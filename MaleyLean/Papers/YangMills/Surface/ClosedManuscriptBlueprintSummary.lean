import MaleyLean.Papers.YangMills.Kernel.ClosedManuscriptBlueprint

namespace MaleyLean

theorem YangMillsClosedManuscriptBlueprintSummaryStatement
  (B : YMClosedManuscriptBlueprint) :
  let M := B.toFormalizedManuscript
  Nonempty (YMFormalizedManuscript) /\
  Nonempty (YMChosenManuscriptObjects M) /\
  ym_core_named_theorem_reflection M.S M.RC M.RD M.RE /\
  ym_unique_flowed_continuum_state_statement M.RC /\
  ym_tuned_bounded_positive_time_base_state_statement M.RC /\
  ym_exact_dimension_quotient_identity_statement M.RC /\
  ym_coefficient_extraction_on_arbitrary_quotient_blocks_statement M.RC /\
  ym_one_shell_transport_on_finite_truncations_statement M.RC /\
  ym_finite_truncation_inverse_control_statement M.RC /\
  ym_finite_truncation_sfte_remainder_package_statement M.RC /\
  ym_finite_mixed_bounded_family_packaging_statement M.RC /\
  ym_first_mixed_correlator_closure_at_finite_cap_statement M.RC /\
  ym_finite_cap_sharp_local_extension_statement M.RC /\
  ym_passage_to_full_sharp_local_inductive_union_statement M.RC /\
  ym_bounded_base_cyclicity_in_reconstructed_sharp_local_hilbert_space_statement M.RC /\
  ym_public_group_scope_export_statement M.RD /\
  ym_one_shot_entrance_at_bounded_physical_scale_statement M.RD /\
  ym_tuned_full_fixed_lattice_os_gap_statement M.RD /\
  ym_same_scale_wilson_to_patched_transport_statement M.RD /\
  ym_bounded_wilson_dyadic_os_limit_theorem_statement M.RD /\
  ym_continuum_time_os_upgrade_of_bounded_base_state_statement M.RD /\
  ym_density_of_bounded_base_algebra_statement M.RD /\
  ym_graph_core_approximation_at_qe3_seam_statement M.RD /\
  ym_continuum_vacuum_gap_transport_statement M.RD /\
  ym_continuum_sharp_local_vacuum_gap_statement M.RD /\
  ym_euclidean_os_dossier_on_full_sharp_local_algebra_statement M.RE /\
  ym_wightman_haag_kastler_reconstruction_statement M.RE /\
  ym_field_correspondence_statement M.RE /\
  ym_minkowski_hamiltonian_inherits_gap_statement M.RE /\
  ym_non_triviality_witness_statement M.RE /\
  ym_faithful_wilson_universality_hypotheses_statement M.RE /\
  ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement M.RE /\
  ym_quantitative_ledger_remains_rho_indexed_statement M.RE /\
  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement M.RE /\
  ym_group_only_restatement_of_endpoint_theorem_statement M.RE := by
  exact YangMillsClosedManuscriptBlueprintExportStatement B

end MaleyLean
