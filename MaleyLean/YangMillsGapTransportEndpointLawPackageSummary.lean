import MaleyLean.Papers.YangMills.Surface.GapTransportEndpointLawPackageSummary

namespace MaleyLean

theorem YangMillsGapTransportEndpointLawPackageSummaryExportStatement :
  forall RC : YMConstructiveRoute,
    forall RD : YMVacuumGapRoute,
      forall RE : YMEndpointCore,
        forall htrunc : RC.finite_truncation_ready,
          forall hext : RC.finite_cap_extension_ready,
            forall hcompat : RC.bounded_state_compatibility_ready,
              forall hunion : RC.inductive_union_ready,
                forall cwin :
                  (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window,
                  forall cbridge :
                    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map,
                    forall cbase :
                      (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier,
                      forall cstate :
                        (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data,
                        forall cunion :
                          (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data,
                          forall hww : RD.weak_window_certificate_ready,
                            forall vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map,
                              forall vobs :
                                (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family,
                                forall vrsec :
                                  (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector,
                                  forall vcorr :
                                    (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family,
                                    forall vgapf :
                                      (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional,
                                      forall vhgap :
                                        (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
                                          vgapf
                                          ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr),
                                        forall hE : RE.euclidean_dossier_ready,
                                          forall hP : RE.endpoint_packet_ready,
                                            forall evac :
                                              (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector,
                                              forall etest :
                                                (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space,
                                                forall efield :
                                                  (YangMillsEndpointSemanticBundleData RE hE hP).field_family,
                                                  Nonempty (YMGapTransportEndpointLawPackage RD RE) /\
                                                  YMGapTransportFeedsEndpointLaw RD RE := by
  intro RC RD RE htrunc hext hcompat hunion
  intro cwin cbridge cbase cstate cunion
  intro hww vtm vobs vrsec vcorr vgapf vhgap
  intro hE hP evac etest efield
  exact
    YangMillsGapTransportEndpointLawPackageSummaryStatement
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield

end MaleyLean
