import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteTwoSeamManuscriptProjection

namespace MaleyLean

/--
Concrete manuscript-facing OS time-upgrade seam:
the dyadic OS limit theorem together with the continuum-time OS upgrade.

This isolates the weakest of the previously identified high-value seams in the
exact shape it currently appears in the manuscript-facing Route 1 theorem API.
-/
def ym_concrete_qe3_os_time_upgrade_seam_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  ym_bounded_wilson_dyadic_os_limit_theorem_statement RD /\
    ym_continuum_time_os_upgrade_of_bounded_base_state_statement RD

/--
Reduced payload of the current OS time-upgrade seam.

At the present theorem surface, the dyadic OS limit theorem together with the
continuum-time OS upgrade carries exactly:
- OS transport readiness,
- lattice-gap input,
- and transport origin.
-/
def ym_concrete_qe3_os_time_upgrade_reduced_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  RD.transport_package.os_transport_ready /\
    RD.transport_package.lattice_gap_input /\
    RD.reconstruction_package.obtained_from_transport

/--
The manuscript-facing OS time-upgrade seam reduces to its exact current
payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_seam_statement I ->
      ym_concrete_qe3_os_time_upgrade_reduced_statement I := by
  intro h
  dsimp [ym_concrete_qe3_os_time_upgrade_seam_statement,
    ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  exact ⟨h.1.1, h.1.2, h.2.2⟩

/--
Conversely, the reduced OS time-upgrade payload already recovers the full
manuscript-facing seam.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_reduced_statement I ->
      ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  intro h
  dsimp [ym_concrete_qe3_os_time_upgrade_seam_statement,
    ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  exact ⟨⟨h.1, h.2.1⟩, ⟨h.1, h.2.2⟩⟩

/--
So the manuscript-facing OS time-upgrade seam is logically equivalent to its
reduced payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamIffReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_seam_statement I <->
      ym_concrete_qe3_os_time_upgrade_reduced_statement I := by
  constructor
  · exact YangMillsConcreteQE3OSTimeUpgradeReducedFromSeam I
  · exact YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I

/--
The Route 1 theorem-content surface already recovers the OS time-upgrade seam.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  intro hRoute1
  rcases hRoute1 with
    ⟨_hNonempty, _hScope, _hEntrance, _hLattice, _hSameScale, hDyadic,
      hUpgrade, _hDensity, _hGraph, _hTransport, _hGap⟩
  exact ⟨hDyadic, hUpgrade⟩

/--
Concrete closed-manuscript Route 1 theorem-content version of the same result.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  exact
    YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
The Part D statement also recovers the same reduced OS time-upgrade payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_os_time_upgrade_reduced_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3OSTimeUpgradeReducedFromSeam I
      (YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContentStatement I
        (YangMillsRoute1TheoremContentExportStatement
          I.blueprint.objects.RD hPartD))

/--
The concrete QE3 side-condition bundle also recovers the reduced OS time-
upgrade payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_os_time_upgrade_reduced_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3OSTimeUpgradeReducedFromPartDStatement I
      (YangMillsConcreteVacuumGapFeedsPaperPartDStatement I hSide)

/--
The Part D manuscript-facing surface therefore also recovers the full OS
time-upgrade seam itself.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
      (YangMillsConcreteQE3OSTimeUpgradeReducedFromPartDStatement I hPartD)

/--
And the shared QE3 side-condition package likewise recovers the full OS
time-upgrade seam.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
      (YangMillsConcreteQE3OSTimeUpgradeReducedFromSideConditions I hSide)

/--
Part D version of the exactness law between the OS time-upgrade seam and its
reduced payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamIffReducedFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_os_time_upgrade_seam_statement I <->
        ym_concrete_qe3_os_time_upgrade_reduced_statement I) := by
  intro _hPartD
  exact YangMillsConcreteQE3OSTimeUpgradeSeamIffReduced I

/--
Shared side-condition version of the same exactness law.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamIffReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_os_time_upgrade_seam_statement I <->
        ym_concrete_qe3_os_time_upgrade_reduced_statement I) := by
  intro _hSide
  exact YangMillsConcreteQE3OSTimeUpgradeSeamIffReduced I

theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContent_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContent I =
      YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
        (YangMillsConcreteQE3OSTimeUpgradeReducedFromSeam I
          (YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContent I)) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromPartDStatement_eq_fromReduced
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3OSTimeUpgradeSeamFromPartDStatement I hPartD =
        YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
          (YangMillsConcreteQE3OSTimeUpgradeReducedFromPartDStatement I hPartD) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromSideConditions_eq_fromReduced
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3OSTimeUpgradeSeamFromSideConditions I hSide =
        YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
          (YangMillsConcreteQE3OSTimeUpgradeReducedFromSideConditions I hSide) := by
  exact Subsingleton.elim _ _

end MaleyLean
