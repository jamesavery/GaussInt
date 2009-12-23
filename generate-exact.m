Get["Gauss/nlmbasis.m"];
Get["Sturmian`sturm`"];
Get["Sturmian`ang`"];
Off[ClebschGordon::phy];

lookup4[{i_,j_,k_,l_}] := lookup4[i,j,k,l];
lookup4[i_,j_,k_,l_] := lookup2[lookup2[i,j],lookup2[k,l]];
lookup2[i_,j_] := If[i<j,lookup2[j,i], i(i-1)/2+j];

(* lookupnl[n,l] gives the index into Flatten[nls] of {n,l} *)
lookupnl[n_, l_] :=  n (n - 1)/2 + l +  1;
lookupnl[{n_, l_}] := lookupnl[n, l];

(* Note: no factor 1/2. Gives index into Flatten[lms] of (l,m) *)
lookuplm[l_, m_] := l (l + 1) + m + 1; 

(* lookup2[lookupnl[n1,l1],lookupnl[n2,l2]] gives the index into 
   Flatten[Table[nls[[i,j]],{i,Length},{j,i,Length}] *)


findelement[x_, l_] := Do[If[l[[i]] == x, Return[i]], {i, Length[l]}];

ang[{{l1_, m1_}, {l2_, m2_}, {l3_, m3_}, {l4_, m4_}}] := ang[l1, m1, l2, m2, l3, m3, l4, m4];

(* Calculate interelectron repulsion integrals *)
radialInt2[i_, j_] := 
  Module[{p1, p2, ni, li, nj, lj, nk, lk, nl, ll, lmin, lmax},
   If[i < j, Return[radialInt2[j, i]]];
   {p1, p2} = {ps[[i]], ps[[j]]};
   {{{ni, li}, {nk, lk}}, {{nj, lj}, {nl, ll}}} = {nls2[[i]], nls2[[j]]};
   
   lmin = Max[Abs[li - lk], Abs[lj - ll]];
   lmax = Min[li + lk, lj + ll];
   If[Mod[li + lk, 2] != Mod[lj + ll, 2], Return[{}]];
   
   Return[
    Table[{l, radialInt[p1, p2, 2, 2, l]}, {l, lmin, lmax, 2}]];
];


nmax = Max[#[[1]]&/@nlmbasis];
lmax = Max[#[[2]]&/@nlmbasis];
mmax = Max[Abs[#[[3]]]&/@nlmbasis];

nls = Flatten[Table[{n, l}, {n, 1, nmax}, {l, 0, Min[n - 1,lmax]}], 1];
lms = Flatten[Table[{l, m}, {l, 0, lmax}, {m, Max[-l,mmax], Min[l,mmax]}], 1];
polys = sturmPoly[#[[1]], #[[2]], 1] & /@ nls // Simplify;

ps = Flatten[
    Table[polys[[i]]*polys[[j]], {i, Length[polys]}, {j, 1, i}]] // 
   Simplify;

nls2 = Flatten[Table[{nls[[i]], nls[[j]]}, {i, Length[nls]}, {j, 1, i}], 1];
nls4 = Flatten[Table[Join[nls2[[i]], nls2[[j]]], {i, Length[nls2]}, {j, 1, i}], 1];
lms2 = Flatten[Table[{lms[[i]], lms[[j]]}, {i, Length[lms]}, {j, 1, i}], 1];
lms4 = Flatten[Table[Join[lms2[[i]], lms2[[j]]], {i, Length[lms2]}, {j, 1, i}], 1];

nlmtonl = Table[findelement[{nlmbasis[[i,1]],nlmbasis[[i,2]]},nls],{i,Length[nlmbasis]}];
nlmtolm = Table[findelement[{nlmbasis[[i,2]],nlmbasis[[i,3]]},lms],{i,Length[nlmbasis]}];

repzexact[{mu1_, mu2_, mu3_, mu4_}] := repzexact[mu1,mu2,mu3,mu4];
repzexact[mu1_,mu2_,mu3_,mu4_] := Module[{nlis,lmis,ri,ai,sum},
  nlis = nlmtonl[[#]]&/@{mu1,mu2,mu3,mu4};
  lmis = nlmtolm[[#]]&/@{mu1,mu2,mu3,mu4};

  ri = radialtable[[lookup4[nlis]]];
  ai = angulartable[[lookup4[lmis]]];
  
  Return[ Sum[If[ri[[i,1]]==ai[[j,1]],ri[[i,2]]*ai[[j,2]],0],{i,Length[ri]},{j,Length[ai]}] ];
];

Print["Computing radial integrals..."];
radialtable =Flatten[Table[radialInt2[i,j],{i,Length[ps]},{j,i}],1];

Print["Computing angular integrals..."];
angulartable=ang /@ lms4;

Save["Gauss/generated/exact-table.m",{radialtable,angulartable,nls,nls2,nls4,lms,lms2,lms4,repzexact,nmax,lmax,mmax}];
