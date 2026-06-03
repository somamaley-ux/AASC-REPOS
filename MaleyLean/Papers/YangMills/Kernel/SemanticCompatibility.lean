import MaleyLean.Papers.YangMills.Kernel.SemanticAssembly

namespace MaleyLean

/--
Compatibility law for the constructive semantic bundle: once finite-cap
extension and the positive bridge are available, the bundled sharp-local
output already carries bounded-base extension.
-/
def YMConstructiveOperationCompatibility
  {RC : YMConstructiveRoute}
  (_B : YMConstructiveSemanticBundle RC) : Prop :=
  RC.finite_cap_package.finite_cap_extension_ready ->
  RC.finite_cap_package.positive_bridge_ready ->
  RC.sharp_local_package.sharp_local_state.extends_bounded_base

/--
Compatibility law for the vacuum-gap semantic bundle: once transport is ready
and exhibits both OS transport and a positive gap, the bundled Minkowski-gap
readiness is already present.
-/
def YMVacuumGapOperationCompatibility
  {RD : YMVacuumGapRoute}
  (_B : YMVacuumGapSemanticBundle RD) : Prop :=
  RD.continuum_gap_transport_ready ->
  RD.transport_package.os_transport_ready ->
  RD.transport_package.positive_gap_exhibited ->
  RD.reconstruction_package.minkowski_gap_ready

/--
Compatibility law for the endpoint semantic bundle: once reconstruction and
its smearing/correlation operations are ready, the exact endpoint is already
available.
-/
def YMEndpointOperationCompatibility
  {RE : YMEndpointCore}
  (_B : YMEndpointSemanticBundle RE) : Prop :=
  RE.reconstruction_ready ->
  RE.reconstruction_package.smearing_defined ->
  RE.reconstruction_package.vacuum_correlations_defined ->
  RE.endpoint_object.exact_local_net_endpoint

theorem YangMillsConstructiveOperationCompatibilityStatement
  {RC : YMConstructiveRoute}
  (B : YMConstructiveSemanticBundle RC) :
  YMConstructiveOperationCompatibility B := by
  intro _ _
  exact B.bounded_base_extension

theorem YangMillsVacuumGapOperationCompatibilityStatement
  {RD : YMVacuumGapRoute}
  (B : YMVacuumGapSemanticBundle RD) :
  YMVacuumGapOperationCompatibility B := by
  intro _ _ _
  exact B.minkowski_gap_ready

theorem YangMillsEndpointOperationCompatibilityStatement
  {RE : YMEndpointCore}
  (B : YMEndpointSemanticBundle RE) :
  YMEndpointOperationCompatibility B := by
  intro _ _ _
  exact B.exact_endpoint

theorem YangMillsSemanticAssemblyCompatibilityStatement
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
  let A := YangMillsSemanticAssemblyData RC RD RE htrunc hext hcompat hunion hww hEE hEP
  YMConstructiveOperationCompatibility A.constructive /\
  YMVacuumGapOperationCompatibility A.vacuum_gap /\
  YMEndpointOperationCompatibility A.endpoint := by
  exact And.intro
    (YangMillsConstructiveOperationCompatibilityStatement _)
    (And.intro
      (YangMillsVacuumGapOperationCompatibilityStatement _)
      (YangMillsEndpointOperationCompatibilityStatement _))

end MaleyLean
