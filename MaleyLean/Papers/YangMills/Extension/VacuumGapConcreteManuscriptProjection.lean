import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteUpstreamSideConditions
import MaleyLean.Papers.YangMills.Kernel.NamedRoute1TheoremContent

namespace MaleyLean

/--
Manuscript-facing Part D statement extracted from the concrete QE3 / vacuum-gap
side-condition package carried by a closed instantiated manuscript.
-/
def ym_concrete_vacuum_gap_partD_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_paper_partD_statement I.blueprint.objects.RD

theorem YangMillsConcreteVacuumGapFeedsPaperPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_vacuum_gap_partD_statement I := by
  intro hSide
  rcases hSide with
    ⟨_, hTransport, hOSTransport, hPositiveGap, hLatticeGap, hReconstruction,
      hOSSector, hMinkowskiGap, hTransportOrigin, _, _⟩
  exact
    And.intro hTransport <|
      And.intro hOSTransport <|
        And.intro hPositiveGap <|
          And.intro hLatticeGap <|
            And.intro hReconstruction <|
              And.intro hOSSector <|
                And.intro hMinkowskiGap hTransportOrigin

theorem YangMillsConcreteVacuumGapPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I := by
  exact
    YangMillsConcreteVacuumGapFeedsPaperPartDStatement I
      (YangMillsConcreteVacuumGapSideConditionsStatement I)

theorem YangMillsConcreteVacuumGapRoute1TheoremContentStatement
    (I : YMClosedInstantiatedManuscript) :
    Nonempty (YMRoute1TheoremContent I.blueprint.objects.RD) /\
      ym_public_group_scope_export_statement I.blueprint.objects.RD /\
      ym_one_shot_entrance_at_bounded_physical_scale_statement
        I.blueprint.objects.RD /\
      ym_tuned_full_fixed_lattice_os_gap_statement I.blueprint.objects.RD /\
      ym_same_scale_wilson_to_patched_transport_statement
        I.blueprint.objects.RD /\
      ym_bounded_wilson_dyadic_os_limit_theorem_statement
        I.blueprint.objects.RD /\
      ym_continuum_time_os_upgrade_of_bounded_base_state_statement
        I.blueprint.objects.RD /\
      ym_density_of_bounded_base_algebra_statement I.blueprint.objects.RD /\
      ym_graph_core_approximation_at_qe3_seam_statement
        I.blueprint.objects.RD /\
      ym_continuum_vacuum_gap_transport_statement I.blueprint.objects.RD /\
      ym_continuum_sharp_local_vacuum_gap_statement I.blueprint.objects.RD := by
  exact
    YangMillsRoute1TheoremContentExportStatement
      I.blueprint.objects.RD
      (YangMillsConcreteVacuumGapPartDStatement I)

end MaleyLean
