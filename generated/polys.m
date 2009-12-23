pol1[{na_, nb_}] := pol1a[na, nb] /. p1 -> sn1[]*p1
 
pol1a[na_, nb_] := If[nb > na, pol1[{nb, na}] /. {a -> b, b -> a, Xa -> Xb, 
       Xb -> Xa}, v1[[na + 1,nb + 1]]]
 
v1 = {{1}, {(I*p1 + 2*b*(-Xa + Xb))/(2*(a + b)), 
      (-p1^2 + b*(2 - (2*I)*p1*(Xa - Xb)) + a*(2 + (2*I)*p1*(Xa - Xb) - 
          4*b*(Xa - Xb)^2))/(4*(a + b)^2)}, 
     {(2*a - p1^2 + b*(2 - (4*I)*p1*(Xa - Xb)) + 4*b^2*(Xa - Xb)^2)/
       (4*(a + b)^2), ((-I)*p1^3 - 2*a*(I*p1*(-3 + 4*b*(Xa - Xb)^2) + 
          p1^2*(Xa - Xb) - 2*b*(-1 + 2*b*(Xa - Xb)^2)*(Xa - Xb)) + 
        4*a^2*(Xa - Xb) + 2*b*p1*(3*I + 2*p1*Xa - 2*p1*Xb) + 
        (4*I)*b^2*(Xa - Xb)*(2*I + p1*Xa - p1*Xb))/(8*(a + b)^3), 
      (p1^4 + (4*I)*b*p1^2*(3*I + p1*(Xa - Xb)) - 
        4*b^2*(-3 + (6*I)*p1*(Xa - Xb) + p1^2*(Xa - Xb)^2) + 
        4*a*(p1^2*(-3 - I*p1*(Xa - Xb)) + b*(6 + 4*p1^2*(Xa - Xb)^2) + 
          (2*I)*b^2*(3*I + 2*p1*(Xa - Xb))*(Xa - Xb)^2) - 
        4*a^2*(-3 + (2*I)*p1*(-3 + 2*b*(Xa - Xb)^2)*(Xa - Xb) + 
          6*b*(Xa - Xb)^2 + p1^2*(Xa - Xb)^2 - 4*b^2*(Xa - Xb)^4) + 
        8*a^3*(Xa - Xb)^2 + 8*b^3*(Xa - Xb)^2)/(16*(a + b)^4)}}
 
sn1[] := 1
 
pol2[{na_, nb_}] := pol1a[na, nb] /. {Xa -> Ya, Xb -> Yb} /. {p1 -> sn2[]*p2}
 
sn2[] := 1
 
pol3[{na_, nb_}] := pol1a[na, nb] /. {Xa -> Za, Xb -> Zb} /. {p1 -> sn3[]*p3}
 
sn3[] := 1
 
polynmax = 2
