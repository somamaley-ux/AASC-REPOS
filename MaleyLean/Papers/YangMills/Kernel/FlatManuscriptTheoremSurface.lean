import MaleyLean.Papers.YangMills.Kernel.ManuscriptGranularTheoremSurface

namespace MaleyLean

/--
Flattened manuscript-facing Yang-Mills theorem surface.

This export removes the remaining bundle layer from the preferred theorem path
and states the core named-theorem reflection together with every currently
named Lane A, Route 1/QE3, and endpoint theorem-content proposition directly.
-/
theorem YangMillsFlatManuscriptTheoremSurfaceStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  ym_core_named_theorem_reflection S RC RD RE /\
  ym_unique_flowed_continuum_state_statement RC /\
  ym_tuned_bounded_positive_time_base_state_statement RC /\
  ym_exact_dimension_quotient_identity_statement RC /\
  ym_coefficient_extraction_on_arbitrary_quotient_blocks_statement RC /\
  ym_one_shell_transport_on_finite_truncations_statement RC /\
  ym_finite_truncation_inverse_control_statement RC /\
  ym_finite_truncation_sfte_remainder_package_statement RC /\
  ym_finite_mixed_bounded_family_packaging_statement RC /\
  ym_first_mixed_correlator_closure_at_finite_cap_statement RC /\
  ym_finite_cap_sharp_local_extension_statement RC /\
  ym_passage_to_full_sharp_local_inductive_union_statement RC /\
  ym_bounded_base_cyclicity_in_reconstructed_sharp_local_hilbert_space_statement RC /\
  ym_public_group_scope_export_statement RD /\
  ym_one_shot_entrance_at_bounded_physical_scale_statement RD /\
  ym_tuned_full_fixed_lattice_os_gap_statement RD /\
  ym_same_scale_wilson_to_patched_transport_statement RD /\
  ym_bounded_wilson_dyadic_os_limit_theorem_statement RD /\
  ym_continuum_time_os_upgrade_of_bounded_base_state_statement RD /\
  ym_density_of_bounded_base_algebra_statement RD /\
  ym_graph_core_approximation_at_qe3_seam_statement RD /\
  ym_continuum_vacuum_gap_transport_statement RD /\
  ym_continuum_sharp_local_vacuum_gap_statement RD /\
  ym_euclidean_os_dossier_on_full_sharp_local_algebra_statement RE /\
  ym_wightman_haag_kastler_reconstruction_statement RE /\
  ym_field_correspondence_statement RE /\
  ym_minkowski_hamiltonian_inherits_gap_statement RE /\
  ym_non_triviality_witness_statement RE /\
  ym_faithful_wilson_universality_hypotheses_statement RE /\
  ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement RE /\
  ym_quantitative_ledger_remains_rho_indexed_statement RE /\
  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE /\
  ym_group_only_restatement_of_endpoint_theorem_statement RE := by
  have hdirect :=
    YangMillsDirectPaperTheoremStatement
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  have hcore :=
    (YangMillsNamedCoreTheoremReflectionExportStatement
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP).2
  have hpartC : ym_paper_partC_statement RC := hdirect.2.2.2.2.1
  have hpartD : ym_paper_partD_statement RD := hdirect.2.2.2.2.2.1
  have hendpoint : ym_paper_endpoint_statement RE := hdirect.2.2.2.2.2.2
  have hlaneA := YangMillsLaneATheoremContentExportStatement RC hpartC
  have hroute1 := YangMillsRoute1TheoremContentExportStatement RD hpartD
  have hendpointContent := YangMillsEndpointTheoremContentExportStatement RE hendpoint
  exact
    And.intro hcore <|
      And.intro hlaneA.2.1 <|
        And.intro hlaneA.2.2.1 <|
          And.intro hlaneA.2.2.2.1 <|
            And.intro hlaneA.2.2.2.2.1 <|
              And.intro hlaneA.2.2.2.2.2.1 <|
                And.intro hlaneA.2.2.2.2.2.2.1 <|
                  And.intro hlaneA.2.2.2.2.2.2.2.1 <|
                    And.intro hlaneA.2.2.2.2.2.2.2.2.1 <|
                      And.intro hlaneA.2.2.2.2.2.2.2.2.2.1 <|
                        And.intro hlaneA.2.2.2.2.2.2.2.2.2.2.1 <|
                          And.intro hlaneA.2.2.2.2.2.2.2.2.2.2.2.1 <|
                            And.intro hlaneA.2.2.2.2.2.2.2.2.2.2.2.2
                              <| And.intro hroute1.2.1 <|
                                And.intro hroute1.2.2.1 <|
                                  And.intro hroute1.2.2.2.1 <|
                                    And.intro hroute1.2.2.2.2.1 <|
                                      And.intro hroute1.2.2.2.2.2.1 <|
                                        And.intro hroute1.2.2.2.2.2.2.1 <|
                                          And.intro hroute1.2.2.2.2.2.2.2.1 <|
                                            And.intro hroute1.2.2.2.2.2.2.2.2.1 <|
                                              And.intro hroute1.2.2.2.2.2.2.2.2.2.1 <|
                                                And.intro hroute1.2.2.2.2.2.2.2.2.2.2
                                                  <| And.intro hendpointContent.2.1 <|
                                                    And.intro hendpointContent.2.2.1 <|
                                                      And.intro hendpointContent.2.2.2.1 <|
                                                        And.intro hendpointContent.2.2.2.2.1 <|
                                                          And.intro hendpointContent.2.2.2.2.2.1 <|
                                                            And.intro hendpointContent.2.2.2.2.2.2.1 <|
                                                              And.intro hendpointContent.2.2.2.2.2.2.2.1 <|
                                                                And.intro hendpointContent.2.2.2.2.2.2.2.2.1
                                                                  hendpointContent.2.2.2.2.2.2.2.2.2

end MaleyLean
