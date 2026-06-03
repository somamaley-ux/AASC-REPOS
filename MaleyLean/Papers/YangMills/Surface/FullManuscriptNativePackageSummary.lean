import MaleyLean.Papers.YangMills.Kernel.FullManuscriptNativePackage

namespace MaleyLean

/--
Surface-level summary exposing the full manuscript native package.
-/
theorem YangMillsFullManuscriptNativePackageSummaryStatement :
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
                                                          Nonempty (YMFullManuscriptNativePackage S RC RD RE) /\
                                                          S.theorem_parts.partA_public_scope /\
                                                          ym_paper_partC_statement RC /\
                                                          ym_paper_partD_statement RD /\
                                                          ym_paper_endpoint_statement RE /\
                                                          ym_source_labels .finiteCapSharpLocalExtension = ["5.74A", "5.74", "5.75"] /\
                                                          ym_source_labels .passageToFullSharpLocalInductiveUnion = ["5.76"] /\
                                                          ym_source_labels
                                                              .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace = ["5.77"] /\
                                                          ym_source_labels .minkowskiHamiltonianInheritsGap = ["M.5"] /\
                                                          ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
                                                          ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
                                                          ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
                                                          ym_constructive_witness_source_labels .boundedBaseExtensionWitness = ["5.76"] /\
                                                          ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
                                                          ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
                                                          Nonempty (YMConstructiveNativeTheoremObjects RC) /\
                                                          Nonempty (YMVacuumGapNativeTheoremObjects RD) /\
                                                          Nonempty (YMEndpointNativeTheoremObjects RE) /\
                                                          Nonempty (YMConstructiveOperatorPrimitives RC) /\
                                                          Nonempty (YMConstructiveOperatorApplicationCertificates RC) /\
                                                          Nonempty (YMConstructiveChosenSiteExecutionTrace RC) /\
                                                          Nonempty (YMConstructivePrimitiveConstructions RC) /\
                                                          Nonempty (YMConstructiveFiniteCapConstructionStage RC) /\
                                                          Nonempty (YMConstructiveBoundedStateConstructionStage RC) /\
                                                          Nonempty (YMConstructiveInductiveUnionConstructionStage RC) /\
                                                          Nonempty (YMConstructiveSharpLocalConstructionStage RC) /\
                                                          Nonempty (YMConstructiveChosenSiteLawAtoms RC) /\
                                                          Nonempty (YMConstructiveNativeProofHomes RC) /\
                                                          Nonempty (YMVacuumGapOperatorPrimitives RD) /\
                                                          Nonempty (YMVacuumGapOperatorApplicationCertificates RD) /\
                                                          Nonempty (YMVacuumGapChosenSiteExecutionTrace RD) /\
                                                          Nonempty (YMVacuumGapPrimitiveConstructions RD) /\
                                                          Nonempty (YMVacuumGapTransportConstructionStage RD) /\
                                                          Nonempty (YMVacuumGapOSSectorConstructionStage RD) /\
                                                          Nonempty (YMVacuumGapGapEvaluationConstructionStage RD) /\
                                                          Nonempty (YMVacuumGapReconstructionConstructionStage RD) /\
                                                          Nonempty (YMVacuumGapChosenSiteLawAtoms RD) /\
                                                          Nonempty (YMVacuumGapNativeProofHomes RD) /\
                                                          Nonempty (YMEndpointOperatorPrimitives RE) /\
                                                          Nonempty (YMEndpointOperatorApplicationCertificates RE) /\
                                                          Nonempty (YMEndpointPrimitiveConstructions RE) /\
                                                          Nonempty (YMEndpointReconstructionCarrierConstructionStage RE) /\
                                                          Nonempty (YMEndpointReconstructionOperationsConstructionStage RE) /\
                                                          Nonempty (YMEndpointChosenSiteExecutionTrace RE) /\
                                                          Nonempty (YMEndpointSmearingConstructionStage RE) /\
                                                          Nonempty (YMEndpointCorrelationConstructionStage RE) /\
                                                          Nonempty (YMEndpointChosenSiteLawAtoms RE) /\
                                                          Nonempty (YMEndpointNativeProofHomes RE) /\
                                                          RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
                                                          RC.finite_cap_package.truncation_window_ready /\
                                                          RC.finite_cap_package.finite_cap_extension_ready /\
                                                          RC.finite_cap_package.positive_bridge_ready /\
                                                          RC.sharp_local_package.bounded_state_compatibility_ready /\
                                                          RC.sharp_local_package.inductive_union_ready /\
                                                          RD.continuum_gap_transport_ready /\
                                                          RD.transport_package.os_transport_ready /\
                                                          RD.transport_package.positive_gap_exhibited /\
                                                          RD.transport_package.lattice_gap_input /\
                                                          RD.reconstruction_ready /\
                                                          RD.reconstruction_package.os_sector_ready /\
                                                          RD.reconstruction_package.minkowski_gap_ready /\
                                                          RD.reconstruction_package.obtained_from_transport /\
                                                          RE.reconstruction_ready /\
                                                          RE.reconstruction_package.wightman_fields_present /\
                                                          RE.reconstruction_package.vacuum_vector_present /\
                                                          RE.reconstruction_package.smearing_defined /\
                                                          RE.reconstruction_package.vacuum_correlations_defined /\
                                                          ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).source_dossier =
                                                            RE.reconstruction_package.from_dossier) /\
                                                          ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).constructed_reconstructed_hilbert =
                                                            RE.reconstruction_package.reconstructed_hilbert) /\
                                                          ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).constructed_field_family =
                                                            RE.reconstruction_package.field_family) /\
                                                          ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).constructed_vacuum_vector =
                                                            RE.reconstruction_package.vacuum_vector) /\
                                                          ((YangMillsEndpointReconstructionOperationsConstructionStageData RE hE hP).constructed_test_function_space =
                                                            RE.reconstruction_package.test_function_space) /\
                                                          ((YangMillsEndpointReconstructionOperationsConstructionStageData RE hE hP).constructed_smeared_field_operator =
                                                            RE.reconstruction_package.smeared_field_operator) /\
                                                          ((YangMillsEndpointReconstructionOperationsConstructionStageData RE hE hP).constructed_vacuum_correlation_family =
                                                            RE.reconstruction_package.vacuum_correlation_family) /\
                                                          RE.reconstruction_package.smearing_defined /\
                                                          RE.reconstruction_package.vacuum_correlations_defined /\
                                                          ((YangMillsConstructiveOperatorPrimitivesData RC htrunc hext hcompat hunion).extend_operator
                                                              (YangMillsConstructiveRelationalInterfaceData
                                                                RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_window
                                                              (YangMillsConstructiveRelationalInterfaceData
                                                                RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_bridge_map =
                                                            (YangMillsConstructiveRelationalInterfaceData
                                                              RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_extension_data) /\
                                                          ((YangMillsConstructiveRelationalInterfaceData
                                                              RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).bundle.extend_finite_cap
                                                              (YangMillsConstructiveRelationalInterfaceData
                                                                RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_window
                                                              (YangMillsConstructiveRelationalInterfaceData
                                                                RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_bridge_map =
                                                            (YangMillsConstructiveRelationalInterfaceData
                                                              RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_extension_data) /\
                                                          ((YangMillsConstructiveBoundedStateConstructionStageData
                                                              RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).trace.certificates.law_atoms.interface.bundle.assemble_sharp_local_state
                                                              (YangMillsConstructiveBoundedStateConstructionStageData
                                                                RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_bounded_base
                                                              (YangMillsConstructiveBoundedStateConstructionStageData
                                                                RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_bounded_state
                                                              (YangMillsConstructiveBoundedStateConstructionStageData
                                                                RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).chosen_inductive_union =
                                                            (YangMillsConstructiveBoundedStateConstructionStageData
                                                              RC htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion).constructed_sharp_local_state) /\
                                                          RC.sharp_local_package.inductive_union_ready /\
                                                          RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
                                                          ((YangMillsVacuumGapOperatorPrimitivesData RD hww).transport_operator
                                                              (YangMillsVacuumGapRelationalInterfaceData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_transport_map
                                                              (YangMillsVacuumGapRelationalInterfaceData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_observable =
                                                            (YangMillsVacuumGapRelationalInterfaceData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_transport_state) /\
                                                          ((YangMillsVacuumGapRelationalInterfaceData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).bundle.transport_observable
                                                              (YangMillsVacuumGapRelationalInterfaceData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_transport_map
                                                              (YangMillsVacuumGapRelationalInterfaceData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_observable =
                                                            (YangMillsVacuumGapRelationalInterfaceData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_transport_state) /\
                                                          ((YangMillsVacuumGapPrimitiveConstructionsData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).trace.certificates.law_atoms.interface.bundle.realize_os_sector
                                                              (YangMillsVacuumGapPrimitiveConstructionsData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).trace.chosen_reconstructed_sector
                                                              (YangMillsVacuumGapPrimitiveConstructionsData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).trace.chosen_correlation_family =
                                                            (YangMillsVacuumGapPrimitiveConstructionsData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).constructed_os_sector) /\
                                                          ((YangMillsVacuumGapOSSectorConstructionStageData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).constructions.trace.certificates.law_atoms.interface.bundle.realize_os_sector
                                                              (YangMillsVacuumGapOSSectorConstructionStageData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_reconstructed_sector
                                                              (YangMillsVacuumGapOSSectorConstructionStageData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_correlation_family =
                                                            (YangMillsVacuumGapOSSectorConstructionStageData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).constructed_os_sector) /\
                                                          ((YangMillsVacuumGapPrimitiveConstructionsData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
                                                              (YangMillsVacuumGapPrimitiveConstructionsData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).trace.chosen_gap_functional
                                                              (YangMillsVacuumGapPrimitiveConstructionsData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).constructed_os_sector) /\
                                                          ((YangMillsVacuumGapGapEvaluationConstructionStageData
                                                              RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).os_sector_stage.constructions.trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
                                                              (YangMillsVacuumGapGapEvaluationConstructionStageData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).chosen_gap_functional
                                                              (YangMillsVacuumGapGapEvaluationConstructionStageData
                                                                RD hww _vtm _vobs vrsec vcorr vgapf _vhgap).constructed_os_sector) /\
                                                          ((YangMillsEndpointOperatorPrimitivesData RE hE hP).correlate_operator
                                                              (YangMillsEndpointRelationalInterfaceData
                                                                RE hE hP _evac _etest _efield).chosen_vacuum_vector
                                                              (YangMillsEndpointRelationalInterfaceData
                                                                RE hE hP _evac _etest _efield).chosen_smeared_operator =
                                                            (YangMillsEndpointRelationalInterfaceData
                                                              RE hE hP _evac _etest _efield).chosen_vacuum_correlation) /\
                                                          ((YangMillsEndpointRelationalInterfaceData
                                                              RE hE hP _evac _etest _efield).bundle.smear_field
                                                              (YangMillsEndpointRelationalInterfaceData
                                                                RE hE hP _evac _etest _efield).chosen_test_function
                                                              (YangMillsEndpointRelationalInterfaceData
                                                                RE hE hP _evac _etest _efield).chosen_field =
                                                            (YangMillsEndpointRelationalInterfaceData
                                                              RE hE hP _evac _etest _efield).chosen_smeared_operator) /\
                                                          ((YangMillsEndpointSmearingConstructionStageData
                                                              RE hE hP _evac _etest _efield).trace.certificates.law_atoms.interface.bundle.smear_field
                                                              (YangMillsEndpointSmearingConstructionStageData
                                                                RE hE hP _evac _etest _efield).chosen_test_function
                                                              (YangMillsEndpointSmearingConstructionStageData
                                                                RE hE hP _evac _etest _efield).chosen_field =
                                                            (YangMillsEndpointSmearingConstructionStageData
                                                              RE hE hP _evac _etest _efield).constructed_smeared_operator) /\
                                                          ((YangMillsEndpointCorrelationConstructionStageData
                                                              RE hE hP _evac _etest _efield).smearing_stage.trace.certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
                                                              (YangMillsEndpointCorrelationConstructionStageData
                                                                RE hE hP _evac _etest _efield).chosen_vacuum_vector
                                                              (YangMillsEndpointCorrelationConstructionStageData
                                                                RE hE hP _evac _etest _efield).chosen_smeared_operator =
                                                            (YangMillsEndpointCorrelationConstructionStageData
                                                              RE hE hP _evac _etest _efield).constructed_vacuum_correlation) /\
                                                          RE.endpoint_object.exact_local_net_endpoint := by
  exact YangMillsFullManuscriptNativePackageExportStatement

end MaleyLean
