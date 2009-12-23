Get["Gauss/tqltable.m"];
Get["Gauss/spherical-simplified.m"];
Get["Gauss/nlmbasis.m"];
Get["Gauss/generated/gammas.m"];
Get["Gauss/generated/polys.m"];
Get["Gauss/generated/exact-table.m"];
Get["Gauss/generated/I124.m"];

tkl=tqltablem0;
$MaxExtraPrecision = 200;


(* TODO:
   [ ] File for calculating ttr
   [x] File for calculating gammas
   [x] File for calculating Gammas and Gammasp
   [x] File for calculating polynomials
   [x] File for generating interpolated spherical Bessel functions
   [x] File for generating tI124 and tI124z.
   [x] Distributed calculation of J65
   [ ] Fix whatever is wrong with makeJ110 and replace makeJ65 in 0sss-calculations.
   [ ] Program for calculating exact 00ss-integrals
   [ ] 
*)

(* Interpolation functions for rapid calculation of spherical Bessel functions: 
   sphericalbesseltable[l][x] corresponds to j_l(x). Note the j[l][x] must be defined up to x = max(s)*max(p).
 *)
Get["Gauss/generated/sphericalbessel.m"];

(* The file also contains integrand[mu1_,mu2_,mu3_,mu4_], 
   which is used to calculate interelectron repulsion integrals with 
   {Za,Zb,Zap,Zbp}={s,0,0,0} (see gauss32.nb) 
*)

(* makeJ110 and makeJ65 refer respectively to what used to be the triple 
   sum and to the quadruple sum (see gauss1a.pdf and gauss40.nb) 
*)
makeJ110[{mu1_, mu2_, mu3_, mu4_}] := makeJ110[mu1,mu2,mu3,mu4];
makeJ110[mu1_, mu2_, mu3_, mu4_] := Module[{wwa,trp,tfp,tJ,fJ,ss,ps},
     Print["makeJ110[",{mu1,mu2,mu3,mu4},"]"];
     wwa = integrand[mu1, mu2, mu3, mu4]; 
     Print["integrand[] done."]; 
     ss = Range[0,20,2/10];
     ps = Range[0,10,1/10];
     trp = wwa /. s -> ss;
     Print["trp done."]; 
     tfp = Table[Interpolation[Table[{p, trp[[j]]}/.p -> ps[[i]], {i,Length[ps]}]], 
     	   				      	       	          {j,Length[ss]}]; 
     Print["tfp done."]; 
     tJ = Table[{ss[[j]], (4*Pi)^2*NIntegrate[tfp[[j]][p], {p, 0, 10}]}, {j,Length[ss]}]; 
     Print["tJ done."]; 
     fJ = Interpolation[tJ]; 
     Return[fJ];
];

makeJ65[{mu1_, mu2_, mu3_, mu4_}] := makeJ65[mu1,mu2,mu3,mu4];
makeJ65[mu1_, mu2_, mu3_, mu4_] := Module[{var,fvar},
  Print["Calculating J123...\n"];
  Print[Timing[var=J123[mu1, mu2, mu3, mu4];]];
  Print["Evaluating...\n"];
  tvar=Join[{{0,repzexact[mu1,mu2,mu3,mu4]}},Table[Print[Timing[vzv=var/.s->ss]];{ss,vzv},{ss,2/10,20,2/10}]];
  fvar=Interpolation[tvar];
  Print["Done!\n"];
  Return[fvar];
];

makeJ65b[mu1_, mu2_, mu3_, mu4_] := Module[{var,fvar},
  Print["Evaluating...\n"];
  tvar=Join[{{0,repzexact[mu1,mu2,mu3,mu4]}},
  Table[s=ss;Print[Timing[vzv=J123[mu1, mu2, mu3, mu4]]];Clear[s];{ss,vzv},{ss,2/10,20,2/10}]];
  Clear[s]; 
  fvar=Interpolation[tvar];
  Print["Done!\n"];
  Return[fvar];
];


integrand[mu1_, mu2_, mu3_, mu4_] := Sum[sum115[mu1, mu2, mu3, mu4, q, l], {q, 0, Length[c114[1, 1, mu1, mu2, mu3, mu4]] - 1}, {l, 0, q}]
 
