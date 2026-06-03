import MaleyLean.Papers.YangMills.Kernel.CanonicalVerifiedPayload

namespace MaleyLean

theorem YangMillsCanonicalVerifiedPayloadSummaryStatement :
  forall S : YMLoadBearingSpine,
    forall RC : YMConstructiveRoute,
      forall RD : YMVacuumGapRoute,
        forall RE : YMEndpointCore,
          forall _hp1 : S.packet1_uv_gate,
            forall _hp2 : S.packet2_entrance,
              forall _hCready1 : S.partC_route.flowed_state_ready,
                forall _hCready2 : S.partC_route.finite_truncation_ready,
                  forall _hCready3 : S.partC_route.finite_cap_extension_ready,
                    forall _hCready4 : S.partC_route.cyclicity_ready,
                      forall _hCready5 : S.partC_route.finite_cap_bridge_ready,
                        forall _hCready6 : S.partC_route.bounded_state_compatibility_ready,
                          forall _hCready7 : S.partC_route.inductive_union_ready,
                            forall _hDready1 : S.partD_route.uv_gate_ready,
                              forall _hDready2 : S.partD_route.entrance_ready,
                                forall _hDready3 : S.partD_route.fixed_lattice_gap_ready,
                                  forall _hDready4 : S.partD_route.weak_window_certificate_ready,
                                    forall _hDready5 : S.partD_route.continuum_gap_transport_ready,
                                      forall _hDready6 : S.partD_route.reconstruction_ready,
                                        forall _hDready7 : S.partD_route.endpoint_packet_ready,
                                          forall _hEready1 : S.endpoint_route.euclidean_dossier_ready,
                                            forall _hEready2 : S.endpoint_route.reconstruction_ready,
                                              forall _hEready3 : S.endpoint_route.endpoint_packet_ready,
                                                forall _hAroute : ym_public_scope_route S,
                                                  forall htrunc : RC.finite_truncation_ready,
                                                    forall hext : RC.finite_cap_extension_ready,
                                                      forall hcompat : RC.bounded_state_compatibility_ready,
                                                        forall hunion : RC.inductive_union_ready,
                                                          forall _cwin :
                                                            (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window,
                                                            forall _cbridge :
                                                              (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map,
                                                              forall _cbase :
                                                                (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier,
                                                                forall _cstate :
                                                                  (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data,
                                                                  forall _cunion :
                                                                    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data,
                                                                    forall hww : RD.weak_window_certificate_ready,
                                                                      forall _vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map,
                                                                        forall _vobs :
                                                                          (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family,
                                                                          forall _vrsec :
                                                                            (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector,
                                                                            forall _vcorr :
                                                                              (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family,
                                                                              forall _vgapf :
                                                                                (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional,
                                                                                forall _vhgap :
                                                                                  (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
                                                                                    _vgapf
                                                                                    ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector _vrsec _vcorr),
                                                                                  forall hE : RE.euclidean_dossier_ready,
                                                                                    forall hP : RE.endpoint_packet_ready,
                                                                                      forall _evac :
                                                                                        (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector,
                                                                                        forall _etest :
                                                                                          (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space,
                                                                                          forall _efield :
                                                                                            (YangMillsEndpointSemanticBundleData RE hE hP).field_family,
                                                                                            Nonempty (YMCanonicalVerifiedPayload S RC RD RE) /\
                                                                                            S.theorem_parts.partA_public_scope /\
                                                                                            S.partC_route.partC_output /\
                                                                                            S.partD_route.partD_output /\
                                                                                            S.endpoint_route.endpoint_output /\
                                                                                            RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
                                                                                            RD.transport_package.os_transport_ready /\
                                                                                            RE.endpoint_object.exact_local_net_endpoint := by
  intro S RC RD RE _hp1 _hp2
  intro _hCready1 _hCready2 _hCready3 _hCready4 _hCready5 _hCready6 _hCready7
  intro _hDready1 _hDready2 _hDready3 _hDready4 _hDready5 _hDready6 _hDready7
  intro _hEready1 _hEready2 _hEready3 _hAroute
  intro htrunc hext hcompat hunion
  intro _cwin _cbridge _cbase _cstate _cunion
  intro hww _vtm _vobs _vrsec _vcorr _vgapf _vhgap
  intro hE hP _evac _etest _efield
  exact
    YangMillsCanonicalVerifiedPayloadExportStatement
      S RC RD RE
      _hp1 _hp2
      _hCready1 _hCready2 _hCready3 _hCready4 _hCready5 _hCready6 _hCready7
      _hDready1 _hDready2 _hDready3 _hDready4 _hDready5 _hDready6 _hDready7
      _hEready1 _hEready2 _hEready3
      _hAroute
      htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion
      hww _vtm _vobs _vrsec _vcorr _vgapf _vhgap
      hE hP _evac _etest _efield

end MaleyLean
