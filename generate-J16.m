Get["Gauss/nlmbasis.m"];
Get["Gauss/harmonics.m"];
Get["Gauss/spherical-simplified.m"];
Get["Gauss/generated/exact-table.m"];

jlmbasis = {#[[1]]-1,#[[2]],#[[3]]}&/@nlmbasis;
jlmbasis2 = Module[{nmax,lmax,lmin,mmax},
  nmax = Max[#[[1]]&/@nlmbasis];
  lmax = Max[#[[2]]&/@nlmbasis];
  lmin = Min[#[[2]]&/@nlmbasis];
  mmax = Max[Abs[#[[3]]&/@nlmbasis]];

  (* TODO: Er m-håndtering korrekt? *)
  Flatten[Table[{j,l,m},
  {j, 2 lmin, 2 nmax - 2}, {l, 0, Min[2 lmax,j]},{m,0,Min[mmax,l]}],2]
];


J16[{jp_, lp_, mp_}, {j_, l_, m_}] := (Print[{jp+1,lp,mp},{j+1,l,m}]; If[mp != -m, 0, 
     (4*Pi)^2*Sum[I^lpp*prc[lpp, lp, mp, l, m]*f69a[{jp, lp}, {j, l}, lpp], 
       {lpp, Abs[l - lp], l + lp, 2}]])
 
prc[lpp_, lp_, mp_, l_, m_] := 
    (-1)^l*If[(-1)^(l + lp + lpp) == 1 && lpp > Abs[l - lp] - 1 && 
        lpp < l + lp + 1, y3[lpp, m + mp]*4*Pi*
        h03[y3c[lpp, m + mp]*y3[lp, mp]*y3[l, m]], 0] /. 
     {u1 -> 0, u2 -> 0, u3 -> 1}
 
y3[l_, m_] := spheric3[l, m]
 
spheric3[l_, m_] := If[Abs[m] > l, 0, 
     Sqrt[(2*l + 1)*(l + m)!*((l - m)!/(4*Pi))]*
      Sum[(-1)^p*(1/(2^(p + q)*(p!*q!*s!)))*(u1 + I*u2)^p*(u1 - I*u2)^q*
          u3^s /. q -> p - m /. p -> (l + m - s)/2, {s, Mod[l + m, 2], l - m, 
        2}]]
 
h03[f_] := Module[{list = CoefficientList[f, {u1, u2, u3}], dim, sum = 0}, 
     dim = Dimensions[list]; Do[If[(-1)^i == 1 || (-1)^j == 1 || (-1)^k == 1, 
        0, sum = sum + (i - 2)!!*(j - 2)!!*(k - 2)!!*list[[i,j,k]]*
           (1/(i + j + k - 2)!!)], {i, dim[[1]]}, {j, dim[[2]]}, 
       {k, dim[[3]]}]; Return[sum]]
 
y3c[l_, m_] := (-1)^m*y3[l, -m]
 
f69a[jlp_, jl_, lpp_] := f69[jlp[[1]], jlp[[2]], jl[[1]], jl[[2]], lpp]
 
f69[jp_, lp_, j_, l_, lpp_] := 
    Integrate[f72[jp, lp]*f72[j, l]*SphericalBesselJ[lpp, p*R] /. k -> 1, 
      {p, 0, Infinity}, Assumptions -> {R > 0}] /. R -> s
 
f72[j_, l_] := 4*Sqrt[2/Pi]*(-I)^l*jj[j + 2, l]*k^3
 
jj[n_, l_] := 2^(-2 - 2*l - n)*(p/k)^l*Sqrt[Pi]*Gamma[1 + l + n]*
     Hypergeometric2F1Regularized[(1/2)*(1 + l + n), (1/2)*(2 + l + n), 
      3/2 + l, -(p^2/(4*k^2))]

J16Table = Outer[J16,jlmbasis2,jlmbasis2,1] //Simplify;

Save["generated/J16.m",{J16Table,jlmbasis,jlmbasis2}];