sum115[mu1_, mu2_, mu3_, mu4_, q_, l_] := Module[{pItql,jl,G,f,c,gamf},
    Print["sum115[",{mu1,mu2,mu3,mu4,q,l},"]"];
    gamf[n_, i_] := gammas[[n + 1, i]];
    jl = sphericalbesseltable[[l+1]];
    pItql= tkl[[q+1,l+1]]*p^q*I^l;

    (* rho113*w117 *)
    f = (1/Pi)*AAij*Gammas[[mu1,mu2]]*Exp[-p^2/(4*a+4*b)]*w117[mu3,mu4];
    (* c from Eq. 114 *)
    c = CoefficientList[f,p3][[q+1]];

    pItql*Sum[(c/.{a->aa[[i]],b->aa[[j]],gam->gamf,AAij->AA[i,j]})*jl[p*R112[i, j]],
    							{i, ngaussians}, {j, ngaussians}] 
];
 
c114[i_, j_, mu1_, mu2_, mu3_, mu4_] := CoefficientList[
     rho113[i, j, mu1, mu2]*w117[mu3, mu4], p3]
 
rho113[i_, j_, mu1_, mu2_] := (1/Pi)*AA[i, j]*Gam[i, j, mu1, mu2]*Exp[-p^2/(4*aa[[i]] + 4*aa[[j]])]
 
AA[i_, j_] := Exp[-((aa[[i]]*aa[[j]]*(Za - Zb)^2)/(aa[[i]] + aa[[j]]))]/
     (2*aa[[i]] + 2*aa[[j]])^(3/2)
 
AAP[i_, j_] := Exp[-((aa[[i]]*aa[[j]]*(Zap - Zbp)^2)/(aa[[i]] + aa[[j]]))]/
     (2*aa[[i]] + 2*aa[[j]])^(3/2)

a125[i_,j_,ip_,jp_]:=(aa[[i]]+aa[[j]]+aa[[ip]]+aa[[jp]])/((aa[[i]]+aa[[j]])*(aa[[ip]]+aa[[jp]]))

R126[i_,j_,ip_,jp_]:=Abs[(aa[[i]]*Za+aa[[j]]*Zb)/(aa[[i]]+aa[[j]])-(aa[[ip]]*Zap+aa[[jp]]*Zbp)/(aa[[ip]]+aa[[jp]])]

c121[i_,j_,ip_,jp_,mu1_,mu2_,mu3_,mu4_]:=CoefficientList[Gam[i,j,mu1,mu2]*Gamp[ip,jp,mu3,mu4],p3] 
c121[mu1_,mu2_,mu3_,mu4_]:=CoefficientList[Gammas[[mu1,mu2]]*Gammasp[[mu3,mu4]],p3]

I123a[i_,j_,ip_,jp_,q_,l_]:=tI124[[q+1,l+1]]/.{g->a125[i,j,ip,jp],R->R126[i,j,ip,jp]} 
I123b[i_,j_,ip_,jp_,q_,l_]:=tI124z[[q+1,l+1]]/.{g->a125[i,j,ip,jp],R->R126[i,j,ip,jp]} 
I123[i_,j_,ip_,jp_,q_,l_]:=If[Abs[R126[i,j,ip,jp]/.s->1]<.000001,I123b[i,j,ip,jp,q,l],I123a[i,j,ip,jp,q,l]]


qlsum123[i_,j_,ip_,jp_,mu1_,mu2_,mu3_,mu4_]:=(
  wwwa=c121[i,j,ip,jp,mu1,mu2,mu3,mu4];
  Sum[wwwa[[q+1]]*I^l*tkl[[q+1,l+1]]*I123[i,j,ip,jp,q,l],{q,0,Length[wwwa]-1},{l,0,q}]
);

