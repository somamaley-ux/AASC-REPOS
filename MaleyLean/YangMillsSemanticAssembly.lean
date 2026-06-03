import MaleyLean.Papers.YangMills.Kernel.SemanticAssembly

namespace MaleyLean

theorem YangMillsSemanticAssemblyExportStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hEE : RE.euclidean_dossier_ready)
  (hEP : RE.endpoint_packet_ready) :
  Nonempty (YMSemanticAssembly RC RD RE) := by
  exact
    YangMillsSemanticAssemblyExistsStatement
      RC RD RE htrunc hext hcompat hunion hww hEE hEP

end MaleyLean
