import MaleyLean.Papers.YangMills.Kernel.CanonicalCoreOutputAssembly

namespace MaleyLean

theorem YangMillsCanonicalCoreOutputAssemblyTopExportStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMCanonicalCoreOutputAssembly RC RD RE) /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  RD.transport_package.os_transport_ready /\
  RE.endpoint_object.exact_local_net_endpoint := by
  exact
    YangMillsCanonicalCoreOutputAssemblyExportStatement
      RC RD RE hcompat hunion hww hE hP

end MaleyLean
