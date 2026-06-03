import MaleyLean.Papers.YangMills.Kernel.CanonicalVerifiedPayload

namespace MaleyLean

theorem YangMillsCanonicalVerifiedPayloadTopExportStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hCready1 : S.partC_route.flowed_state_ready)
  (hCready2 : S.partC_route.finite_truncation_ready)
  (hCready3 : S.partC_route.finite_cap_extension_ready)
  (hCready4 : S.partC_route.cyclicity_ready)
  (hCready5 : S.partC_route.finite_cap_bridge_ready)
  (hCready6 : S.partC_route.bounded_state_compatibility_ready)
  (hCready7 : S.partC_route.inductive_union_ready)
  (hDready1 : S.partD_route.uv_gate_ready)
  (hDready2 : S.partD_route.entrance_ready)
  (hDready3 : S.partD_route.fixed_lattice_gap_ready)
  (hDready4 : S.partD_route.weak_window_certificate_ready)
  (hDready5 : S.partD_route.continuum_gap_transport_ready)
  (hDready6 : S.partD_route.reconstruction_ready)
  (hDready7 : S.partD_route.endpoint_packet_ready)
  (hEready1 : S.endpoint_route.euclidean_dossier_ready)
  (hEready2 : S.endpoint_route.reconstruction_ready)
  (hEready3 : S.endpoint_route.endpoint_packet_ready)
  (hAroute : ym_public_scope_route S)
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
  Nonempty (YMCanonicalVerifiedPayload S RC RD RE) /\
  S.theorem_parts.partA_public_scope /\
  S.partC_route.partC_output /\
  S.partD_route.partD_output /\
  S.endpoint_route.endpoint_output /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  RD.transport_package.os_transport_ready /\
  RE.endpoint_object.exact_local_net_endpoint := by
  exact
    YangMillsCanonicalVerifiedPayloadExportStatement
      S RC RD RE
      hp1 hp2
      hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
      hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
      hEready1 hEready2 hEready3
      hAroute
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield

end MaleyLean
