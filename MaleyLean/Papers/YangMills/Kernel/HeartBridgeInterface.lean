import MaleyLean.Papers.YangMills.Kernel.BridgeLawConsequences

namespace MaleyLean

/--
Domain-shaped interface tying bridge consequences back to concrete theorem-heart
endpoint facts.
-/
structure YMHeartBridgeInterface
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  consequences : YMBridgeLawConsequences RC RD RE
  constructive_bounded_base_endpoint : Prop
  constructive_positive_bridge_endpoint : Prop
  vacuum_gap_positive_gap_endpoint : Prop
  vacuum_gap_transport_endpoint : Prop
  vacuum_gap_transport_origin_endpoint : Prop
  endpoint_smearing_target : Prop
  endpoint_vacuum_correlation_target : Prop
  endpoint_exact_target : Prop
  bounded_base_feeds_transport :
    constructive_bounded_base_endpoint -> vacuum_gap_transport_endpoint
  bounded_base_records_origin :
    constructive_bounded_base_endpoint -> vacuum_gap_transport_origin_endpoint
  gap_feeds_vacuum_correlations :
    vacuum_gap_positive_gap_endpoint -> endpoint_vacuum_correlation_target
  constructive_feeds_smearing :
    constructive_positive_bridge_endpoint -> endpoint_smearing_target
  constructive_feeds_exact_endpoint :
    constructive_positive_bridge_endpoint -> endpoint_exact_target

def YangMillsHeartBridgeInterfaceData
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
  YMHeartBridgeInterface RC RD RE := by
  let C := YangMillsBridgeLawConsequencesData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  refine
    { consequences := C
      constructive_bounded_base_endpoint :=
        RC.sharp_local_package.sharp_local_state.extends_bounded_base
      constructive_positive_bridge_endpoint :=
        RC.finite_cap_package.positive_bridge_ready
      vacuum_gap_positive_gap_endpoint :=
        RD.transport_package.positive_gap_exhibited
      vacuum_gap_transport_endpoint :=
        RD.transport_package.os_transport_ready
      vacuum_gap_transport_origin_endpoint :=
        RD.reconstruction_package.obtained_from_transport
      endpoint_smearing_target :=
        RE.reconstruction_package.smearing_defined
      endpoint_vacuum_correlation_target :=
        RE.reconstruction_package.vacuum_correlations_defined
      endpoint_exact_target :=
        RE.endpoint_object.exact_local_net_endpoint
      bounded_base_feeds_transport := C.yields_os_transport
      bounded_base_records_origin := C.records_transport_origin
      gap_feeds_vacuum_correlations := C.yields_vacuum_correlations
      constructive_feeds_smearing := C.yields_constructive_smearing
      constructive_feeds_exact_endpoint := C.yields_constructive_exact_endpoint }

theorem YangMillsHeartBridgeInterfaceExistsStatement
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
  Nonempty (YMHeartBridgeInterface RC RD RE) := by
  exact ⟨YangMillsHeartBridgeInterfaceData
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield⟩

theorem YangMillsHeartBridgeInterfaceWitnessStatement
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
  Nonempty (YMHeartBridgeInterface RC RD RE) /\
  (RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
    RD.transport_package.os_transport_ready) /\
  (RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
    RD.reconstruction_package.obtained_from_transport) /\
  (RC.finite_cap_package.positive_bridge_ready ->
    RE.reconstruction_package.smearing_defined) /\
  (RD.transport_package.positive_gap_exhibited ->
    RE.reconstruction_package.vacuum_correlations_defined) /\
  (RC.finite_cap_package.positive_bridge_ready ->
    RE.endpoint_object.exact_local_net_endpoint) := by
  have hI := YangMillsHeartBridgeInterfaceExistsStatement
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  rcases hI with ⟨I⟩
  exact And.intro ⟨I⟩ <|
    And.intro I.consequences.yields_os_transport <|
      And.intro I.consequences.records_transport_origin <|
        And.intro I.consequences.yields_constructive_smearing <|
          And.intro I.consequences.yields_vacuum_correlations
            I.consequences.yields_constructive_exact_endpoint

end MaleyLean
