draftrun=True;

If[draftrun,
   polynmax=2
,
   polynmax=5
];

db1[f_] := Simplify[D[f, p1]/I - Xb*f]
da1[f_] := Simplify[D[f, p1]/I - Xa*f]

f = E^(-(a*(x - Xa)^2) - b*(x - Xb)^2);
ppol[{na_, nb_}, f_] := Nest[db1, Nest[da1, f, na], nb]/f
 
ftx = 1/(Sqrt[2]*Sqrt[a + b]*E^((p1^2 + 4*a*b*(Xa - Xb)^2 
				 - (4*I)*p1*(a*Xa + b*Xb))/(4*(a + b))));

v1  = Simplify[Table[ppol[{na,nb},ftx],{na,0,polynmax},{nb,0,na}]];

sn1[] := 1; (*If[Xa == Xb, 1, Sign[(Xa - Xb)]/.s->1];*)
sn2[] := 1; (*If[Ya == Yb, 1, Sign[(Ya - Yb)]/.s->1];*)
sn3[] := 1; (*If[Za == Zb, 1, Sign[(Za - Zb)]/.s->1];*)

(* Note: Only p3 should be inverted when switching identity of the centers. *)
pol1a[na_, nb_] := If[nb > na, pol1[{nb, na}] /. {a -> b, b -> a, Xa -> Xb, 
						  Xb -> Xa (*, p1 -> -p1*)}, v1[[na + 1,nb + 1]]]

pol1[{na_,nb_}] :=  pol1a[na,nb] /. p1 -> sn1[]*p1;
pol3[{na_, nb_}] := (pol1a[na,nb] /. {Xa -> Za, Xb -> Zb}) /. {p1 -> sn3[]*p3};
pol2[{na_, nb_}] := (pol1a[na,nb] /. {Xa -> Ya, Xb -> Yb}) /. {p1 -> sn2[]*p2};

Save["Gauss/generated/polys.m",{pol1,pol2,pol3,polynmax}];
