import MaleyLean.Papers.YangMills.Kernel.VacuumGapEndpointBridgeObjects

namespace MaleyLean

/--
Surface-level summary exposing the native `M.5 -> O.2 / O.3 / O.5` bridge
object.
-/
theorem YangMillsVacuumGapEndpointBridgeSummaryStatement :
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
                            forall _vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map,
                              forall _vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family,
                                forall vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector,
                                  forall vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family,
                                    forall vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional,
                                      forall vhgap :
                                        (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
                                          vgapf
                                          ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr),
                                        forall hE : RE.euclidean_dossier_ready,
                                          forall hP : RE.endpoint_packet_ready,
                                            forall _evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector,
                                              forall _etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space,
                                                forall _efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family,
                                                  Nonempty (YMVacuumGapEndpointBridgeObject RC RD RE) /\
                                                  ym_source_labels .minkowskiHamiltonianInheritsGap = ["M.5"] /\
                                                  ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
                                                  ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
                                                  ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
                                                  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
                                                  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
                                                  RD.reconstruction_package.minkowski_gap_ready /\
                                                  RE.endpoint_object.exact_local_net_endpoint /\
                                                  ym_faithful_wilson_universality_hypotheses_statement RE /\
                                                  ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement RE /\
                                                  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE /\
                                                  ((YangMillsNativeVacuumGapEndpointFactorizationData
                                                      RC RD RE
                                                      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
                                                      hww _vtm _vobs vrsec vcorr vgapf vhgap
                                                      hE hP _evac _etest _efield).law_object.compatibility.vacuum_gap_to_endpoint
                                                      (YangMillsNativeVacuumGapEndpointFactorizationData
                                                        RC RD RE
                                                        htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
                                                        hww _vtm _vobs vrsec vcorr vgapf vhgap
                                                        hE hP _evac _etest _efield).chosen_vacuum_gap_ready =
                                                    (YangMillsNativeVacuumGapEndpointFactorizationData
                                                      RC RD RE
                                                      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
                                                      hww _vtm _vobs vrsec vcorr vgapf vhgap
                                                      hE hP _evac _etest _efield).direct_endpoint_image) := by
  exact YangMillsVacuumGapEndpointBridgeExportStatement

end MaleyLean