J123[mu1_,mu2_,mu3_,mu4_]:=16*Sum[AA[i,j]*AAP[ip,jp]*qlsum123[i,j,ip,jp,mu1,mu2,mu3,mu4],{i,ngaussians},{j,ngaussians},{ip,ngaussians},{jp,ngaussians}];

 
(* The table ttr already has the right sign to be used directly in J110. *)
w117[mu3_, mu4_] := Sum[ttr[[l + 1,mu3,mu4]]*y3[l, 0], {l, 0, 5}] /. {u1->p1/p,u2->p2/p,u3->p3/p};


Gam[ii_, jj_, mu1_, mu2_] := Module[{gamf},
   (* Note: When i is set outside, it is replaced by its value in Gammas[[mu1,mu2]]. This 
      can (and has) lead to confusing errors. *)
   gamf[n_, i_] := gammas[[n + 1, i]];

   Gammas[[mu1, mu2]] /. {i -> ii, j -> jj, gam -> gamf, 
   		          a->aa[[ii]], b->aa[[jj]]}
   ];


Gamp[ii_, jj_, mu1_, mu2_] := Module[{gamf},
(*   Print["Gamp[",{ii,jj,mu1,mu2},"] ~:",Gammasp[[mu1,mu2]]];
     gamf[n_, i_] := (Print[{n,i}];gammas[[n + 1, i]]); *)
   gamf[n_, i_] := gammas[[n + 1, i]];
   Gammasp[[mu1, mu2]] /. {ip -> ii, jp -> jj, gam -> gamf,
    		       	   a->aa[[ii]], b->aa[[jj]]}
   ]; 
 
