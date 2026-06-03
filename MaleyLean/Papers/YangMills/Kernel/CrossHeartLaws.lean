import MaleyLean.Papers.YangMills.Kernel.InterHeartCompatibility

namespace MaleyLean

/--
Domain-shaped law saying constructive bounded-base support is sufficient to
expose the vacuum-gap transport side.
-/
def YMBoundedBaseFeedsTransportLaw
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute) : Prop :=
  RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
  RD.transport_package.os_transport_ready /\ RD.reconstruction_package.obtained_from_transport

/--
Domain-shaped law saying the vacuum-gap side carries enough gap information to
support the endpoint side.
-/
def YMGapTransportFeedsEndpointLaw
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore) : Prop :=
  RD.transport_package.positive_gap_exhibited ->
  RE.reconstruction_package.vacuum_correlations_defined /\ RE.endpoint_object.exact_local_net_endpoint

/--
Domain-shaped law saying constructive support can be routed directly into the
endpoint-side smearing/exactness surface.
-/
def YMConstructiveSupportsEndpointLaw
  (RC : YMConstructiveRoute)
  (RE : YMEndpointCore) : Prop :=
  RC.finite_cap_package.positive_bridge_ready ->
  RE.reconstruction_package.smearing_defined /\ RE.endpoint_object.exact_local_net_endpoint

theorem YangMillsBoundedBaseFeedsTransportLawStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (A : YMRelationalAssembly RC RD RE) :
  YMBoundedBaseFeedsTransportLaw RC RD := by
  intro _
  exact And.intro A.vacuum_gap.bundle.os_transport_ready A.vacuum_gap.bundle.obtained_from_transport

theorem YangMillsGapTransportFeedsEndpointLawStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (A : YMRelationalAssembly RC RD RE) :
  YMGapTransportFeedsEndpointLaw RD RE := by
  intro _
  exact And.intro
    A.endpoint.bundle.vacuum_correlations_defined
    A.endpoint.bundle.exact_endpoint

theorem YangMillsConstructiveSupportsEndpointLawStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (A : YMRelationalAssembly RC RD RE) :
  YMConstructiveSupportsEndpointLaw RC RE := by
  intro _
  exact And.intro
    A.endpoint.bundle.smearing_defined
    A.endpoint.bundle.exact_endpoint

theorem YangMillsCrossHeartLawWitnessStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (cwin : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window)
  (cbridge :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map)
  (cbase :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier)
  (cstate :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data)
  (cunion :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data)
  (hww : RD.weak_window_certificate_ready)
  (vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map)
  (vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family)
  (vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector)
  (vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family)
  (vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional)
  (vhgap :
    (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
      vgapf
      ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr))
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector)
  (etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space)
  (efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family) :
  Nonempty (YMRelationalAssembly RC RD RE) /\
  YMBoundedBaseFeedsTransportLaw RC RD /\
  YMGapTransportFeedsEndpointLaw RD RE /\
  YMConstructiveSupportsEndpointLaw RC RE := by
  have hA := YangMillsRelationalAssemblyExistsStatement
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  rcases hA with ⟨A⟩
  exact And.intro
    ⟨A⟩
    (And.intro
      (YangMillsBoundedBaseFeedsTransportLawStatement RC RD RE A)
      (And.intro
        (YangMillsGapTransportFeedsEndpointLawStatement RC RD RE A)
        (YangMillsConstructiveSupportsEndpointLawStatement RC RD RE A)))

end MaleyLean
