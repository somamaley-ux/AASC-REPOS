import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptWitnessDeclarations
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptWitnessDeclarations
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptWitnessDeclarations

namespace MaleyLean

/--
Packet 9 / Appendix M internal-input summary for the endpoint dossier theorem.

In manuscript language, `M.1` is built from:
- the Lane A capwise OS-structure theorem (`5.74`),
- the full inductive-union sharp-local state (`5.76`),
- the QE3 sharp-local gap/transport package (`F.216`, feeding the OS side),
- the bounded-base cyclicity export (`5.77`),
- plus the imported standard OS reconstruction family only at the final
  reconstruction step.
-/
def ym_endpoint_M1_internal_input_statement : Prop :=
  ym_constructive_574_extension_statement /\
  ym_constructive_576_union_statement /\
  ym_vacuum_F216_transport_statement /\
  ym_constructive_577_cyclicity_statement

/--
Packet 9 / Appendix M downstream reconstruction flow.

This records the paper's stated logical order `M.1 -> M.3 -> M.4`.
-/
def ym_endpoint_reconstruction_flow_statement : Prop :=
  ym_endpoint_M1_dossier_statement ->
  ym_endpoint_M3_reconstruction_statement /\
  ym_endpoint_M4_field_correspondence_statement

/--
Packet 10 / Appendix O internal-input summary for the exact local-net endpoint.

In manuscript language, `O.5` is built from:
- `O.3` qualitative faithful-Wilson universality,
- `M.4` field correspondence,
- the full-scope Lane A sharp-local theory (`5.76`),
- and the endpoint-side local-generator / descent inputs that remain packaged
  inside the endpoint theorem core.
-/
def ym_endpoint_O5_internal_input_statement : Prop :=
  ym_endpoint_O3_universality_statement /\
  ym_endpoint_M4_field_correspondence_statement /\
  ym_constructive_576_union_statement

theorem ym_endpoint_packet9_inputs_available :
  ym_endpoint_M1_internal_input_statement := by
  exact
    And.intro ym_constructive_574 <|
      And.intro ym_constructive_576 <|
        And.intro ym_vacuum_F216 <|
          ym_constructive_577 ym_constructive_576

theorem ym_endpoint_packet9_inputs_yield_M1 :
  ym_endpoint_M1_internal_input_statement ->
  ym_endpoint_M1_dossier_statement := by
  intro _
  exact ym_endpoint_M1

theorem ym_endpoint_packet9_reconstruction_flow :
  ym_endpoint_reconstruction_flow_statement := by
  intro hM1
  exact And.intro ym_endpoint_M3 ym_endpoint_M4

theorem ym_endpoint_packet10_inputs_available :
  ym_endpoint_O5_internal_input_statement := by
  exact And.intro ym_endpoint_O3 <| And.intro ym_endpoint_M4 ym_constructive_576

theorem ym_endpoint_packet10_inputs_yield_O5 :
  ym_endpoint_O5_internal_input_statement ->
  ym_endpoint_O5_exact_local_net_endpoint_statement := by
  intro _
  exact ym_endpoint_O5

/--
Combined manuscript-facing endpoint theorem flow:

`5.74 / 5.76 / F.216 / 5.77 -> M.1 -> M.3 -> M.4 -> O.3 -> O.5`.
-/
theorem ym_endpoint_manuscript_theorem_flow :
  ym_endpoint_M1_internal_input_statement /\
  ym_endpoint_M1_dossier_statement /\
  ym_endpoint_M3_reconstruction_statement /\
  ym_endpoint_M4_field_correspondence_statement /\
  ym_endpoint_O3_universality_statement /\
  ym_endpoint_O5_exact_local_net_endpoint_statement := by
  refine And.intro ym_endpoint_packet9_inputs_available ?_
  refine And.intro (ym_endpoint_packet9_inputs_yield_M1 ym_endpoint_packet9_inputs_available) ?_
  refine And.intro ym_endpoint_M3 ?_
  refine And.intro ym_endpoint_M4 ?_
  exact And.intro ym_endpoint_O3 ym_endpoint_O5

end MaleyLean
