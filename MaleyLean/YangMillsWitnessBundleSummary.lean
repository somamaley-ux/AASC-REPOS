import MaleyLean.Papers.YangMills.Surface.WitnessBundleSummary

namespace MaleyLean

theorem YangMillsWitnessBundleSummaryExportStatement :
  forall RC : YMConstructiveRoute,
    forall RD : YMVacuumGapRoute,
      forall RE : YMEndpointCore,
        RC.finite_truncation_ready ->
        RC.finite_cap_extension_ready ->
        RC.bounded_state_compatibility_ready ->
        RC.inductive_union_ready ->
        RD.weak_window_certificate_ready ->
        RE.euclidean_dossier_ready ->
        RE.endpoint_packet_ready ->
        YMWitnessBundle RC RD RE := by
  exact YangMillsWitnessBundleSummaryStatement

end MaleyLean
