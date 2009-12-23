Get["Gauss/nlmbasis.m"];
lmaxJl = Max[#[[2]]&/@nlmbasis]*4; (* TODO: Is this the correct upper bound? *)

sphericalbesseltable = Table[Interpolation[{#,SphericalBesselJ[l,#]}&/@Range[0,300,.2]],{l,0,lmaxJl}];

Save["Gauss/generated/sphericalbessel.m",sphericalbesseltable,lmaxJl];

