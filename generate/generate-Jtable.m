Xs = ToExpression[Environment["Xs"]];
job = Environment["job"];

{Za,Zb,Zap,Zbp} = Xs;
{Gammas,Gammasp} = Simplify[{Gammas,Gammasp}];

Get["Gauss/nlmbasis.m"];

Switch[Xs,
       {0,0,0,0},

       Print["{0,0,0,0}: Full symmetry: 12<->34, 1<->2, 3<->4"];
       nlmindex2 = Flatten[Table[{mu1,mu2},{mu1,Length[nlmbasis]},{mu2,mu1}],1];
       nlmindex4 = Flatten[Table[Join[nlmindex2[[i]],nlmindex2[[j]]],{i,Length[nlmindex2]},{j,i}],1];
       ,
       {0,0,s,s},
       Get["generate-exact-00ss.m"];

       Print["{0,0,s,s}: Full symmetry w/ sign: 12<->34: (-1)^L, 1<->2, 3<->4"];
       nlmindex2 = Flatten[Table[{mu1,mu2},{mu1,Length[nlmbasis]},{mu2,mu1}],1];
       nlmindex4 = Flatten[Table[Join[nlmindex2[[i]],nlmindex2[[j]]],{i,Length[nlmindex2]},{j,i}],1];

       makeJ = rp19;
       ,
       {0,s,s,s},

       Print["{0,s,s,s}: Partial symmetry: 3<->4"];
       M = Length[nlmbasis];
       nlmindex4 = Flatten[Table[{mu1,mu2,mu3,mu4},{mu1,M},{mu2,M},{mu3,M},{mu4,mu3}],3];
       nlmbasis4 = Flatten[Table[{nlmbasis[[mu1]],nlmbasis[[mu2]],nlmbasis[[mu3]],nlmbasis[[mu4]]},
       {mu1,M},{mu2,M},{mu3,M},{mu4,mu3}],3];

       makeJ = makeJ110;
       ,
       {0,s,0,s},

       Print["{0,s,0,s}: Partial symmetry w/ sign:  12 <-> 34 and (1<->2 && 3<->4) (-1)^L"];
       M = Length[nlmbasis];

       nlmindex2a = Flatten[Table[{mu1, mu2}, {mu1, M}, {mu2, mu1}], 1];
       nlmindex2b = Flatten[Table[{mu1, mu2}, {mu1, M}, {mu2, mu1 - 1}], 1];

       M2a = Length[nlmindex2a];
       M2b = Length[nlmindex2b];
       nlmindex4 = Join[
              Flatten[Table[Join[nlmindex2a[[i]], nlmindex2a[[j]]], {i, M2a}, {j, i}], 1], 
              Flatten[Table[Join[nlmindex2b[[i]], Reverse[nlmindex2b[[j]]]], {i, M2b}, {j, i}], 1]
       ];

       makeJ = makeJ65;
];

Switch[job,
  "get-length",
  Print["Length[nlmbasis]=",Length[nlmbasis]];
  Print["Length[nlmindex2]=",Length[nlmindex2]];
  Print["Length[nlmindex4]=",Length[nlmindex4]],
  "collect",
  JTable = Table[(Get["generated/"<>ToString[Xs]<>"/J."<>ToString[i]<>".m"];J),{i,Length[nlmindex4]}];
  Save["generated/"<>ToString[Xs]<>"/JTable.m",{JTable,nlmindex2,nlmindex4}],
  "run",
  Get["Gauss/gauss.m"];

  inputs = ToExpression[Environment["inputs"]];
  dir   = CreateDirectory["generated/"<>ToString[Xs]];
  Do[
    idx = inputs[[ii]];
    is  = nlmindex4[[idx]];
    mus = nlmbasis[[#]]&/@is;
    Print[idx,": ",is," ~> ",mus];
    J = makeJ[is];
    Save[dir<>"/J."<>ToString[idx]<>".m",J];
  ,{ii,1,Length[inputs]}];
];


