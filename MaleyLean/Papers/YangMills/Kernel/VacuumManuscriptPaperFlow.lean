import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptWitnessDeclarations

namespace MaleyLean

/--
Route 1 / QE3 manuscript theorem flow:

`III.1 -> III.2 -> III.3 -> IV.1 -> IV.4/F.298 -> F.216 -> F.5 -> M.5`.
-/
def ym_vacuum_route1_theorem_flow_statement : Prop :=
  ym_vacuum_III1_ultraviolet_gate_statement /\
  ym_vacuum_III2_public_scope_export_statement /\
  ym_vacuum_III3_entrance_statement /\
  ym_vacuum_IV1_fixed_lattice_gap_statement /\
  ym_vacuum_IV4_weak_window_statement /\
  ym_vacuum_F298_weak_window_certificate_statement /\
  ym_vacuum_F216_transport_statement /\
  ym_vacuum_F5_continuum_gap_statement /\
  ym_vacuum_M5_gap_transfer_statement

/--
Packet-level manuscript reading of the QE3 route:

the weak-window certificate feeds the frozen QE3 chain to `F.216`, and the
continuum transport theorem then feeds the sharp-local gap corollaries.
-/
def ym_vacuum_packet_flow_statement : Prop :=
  ym_vacuum_IV4_weak_window_statement ->
  ym_vacuum_F216_transport_statement /\
  ym_vacuum_F5_continuum_gap_statement /\
  ym_vacuum_M5_gap_transfer_statement

theorem ym_vacuum_route1_theorem_flow :
  ym_vacuum_route1_theorem_flow_statement := by
  refine And.intro ym_vacuum_III1 ?_
  refine And.intro ym_vacuum_III2 ?_
  refine And.intro ym_vacuum_III3 ?_
  refine And.intro ym_vacuum_IV1 ?_
  refine And.intro ym_vacuum_IV4 ?_
  refine And.intro ym_vacuum_F298 ?_
  refine And.intro ym_vacuum_F216 ?_
  refine And.intro ym_vacuum_F5 ?_
  exact ym_vacuum_M5

theorem ym_vacuum_packet_flow :
  ym_vacuum_packet_flow_statement := by
  intro _
  exact And.intro ym_vacuum_F216 <| And.intro ym_vacuum_F5 ym_vacuum_M5

/--
Manuscript-facing Route 1 / QE3 backbone summary:

`III.1 / III.2 -> III.3 -> IV.1 -> IV.4 / F.298 -> F.216 -> F.5 -> M.5`.
-/
theorem ym_vacuum_manuscript_theorem_flow :
  ym_vacuum_III1_ultraviolet_gate_statement /\
  ym_vacuum_III2_public_scope_export_statement /\
  ym_vacuum_III3_entrance_statement /\
  ym_vacuum_IV1_fixed_lattice_gap_statement /\
  ym_vacuum_IV4_weak_window_statement /\
  ym_vacuum_F298_weak_window_certificate_statement /\
  ym_vacuum_F216_transport_statement /\
  ym_vacuum_F5_continuum_gap_statement /\
  ym_vacuum_M5_gap_transfer_statement :=
  ym_vacuum_route1_theorem_flow

end MaleyLean
