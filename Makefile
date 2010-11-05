DRAFT="True"
NLMBASIS=nl0-3d
QMAX=8
# NLMBASIS=n00-3s

GENERATED_BASE=nlmbasis.m generated/polys.m generated/gammas.m generated/sphericalbessel.m \
               generated/exact-table.m generated/I124.m

generated/gammas.m: generate/generate-gammas.m 
	math < generate/generate-gammas.m

generated/polys.m: generate/generate-polys.m nlmbasis.m
	math < generate/generate-polys.m

generated/I124.m: generate/generate-I124.m
	qmax=$(QMAX) math < generate/generate-I124.m

nlmbasis.m: generate/generate-Gammas.m Makefile generated/polys.m
	NLMBASIS=$(NLMBASIS) math < generate/generate-Gammas.m
	ln -sf generated/nlmbasis-$(NLMBASIS).m nlmbasis.m

generated/sphericalbessel.m: generate/generate-bessel.m nlmbasis.m
	math < generate/generate-bessel.m

generated/exact-table.m: generate/generate-exact.m nlmbasis.m
	math < generate/generate-exact.m

generated/J16.m: generate/generate-J16.m nlmbasis.m
	math < generate/generate-J16.m

run-0000: generate/generate-Jtable.m run-distributed.pl $(GENERATED_BASE)

run-00ss: generate/generate-Jtable.m run-distributed.pl $(GENERATED_BASE)
	(./run-distributed.pl hosts "{0,0,s,s}" . | tee logs/00ss.`hostname -s`) 2> logs/00ss.`hostname -s`.err

run-0sss: generate/generate-Jtable.m run-distributed.pl $(GENERATED_BASE)
	(./run-distributed.pl hosts "{0,s,s,s}" . | tee logs/0sss.`hostname -s`) 2> logs/0sss.`hostname -s`.err

run-0s0s: generate/generate-Jtable.m run-distributed.pl $(GENERATED_BASE)
	(./run-distributed.pl hosts "{0,s,0,s}" . | tee logs/0s0s.`hostname -s`) 2> logs/0s0s.`hostname -s`.err

00ss: gauss00ss.m $(GENERATED_BASE)
	math < gauss00ss.m

0sss: gauss0sss.m $(GENERATED_BASE)
	math < gauss0sss.m

0s0s: gauss0sss.m $(GENERATED_BASE)
	math < gauss0s0s.m

clean:
	rm -f \#*\# *~ 

distclean: clean
	rm generated/*
