import MaleyLean.Papers.YangMills.Kernel.NamedEndpointTheoremContent

namespace MaleyLean

theorem YangMillsNamedEndpointTheoremContentTopExportStatement
  (RE : YMEndpointCore)
  (hendpoint : ym_paper_endpoint_statement RE) :
  Nonempty (YMEndpointTheoremContent RE) /\
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
  exact YangMillsEndpointTheoremContentExportStatement RE hendpoint

end MaleyLean
