Get["Gauss/nlmbasis.m"];
Get["Gauss/generated/J16.m"];
Get["Gauss/harmonics.m"];
Get["Gauss/spherical-simplified.m"];
Get["Gauss/generated/exact-table.m"];

(* Eq. (19) in gauss1a.pdf *)
rp19[ss_,mus_] := Module[{a1,a2,b1,b2,result,find,tjlm},
    {{n1, l1, m1}, {n2, l2, m2}, {n3, l3, m3}, {n4, l4, m4}} = nlmbasis[[#]]&/@mus;
    ind[l_] := Floor[l/2];
    find[jlm_] := Do[If[jlmbasis2[[i]]==jlm,Return[i]],{i,Length[jlmbasis2]}];

    tjlm = If[ss>0,J16Table /. s->ss,Limit[J16Table,s->ss]];

    If[m2 - m1 + m4 - m3 != 0, Return[0]];
    
    a1 = alph[n1, l1, n2, l2]; 
    a2 = alph[n3, l3, n4, l4]; 
    b1 = bet[l1, m1, l2, m2]; 
    b2 = bet[l3, m3, l4, m4]; 

    (* TODO: Er det korrekt at tage absolut værdi |m2-m1|, |m4-m3|? *)
    result = Sum[
          a1[[j + 1]]*a2[[jp + 1]]*b1[[ind[l - Abs[l1 - l2]] + 1]]*b2[[ind[lp - Abs[l3 - l4]] + 1]]*
          tjlm[[find[{j, l, Abs[m2 - m1]}],find[{jp, lp, Abs[m4 - m3]}]]], 

          {j, l1 + l2, n1 + n2 - 2}, {l, Abs[l1 - l2], l1 + l2, 2}, 
          {jp, l3 + l4, n3 + n4 - 2}, {lp, Abs[l3 - l4], l3 + l4, 2}
    ];

    Return[result];
];

rp19e[mus_] := Module[{a1,a2,b1,b2,result,find,tjlm},
    {{n1, l1, m1}, {n2, l2, m2}, {n3, l3, m3}, {n4, l4, m4}} = nlmbasis[[#]]&/@mus;
    ind[l_] := Floor[l/2];
    find[jlm_] := Do[If[jlmbasis2[[i]]==jlm,Return[i]],{i,Length[jlmbasis2]}];

    tjlm = J16Table;

    If[m2 - m1 + m4 - m3 != 0, Return[0]];
    
    a1 = alph[n1, l1, n2, l2]; 
    a2 = alph[n3, l3, n4, l4]; 
    b1 = bet[l1, m1, l2, m2]; 
    b2 = bet[l3, m3, l4, m4]; 

    (* TODO: Er det korrekt at tage absolut værdi |m2-m1|, |m4-m3|? *)
    result = Sum[
          a1[[j + 1]]*a2[[jp + 1]]*b1[[ind[l - Abs[l1 - l2]] + 1]]*b2[[ind[lp - Abs[l3 - l4]] + 1]]*
          tjlm[[find[{j, l, Abs[m2 - m1]}],find[{jp, lp, Abs[m4 - m3]}]]], 

          {j, l1 + l2, n1 + n2 - 2}, {l, Abs[l1 - l2], l1 + l2, 2}, 
          {jp, l3 + l4, n3 + n4 - 2}, {lp, Abs[l3 - l4], l3 + l4, 2}
    ];

    Return[result];
];

rp19[mus_] := Module[{tJ},
  tJ = Table[{ss,rp19[ss,mus]}, {ss,0, 20,1/5}];
  Return[ Interpolation[N[tJ,16]] ];
];

rp19t[mus_] := Table[{ss, rp19[ss,mus]}, {ss, 0, 20, 1/5}];

alph[np_, lp_, n_, l_] := CoefficientList[(st[np, lp]*st[n, l])/4, s]
 
st[n_, l_] := sf[n, l, 1] /. r -> s
 
sf[n_, l_, k_] := norm[n, l, k]*(2*k*r)^l*Hypergeometric1F1[l + 1 - n, 
      2*l + 2, 2*k*r]
 
norm[n_, l_, k_] := 2*(k^(3/2)/(2*l + 1)!)*Sqrt[(l + n)!/(n*(n - l - 1)!)]
 
bet[lp_, mp_, l_, m_] := (#1[[3]] & ) /@ res2[lp, mp, l, m]

res2[lp_, mp_, l_, m_] := Table[{lpp, m - mp, pr[lpp, m - mp, lp, mp, l, m]}, 
     {lpp, Abs[l - lp], l + lp, 2}]
