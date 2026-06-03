import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteContinuumTransportProjection

namespace MaleyLean

/--
Concrete manuscript-facing density / graph-core seam:
the density theorem together with the graph-core approximation theorem at the
QE3 seam.

This isolates the first major analytic kill-switch seam in the exact shape it
currently appears in the manuscript-facing Route 1 theorem API.
-/
def ym_concrete_qe3_density_graph_seam_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  ym_density_of_bounded_base_algebra_statement RD /\
    ym_graph_core_approximation_at_qe3_seam_statement RD

/--
Reduced payload of the current density / graph-core seam.

At the present theorem surface, the density theorem together with the graph-core
approximation theorem carries exactly:
- positive gap,
- OS-sector readiness,
- and transport origin.
-/
def ym_concrete_qe3_density_graph_seam_reduced_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  RD.transport_package.positive_gap_exhibited /\
    RD.reconstruction_package.os_sector_ready /\
    RD.reconstruction_package.obtained_from_transport

/--
The manuscript-facing density / graph-core seam reduces to its exact current
payload.
-/
theorem YangMillsConcreteQE3DensityGraphSeamReducedFromSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_seam_statement I ->
      ym_concrete_qe3_density_graph_seam_reduced_statement I := by
  intro h
  dsimp [ym_concrete_qe3_density_graph_seam_statement,
    ym_concrete_qe3_density_graph_seam_reduced_statement] at *
  exact ⟨h.1.1, h.1.2, h.2.2⟩

/--
Conversely, the reduced density / graph-core payload already recovers the full
manuscript-facing seam.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_seam_reduced_statement I ->
      ym_concrete_qe3_density_graph_seam_statement I := by
  intro h
  dsimp [ym_concrete_qe3_density_graph_seam_statement,
    ym_concrete_qe3_density_graph_seam_reduced_statement] at *
  exact ⟨⟨h.1, h.2.1⟩, ⟨h.1, h.2.2⟩⟩

/--
So the manuscript-facing density / graph-core seam is logically equivalent to
its reduced payload.
-/
theorem YangMillsConcreteQE3DensityGraphSeamIffReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_seam_statement I <->
      ym_concrete_qe3_density_graph_seam_reduced_statement I := by
  constructor
  · exact YangMillsConcreteQE3DensityGraphSeamReducedFromSeam I
  · exact YangMillsConcreteQE3DensityGraphSeamFromReduced I

/--
The Route 1 theorem-content surface already recovers the density / graph-core
seam.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_density_graph_seam_statement I := by
  intro hRoute1
  rcases hRoute1 with
    ⟨_hNonempty, _hScope, _hEntrance, _hLattice, _hSameScale, _hDyadic,
      _hUpgrade, hDensity, hGraph, _hTransport, _hGap⟩
  exact ⟨hDensity, hGraph⟩

/--
Concrete closed-manuscript Route 1 theorem-content version of the same result.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_seam_statement I := by
  exact
    YangMillsConcreteQE3DensityGraphSeamFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
The Route 1 theorem-content surface therefore already recovers the exact
reduced density / graph-core payload as well.
-/
theorem YangMillsConcreteQE3DensityGraphSeamReducedFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_density_graph_seam_reduced_statement I := by
  intro hRoute1
  exact
    YangMillsConcreteQE3DensityGraphSeamReducedFromSeam I
      (YangMillsConcreteQE3DensityGraphSeamFromRoute1TheoremContentStatement I hRoute1)

/--
Closed-manuscript Route 1 theorem-content version of the same reduced result.
-/
theorem YangMillsConcreteQE3DensityGraphSeamReducedFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_seam_reduced_statement I := by
  exact
    YangMillsConcreteQE3DensityGraphSeamReducedFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
Statement-level Route 1 theorem-content version of the exactness law between
the density / graph-core seam and its reduced payload.
-/
theorem YangMillsConcreteQE3DensityGraphSeamIffReducedStatement
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
      (ym_concrete_qe3_density_graph_seam_statement I <->
        ym_concrete_qe3_density_graph_seam_reduced_statement I) := by
  intro _hRoute1
  exact YangMillsConcreteQE3DensityGraphSeamIffReduced I

/--
The Part D statement also recovers the same reduced density / graph-core
payload.
-/
theorem YangMillsConcreteQE3DensityGraphSeamReducedFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_density_graph_seam_reduced_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3DensityGraphSeamReducedFromRoute1TheoremContentStatement I
      (YangMillsRoute1TheoremContentExportStatement
        I.blueprint.objects.RD hPartD)

/--
The concrete QE3 side-condition bundle also recovers the reduced density /
graph-core payload.
-/
theorem YangMillsConcreteQE3DensityGraphSeamReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_density_graph_seam_reduced_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3DensityGraphSeamReducedFromPartDStatement I
      (YangMillsConcreteVacuumGapFeedsPaperPartDStatement I hSide)

/--
The Part D manuscript-facing surface therefore also recovers the full density
/ graph-core seam itself.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_density_graph_seam_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3DensityGraphSeamFromReduced I
      (YangMillsConcreteQE3DensityGraphSeamReducedFromPartDStatement I hPartD)

/--
And the shared QE3 side-condition package likewise recovers the full density /
graph-core seam.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_density_graph_seam_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3DensityGraphSeamFromReduced I
      (YangMillsConcreteQE3DensityGraphSeamReducedFromSideConditions I hSide)

/--
Part D version of the exactness law between the density / graph-core seam and
its reduced payload.
-/
theorem YangMillsConcreteQE3DensityGraphSeamIffReducedFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_density_graph_seam_statement I <->
        ym_concrete_qe3_density_graph_seam_reduced_statement I) := by
  intro _hPartD
  exact YangMillsConcreteQE3DensityGraphSeamIffReduced I

/--
Shared side-condition version of the same exactness law.
-/
theorem YangMillsConcreteQE3DensityGraphSeamIffReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_density_graph_seam_statement I <->
        ym_concrete_qe3_density_graph_seam_reduced_statement I) := by
  intro _hSide
  exact YangMillsConcreteQE3DensityGraphSeamIffReduced I

theorem YangMillsConcreteQE3DensityGraphSeamFromRoute1TheoremContent_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3DensityGraphSeamFromRoute1TheoremContent I =
      YangMillsConcreteQE3DensityGraphSeamFromReduced I
        (YangMillsConcreteQE3DensityGraphSeamReducedFromRoute1TheoremContent I) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3DensityGraphSeamFromPartDStatement_eq_fromReduced
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3DensityGraphSeamFromPartDStatement I hPartD =
        YangMillsConcreteQE3DensityGraphSeamFromReduced I
          (YangMillsConcreteQE3DensityGraphSeamReducedFromPartDStatement I hPartD) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3DensityGraphSeamFromSideConditions_eq_fromReduced
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3DensityGraphSeamFromSideConditions I hSide =
        YangMillsConcreteQE3DensityGraphSeamFromReduced I
          (YangMillsConcreteQE3DensityGraphSeamReducedFromSideConditions I hSide) := by
  exact Subsingleton.elim _ _

end MaleyLean
