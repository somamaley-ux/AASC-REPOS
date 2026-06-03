import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteOSTimeUpgradeProjection

namespace MaleyLean

/--
Concrete manuscript-facing continuum transport seam:
the continuum vacuum-gap transport theorem together with the sharp-local vacuum
gap theorem.

This isolates the second major analytic kill-switch seam in the exact shape it
currently appears in the manuscript-facing Route 1 theorem API.
-/
def ym_concrete_qe3_continuum_transport_seam_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  ym_continuum_vacuum_gap_transport_statement RD /\
    ym_continuum_sharp_local_vacuum_gap_statement RD

/--
Reduced payload of the current continuum transport seam.

At the present theorem surface, the continuum transport theorem together with
the sharp-local gap theorem carries exactly:
- positive gap,
- Minkowski-gap readiness,
- and transport origin.
-/
def ym_concrete_qe3_continuum_transport_reduced_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  RD.transport_package.positive_gap_exhibited /\
    RD.reconstruction_package.minkowski_gap_ready /\
    RD.reconstruction_package.obtained_from_transport

/--
The manuscript-facing continuum transport seam reduces to its exact current
payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_seam_statement I ->
      ym_concrete_qe3_continuum_transport_reduced_statement I := by
  intro h
  dsimp [ym_concrete_qe3_continuum_transport_seam_statement,
    ym_concrete_qe3_continuum_transport_reduced_statement] at *
  exact ⟨h.1.1, h.1.2, h.2.2⟩

/--
Conversely, the reduced continuum transport payload already recovers the full
manuscript-facing seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_reduced_statement I ->
      ym_concrete_qe3_continuum_transport_seam_statement I := by
  intro h
  dsimp [ym_concrete_qe3_continuum_transport_seam_statement,
    ym_concrete_qe3_continuum_transport_reduced_statement] at *
  exact ⟨⟨h.1, h.2.1⟩, ⟨h.2.1, h.2.2⟩⟩

/--
So the manuscript-facing continuum transport seam is logically equivalent to
its reduced payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamIffReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_seam_statement I <->
      ym_concrete_qe3_continuum_transport_reduced_statement I := by
  constructor
  · exact YangMillsConcreteQE3ContinuumTransportReducedFromSeam I
  · exact YangMillsConcreteQE3ContinuumTransportSeamFromReduced I

/--
The Route 1 theorem-content surface already recovers the continuum transport
seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_continuum_transport_seam_statement I := by
  intro hRoute1
  rcases hRoute1 with
    ⟨_hNonempty, _hScope, _hEntrance, _hLattice, _hSameScale, _hDyadic,
      _hUpgrade, _hDensity, _hGraph, hTransport, hGap⟩
  exact ⟨hTransport, hGap⟩

/--
Concrete closed-manuscript Route 1 theorem-content version of the same result.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_seam_statement I := by
  exact
    YangMillsConcreteQE3ContinuumTransportSeamFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
The Route 1 theorem-content surface therefore already recovers the exact
reduced continuum-transport payload as well.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_continuum_transport_reduced_statement I := by
  intro hRoute1
  exact
    YangMillsConcreteQE3ContinuumTransportReducedFromSeam I
      (YangMillsConcreteQE3ContinuumTransportSeamFromRoute1TheoremContentStatement I hRoute1)

/--
Closed-manuscript Route 1 theorem-content version of the same reduced result.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_reduced_statement I := by
  exact
    YangMillsConcreteQE3ContinuumTransportReducedFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
Statement-level Route 1 theorem-content version of the exactness law between
the continuum-transport seam and its reduced payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamIffReducedStatement
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
      (ym_concrete_qe3_continuum_transport_seam_statement I <->
        ym_concrete_qe3_continuum_transport_reduced_statement I) := by
  intro _hRoute1
  exact YangMillsConcreteQE3ContinuumTransportSeamIffReduced I

/--
The Part D statement also recovers the same reduced continuum transport
payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_continuum_transport_reduced_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3ContinuumTransportReducedFromRoute1TheoremContentStatement I
      (YangMillsRoute1TheoremContentExportStatement
        I.blueprint.objects.RD hPartD)

/--
The concrete QE3 side-condition bundle also recovers the reduced continuum
transport payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_continuum_transport_reduced_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3ContinuumTransportReducedFromPartDStatement I
      (YangMillsConcreteVacuumGapFeedsPaperPartDStatement I hSide)

/--
The Part D manuscript-facing surface therefore also recovers the full
continuum-transport seam itself.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_continuum_transport_seam_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
      (YangMillsConcreteQE3ContinuumTransportReducedFromPartDStatement I hPartD)

/--
And the shared QE3 side-condition package likewise recovers the full
continuum-transport seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_continuum_transport_seam_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
      (YangMillsConcreteQE3ContinuumTransportReducedFromSideConditions I hSide)

/--
Part D version of the exactness law between the continuum-transport seam and
its reduced payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamIffReducedFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_continuum_transport_seam_statement I <->
        ym_concrete_qe3_continuum_transport_reduced_statement I) := by
  intro _hPartD
  exact YangMillsConcreteQE3ContinuumTransportSeamIffReduced I

/--
Shared side-condition version of the same exactness law.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamIffReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_continuum_transport_seam_statement I <->
        ym_concrete_qe3_continuum_transport_reduced_statement I) := by
  intro _hSide
  exact YangMillsConcreteQE3ContinuumTransportSeamIffReduced I

theorem YangMillsConcreteQE3ContinuumTransportSeamFromRoute1TheoremContent_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ContinuumTransportSeamFromRoute1TheoremContent I =
      YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
        (YangMillsConcreteQE3ContinuumTransportReducedFromRoute1TheoremContent I) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3ContinuumTransportSeamFromPartDStatement_eq_fromReduced
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3ContinuumTransportSeamFromPartDStatement I hPartD =
        YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
          (YangMillsConcreteQE3ContinuumTransportReducedFromPartDStatement I hPartD) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3ContinuumTransportSeamFromSideConditions_eq_fromReduced
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3ContinuumTransportSeamFromSideConditions I hSide =
        YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
          (YangMillsConcreteQE3ContinuumTransportReducedFromSideConditions I hSide) := by
  exact Subsingleton.elim _ _

end MaleyLean
