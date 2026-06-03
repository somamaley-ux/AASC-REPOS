import MaleyLean.Papers.YangMills.Kernel.NativeInterHeartCompatibility

namespace MaleyLean

/--
Direct native law exposing how the constructive chosen bounded-base witness
feeds the endpoint exactness side.
-/
theorem YangMillsNativeConstructiveEndpointChosenWitnessStatement
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
  let A := YangMillsNativeLawAssemblyData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  let C := YangMillsNativeInterHeartCompatibilityData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  Nonempty (YMNativeInterHeartCompatibility RC RD RE) /\
  RE.endpoint_object.exact_local_net_endpoint /\
  (C.constructive_to_endpoint A.constructive.bounded_base_witness =
    A.endpoint.exact_endpoint_witness) := by
  let A := YangMillsNativeLawAssemblyData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  let C := YangMillsNativeInterHeartCompatibilityData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  exact And.intro ⟨C⟩ <|
    And.intro
      (C.constructive_to_endpoint A.constructive.bounded_base_witness) <|
      by
        exact
          (YangMillsNativeConstructiveEndpointFactorsThroughVacuumGapStatement
            RC RD RE
            htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
            hww vtm vobs vrsec vcorr vgapf vhgap
            hE hP evac etest efield
            A.constructive.bounded_base_witness).trans
            (YangMillsNativeVacuumGapEndpointRouteAgreementStatement
              RC RD RE
              htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
              hww vtm vobs vrsec vcorr vgapf vhgap
              hE hP evac etest efield)

theorem YangMillsNativeConstructiveEndpointGeneralWitnessStatement
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
  (efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family)
  (hbase : RC.sharp_local_package.sharp_local_state.extends_bounded_base) :
  let C := YangMillsNativeInterHeartCompatibilityData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  RE.endpoint_object.exact_local_net_endpoint /\
  (C.constructive_to_endpoint hbase =
    C.vacuum_gap_to_endpoint (C.constructive_to_vacuum_gap hbase)) := by
  let C := YangMillsNativeInterHeartCompatibilityData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  exact And.intro
    (C.constructive_to_endpoint hbase)
    (YangMillsNativeConstructiveEndpointFactorsThroughVacuumGapStatement
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
      hbase)

end MaleyLean
