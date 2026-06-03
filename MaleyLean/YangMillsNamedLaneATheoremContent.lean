import MaleyLean.Papers.YangMills.Kernel.NamedLaneATheoremContent

namespace MaleyLean

theorem YangMillsNamedLaneATheoremContentTopExportStatement
  (RC : YMConstructiveRoute)
  (hpartC : ym_paper_partC_statement RC) :
  Nonempty (YMLaneATheoremContent RC) /\
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
  ym_bounded_base_cyclicity_in_reconstructed_sharp_local_hilbert_space_statement RC := by
  exact YangMillsLaneATheoremContentExportStatement RC hpartC

end MaleyLean
