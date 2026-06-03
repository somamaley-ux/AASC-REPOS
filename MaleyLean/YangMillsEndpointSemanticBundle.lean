import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticBundle

namespace MaleyLean

theorem YangMillsEndpointSemanticBundleExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  Nonempty (YMEndpointSemanticBundle R) := by
  exact YangMillsEndpointSemanticBundleExistsStatement R hE hP

end MaleyLean
