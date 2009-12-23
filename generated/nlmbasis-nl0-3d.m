nlmbasis = {{1, 0, 0}, {2, 0, 0}, {2, 1, 0}, {3, 0, 0}, {3, 1, 0}, {3, 2, 0}}
 
Gammas = {{gam[0, i]*gam[0, j], gam[0, i]*(gam[0, j] - gam[1, j]), 
      ((I*p3 + 2*a*(Za - Zb))*gam[0, i]*gam[0, j])/(2*(a + b)), 
      (gam[0, i]*(3*gam[0, j] - 6*gam[1, j] + 2*gam[2, j]))/3, 
      ((I*p3 + 2*a*(Za - Zb))*gam[0, i]*(2*gam[0, j] - gam[1, j]))/
       (Sqrt[6]*(a + b)), 
      (gam[0, i]*((3*(2*b - p3^2 + a*(2 + (4*I)*p3*(Za - Zb)) + 
            4*a^2*(Za - Zb)^2)*gam[0, j])/(a + b)^2 - 4*gam[2, j]))/
       (12*Sqrt[2])}, {gam[0, j]*(gam[0, i] - gam[1, i]), 
      (gam[0, i] - gam[1, i])*(gam[0, j] - gam[1, j]), 
      ((I*p3 + 2*a*(Za - Zb))*gam[0, j]*(gam[0, i] - gam[1, i]))/(2*(a + b)), 
      ((gam[0, i] - gam[1, i])*(3*gam[0, j] - 6*gam[1, j] + 2*gam[2, j]))/3, 
      ((I*p3 + 2*a*(Za - Zb))*(gam[0, i] - gam[1, i])*
        (2*gam[0, j] - gam[1, j]))/(Sqrt[6]*(a + b)), 
      ((gam[0, i] - gam[1, i])*(3*(2*b - p3^2 + a*(2 + (4*I)*p3*(Za - Zb)) + 
           4*a^2*(Za - Zb)^2)*gam[0, j] - 4*(a + b)^2*gam[2, j]))/
       (12*Sqrt[2]*(a + b)^2)}, {((I*p3 + 2*b*(-Za + Zb))*gam[0, i]*
        gam[0, j])/(2*(a + b)), ((I*p3 + 2*b*(-Za + Zb))*gam[0, i]*
        (gam[0, j] - gam[1, j]))/(2*(a + b)), 
      ((-p3^2 + b*(2 - (2*I)*p3*(Za - Zb)) + a*(2 + (2*I)*p3*(Za - Zb) - 
           4*b*(Za - Zb)^2))*gam[0, i]*gam[0, j])/(4*(a + b)^2), 
      ((I*p3 + 2*b*(-Za + Zb))*gam[0, i]*(3*gam[0, j] - 6*gam[1, j] + 
         2*gam[2, j]))/(6*(a + b)), ((-p3^2 + b*(2 - (2*I)*p3*(Za - Zb)) + 
         a*(2 + (2*I)*p3*(Za - Zb) - 4*b*(Za - Zb)^2))*gam[0, i]*
        (2*gam[0, j] - gam[1, j]))/(2*Sqrt[6]*(a + b)^2), 
      (gam[0, i]*(3*((-I)*p3^3 + 4*b^2*(-Za + Zb) + 
           2*a*p3*(3*I - 2*p3*Za + 2*p3*Zb) + (4*I)*a^2*(-Za + Zb)*
            (2*I + p3*(-Za + Zb)) - 2*b*(I*p3*(-3 + 4*a*(Za - Zb)^2) + 
             2*a*(-1 + 2*a*(Za - Zb)^2)*(Za - Zb) + p3^2*(-Za + Zb)))*
          gam[0, j] + 4*(a + b)^2*((-I)*p3 + 2*b*(Za - Zb))*gam[2, j]))/
       (24*Sqrt[2]*(a + b)^3)}, 
     {(gam[0, j]*(3*gam[0, i] - 6*gam[1, i] + 2*gam[2, i]))/3, 
      ((gam[0, j] - gam[1, j])*(3*gam[0, i] - 6*gam[1, i] + 2*gam[2, i]))/3, 
      ((I*p3 + 2*a*(Za - Zb))*gam[0, j]*(3*gam[0, i] - 6*gam[1, i] + 
         2*gam[2, i]))/(6*(a + b)), 
      ((3*gam[0, i] - 6*gam[1, i] + 2*gam[2, i])*(3*gam[0, j] - 6*gam[1, j] + 
         2*gam[2, j]))/9, ((I*p3 + 2*a*(Za - Zb))*(2*gam[0, j] - gam[1, j])*
        (3*gam[0, i] - 6*gam[1, i] + 2*gam[2, i]))/(3*Sqrt[6]*(a + b)), 
      ((3*gam[0, i] - 6*gam[1, i] + 2*gam[2, i])*
        (3*(2*b - p3^2 + a*(2 + (4*I)*p3*(Za - Zb)) + 4*a^2*(Za - Zb)^2)*
          gam[0, j] - 4*(a + b)^2*gam[2, j]))/(36*Sqrt[2]*(a + b)^2)}, 
     {((I*p3 + 2*b*(-Za + Zb))*gam[0, j]*(2*gam[0, i] - gam[1, i]))/
       (Sqrt[6]*(a + b)), ((I*p3 + 2*b*(-Za + Zb))*(2*gam[0, i] - gam[1, i])*
        (gam[0, j] - gam[1, j]))/(Sqrt[6]*(a + b)), 
      ((-p3^2 + b*(2 - (2*I)*p3*(Za - Zb)) + a*(2 + (2*I)*p3*(Za - Zb) - 
           4*b*(Za - Zb)^2))*gam[0, j]*(2*gam[0, i] - gam[1, i]))/
       (2*Sqrt[6]*(a + b)^2), ((I*p3 + 2*b*(-Za + Zb))*
        (2*gam[0, i] - gam[1, i])*(3*gam[0, j] - 6*gam[1, j] + 2*gam[2, j]))/
       (3*Sqrt[6]*(a + b)), -((p3^2 + (2*I)*b*(I + p3*(Za - Zb)) + 
          a*(-2 - (2*I)*p3*(Za - Zb) + 4*b*(Za - Zb)^2))*
         (2*gam[0, i] - gam[1, i])*(2*gam[0, j] - gam[1, j]))/(6*(a + b)^2), 
      (6*((-I)*p3^3 + 4*b^2*(-Za + Zb) + 2*a*p3*(3*I - 2*p3*Za + 2*p3*Zb) + 
          (4*I)*a^2*(-Za + Zb)*(2*I + p3*(-Za + Zb)) - 
          2*b*(I*p3*(-3 + 4*a*(Za - Zb)^2) + 2*a*(-1 + 2*a*(Za - Zb)^2)*
             (Za - Zb) + p3^2*(-Za + Zb)))*gam[0, i]*gam[0, j] - 
        3*((-I)*p3^3 + 4*b^2*(-Za + Zb) + 2*a*p3*(3*I - 2*p3*Za + 2*p3*Zb) + 
          (4*I)*a^2*(-Za + Zb)*(2*I + p3*(-Za + Zb)) - 
          2*b*(I*p3*(-3 + 4*a*(Za - Zb)^2) + 2*a*(-1 + 2*a*(Za - Zb)^2)*
             (Za - Zb) + p3^2*(-Za + Zb)))*gam[0, j]*gam[1, i] + 
        8*(a + b)^2*((-I)*p3 + 2*b*(Za - Zb))*gam[0, i]*gam[2, j] + 
        4*(a + b)^2*(I*p3 + 2*b*(-Za + Zb))*gam[1, i]*gam[2, j])/
       (24*Sqrt[3]*(a + b)^3)}, 
     {(gam[0, j]*((3*(2*a - p3^2 + b*(2 - (4*I)*p3*(Za - Zb)) + 
            4*b^2*(Za - Zb)^2)*gam[0, i])/(a + b)^2 - 4*gam[2, i]))/
       (12*Sqrt[2]), -((gam[0, j] - gam[1, j])*
         (-3*(2*a - p3^2 + b*(2 - (4*I)*p3*(Za - Zb)) + 4*b^2*(Za - Zb)^2)*
           gam[0, i] + 4*(a + b)^2*gam[2, i]))/(12*Sqrt[2]*(a + b)^2), 
      (gam[0, j]*(3*((-I)*p3^3 - 2*a*(I*p3*(-3 + 4*b*(Za - Zb)^2) + 
             p3^2*(Za - Zb) - 2*b*(-1 + 2*b*(Za - Zb)^2)*(Za - Zb)) + 
           4*a^2*(Za - Zb) + 2*b*p3*(3*I + 2*p3*Za - 2*p3*Zb) + 
           (4*I)*b^2*(Za - Zb)*(2*I + p3*Za - p3*Zb))*gam[0, i] - 
         4*(a + b)^2*(I*p3 + 2*a*(Za - Zb))*gam[2, i]))/
       (24*Sqrt[2]*(a + b)^3), 
      -((-3*(2*a - p3^2 + b*(2 - (4*I)*p3*(Za - Zb)) + 4*b^2*(Za - Zb)^2)*
           gam[0, i] + 4*(a + b)^2*gam[2, i])*(3*gam[0, j] - 6*gam[1, j] + 
          2*gam[2, j]))/(36*Sqrt[2]*(a + b)^2), 
      (6*((-I)*p3^3 - 2*a*(I*p3*(-3 + 4*b*(Za - Zb)^2) + p3^2*(Za - Zb) - 
            2*b*(-1 + 2*b*(Za - Zb)^2)*(Za - Zb)) + 4*a^2*(Za - Zb) + 
          2*b*p3*(3*I + 2*p3*Za - 2*p3*Zb) + (4*I)*b^2*(Za - Zb)*
           (2*I + p3*Za - p3*Zb))*gam[0, i]*gam[0, j] - 
        3*((-I)*p3^3 - 2*a*(I*p3*(-3 + 4*b*(Za - Zb)^2) + p3^2*(Za - Zb) - 
            2*b*(-1 + 2*b*(Za - Zb)^2)*(Za - Zb)) + 4*a^2*(Za - Zb) + 
          2*b*p3*(3*I + 2*p3*Za - 2*p3*Zb) + (4*I)*b^2*(Za - Zb)*
           (2*I + p3*Za - p3*Zb))*gam[0, i]*gam[1, j] - 
        8*(a + b)^2*(I*p3 + 2*a*(Za - Zb))*gam[0, j]*gam[2, i] + 
        4*(a + b)^2*(I*p3 + 2*a*(Za - Zb))*gam[1, j]*gam[2, i])/
       (24*Sqrt[3]*(a + b)^3), 
      ((9*(p3^4 + (4*I)*b*p3^2*(3*I + p3*(Za - Zb)) - 
           4*b^2*(-3 + (6*I)*p3*(Za - Zb) + p3^2*(Za - Zb)^2) + 
           4*a*(p3^2*(-3 - I*p3*(Za - Zb)) + b*(6 + 4*p3^2*(Za - Zb)^2) + 
             (2*I)*b^2*(3*I + 2*p3*(Za - Zb))*(Za - Zb)^2) - 
           4*a^2*(-3 + (2*I)*p3*(-3 + 2*b*(Za - Zb)^2)*(Za - Zb) + 
             6*b*(Za - Zb)^2 + p3^2*(Za - Zb)^2 - 4*b^2*(Za - Zb)^4) + 
           8*a^3*(Za - Zb)^2 + 8*b^3*(Za - Zb)^2)*gam[0, i]*gam[0, j])/
         (a + b)^4 - (12*(2*b - p3^2 + a*(2 + (4*I)*p3*(Za - Zb)) + 
           4*a^2*(Za - Zb)^2)*gam[0, j]*gam[2, i])/(a + b)^2 - 
        (12*(2*a - p3^2 + b*(2 - (4*I)*p3*(Za - Zb)) + 4*b^2*(Za - Zb)^2)*
          gam[0, i]*gam[2, j])/(a + b)^2 + 16*gam[2, i]*gam[2, j])/288}}
 
