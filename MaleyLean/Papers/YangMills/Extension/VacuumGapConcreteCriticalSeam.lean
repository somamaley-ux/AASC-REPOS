import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteManuscriptProjection

namespace MaleyLean

/--
Concrete manuscript-facing QE3 critical seam extracted from the closed
instantiated manuscript object.

This isolates the transport-side cluster that controls the main failure points
in the current Route 1 / QE3 formalization: continuous-time upgrade, density,
graph-core handoff, continuum transport, and the sharp-local gap export.
-/
def ym_concrete_qe3_critical_seam_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  ym_continuum_time_os_upgrade_of_bounded_base_state_statement RD /\
    ym_density_of_bounded_base_algebra_statement RD /\
    ym_graph_core_approximation_at_qe3_seam_statement RD /\
    ym_continuum_vacuum_gap_transport_statement RD /\
    ym_continuum_sharp_local_vacuum_gap_statement RD

theorem YangMillsConcreteQE3CriticalSeamFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_critical_seam_statement I := by
  intro hPartD
  dsimp [ym_concrete_qe3_critical_seam_statement]
  let RD := I.blueprint.objects.RD
  have hRoute1 := YangMillsRoute1TheoremContentData RD hPartD
  exact
    And.intro hRoute1.continuum_time_os_upgrade_of_bounded_base_state <|
      And.intro hRoute1.density_of_bounded_base_algebra <|
        And.intro hRoute1.graph_core_approximation_at_qe3_seam <|
          And.intro hRoute1.continuum_vacuum_gap_transport
            hRoute1.continuum_sharp_local_vacuum_gap

theorem YangMillsConcreteQE3CriticalSeamStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I := by
  exact
    YangMillsConcreteQE3CriticalSeamFromPartDStatement I
      (YangMillsConcreteVacuumGapPartDStatement I)

theorem YangMillsConcreteQE3CriticalSeamFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_critical_seam_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3CriticalSeamFromPartDStatement I
      (YangMillsConcreteVacuumGapFeedsPaperPartDStatement I hSide)

end MaleyLean
