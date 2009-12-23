#!/usr/bin/perl

my ($config,$Xs,$dir) = @ARGV;

my %capacity;
my $number_of_procs=0;
my $hostname = &trim(`hostname -s`);

my @inputs;
my @proc_chunks;
my @proc_chunk_lengths;
my $number_of_jobs;
my $number_of_hosts;
my $my_pid;
my $my_job;
my $my_job_length;
my @my_inputs;

sub trim {
    my $s = $_[0];
    $s =~ s/^\s*(.*?)\s*$/$1/;
    return $s;
}

sub take {
    my ($start,$n,@list) = @_;
    my @r = ();
    my $i;

    for($i=$start;($i<$start+$n) && ($i<@list);$i++){
	push @r,$list[$i];
    }
    return @r;
}

sub readpool {
    print STDERR "Reading $_[0].pool\n";
    open(POOL,"< ./$_[0].pool");
    my @lines = <POOL>;
    my $i;
    for($i=0;$i<@lines;$i++)
    {
	$l = $lines[$i];
	if($l =~ /\s*([\w\-]+)\s*\:\s*(\d+)/){
	    $capacity{$1} = $2;
	    if(!($1 cmp $hostname)){
		$my_pid = $i;
		$my_procs_start = $number_of_procs;
		$my_procs_end   = $my_procs_start + $capacity{$1} - 1;
	    }
	    $number_of_procs += $2;
	    $number_of_hosts += 1;
	}
    }
#    print STDERR "Total number of CPUs: $number_of_procs\n";
    close POOL;
}
# fisher_yates_shuffle( \@array ) : generate a random permutation
# # of @array in place
srand(17); # Must give the same result for all hosts!
sub fisher_yates_shuffle {
   my $array = shift;
   my $i;
   for ($i = @$array; --$i; ) {
     my $j = int rand ($i+1);
     next if $i == $j;
     @$array[$i,$j] = @$array[$j,$i];
   }
}


sub getjobs {
    my $mathout = `job=get-length Xs='$Xs' math < generate-Jtable.m`;
    if($mathout =~ /Length\[nlmindex4\]\s*=\s*(\d+)/){
	$number_of_jobs = $1;
    }
    @inputs = (1..$number_of_jobs);
    &fisher_yates_shuffle(\@inputs);
}

sub division_of_labour {
    # First divide the jobs among the available processors:
    my $unit_chunk_length = int($number_of_jobs/$number_of_procs);
    my $remainder = $number_of_jobs % $number_of_procs;

    print STDERR "Unit chunk length: $unit_chunk_length; Remainder: $remainder.\n";
    my $chunk = 0;
    my ($p,$i);
    for($p=0;$p<$number_of_procs;$p++){
	$proc_chunk_lengths[$p] = $unit_chunk_length + ($p<$remainder?1:0);
	$proc_chunks[$p] = $chunk;
	$chunk += $proc_chunk_lengths[$p];
    }
    for($p=0;$p<$number_of_procs;$p++){
#	print STDERR "$p: $proc_chunks[$p]-".($proc_chunks[$p]+$proc_chunk_lengths[$p]-1)
#	." ($proc_chunk_lengths[$p])\n";
    }
    
    # Now find what jobs for which this host is responsible:
    $my_job = $proc_chunks[$my_procs_start];
    $my_job_length = 0; 
    for($p=$my_procs_start;$p<=$my_procs_end;$p++){
	$my_job_length += $proc_chunk_lengths[$p];
    }
    for($i=$my_job;$i<$my_job+$my_job_length;$i++){
	push @my_inputs, $inputs[$i];
    }
}

&readpool($config);
&getjobs;
&division_of_labour;


#foreach $I (@inputs){
#    print STDERR "$I\n";
#}
print STDERR "In total $number_of_jobs jobs on $number_of_hosts hosts and $number_of_procs CPUs.\n";

foreach $k (keys %capacity){
    print "$k should run $capacity{$k} concurrent jobs.\n";
}
# print "In total $number_of_procs_total concurrent jobs.\n";

# print STDERR "$hostname($p): $my_job-".($my_job+$my_job_length-1)."\n";
# for($i=$my_job;$i<$my_job+$my_job_length;$i++){
#     print STDERR "I own $inputs[$i].\n";
# }

# Use fork() and wait() instead. Look up how.
# chdir $dir;
# for($i=0;$i<@my_inputs;$i+=$capacity{$hostname}){
#     my @chunk = &take($i+1,$capacity{$hostname}-1,@my_inputs);
#     my $I0 = $my_inputs[$i];
#     print "$i: chunk: '@chunk'; I0: $I0; capacity: $capacity{$hostname}\n";
# }

sub printarray {
 my @a = @_;
 my $s = "{";
 my $i;
 for($i=0;$i<@a;$i++){ $s .= $a[$i].(($i+1<@a)? ",":"}"); }
 return $s;
}

@kids = ();
for($p=$my_procs_start;$p<=$my_procs_end;$p++){
    if($pid = fork()){ # parent
	push @kids, $pid;
    } else { # child
	# my ($start,$end) = ($inputs[$proc_chunks[$p]],$inputs[$proc_chunks[$p]+$proc_chunk_lengths[$p]-1]);	
	my @my_inputs = &take($proc_chunks[$p],$proc_chunk_lengths[$p],@inputs);
	my $inputstring = &printarray(@my_inputs);
	print STDERR "CPU $p: $proc_chunk_lengths[$p] elements, ${start}-${end}\n";
	print STDERR "job=run inputs='$inputstring' Xs='$Xs' math \< generate-Jtable.m\n";
	system("job=run inputs='$inputstring' Xs='$Xs' math \< generate-Jtable.m");

	exit(0);
    }
}

print STDERR "Kids: @kids\n";
foreach $pid (@kids){
    print STDERR "Waiting for kid $pid\n";
    waitpid($pid,0);
}