ttr = {{{(8*Sqrt[2])/((4 + p^2)^2*Pi), (4*Sqrt[2]*(-4 + 3*p^2))/
        ((4 + p^2)^3*Pi), 0, (16*Sqrt[2]*p^2*(-4 + p^2))/((4 + p^2)^4*Pi), 0, 
       0}, {(4*Sqrt[2]*(-4 + 3*p^2))/((4 + p^2)^3*Pi), 
       (16*Sqrt[2]*(8 - 6*p^2 + p^4))/((4 + p^2)^4*Pi), 0, 
       (4*Sqrt[2]*(-64 + 176*p^2 - 60*p^4 + 5*p^6))/((4 + p^2)^5*Pi), 0, 0}, 
      {0, 0, (-32*Sqrt[2]*(-4 + p^2))/((4 + p^2)^4*Pi), 0, 
       (-32*(16 + 5*p^2*(-8 + p^2)))/(Sqrt[3]*(4 + p^2)^5*Pi), 0}, 
      {(16*Sqrt[2]*p^2*(-4 + p^2))/((4 + p^2)^4*Pi), 
       (4*Sqrt[2]*(-64 + 176*p^2 - 60*p^4 + 5*p^6))/((4 + p^2)^5*Pi), 0, 
       (8*Sqrt[2]*(-12 + p^2)*(-4 + 3*p^2)*(16 + 3*p^2*(-8 + p^2)))/
        (3*(4 + p^2)^6*Pi), 0, 0}, {0, 0, (-32*(16 + 5*p^2*(-8 + p^2)))/
        (Sqrt[3]*(4 + p^2)^5*Pi), 0, (-128*Sqrt[2]*(-48 + 88*p^2 - 43*p^4 + 
          3*p^6))/(3*(4 + p^2)^6*Pi), 0}, {0, 0, 0, 0, 0, 
       (128*Sqrt[2]*(48 - 40*p^2 + 3*p^4))/(3*(4 + p^2)^6*Pi)}}, 
     {{0, 0, ((-32*I)*Sqrt[2/3]*p)/((4 + p^2)^3*Pi), 0, 
       (((-32*I)/3)*p*(-4 + 5*p^2))/((4 + p^2)^4*Pi), 0}, 
      {0, 0, ((-16*I)*Sqrt[6]*p*(-4 + p^2))/((4 + p^2)^4*Pi), 0, 
       (((-32*I)/3)*p*(64 - 52*p^2 + 7*p^4))/((4 + p^2)^5*Pi), 0}, 
      {((-32*I)*Sqrt[2/3]*p)/((4 + p^2)^3*Pi), ((-16*I)*Sqrt[6]*p*(-4 + p^2))/
        ((4 + p^2)^4*Pi), 0, ((-64*I)*Sqrt[2/3]*p*(8 - 10*p^2 + p^4))/
        ((4 + p^2)^5*Pi), 0, (((-256*I)/5)*p*(20 - 3*p^2))/
        (Sqrt[3]*(4 + p^2)^5*Pi)}, 
      {0, 0, ((-64*I)*Sqrt[2/3]*p*(8 - 10*p^2 + p^4))/((4 + p^2)^5*Pi), 0, 
       (((-32*I)/3)*p*(-12 + p^2)*(-8 + 3*p^2)*(-4 + 3*p^2))/
        ((4 + p^2)^6*Pi), 0}, {(((-32*I)/3)*p*(-4 + 5*p^2))/((4 + p^2)^4*Pi), 
       (((-32*I)/3)*p*(64 - 52*p^2 + 7*p^4))/((4 + p^2)^5*Pi), 0, 
       (((-32*I)/3)*p*(-12 + p^2)*(-8 + 3*p^2)*(-4 + 3*p^2))/
        ((4 + p^2)^6*Pi), 0, (((128*I)/3)*Sqrt[2]*p*(48 - 40*p^2 + 3*p^4))/
        ((4 + p^2)^6*Pi)}, {0, 0, (((-256*I)/5)*p*(20 - 3*p^2))/
        (Sqrt[3]*(4 + p^2)^5*Pi), 0, (((128*I)/3)*Sqrt[2]*p*
         (48 - 40*p^2 + 3*p^4))/((4 + p^2)^6*Pi), 0}}, 
     {{0, 0, 0, 0, 0, (-128*p^2)/(Sqrt[5]*(4 + p^2)^4*Pi)}, 
      {0, 0, 0, 0, 0, (-64*p^2*(-20 + 3*p^2))/(Sqrt[5]*(4 + p^2)^5*Pi)}, 
      {0, 0, (-128*Sqrt[2/5]*p^2)/((4 + p^2)^4*Pi), 0, 
       (-128*p^2*(-12 + 5*p^2))/(Sqrt[15]*(4 + p^2)^5*Pi), 0}, 
      {0, 0, 0, 0, 0, (-256*p^2*(80 - 48*p^2 + 3*p^4))/(3*Sqrt[5]*(4 + p^2)^6*
         Pi)}, {0, 0, (-128*p^2*(-12 + 5*p^2))/(Sqrt[15]*(4 + p^2)^5*Pi), 0, 
       (-512*Sqrt[2/5]*p^2*(32 - 20*p^2 + 3*p^4))/(3*(4 + p^2)^6*Pi), 0}, 
      {(-128*p^2)/(Sqrt[5]*(4 + p^2)^4*Pi), (-64*p^2*(-20 + 3*p^2))/
        (Sqrt[5]*(4 + p^2)^5*Pi), 0, (-256*p^2*(80 - 48*p^2 + 3*p^4))/
        (3*Sqrt[5]*(4 + p^2)^6*Pi), 0, (2048*Sqrt[2/5]*p^2*(-28 + 3*p^2))/
        (21*(4 + p^2)^6*Pi)}}, {{0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0, (((3072*I)/5)*p^3)/(Sqrt[7]*(4 + p^2)^5*Pi)}, 
      {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, ((512*I)*Sqrt[6/7]*p^3*(-4 + p^2))/
        ((4 + p^2)^6*Pi)}, {0, 0, (((3072*I)/5)*p^3)/(Sqrt[7]*(4 + p^2)^5*
         Pi), 0, ((512*I)*Sqrt[6/7]*p^3*(-4 + p^2))/((4 + p^2)^6*Pi), 0}}, 
     {{0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 
       (4096*Sqrt[2]*p^4)/(7*(4 + p^2)^6*Pi)}}, {{0, 0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}, 
      {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0}}};
 
R112[i_, j_] := Abs[(aa[[i]]*Za + aa[[j]]*Zb)/(aa[[i]] + aa[[j]]) - Zap];


makeJ65a[mu_] := (Print[mu]; makeJ65[mu])

