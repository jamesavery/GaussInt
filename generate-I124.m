qmax = ToExpression[Environment["qmax"]];

Print["Generating Eq. (124) for q = 0,...",qmax," and l=0,...q."];
Print["R=0:"];
tI124z = Table[(Print[{q,l}];If[l!=0,0,
                       Integrate[p^q Exp[-(g/4)*p^2], {p, 0, Infinity},  
                       Assumptions -> {g > 0, R>0}]]), {q, 0, qmax}, {l, 0, q}];

Save["generated/I124.m",{qmax,tI124z}];
Print["R>0:"];
tI124 = Table[Print[{q,l}];Integrate[p^q Exp[-(g/4)*p^2]*SphericalBesselJ[l, p*R], {p, 0, Infinity}, 
                Assumptions -> {g > 0, R>0}], {q, 0, qmax}, {l, 0, q}];

Save["generated/I124.m",tI124];
