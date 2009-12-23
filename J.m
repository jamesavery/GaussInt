Get["nlmbasis.m"];

symindex0000[mu1_,mu2_,mu3_,mu4_] := Module[{index2,i1,i2},
  index2[i_,j_] := If[i<j,index2[j,i],1/2(i-1)i+j];

  Return[index2[index2[mu1,mu2],index2[mu3,mu4]]];
];

symindex0sss[mu1_, mu2_, mu3p_, mu4p_] := Module[{M = Length[nlmbasis],mu3, mu4},
   {mu3, mu4} = {Max[mu3p, mu4p], Min[mu3p, mu4p]};

   Return[((mu1 - 1)*M + (mu2 - 1))*1/2*M (M + 1) + 1/2*(mu3 - 1)*mu3 + mu4];
];

symindex0s0s[mu1_,mu2_,mu3_,mu4_]:=Module[{M = Length[nlmbasis],tablenumber},
  index2[i_,j_] := If[i<j,index2[j,i],1/2(i-1)i+j];
  index2b[i_,j_]:= If[i<j,index2b[j,i],1/2(i-2)(i-1)+j];

  If[(mu1>=mu2 && mu3>=mu4) || (mu1<=mu2 && mu3<=mu4),
    Return[index2[index2[mu1,mu2],index2[mu3,mu4]] ],
    Return[index2[1/2(M+1)M+1,0] + index2[index2b[mu1,mu2],index2b[mu3,mu4]] ]
  ];
];

eri[{tau1_,tau2_,tau3_,tau4_}] := Module[{a,mu1,b,mu2,c,mu3,d,mu4,idx,j,l1,l2,l3,l4,L},
 {a,b,c,d}         = #[[1]]& /@ {tau1,tau2,tau3,tau4};
 {mu1,mu2,mu3,mu4} = #[[2]]& /@ {tau1,tau2,tau3,tau4};
 {l1,l2,l3,l4} = nlmbasis[[#,2]]&/@{mu1,mu2,mu3,mu4};
 L = l1+l2+l3+l4;

 Print[{a,b,c,d}];
 Switch[{a,b,c,d},
        {0,0,0,0},
        j = repzexact[mu1,mu2,mu3,mu4];
	Return[j&],

        {1,1,1,1},
        j = repzexact[mu1,mu2,mu3,mu4];
	Return[j&],

        {0,0,1,1},
 	idx = symindex0000[mu1,mu2,mu3,mu4];
	Return[J00ssTable[[idx]]],

       {1,1,0,0},
 	idx = symindex0000[mu1,mu2,mu3,mu4];
	Return[(-1)^L*J00ssTable[[idx]][#]&],

(* TODO: Check where we need to stick a (-1)^(l1+...+l4) *)
       {0,1,1,1},
        idx = symindex0sss[mu1,mu2,mu3,mu4];
	Return[J0sssTable[[idx]]],

       {1,0,1,1},
        idx = symindex0sss[mu2,mu1,mu3,mu4];
	Return[J0sssTable[[idx]]],

       {1,1,0,1},
        idx = symindex0sss[mu3,mu4,mu1,mu2];
	Return[J0sssTable[[idx]]],

       {1,1,1,0},
        idx = symindex0sss[mu4,mu3,mu1,mu2];
	Return[J0sssTable[[idx]]],

       {1,0,0,0},
        idx = symindex0sss[mu1,mu2,mu3,mu4];
	Return[(-1)^L*J0sssTable[[idx]]],

       {0,1,0,0},
        idx = symindex0sss[mu2,mu1,mu3,mu4];
	Return[(-1)^L*J0sssTable[[idx]]],

       {0,0,1,0},
        idx = symindex0sss[mu3,mu4,mu1,mu2];
	Return[(-1)^L*J0sssTable[[idx]]],

       {0,0,0,1},
        idx = symindex0sss[mu4,mu3,mu1,mu2];
	Return[(-1)^L*J0sssTable[[idx]]],

(* TODO: Check where we need to stick a (-1)^(l1+...+l4) *)
       {0,1,0,1},
        idx = symindex0s0s[mu1,mu2,mu3,mu4];
	Return[J0s0sTable[[idx]]],

       {0,1,1,0},
        idx = symindex0s0s[mu1,mu2,mu4,mu3];
	Return[J0s0sTable[[idx]]],

       {1,0,0,1},
        idx = symindex0s0s[mu2,mu1,mu3,mu4];
	Return[J0s0sTable[[idx]]],

       {1,0,1,0},
        idx = symindex0s0s[mu1,mu2,mu3,mu4];
	Return[(-1)^L*J0s0sTable[[idx]]]
     ];
];

Get["generated/exact-table.m"];
Get["generated/J00ssTable.m"];
nlmindex4x00ss = nlmindex4;
Get["generated/J0sssTable.m"];
nlmindex4x0sss = nlmindex4;
Get["generated/J0s0sTable.m"];
nlmindex4x0s0s = nlmindex4;
