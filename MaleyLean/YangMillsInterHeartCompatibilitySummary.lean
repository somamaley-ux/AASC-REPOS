import MaleyLean.Papers.YangMills.Surface.InterHeartCompatibilitySummary

namespace MaleyLean

theorem YangMillsInterHeartCompatibilitySummaryExportStatement :
  forall RC : YMConstructiveRoute,
    forall RD : YMVacuumGapRoute,
      forall RE : YMEndpointCore,
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
                                                  Nonempty (YMRelationalAssembly RC RD RE) /\
                                                  YMConstructiveToVacuumGapCompatibility RC RD /\
                                                  YMVacuumGapToEndpointCompatibility RD RE /\
                                                  YMConstructiveToEndpointCompatibility RC RE := by
  intro RC RD RE htrunc hext hcompat hunion
  intro _cwin _cbridge _cbase _cstate _cunion
  intro hww _vtm _vobs _vrsec _vcorr _vgapf _vhgap
  intro hE hP _evac _etest _efield
  exact
    YangMillsInterHeartCompatibilitySummaryStatement
      RC RD RE
      htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion
      hww _vtm _vobs _vrsec _vcorr _vgapf _vhgap
      hE hP _evac _etest _efield

end MaleyLean
