
makeGammam0[fi_, fj_] := Module[{ci, cj},
   pol3[{0,0}] := 1;

   ci = CoefficientList[fi, {r, z}];
   cj = CoefficientList[fj, {r, z}];
   
   Sum[ci[[pi + 1, ni + 1]]*cj[[pj + 1, nj + 1]]*gam[pi,i]*gam[pj,j]*
     pol3[{ni, nj}],
    {pi, 0, Length[ci] - 1}, {ni, 0, Length[ci[[pi + 1]]] - 1},
    {pj, 0, Length[cj] - 1}, {nj, 0, Length[cj[[pj + 1]]] - 1}]
];

makeGamma[fi_, fj_] := Module[{ci, cj},
   pol1[{0,0}] := 1;
   pol2[{0,0}] := 1;
   pol3[{0,0}] := 1;

   ci = CoefficientList[fi, {r, x,y,z}];
   cj = CoefficientList[fj, {r, x,y,z}];
   
   Sum[ci[[pi + 1, nxi+1,nyi+1,nzi+1]]*cj[[pj + 1, nxj+1,nyj+1,nzj+1]]*
       gam[pi,i]*gam[pj,j]*pol1[{nxi, nxj}]*pol2[{nyi, nyj}]*pol3[{nzi, nzj}],

    {pi, 0, Length[ci] - 1}, 
    {nxi, 0, Length[ci[[pi + 1]]]-1},{nyi, 0, Length[ci[[pi + 1,nxi+1]]]-1},{nzi, 0, Length[ci[[pi + 1,nxi+1,nyi+1]]]-1},

    {pj, 0, Length[cj] - 1}, 
    {nxj, 0, Length[cj[[pj + 1]]]-1},{nyj, 0, Length[cj[[pj + 1,nxj+1]]]-1},{nzj, 0, Length[cj[[pj + 1,nxj+1,nyj+1]]]-1}
  ]
];

Get["spherical-simplified.m"];
sf[n_, l_, k_] := norm[n, l, k]*(2*k*r)^l*Hypergeometric1F1[l + 1 - n, 
      2*l + 2, 2*k*r]
norm[n_, l_, k_] := 2*(k^(3/2)/(2*l + 1)!)*Sqrt[(l + n)!/(n*(n - l - 1)!)]
bf[{n_,l_,m_}] := Sqrt[Pi]*sf[n,l,1]*y3[l,m]/.{u1->x/r,u2->y/r,u3->z/r};

makeGammaTable[nlmbasis_] := Module[{bfs},
   bfs = bf/@nlmbasis;
   Outer[makeGamma,bfs,bfs]
];
