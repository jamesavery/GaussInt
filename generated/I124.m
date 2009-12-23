qmax = 8
 
tI124z = {{Sqrt[Pi]/Sqrt[g]}, {2/g, 0}, {(2*Sqrt[Pi])/g^(3/2), 0, 0}, 
     {8/g^2, 0, 0, 0}, {(12*Sqrt[Pi])/g^(5/2), 0, 0, 0, 0}, 
     {64/g^3, 0, 0, 0, 0, 0}, {(120*Sqrt[Pi])/g^(7/2), 0, 0, 0, 0, 0, 0}, 
     {768/g^4, 0, 0, 0, 0, 0, 0, 0}, {(1680*Sqrt[Pi])/g^(9/2), 0, 0, 0, 0, 0, 
      0, 0, 0}}
tI124 = {{(Pi*Erf[R/Sqrt[g]])/(2*R)}, {(Sqrt[Pi]*Erfi[R/Sqrt[g]])/
       (E^(R^2/g)*Sqrt[g]*R), -((2*Sqrt[Pi]*R)/(E^(R^2/g)*Sqrt[g]) - 
         Pi*Erf[R/Sqrt[g]])/(2*R^2)}, {(2*Sqrt[Pi])/(E^(R^2/g)*g^(3/2)), 
      (-2*Sqrt[g]*R + (Sqrt[Pi]*(g + 2*R^2)*Erfi[R/Sqrt[g]])/E^(R^2/g))/
       (g^(3/2)*R^2), -((Sqrt[Pi]*(3*g + 2*R^2))/(E^(R^2/g)*g^(3/2)*R^2)) + 
       (3*Pi*Erf[R/Sqrt[g]])/(2*R^3)}, 
     {4/g^2 + (2*Sqrt[Pi]*(g - 2*R^2)*Erfi[R/Sqrt[g]])/(E^(R^2/g)*g^(5/2)*R), 
      (4*Sqrt[Pi]*R)/(E^(R^2/g)*g^(5/2)), (-2*Sqrt[g]*R*(3*g + 2*R^2) + 
        (Sqrt[Pi]*(3*g^2 + 4*g*R^2 + 4*R^4)*Erfi[R/Sqrt[g]])/E^(R^2/g))/
       (g^(5/2)*R^3), -((Sqrt[Pi]*(15*g^2 + 10*g*R^2 + 4*R^4))/
         (E^(R^2/g)*g^(5/2)*R^3)) + (15*Pi*Erf[R/Sqrt[g]])/(2*R^4)}, 
     {(4*Sqrt[Pi]*(3*g - 2*R^2))/(E^(R^2/g)*g^(7/2)), 
      (2*(-2*Sqrt[g]*R*(g - 2*R^2) + (Sqrt[Pi]*(g^2 + 4*g*R^2 - 4*R^4)*
           Erfi[R/Sqrt[g]])/E^(R^2/g)))/(g^(7/2)*R^2), 
      (8*Sqrt[Pi]*R^2)/(E^(R^2/g)*g^(7/2)), 
      (-2*Sqrt[g]*R*(15*g^2 + 8*g*R^2 + 4*R^4) + 
        (Sqrt[Pi]*(15*g^3 + 18*g^2*R^2 + 12*g*R^4 + 8*R^6)*Erfi[R/Sqrt[g]])/
         E^(R^2/g))/(g^(7/2)*R^4), 
      -((Sqrt[Pi]*(105*g^3 + 70*g^2*R^2 + 28*g*R^4 + 8*R^6))/
         (E^(R^2/g)*g^(7/2)*R^4)) + (105*Pi*Erf[R/Sqrt[g]])/(2*R^5)}, 
     {(8*(5*g - 2*R^2))/g^4 + (4*Sqrt[Pi]*(3*g^2 - 12*g*R^2 + 4*R^4)*
         Erfi[R/Sqrt[g]])/(E^(R^2/g)*g^(9/2)*R), (8*Sqrt[Pi]*R*(5*g - 2*R^2))/
       (E^(R^2/g)*g^(9/2)), (2*(-2*Sqrt[g]*R*(3*g^2 + 4*g*R^2 - 4*R^4) + 
         (Sqrt[Pi]*(3*g^3 + 6*g^2*R^2 + 12*g*R^4 - 8*R^6)*Erfi[R/Sqrt[g]])/
          E^(R^2/g)))/(g^(9/2)*R^3), (16*Sqrt[Pi]*R^3)/(E^(R^2/g)*g^(9/2)), 
      (-2*Sqrt[g]*R*(105*g^3 + 50*g^2*R^2 + 20*g*R^4 + 8*R^6) + 
        (Sqrt[Pi]*(105*g^4 + 120*g^3*R^2 + 72*g^2*R^4 + 32*g*R^6 + 16*R^8)*
          Erfi[R/Sqrt[g]])/E^(R^2/g))/(g^(9/2)*R^5), 
      -((Sqrt[Pi]*(945*g^4 + 630*g^3*R^2 + 252*g^2*R^4 + 72*g*R^6 + 16*R^8))/
         (E^(R^2/g)*g^(9/2)*R^5)) + (945*Pi*Erf[R/Sqrt[g]])/(2*R^6)}, 
     {(8*Sqrt[Pi]*(15*g^2 - 20*g*R^2 + 4*R^4))/(E^(R^2/g)*g^(11/2)), 
      (4*(-2*Sqrt[g]*R*(3*g^2 - 16*g*R^2 + 4*R^4) + 
         (Sqrt[Pi]*(3*g^3 + 18*g^2*R^2 - 36*g*R^4 + 8*R^6)*Erfi[R/Sqrt[g]])/
          E^(R^2/g)))/(g^(11/2)*R^2), (16*Sqrt[Pi]*R^2*(7*g - 2*R^2))/
       (E^(R^2/g)*g^(11/2)), 
      (2*(-2*Sqrt[g]*R*(5*g - 2*R^2)*(3*g^2 + 4*g*R^2 + 4*R^4) + 
         (Sqrt[Pi]*(15*g^4 + 24*g^3*R^2 + 24*g^2*R^4 + 32*g*R^6 - 16*R^8)*
           Erfi[R/Sqrt[g]])/E^(R^2/g)))/(g^(11/2)*R^4), 
      (32*Sqrt[Pi]*R^4)/(E^(R^2/g)*g^(11/2)), 
      (-2*Sqrt[g]*R*(945*g^4 + 420*g^3*R^2 + 152*g^2*R^4 + 48*g*R^6 + 
          16*R^8) + (Sqrt[Pi]*(945*g^5 + 1050*g^4*R^2 + 600*g^3*R^4 + 
           240*g^2*R^6 + 80*g*R^8 + 32*R^10)*Erfi[R/Sqrt[g]])/E^(R^2/g))/
       (g^(11/2)*R^6), -((Sqrt[Pi]*(10395*g^5 + 6930*g^4*R^2 + 2772*g^3*R^4 + 
           792*g^2*R^6 + 176*g*R^8 + 32*R^10))/(E^(R^2/g)*g^(11/2)*R^6)) + 
       (10395*Pi*Erf[R/Sqrt[g]])/(2*R^7)}, 
     {(16*(33*g^2 - 28*g*R^2 + 4*R^4))/g^6 + 
       (8*Sqrt[Pi]*(15*g^3 - 90*g^2*R^2 + 60*g*R^4 - 8*R^6)*Erfi[R/Sqrt[g]])/
        (E^(R^2/g)*g^(13/2)*R), (64*Sqrt[Pi]*R*((35*g^2)/4 - 7*g*R^2 + R^4))/
       (E^(R^2/g)*g^(13/2)), 
      (4*(-2*Sqrt[g]*R*(9*g^3 + 18*g^2*R^2 - 44*g*R^4 + 8*R^6) + 
         (Sqrt[Pi]*(9*g^4 + 24*g^3*R^2 + 72*g^2*R^4 - 96*g*R^6 + 16*R^8)*
           Erfi[R/Sqrt[g]])/E^(R^2/g)))/(g^(13/2)*R^3), 
      (32*Sqrt[Pi]*R^3*(9*g - 2*R^2))/(E^(R^2/g)*g^(13/2)), 
      (2*(-2*Sqrt[g]*R*(105*g^4 + 80*g^3*R^2 + 48*g^2*R^4 + 32*g*R^6 - 
           16*R^8) + (Sqrt[Pi]*(105*g^5 + 150*g^4*R^2 + 120*g^3*R^4 + 
            80*g^2*R^6 + 80*g*R^8 - 32*R^10)*Erfi[R/Sqrt[g]])/E^(R^2/g)))/
       (g^(13/2)*R^5), (64*Sqrt[Pi]*R^5)/(E^(R^2/g)*g^(13/2)), 
      (-2*Sqrt[g]*R*(10395*g^5 + 4410*g^4*R^2 + 1512*g^3*R^4 + 432*g^2*R^6 + 
          112*g*R^8 + 32*R^10) + (Sqrt[Pi]*(10395*g^6 + 11340*g^5*R^2 + 
           6300*g^4*R^4 + 2400*g^3*R^6 + 720*g^2*R^8 + 192*g*R^10 + 64*R^12)*
          Erfi[R/Sqrt[g]])/E^(R^2/g))/(g^(13/2)*R^7), 
      -((Sqrt[Pi]*(135135*g^6 + 90090*g^5*R^2 + 36036*g^4*R^4 + 
           10296*g^3*R^6 + 2288*g^2*R^8 + 416*g*R^10 + 64*R^12))/
         (E^(R^2/g)*g^(13/2)*R^7)) + (135135*Pi*Erf[R/Sqrt[g]])/(2*R^8)}, 
     {(16*Sqrt[Pi]*(105*g^3 - 210*g^2*R^2 + 84*g*R^4 - 8*R^6))/
       (E^(R^2/g)*g^(15/2)), 
      (8*(2*Sqrt[g]*R*(-15*g^3 + 146*g^2*R^2 - 76*g*R^4 + 8*R^6) + 
         (Sqrt[Pi]*(15*g^4 + 120*g^3*R^2 - 360*g^2*R^4 + 160*g*R^6 - 16*R^8)*
           Erfi[R/Sqrt[g]])/E^(R^2/g)))/(g^(15/2)*R^2), 
      (32*Sqrt[Pi]*R^2*(63*g^2 - 36*g*R^2 + 4*R^4))/(E^(R^2/g)*g^(15/2)), 
      (4*(-2*Sqrt[g]*R*(45*g^4 + 60*g^3*R^2 + 72*g^2*R^4 - 112*g*R^6 + 
           16*R^8) + (Sqrt[Pi]*(45*g^5 + 90*g^4*R^2 + 120*g^3*R^4 + 
            240*g^2*R^6 - 240*g*R^8 + 32*R^10)*Erfi[R/Sqrt[g]])/E^(R^2/g)))/
       (g^(15/2)*R^4), (64*Sqrt[Pi]*R^4*(11*g - 2*R^2))/(E^(R^2/g)*g^(15/2)), 
      (2*(-2*Sqrt[g]*R*(945*g^5 + 630*g^4*R^2 + 312*g^3*R^4 + 144*g^2*R^6 + 
           80*g*R^8 - 32*R^10) + (Sqrt[Pi]*(945*g^6 + 1260*g^5*R^2 + 
            900*g^4*R^4 + 480*g^3*R^6 + 240*g^2*R^8 + 192*g*R^10 - 64*R^12)*
           Erfi[R/Sqrt[g]])/E^(R^2/g)))/(g^(15/2)*R^6), 
      (128*Sqrt[Pi]*R^6)/(E^(R^2/g)*g^(15/2)), 
      (-2*Sqrt[g]*R*(135135*g^6 + 55440*g^5*R^2 + 18396*g^4*R^4 + 
          4992*g^3*R^6 + 1168*g^2*R^8 + 256*g*R^10 + 64*R^12) + 
        (Sqrt[Pi]*(135135*g^7 + 145530*g^6*R^2 + 79380*g^5*R^4 + 
           29400*g^4*R^6 + 8400*g^3*R^8 + 2016*g^2*R^10 + 448*g*R^12 + 
           128*R^14)*Erfi[R/Sqrt[g]])/E^(R^2/g))/(g^(15/2)*R^8), 
      -((Sqrt[Pi]*(2027025*g^7 + 1351350*g^6*R^2 + 540540*g^5*R^4 + 
           154440*g^4*R^6 + 34320*g^3*R^8 + 6240*g^2*R^10 + 960*g*R^12 + 
           128*R^14))/(E^(R^2/g)*g^(15/2)*R^8)) + (2027025*Pi*Erf[R/Sqrt[g]])/
        (2*R^9)}}