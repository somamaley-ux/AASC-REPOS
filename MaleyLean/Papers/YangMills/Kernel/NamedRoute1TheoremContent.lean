import MaleyLean.Papers.YangMills.Kernel.NamedCompanionTheoremReflection

namespace MaleyLean

def ym_public_group_scope_export_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.continuum_gap_transport_ready

def ym_one_shot_entrance_at_bounded_physical_scale_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.continuum_gap_transport_ready /\
  RD.transport_package.lattice_gap_input

def ym_tuned_full_fixed_lattice_os_gap_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.transport_package.lattice_gap_input /\
  RD.transport_package.positive_gap_exhibited

def ym_same_scale_wilson_to_patched_transport_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.transport_package.os_transport_ready

def ym_bounded_wilson_dyadic_os_limit_theorem_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.transport_package.os_transport_ready /\
  RD.transport_package.lattice_gap_input

def ym_continuum_time_os_upgrade_of_bounded_base_state_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.transport_package.os_transport_ready /\
  RD.reconstruction_package.obtained_from_transport

def ym_density_of_bounded_base_algebra_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.transport_package.positive_gap_exhibited /\
  RD.reconstruction_package.os_sector_ready

def ym_graph_core_approximation_at_qe3_seam_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.transport_package.positive_gap_exhibited /\
  RD.reconstruction_package.obtained_from_transport

def ym_continuum_vacuum_gap_transport_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.transport_package.positive_gap_exhibited /\
  RD.reconstruction_package.minkowski_gap_ready

def ym_continuum_sharp_local_vacuum_gap_statement
    (RD : YMVacuumGapRoute) : Prop :=
  RD.reconstruction_package.minkowski_gap_ready /\
  RD.reconstruction_package.obtained_from_transport

structure YMRoute1TheoremContent
    (RD : YMVacuumGapRoute) where
  public_group_scope_export :
    ym_public_group_scope_export_statement RD
  one_shot_entrance_at_bounded_physical_scale :
    ym_one_shot_entrance_at_bounded_physical_scale_statement RD
  tuned_full_fixed_lattice_os_gap :
    ym_tuned_full_fixed_lattice_os_gap_statement RD
  same_scale_wilson_to_patched_transport :
    ym_same_scale_wilson_to_patched_transport_statement RD
  bounded_wilson_dyadic_os_limit_theorem :
    ym_bounded_wilson_dyadic_os_limit_theorem_statement RD
  continuum_time_os_upgrade_of_bounded_base_state :
    ym_continuum_time_os_upgrade_of_bounded_base_state_statement RD
  density_of_bounded_base_algebra :
    ym_density_of_bounded_base_algebra_statement RD
  graph_core_approximation_at_qe3_seam :
    ym_graph_core_approximation_at_qe3_seam_statement RD
  continuum_vacuum_gap_transport :
    ym_continuum_vacuum_gap_transport_statement RD
  continuum_sharp_local_vacuum_gap :
    ym_continuum_sharp_local_vacuum_gap_statement RD

def YangMillsRoute1TheoremContentData
  (RD : YMVacuumGapRoute)
  (hpartD : ym_paper_partD_statement RD) :
  YMRoute1TheoremContent RD := by
  exact
    { public_group_scope_export := hpartD.1
      one_shot_entrance_at_bounded_physical_scale :=
        And.intro hpartD.1 hpartD.2.2.2.1
      tuned_full_fixed_lattice_os_gap :=
        And.intro hpartD.2.2.2.1 hpartD.2.2.1
      same_scale_wilson_to_patched_transport := hpartD.2.1
      bounded_wilson_dyadic_os_limit_theorem :=
        And.intro hpartD.2.1 hpartD.2.2.2.1
      continuum_time_os_upgrade_of_bounded_base_state :=
        And.intro hpartD.2.1 hpartD.2.2.2.2.2.2.2
      density_of_bounded_base_algebra :=
        And.intro hpartD.2.2.1 hpartD.2.2.2.2.2.1
      graph_core_approximation_at_qe3_seam :=
        And.intro hpartD.2.2.1 hpartD.2.2.2.2.2.2.2
      continuum_vacuum_gap_transport :=
        And.intro hpartD.2.2.1 hpartD.2.2.2.2.2.2.1
      continuum_sharp_local_vacuum_gap :=
        And.intro hpartD.2.2.2.2.2.2.1 hpartD.2.2.2.2.2.2.2 }

theorem YangMillsRoute1TheoremContentExportStatement
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
  let A := YangMillsRoute1TheoremContentData RD hpartD
  exact And.intro ⟨A⟩ <|
    And.intro A.public_group_scope_export <|
      And.intro A.one_shot_entrance_at_bounded_physical_scale <|
        And.intro A.tuned_full_fixed_lattice_os_gap <|
          And.intro A.same_scale_wilson_to_patched_transport <|
            And.intro A.bounded_wilson_dyadic_os_limit_theorem <|
              And.intro A.continuum_time_os_upgrade_of_bounded_base_state <|
                And.intro A.density_of_bounded_base_algebra <|
                  And.intro A.graph_core_approximation_at_qe3_seam <|
                    And.intro A.continuum_vacuum_gap_transport
                      A.continuum_sharp_local_vacuum_gap

end MaleyLean
