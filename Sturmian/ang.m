BeginPackage["Sturmian`ang`"]

ang::usage = 
"ang[li,mi,lj,mj,lk,mk,ll,ml] gives a list of tuples \!\((l,value)\) of
 the terms for which the angular integral al (eq. A.4) are nonzero.";

angal::usage = "angal[li, mi, lj, mj, lk, mk, ll, ml, l] computes the
angular integral of products of spherical harmonics of the form
\[Integral] \!\(d\[CapitalOmega]\_1 Y\_\(li,mi\) Y\_\(lk,mk\)
\[Integral] d\[CapitalOmega]\_2 Y\_\(lj,mj\) Y\_\(ll,ml\) P\_l\) ";

Begin["`Private`"]

ang[li_,mi_,lj_,mj_,lk_,mk_,ll_,ml_]:=
(
(* Print["ang[",li,",",mi,",",lj,",",mj,",",lk,",",mk,",",ll,",",ml,"]"]; *)
 If[((mi+mj != mk+ml) || (Mod[li+lk,2] != Mod[lj+ll,2])), {}, 
   Block[{a,r = {},
	  mn = Max[Abs[li-lk],Abs[lj-ll]],
	  mx = Min[li+lk,lj+ll]
          },
(*	Print[mn," -> ",mx]; *)
   For[l=mn,l<=mx,l+=2,
       a = angal[li,mi,lj,mj,lk,mk,ll,ml,l];
      (*        Print["a_",l," : ",a]; *)
       If[a!=0, r = Insert[r,{l,a},1]];
   ];
(* Print["r : ",r]; *)
   Return[r]
   ]
 ]
);


angal[li_, mi_, lj_, mj_, lk_, mk_, ll_, ml_, l_] := 
    w1[li, mi, lk, mk, l, mi - mk]*w2[lj, mj, ll, ml, l, mi - mk]*4*
     (Pi/(2*l + 1))

w1[l1_, m1_, l2_, m2_, l3_, m3_] := 
    (-1)^m1*Sqrt[(2*l1 + 1)*(2*l2 + 1)*((2*l3 + 1)/(4*Pi))]*
     j3[{l1, 0}, {l2, 0}, {l3, 0}]*j3[{l1, -m1}, {l2, m2}, {l3, m3}]

w2[l1_, m1_, l2_, m2_, l_, m_] := w1[l1, m1, l2, m2, l, -m]*(-1)^m 

j3[a_, b_, c_] := ThreeJSymbol[a, b, c];

End[]
EndPackage[]
