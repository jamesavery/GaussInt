draftrun=False;

If[draftrun,
   gaussscale = 1/100;
   ngaussians = 10;
,
   gaussscale = 1/10000;
   ngaussians = 19;
];

nexponentials = 10; (* Highest $n$ for which to approximate $s^n e^{-s}$. *)
fitstart=0.05`30;   (* Attempting to replicate the hard cusp may make
		       the rest of the approximation unnecessarily
		       imprecise.  Thus it is sometimes beneficial to
		       start sampling a little way out from the origin.
		     *)
fitend=25`30;  	     (* The largest radius at which to sample. *)
fitstep=0.1`30;	     (* The distance between samples. *)

(* The exponents grow exponentially. *)
aa = Table[gaussscale*2^n, {n, 0, ngaussians - 1}];

(* Unnormalized Gaussians *)
gaussians = Exp[-aa*s^2];

sne = Table[s^n E^(-s),{n,0,nexponentials-1}]; (* Unnormalized exponentials *)
sneg = Table[Fit[Table[{s, sne[[i]]}, {s, fitstart, fitend, fitstep}], 
		 gaussians, s], {i, Length[sne]}];

(* 
   sneg[[i]] is on the form $\gamma_{i1} Exp[-a_1 s^2]+...+\gamma_{in} Exp[-a_n s^2]$. 
   The following extracts the coefficients $\gamma_{ij}$.  
 *)
gammas = Table[sneg[[i, ngaussians+1-j]]/Exp[-aa[[j]]*s^2], {i, Length[sneg]}, {j, ngaussians}];

Save["Gauss/generated/gammas.m",{aa,gammas,nexponentials,ngaussians}];
