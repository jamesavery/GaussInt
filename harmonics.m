(* pr3c[l,f] is the lth projection of 3-dimensional angular function f(u1,u2,u3) *)
pr3c[l_, f_] := Simplify[(2*l + 1)*h03[LegendreP[l, u3]*f]]

(* h03[f] is the 0th projection of 3-dimensional angular function f(u1,u2,u3) *)
h03[f_] := Module[{list = CoefficientList[f, {u1, u2, u3}], dim, sum = 0}, 
     dim = Dimensions[list]; Do[If[(-1)^i == 1 || (-1)^j == 1 || (-1)^k == 1, 
        0, sum = sum + (i - 2)!!*(j - 2)!!*(k - 2)!!*list[[i,j,k]]*
           (1/(i + j + k - 2)!!)], {i, dim[[1]]}, {j, dim[[2]]}, 
       {k, dim[[3]]}]; Return[sum]]

(* pr[l'',m'', l',m', l,m] does.. what? I forgot. *)
pr[lpp_, mpp_, lp_, mp_, l_, m_] := 
    If[mpp == m - mp && (-1)^(l + lp + lpp) == 1 && lpp > Abs[l - lp] - 1 && 
      lpp < l + lp + 1, 4*Pi*h03[y3c[lpp, mpp]*y3c[lp, mp]*y3[l, m]], 0]

prc[lpp_, lp_, mp_, l_, m_] := 
    (-1)^l*If[(-1)^(l + lp + lpp) == 1 && lpp > Abs[l - lp] - 1 && 
        lpp < l + lp + 1, y3[lpp, m + mp]*4*Pi*
        h03[y3c[lpp, m + mp]*y3[lp, mp]*y3[l, m]], 0] /. 
     {u1 -> 0, u2 -> 0, u3 -> 1}