import MaleyLean.Papers.YangMills.Verbatim.TheoremRegister
import MaleyLean.Papers.YangMills.Kernel.ConstructiveCore
import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore
import MaleyLean.Papers.YangMills.Kernel.EndpointCore

namespace MaleyLean

/--
Register-keyed Lane A claim family taken as the paper-facing Part C boundary.
-/
def ym_laneA_verbatim_claim_family : Prop :=
  ∀ t : YMVerbatimTheoremEntry,
    ym_verbatim_theorem_section t = .laneASharpLocalConstruction ->
      ym_verbatim_theorem_owner t = .laneASharpLocalConstruction

/--
Register-keyed Route 1 / QE3 claim family taken as the paper-facing Part D
boundary.
-/
def ym_route1_verbatim_claim_family : Prop :=
  ∀ t : YMVerbatimTheoremEntry,
    ym_verbatim_theorem_section t = .qe3Transport ->
      ym_verbatim_theorem_owner t = .ultravioletGateAndRoute1

/--
Register-keyed endpoint claim family taken as the paper-facing endpoint
boundary.
-/
def ym_endpoint_verbatim_claim_family : Prop :=
  ∀ t : YMVerbatimTheoremEntry,
    ym_verbatim_theorem_section t = .endpointPacket ->
      ym_verbatim_theorem_owner t = .reconstructionAndUniversality

def ym_paper_partC_statement (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.truncation_window_ready /\
    RC.finite_cap_package.finite_cap_extension_ready /\
    RC.finite_cap_package.positive_bridge_ready /\
    RC.sharp_local_package.bounded_state_compatibility_ready /\
    RC.sharp_local_package.inductive_union_ready /\
    RC.sharp_local_package.sharp_local_state.extends_bounded_base

def ym_paper_partD_statement (RD : YMVacuumGapRoute) : Prop :=
  RD.continuum_gap_transport_ready /\
    RD.transport_package.os_transport_ready /\
    RD.transport_package.positive_gap_exhibited /\
    RD.transport_package.lattice_gap_input /\
    RD.reconstruction_ready /\
    RD.reconstruction_package.os_sector_ready /\
    RD.reconstruction_package.minkowski_gap_ready /\
    RD.reconstruction_package.obtained_from_transport

def ym_paper_endpoint_statement (RE : YMEndpointCore) : Prop :=
  RE.reconstruction_ready /\
    RE.reconstruction_package.wightman_fields_present /\
    RE.reconstruction_package.vacuum_vector_present /\
    RE.reconstruction_package.smearing_defined /\
    RE.reconstruction_package.vacuum_correlations_defined /\
    RE.endpoint_object.exact_local_net_endpoint

theorem YangMillsLaneAVerbatimClaimFamilyStatement :
  ym_laneA_verbatim_claim_family := by
  intro t h
  cases t <;> cases h <;> rfl

theorem YangMillsRoute1VerbatimClaimFamilyStatement :
  ym_route1_verbatim_claim_family := by
  intro t h
  cases t <;> cases h <;> rfl

theorem YangMillsEndpointVerbatimClaimFamilyStatement :
  ym_endpoint_verbatim_claim_family := by
  intro t h
  cases t <;> cases h <;> rfl

theorem YangMillsLaneAPaperClaimIffExplicitStatement
  (RC : YMConstructiveRoute) :
  ym_paper_partC_statement RC ↔ ym_laneA_explicit_statement RC := by
  rfl

theorem YangMillsRoute1PaperClaimIffExplicitStatement
  (RD : YMVacuumGapRoute) :
  ym_paper_partD_statement RD ↔ ym_route1_explicit_statement RD := by
  rfl

theorem YangMillsEndpointPaperClaimIffExplicitStatement
  (RE : YMEndpointCore) :
  ym_paper_endpoint_statement RE ↔ ym_endpoint_explicit_statement RE := by
  rfl

end MaleyLean
