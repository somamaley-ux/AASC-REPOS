import MaleyLean.Papers.YangMills.Kernel.EndpointCore
import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore
import MaleyLean.Papers.YangMills.Kernel.ConstructiveCore

namespace MaleyLean

/--
Assembly of the explicit heart-level statements for the three main Yang--Mills
theorem routes.

This records the direct, non-placeholder statement payload now exposed by the
constructive, vacuum-gap, and endpoint cores.
-/
structure YMExplicitHeartStatementAssembly
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  partC_explicit : ym_laneA_explicit_statement RC
  partD_explicit : ym_route1_explicit_statement RD
  endpoint_explicit : ym_endpoint_explicit_statement RE

def YangMillsExplicitHeartStatementAssemblyData
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  YMExplicitHeartStatementAssembly RC RD RE := by
  exact
    { partC_explicit :=
        YangMillsLaneAExplicitStatementFromReadinessStatement
          RC htrunc hext hcompat hunion
      partD_explicit :=
        YangMillsRoute1ExplicitStatementFromWeakWindowStatement
          RD hww
      endpoint_explicit :=
        YangMillsEndpointExplicitStatementFromReadinessStatement
          RE hE hP }

theorem YangMillsExplicitHeartStatementAssemblyExistsStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMExplicitHeartStatementAssembly RC RD RE) := by
  exact
    ⟨YangMillsExplicitHeartStatementAssemblyData
      RC RD RE htrunc hext hcompat hunion hww hE hP⟩

theorem YangMillsExplicitHeartStatementAssemblyExportStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMExplicitHeartStatementAssembly RC RD RE) /\
  ym_laneA_explicit_statement RC /\
  ym_route1_explicit_statement RD /\
  ym_endpoint_explicit_statement RE := by
  let A :=
    YangMillsExplicitHeartStatementAssemblyData
      RC RD RE htrunc hext hcompat hunion hww hE hP
  exact
    And.intro ⟨A⟩ <|
      And.intro A.partC_explicit <|
        And.intro A.partD_explicit A.endpoint_explicit

end MaleyLean
