theory Scratch imports
"HOL-Algebra.Divisibility"         
"HOL-Algebra.IntRing"              (* Ideals and residue classes? *)
"HOL-Algebra.UnivPoly"             (* Polynomials *)
"HOL-Algebra.More_Ring"            (* This imports Rings. *)
"HOL-Algebra.Multiplicative_Group"
"HOL-Number_Theory.Residues"       (* \<int>/p\<int> and all(?) of the above *)
begin

section\<open>Quick test\<close>

definition
  R :: "real ring"
  where "R = \<lparr>carrier = UNIV, mult = op *, one = 1, zero = 0, add = op +\<rparr>"

lemma R_cring: "cring R"
  by (unfold R_def) (auto intro!: cringI abelian_groupI comm_monoidI
    left_minus distrib_right)

lemma R_id_eval:
  "UP_pre_univ_prop R R id"
  by (fast intro: UP_pre_univ_propI R_cring id_ring_hom)

lemma "field R"
  apply (rule cring.cring_fieldI2)
  apply (fact R_cring)
  unfolding R_def apply auto using dvd_field_iff
  by (metis dvdE)

definition
  C :: "complex ring"
  where "C = \<lparr>carrier = UNIV, mult = op *, one = 1, zero = 0, add = op +\<rparr>"

lemma C_cring: "cring C"
  by (unfold C_def) (auto intro!: cringI abelian_groupI comm_monoidI
    left_minus distrib_right)

lemma C_id_eval:
  "UP_pre_univ_prop C C id"
  by (fast intro: UP_pre_univ_propI C_cring id_ring_hom)

lemma "field C"
  apply (rule cring.cring_fieldI2)
    apply (fact C_cring)
  unfolding C_def apply auto using dvd_field_iff
  by (metis dvdE)


section\<open>Observations\<close>

term field
--\<open>field_simps are *not* available in general. Re-prove them? Collect them?\<close>

text\<open>The following is an easy generalisation of @{thm field.finite_mult_of}\<close>
lemma finite_mult_of: "finite (carrier R) \<Longrightarrow> finite (carrier (mult_of R))"
  by (auto simp: mult_of_simps)

(* duplicate: *)
value INTEG
value "\<Z>"
thm INTEG_def

find_theorems field
thm
field_axioms_def
QuotRing.maximalideal.quotient_is_field
Ideal.field.all_ideals
UnivPoly.INTEG.R.trivialideals_eq_field

end