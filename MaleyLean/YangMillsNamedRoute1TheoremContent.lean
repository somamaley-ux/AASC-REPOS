import MaleyLean.Papers.YangMills.Kernel.NamedRoute1TheoremContent

namespace MaleyLean

theorem YangMillsNamedRoute1TheoremContentTopExportStatement
  (RD : YMVacuumGapRoute)
  (hpartD : ym_paper_partD_statement RD) :
  Nonempty (YMRoute1TheoremContent RD) /\
  ym_public_group_scope_export_statement RD /\
  ym_one_shot_entrance_at_bounded_physical_scale_statement RD /\
  ym_tuned_full_fixed_lattice_os_gap_statement RD /\
  ym_same_scale_wilson_to_patched_transport_statement RD /\
  ym_bounded_wilson_dyadic_os_limit_theorem_statement RD /\
  ym_continuum_time_os_upgrade_of_bounded_base_state_statement RD /\
  ym_density_of_bounded_base_algebra_statement RD /\
  ym_graph_core_approximation_at_qe3_seam_statement RD /\
  ym_continuum_vacuum_gap_transport_statement RD /\
  ym_continuum_sharp_local_vacuum_gap_statement RD := by
  exact YangMillsRoute1TheoremContentExportStatement RD hpartD

end MaleyLean
