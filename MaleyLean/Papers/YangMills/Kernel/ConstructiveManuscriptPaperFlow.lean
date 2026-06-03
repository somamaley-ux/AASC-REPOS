import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptWitnessDeclarations

namespace MaleyLean

/--
Lane A front-end manuscript flow for the constructive packet:

`4.92 -> 4.94 -> 5.69 -> 5.70 -> 5.74A -> 5.74 -> 5.75 -> 5.76 -> 5.77`.
-/
def ym_constructive_laneA_theorem_flow_statement : Prop :=
  ym_constructive_492_flowed_state_statement /\
  ym_constructive_494_bounded_base_export_statement /\
  ym_constructive_569_truncation_statement /\
  ym_constructive_570_closure_package_statement /\
  ym_constructive_574A_bridge_statement /\
  ym_constructive_574_extension_statement /\
  ym_constructive_575_compatibility_statement /\
  ym_constructive_576_union_statement /\
  ym_constructive_577_cyclicity_statement

/--
Packet-level manuscript reading of the constructive route:

the flowed-state opening feeds the finite-truncation package, which feeds the
finite-cap bridge/extension step, which then feeds compatibility, inductive
union, and finally bounded-base cyclicity.
-/
def ym_constructive_packet_flow_statement : Prop :=
  ym_constructive_492_flowed_state_statement ->
  ym_constructive_569_truncation_statement /\
  ym_constructive_574_extension_statement /\
  ym_constructive_576_union_statement

theorem ym_constructive_laneA_theorem_flow :
  ym_constructive_laneA_theorem_flow_statement := by
  refine And.intro ym_constructive_492 ?_
  refine And.intro (ym_constructive_494 ym_constructive_492) ?_
  refine And.intro ym_constructive_569 ?_
  refine And.intro ym_constructive_570 ?_
  refine And.intro ym_constructive_574A ?_
  refine And.intro ym_constructive_574 ?_
  refine And.intro (ym_constructive_575 ym_constructive_574) ?_
  refine And.intro ym_constructive_576 ?_
  exact ym_constructive_577 ym_constructive_576

theorem ym_constructive_packet_flow :
  ym_constructive_packet_flow_statement := by
  intro _
  exact And.intro ym_constructive_569 <| And.intro ym_constructive_574 ym_constructive_576

/--
Manuscript-facing constructive backbone summary:

`4.92 / 4.94 -> 5.69 / 5.70 -> 5.74A / 5.74 -> 5.75 -> 5.76 -> 5.77`.
-/
theorem ym_constructive_manuscript_theorem_flow :
  ym_constructive_492_flowed_state_statement /\
  ym_constructive_494_bounded_base_export_statement /\
  ym_constructive_569_truncation_statement /\
  ym_constructive_570_closure_package_statement /\
  ym_constructive_574A_bridge_statement /\
  ym_constructive_574_extension_statement /\
  ym_constructive_575_compatibility_statement /\
  ym_constructive_576_union_statement /\
  ym_constructive_577_cyclicity_statement :=
  ym_constructive_laneA_theorem_flow

end MaleyLean
