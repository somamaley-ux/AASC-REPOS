import MaleyLean.Papers.YangMills.Kernel.Route1EndpointNativePackage

namespace MaleyLean

/--
Surface-level summary exposing the submission-facing Route 1 to endpoint native
package.
-/
theorem YangMillsRoute1EndpointNativePackageSummaryStatement :
  forall S : YMLoadBearingSpine,
    forall RC : YMConstructiveRoute,
      forall RD : YMVacuumGapRoute,
        forall RE : YMEndpointCore,
          forall _hp1 : S.packet1_uv_gate,
            forall _hp2 : S.packet2_entrance,
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
                                      forall _vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family,
                                        forall vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector,
                                          forall vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family,
                                            forall vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional,
                                            forall _vhgap :
                                                (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
                                                  vgapf
                                                  ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr),
                                                forall hE : RE.euclidean_dossier_ready,
                                                  forall hP : RE.endpoint_packet_ready,
                                                    forall _evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector,
                                                      forall _etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space,
                                                        forall _efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family,
                                                          Nonempty (YMRoute1EndpointNativePackage S RC RD RE) /\
                                                          S.theorem_parts.partA_public_scope /\
                                                          ym_paper_partD_statement RD /\
                                                          ym_paper_endpoint_statement RE /\
                                                          ym_source_labels .minkowskiHamiltonianInheritsGap = ["M.5"] /\
                                                          ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
                                                          ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
                                                          ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
                                                          ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
                                                          ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
                                                          RE.endpoint_object.exact_local_net_endpoint := by
  exact YangMillsRoute1EndpointNativePackageExportStatement

end MaleyLean
