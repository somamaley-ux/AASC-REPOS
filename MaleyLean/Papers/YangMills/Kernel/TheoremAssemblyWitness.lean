import MaleyLean.Papers.YangMills.Kernel.TheoremBridgeConsequences

namespace MaleyLean

/--
Compact theorem-assembly witness object extracted from the theorem-bridge
consequences layer.
-/
structure YMTheoremAssemblyWitness
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  bridge_consequences : YMTheoremBridgeConsequences S RC RD RE
  constructive_base_witness :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base
  transport_ready_witness :
    RD.transport_package.os_transport_ready
  endpoint_exact_witness :
    RE.endpoint_object.exact_local_net_endpoint
  partC_witness :
    S.theorem_parts.partC_sharp_local_construction
  partD_witness :
    S.theorem_parts.partD_vacuum_gap
  endpoint_part_witness :
    S.theorem_parts.endpoint_exact_object

def YangMillsTheoremAssemblyWitnessData
  (S : YMLoadBearingSpine)
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
  (hCalign :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
      S.theorem_parts.partC_sharp_local_construction)
  (hDalign :
    RD.transport_package.os_transport_ready ->
      S.theorem_parts.partD_vacuum_gap)
  (hEalign :
    RE.endpoint_object.exact_local_net_endpoint ->
      S.theorem_parts.endpoint_exact_object) :
  YMTheoremAssemblyWitness S RC RD RE := by
  let C := YangMillsTheoremBridgeConsequencesData
    S RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
    hCalign hDalign hEalign
  let hTransport :=
    C.theorem_bridge.heart_bridge.consequences.yields_os_transport C.witness_constructive_base
  let hPartC := C.partC_from_bounded_base C.witness_constructive_base
  let hPartD := C.partD_from_transport hTransport
  let hEndpoint := C.endpoint_from_exactness C.witness_endpoint_exact
  refine
    { bridge_consequences := C
      constructive_base_witness := C.witness_constructive_base
      transport_ready_witness := hTransport
      endpoint_exact_witness := C.witness_endpoint_exact
      partC_witness := hPartC
      partD_witness := hPartD
      endpoint_part_witness := hEndpoint }

theorem YangMillsTheoremAssemblyWitnessExistsStatement
  (S : YMLoadBearingSpine)
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
  (hCalign :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
      S.theorem_parts.partC_sharp_local_construction)
  (hDalign :
    RD.transport_package.os_transport_ready ->
      S.theorem_parts.partD_vacuum_gap)
  (hEalign :
    RE.endpoint_object.exact_local_net_endpoint ->
      S.theorem_parts.endpoint_exact_object) :
  Nonempty (YMTheoremAssemblyWitness S RC RD RE) := by
  exact ⟨YangMillsTheoremAssemblyWitnessData
    S RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
    hCalign hDalign hEalign⟩

theorem YangMillsTheoremAssemblyWitnessExportStatement
  (S : YMLoadBearingSpine)
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
  (hCalign :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
      S.theorem_parts.partC_sharp_local_construction)
  (hDalign :
    RD.transport_package.os_transport_ready ->
      S.theorem_parts.partD_vacuum_gap)
  (hEalign :
    RE.endpoint_object.exact_local_net_endpoint ->
      S.theorem_parts.endpoint_exact_object) :
  Nonempty (YMTheoremAssemblyWitness S RC RD RE) /\
  S.theorem_parts.partC_sharp_local_construction /\
  S.theorem_parts.partD_vacuum_gap /\
  S.theorem_parts.endpoint_exact_object := by
  have hW := YangMillsTheoremAssemblyWitnessExistsStatement
    S RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
    hCalign hDalign hEalign
  rcases hW with ⟨W⟩
  exact And.intro ⟨W⟩ <| And.intro W.partC_witness <|
    And.intro W.partD_witness W.endpoint_part_witness

end MaleyLean
