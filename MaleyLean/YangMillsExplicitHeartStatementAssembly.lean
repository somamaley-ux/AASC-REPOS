import MaleyLean.Papers.YangMills.Kernel.ExplicitHeartStatementAssembly

namespace MaleyLean

theorem YangMillsExplicitHeartStatementAssemblyTopExportStatement
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
  exact
    YangMillsExplicitHeartStatementAssemblyExportStatement
      RC RD RE htrunc hext hcompat hunion hww hE hP

end MaleyLean
