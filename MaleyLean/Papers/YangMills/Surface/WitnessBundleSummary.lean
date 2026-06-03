import MaleyLean.Papers.YangMills.Kernel.WitnessBundle

namespace MaleyLean

/--
Additive manuscript-facing summary layer exposing the structured three-heart
witness bundle at the surface level.
-/
theorem YangMillsWitnessBundleSummaryStatement :
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
  intro RC RD RE htrunc hext hcompat hunion hww hEE hEP
  exact
    YangMillsWitnessBundleFromNamedOutputsStatement
      RC RD RE htrunc hext hcompat hunion hww hEE hEP

end MaleyLean