Gammasp = {{gam[0, ip]*gam[0, jp], gam[0, ip]*(gam[0, jp] - gam[1, jp]), 
      (((-I)*p3 + 2*a*(Zap - Zbp))*gam[0, ip]*gam[0, jp])/(2*(a + b)), 
      (gam[0, ip]*(3*gam[0, jp] - 6*gam[1, jp] + 2*gam[2, jp]))/3, 
      (((-I)*p3 + 2*a*(Zap - Zbp))*gam[0, ip]*(2*gam[0, jp] - gam[1, jp]))/
       (Sqrt[6]*(a + b)), 
      (gam[0, ip]*((3*(2*b - p3^2 + a*(2 - (4*I)*p3*(Zap - Zbp)) + 
            4*a^2*(Zap - Zbp)^2)*gam[0, jp])/(a + b)^2 - 4*gam[2, jp]))/
       (12*Sqrt[2])}, {gam[0, jp]*(gam[0, ip] - gam[1, ip]), 
      (gam[0, ip] - gam[1, ip])*(gam[0, jp] - gam[1, jp]), 
      (((-I)*p3 + 2*a*(Zap - Zbp))*gam[0, jp]*(gam[0, ip] - gam[1, ip]))/
       (2*(a + b)), ((gam[0, ip] - gam[1, ip])*(3*gam[0, jp] - 6*gam[1, jp] + 
         2*gam[2, jp]))/3, (((-I)*p3 + 2*a*(Zap - Zbp))*
        (gam[0, ip] - gam[1, ip])*(2*gam[0, jp] - gam[1, jp]))/
       (Sqrt[6]*(a + b)), ((gam[0, ip] - gam[1, ip])*
        (3*(2*b - p3^2 + a*(2 - (4*I)*p3*(Zap - Zbp)) + 4*a^2*(Zap - Zbp)^2)*
          gam[0, jp] - 4*(a + b)^2*gam[2, jp]))/(12*Sqrt[2]*(a + b)^2)}, 
     {(((-I)*p3 + 2*b*(-Zap + Zbp))*gam[0, ip]*gam[0, jp])/(2*(a + b)), 
      (((-I)*p3 + 2*b*(-Zap + Zbp))*gam[0, ip]*(gam[0, jp] - gam[1, jp]))/
       (2*(a + b)), ((-p3^2 + b*(2 + (2*I)*p3*(Zap - Zbp)) + 
         a*(2 - (2*I)*p3*(Zap - Zbp) - 4*b*(Zap - Zbp)^2))*gam[0, ip]*
        gam[0, jp])/(4*(a + b)^2), (((-I)*p3 + 2*b*(-Zap + Zbp))*gam[0, ip]*
        (3*gam[0, jp] - 6*gam[1, jp] + 2*gam[2, jp]))/(6*(a + b)), 
      ((-p3^2 + b*(2 + (2*I)*p3*(Zap - Zbp)) + a*(2 - (2*I)*p3*(Zap - Zbp) - 
           4*b*(Zap - Zbp)^2))*gam[0, ip]*(2*gam[0, jp] - gam[1, jp]))/
       (2*Sqrt[6]*(a + b)^2), 
      (gam[0, ip]*(3*(I*p3^3 + 4*b^2*(-Zap + Zbp) - 
           2*a*p3*(3*I + 2*p3*Zap - 2*p3*Zbp) + (4*I)*a^2*(-Zap + Zbp)*
            (2*I - p3*(-Zap + Zbp)) - 2*b*((-I)*p3*(-3 + 4*a*(Zap - Zbp)^2) + 
             2*a*(-1 + 2*a*(Zap - Zbp)^2)*(Zap - Zbp) + p3^2*(-Zap + Zbp)))*
          gam[0, jp] + 4*(a + b)^2*(I*p3 + 2*b*(Zap - Zbp))*gam[2, jp]))/
       (24*Sqrt[2]*(a + b)^3)}, 
     {(gam[0, jp]*(3*gam[0, ip] - 6*gam[1, ip] + 2*gam[2, ip]))/3, 
      ((gam[0, jp] - gam[1, jp])*(3*gam[0, ip] - 6*gam[1, ip] + 
         2*gam[2, ip]))/3, (((-I)*p3 + 2*a*(Zap - Zbp))*gam[0, jp]*
        (3*gam[0, ip] - 6*gam[1, ip] + 2*gam[2, ip]))/(6*(a + b)), 
      ((3*gam[0, ip] - 6*gam[1, ip] + 2*gam[2, ip])*(3*gam[0, jp] - 
         6*gam[1, jp] + 2*gam[2, jp]))/9, (((-I)*p3 + 2*a*(Zap - Zbp))*
        (2*gam[0, jp] - gam[1, jp])*(3*gam[0, ip] - 6*gam[1, ip] + 
         2*gam[2, ip]))/(3*Sqrt[6]*(a + b)), 
      ((3*gam[0, ip] - 6*gam[1, ip] + 2*gam[2, ip])*
        (3*(2*b - p3^2 + a*(2 - (4*I)*p3*(Zap - Zbp)) + 4*a^2*(Zap - Zbp)^2)*
          gam[0, jp] - 4*(a + b)^2*gam[2, jp]))/(36*Sqrt[2]*(a + b)^2)}, 
     {(((-I)*p3 + 2*b*(-Zap + Zbp))*gam[0, jp]*(2*gam[0, ip] - gam[1, ip]))/
       (Sqrt[6]*(a + b)), (((-I)*p3 + 2*b*(-Zap + Zbp))*
        (2*gam[0, ip] - gam[1, ip])*(gam[0, jp] - gam[1, jp]))/
       (Sqrt[6]*(a + b)), ((-p3^2 + b*(2 + (2*I)*p3*(Zap - Zbp)) + 
         a*(2 - (2*I)*p3*(Zap - Zbp) - 4*b*(Zap - Zbp)^2))*gam[0, jp]*
        (2*gam[0, ip] - gam[1, ip]))/(2*Sqrt[6]*(a + b)^2), 
      (((-I)*p3 + 2*b*(-Zap + Zbp))*(2*gam[0, ip] - gam[1, ip])*
        (3*gam[0, jp] - 6*gam[1, jp] + 2*gam[2, jp]))/(3*Sqrt[6]*(a + b)), 
      -((p3^2 + (2*I)*b*(I - p3*(Zap - Zbp)) + a*(-2 + (2*I)*p3*(Zap - Zbp) + 
            4*b*(Zap - Zbp)^2))*(2*gam[0, ip] - gam[1, ip])*
         (2*gam[0, jp] - gam[1, jp]))/(6*(a + b)^2), 
      (6*(I*p3^3 + 4*b^2*(-Zap + Zbp) - 2*a*p3*(3*I + 2*p3*Zap - 2*p3*Zbp) + 
          (4*I)*a^2*(-Zap + Zbp)*(2*I - p3*(-Zap + Zbp)) - 
          2*b*((-I)*p3*(-3 + 4*a*(Zap - Zbp)^2) + 
            2*a*(-1 + 2*a*(Zap - Zbp)^2)*(Zap - Zbp) + p3^2*(-Zap + Zbp)))*
         gam[0, ip]*gam[0, jp] - 3*(I*p3^3 + 4*b^2*(-Zap + Zbp) - 
          2*a*p3*(3*I + 2*p3*Zap - 2*p3*Zbp) + (4*I)*a^2*(-Zap + Zbp)*
           (2*I - p3*(-Zap + Zbp)) - 2*b*((-I)*p3*(-3 + 4*a*(Zap - Zbp)^2) + 
            2*a*(-1 + 2*a*(Zap - Zbp)^2)*(Zap - Zbp) + p3^2*(-Zap + Zbp)))*
         gam[0, jp]*gam[1, ip] + 8*(a + b)^2*(I*p3 + 2*b*(Zap - Zbp))*
         gam[0, ip]*gam[2, jp] + 4*(a + b)^2*((-I)*p3 + 2*b*(-Zap + Zbp))*
         gam[1, ip]*gam[2, jp])/(24*Sqrt[3]*(a + b)^3)}, 
     {(gam[0, jp]*((3*(2*a - p3^2 + b*(2 + (4*I)*p3*(Zap - Zbp)) + 
            4*b^2*(Zap - Zbp)^2)*gam[0, ip])/(a + b)^2 - 4*gam[2, ip]))/
       (12*Sqrt[2]), -((gam[0, jp] - gam[1, jp])*
         (-3*(2*a - p3^2 + b*(2 + (4*I)*p3*(Zap - Zbp)) + 
            4*b^2*(Zap - Zbp)^2)*gam[0, ip] + 4*(a + b)^2*gam[2, ip]))/
       (12*Sqrt[2]*(a + b)^2), 
      (gam[0, jp]*(3*(I*p3^3 - 2*a*((-I)*p3*(-3 + 4*b*(Zap - Zbp)^2) + 
             p3^2*(Zap - Zbp) - 2*b*(-1 + 2*b*(Zap - Zbp)^2)*(Zap - Zbp)) + 
           4*a^2*(Zap - Zbp) + (4*I)*b^2*(Zap - Zbp)*(2*I - p3*Zap + 
             p3*Zbp) - 2*b*p3*(3*I - 2*p3*Zap + 2*p3*Zbp))*gam[0, ip] - 
         4*(a + b)^2*((-I)*p3 + 2*a*(Zap - Zbp))*gam[2, ip]))/
       (24*Sqrt[2]*(a + b)^3), 
      -((-3*(2*a - p3^2 + b*(2 + (4*I)*p3*(Zap - Zbp)) + 4*b^2*(Zap - Zbp)^2)*
           gam[0, ip] + 4*(a + b)^2*gam[2, ip])*(3*gam[0, jp] - 
          6*gam[1, jp] + 2*gam[2, jp]))/(36*Sqrt[2]*(a + b)^2), 
      (6*(I*p3^3 - 2*a*((-I)*p3*(-3 + 4*b*(Zap - Zbp)^2) + p3^2*(Zap - Zbp) - 
            2*b*(-1 + 2*b*(Zap - Zbp)^2)*(Zap - Zbp)) + 4*a^2*(Zap - Zbp) + 
          (4*I)*b^2*(Zap - Zbp)*(2*I - p3*Zap + p3*Zbp) - 
          2*b*p3*(3*I - 2*p3*Zap + 2*p3*Zbp))*gam[0, ip]*gam[0, jp] - 
        3*(I*p3^3 - 2*a*((-I)*p3*(-3 + 4*b*(Zap - Zbp)^2) + 
            p3^2*(Zap - Zbp) - 2*b*(-1 + 2*b*(Zap - Zbp)^2)*(Zap - Zbp)) + 
          4*a^2*(Zap - Zbp) + (4*I)*b^2*(Zap - Zbp)*(2*I - p3*Zap + p3*Zbp) - 
          2*b*p3*(3*I - 2*p3*Zap + 2*p3*Zbp))*gam[0, ip]*gam[1, jp] - 
        8*(a + b)^2*((-I)*p3 + 2*a*(Zap - Zbp))*gam[0, jp]*gam[2, ip] + 
        4*(a + b)^2*((-I)*p3 + 2*a*(Zap - Zbp))*gam[1, jp]*gam[2, ip])/
       (24*Sqrt[3]*(a + b)^3), 
      ((9*(p3^4 + (4*I)*b*p3^2*(3*I - p3*(Zap - Zbp)) - 
           4*b^2*(-3 - (6*I)*p3*(Zap - Zbp) + p3^2*(Zap - Zbp)^2) + 
           4*a*(p3^2*(-3 + I*p3*(Zap - Zbp)) + b*(6 + 4*p3^2*(Zap - Zbp)^2) + 
             (2*I)*b^2*(3*I - 2*p3*(Zap - Zbp))*(Zap - Zbp)^2) - 
           4*a^2*(-3 - (2*I)*p3*(-3 + 2*b*(Zap - Zbp)^2)*(Zap - Zbp) + 
             6*b*(Zap - Zbp)^2 + p3^2*(Zap - Zbp)^2 - 4*b^2*(Zap - Zbp)^4) + 
           8*a^3*(Zap - Zbp)^2 + 8*b^3*(Zap - Zbp)^2)*gam[0, ip]*gam[0, jp])/
         (a + b)^4 - (12*(2*b - p3^2 + a*(2 - (4*I)*p3*(Zap - Zbp)) + 
           4*a^2*(Zap - Zbp)^2)*gam[0, jp]*gam[2, ip])/(a + b)^2 - 
        (12*(2*a - p3^2 + b*(2 + (4*I)*p3*(Zap - Zbp)) + 4*b^2*(Zap - Zbp)^2)*
          gam[0, ip]*gam[2, jp])/(a + b)^2 + 16*gam[2, ip]*gam[2, jp])/288}}
