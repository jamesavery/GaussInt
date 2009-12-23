Get["makeGamma.m"];
Get["Gauss/generated/polys.m"];

basisname=Environment["NLMBASIS"];
If[basisname === $Failed, basisname = "n00-3s"];

Switch[basisname,
      "n00-3s",
      nlmbasis = {{1, 0, 0}, {2, 0, 0},{3,0,0}},
      "n00-10s",
      nlmbasis = Table[{n,0,0},{n,10}],
      "nl0-3d",
      nlmbasis = Flatten[Table[{n,l,0},{n,3},{l,0,n-1}],1],
      "nl0-7d",
      nlmbasis = Flatten[Table[{n,l,0},{n,7},{l,0,Min[n-1,2]}],1],
      "nl0-7g",
      nlmbasis = Flatten[Table[{n,l,0},{n,7},{l,0,Min[n-1,4]}],1],
      "nlm-5g",
      nlmbasis = Flatten[Table[{n,l,0},{n,5},{l,0,n-1}],2]
];

Gammas  = Simplify[makeGammaTable[nlmbasis]];
Gammasp = Gammas/.{Xa->Xap,Xb->Xbp,Ya->Yap,Yb->Ybp,Za->Zap,Zb->Zbp,i->ip,j->jp,p1->-p1,p2->-p2,p3->-p3};

Save["Gauss/generated/nlmbasis-"<>basisname<>".m", {nlmbasis, Gammas, Gammasp}];

