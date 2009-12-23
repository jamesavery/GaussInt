BeginPackage["Sturmian`sturm`"]

hwf::usage = 
"hwf[n,l,z,r] is the polynomial part sturmPoly[n,l,z/n] of the Hydrogenlike
wave function";
sturmPoly::usage = 
"sturmPoly[n,l,k,r] is the polynomial part of a one-electron sturmian \!\(\[Chi]\_\(nl..\)(kr)\) 
given by Equations 3.11-3.14. I.e., it is the radial part modulo the exponential.";
radialInt::usage = 
"radialInt[p1,p2,z1,z2,l] computes the radial integrals
 \!\(\[Integral] r\_1\^2 dr\_1 p\_1(r\_1) e\^(-z\_1 r\_1) 
\[Integral] r\_2\^2 dr\_2 p\_2(r\_2) e\^(-z\_2 r\_2)
\(r\_<\^l\)\/\(r\_>\^\(l+1\)\) \)"; (* XXX: ref! *)

overlap::usage = "overlap[p,z] is the overlap integral of a product of
two wavefunctions.  p is a polynomial in r, z is the exponent. Do not
explicitly write the r^2 from the integration over solid angle."; (* XXX: ref! *)

overlapmulrn::usage = "overlap[p,z,n] is the...";

mkR::usage = 
"mkR[basis] constructs R = 1/Q (eq. (x.xx)) given basis.
 basis is either a list of the two primary quantum numbers {n1,n2} for
 the two-electron case, or a list of N-tuples of the form
 \!\({{n\_1,l\_1,..},...,{n\_N,l\_N,..}}\)"; (* XXX: ref! *)


Begin["`Private`"]

hwf[n_,l_,z_] := hwf[n,l,z,r];
sturmPoly[n_,l_,k_]  := sturmPoly[n,l,k,r];

hwf[n_, l_, z_,r_] := sturmPoly[n, l, z/n,r];
sturmPoly[n_, l_, k0_,r_] := norm[n, l, k0]*(2*k0*r)^l*Hypergeometric1F1[l + 1 - n,
                                                          2*l + 2, 2*k0*r];

norm[n_, l_, k0_] := 2*k0^(3/2)*(Sqrt[(l + n)!/(n*(n - l - 1)!)]/(2*l + 1)!);
 

(* int beregner Coulomb og 'exchange'-integralerne ved at splitte
   op i de grad(p1)*grad(p2) led på formen (x.xx). *) (* XXX: ref! lang! *)
radialInt[p1_, p2_, z1_, z2_, l_, r_] := 
(
 c1 = CoefficientList[p1,r]; max1 = Length[c1];     
 c2 = CoefficientList[p2,r]; max2 = Length[c2]; 

 val = Sum[c1[[i1]]*c2[[i2]]*jnt[i1 - 1, i2 - 1, z1, z2, l], 
        {i1, max1}, {i2, max2}]
);

radialInt[p1_, p2_, z1_, z2_, l_] := radialInt[p1, p2, z1, z2, l,r];
 


(* jnt udfoerer integrationen vist i ligning (x.xx), side x.
 Bemaerk at (x.xx) er den transformerede form, hvor den hypergeometriske
 funktion terminerer hurtigt. *) (* XXX: ref! lang! *)

jnt[j1_, j2_, z1_, z2_, l_] := Simplify[
     (Gamma[j1 + j2 + 5]/(z1 + z2)^(j1 + j2 + 4))*
      (Hypergeometric2F1[1, l - j1 - 1, j2 + l + 4, -z2/z1]/
        ((j2 + l + 3)*z1) + Hypergeometric2F1[1, l - j2 - 1, j1 + l + 4, 
         -z1/z2]/((j1 + l + 3)*z2))]



(* 'Inelastic scattering'-artikel, lign. 10 -- \nu = (n1,n2) *) (* XXX: ref! lang! *)
mkR[{}]    := {};
mkR[basis_]:= Map[Sqrt[1/#[[1]]^2 + 1/#[[2]]^2] &, basis]/;Depth[basis] == 3;
mkR[basis_]:= Map[ Sqrt[Sum[1/#[[i,1]]^2,{i,Length[#]}]]&, basis];


(* Evaluerer radialdelen af 'overlap'-integraler; 
   p er polynomie i r, z er den totale eksponentielle koefficient.
*) (* XXX: lang! *)
overlap[p_,z_] := overlap[p,z,r];
overlap[p_,z_,r_] := Module[{c},
  c = CoefficientList[p,r];
  Sum[c[[i]]*(i+1)!/z^(i+2), {i,Length[c]}]
];
overlapmulrn[p_,z_,n_,r_]:=Module[{c},
  c = CoefficientList[p,r];
  Sum[c[[i]]*(i+1+n)!/z^(i+2+n), {i,Length[c]}]
];

End[]
EndPackage[]
