import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteRoute1EndpointProjection

namespace MaleyLean

/--
The manuscript-facing Part D statement already recovers the joint first-plus-
second QE3 seam synthesis.

This pushes the new two-seam equivalence back up to the paper level: the
current Part D surface is not merely sufficient for the critical seam, but also
for the exact paired reduced payload carried by the two identified kill-switch
seams.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3TwoSeamSynthesisFromMinimalPayload I
      (YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
        (YangMillsConcreteQE3CriticalSeamFromPartDStatement I hPartD))

/--
The concrete QE3 / vacuum-gap side-condition bundle also recovers the joint
first-plus-second seam synthesis.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement I
      (YangMillsConcreteVacuumGapFeedsPaperPartDStatement I hSide)

/--
The named Route 1 theorem-content surface also recovers the same two-seam
synthesis directly.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromRoute1TheoremContentStatement
    (I : YMClosedInstantiatedManuscript) :
    (Nonempty (YMRoute1TheoremContent I.blueprint.objects.RD) /\
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
      ym_continuum_sharp_local_vacuum_gap_statement I.blueprint.objects.RD) ->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  intro hRoute1
  rcases hRoute1 with
    ⟨_hNonempty, _hScope, _hEntrance, _hLattice, _hSameScale, _hDyadic,
      hOSUpgrade, hDensity, hGraph, hTransport, hGap⟩
  have hCrit : ym_concrete_qe3_critical_seam_statement I := by
    exact ⟨hOSUpgrade, hDensity, hGraph, hTransport, hGap⟩
  exact
    YangMillsConcreteQE3TwoSeamSynthesisFromMinimalPayload I
      (YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I hCrit)

/--
Concrete closed-manuscript theorem-content version of the same result.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I := by
  exact
    YangMillsConcreteQE3TwoSeamSynthesisFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

end MaleyLean
