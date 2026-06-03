import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteOSProofHomeProjection

namespace MaleyLean

abbrev ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  I.blueprint.objects.RD.transport_package.lattice_gap_input

theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
  have hBridge := YangMillsConcreteVacuumGapChosenSiteBridgeStatement I
  dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement] at *
  rcases hBridge with
    ⟨_hObj, _hRoute1, _hF216, _hF5, _hM5, _hOSTransport, hLatticeGap,
      _hRecon, _hOSSector⟩
  exact hLatticeGap

theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
  have hNative := YangMillsConcreteVacuumGapNativeProofHomesStatement I
  dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement] at *
  rcases hNative with
    ⟨_hHome, _hF216, _hF5, _hM5, _hTransport, _hOSTransport, _hPositiveGap,
      hLatticeGap, _hRecon, _hOSSector, _hMinkowskiGap, _hOrigin⟩
  exact hLatticeGap

theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
  intro hRoute1
  have hSeam :=
    YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContentStatement I
      hRoute1
  have hReduced :=
    YangMillsConcreteQE3OSTimeUpgradeReducedFromSeam I hSeam
  dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement,
    ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  exact hReduced.2.1

theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
  exact
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContentStatement
      I (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
  intro hPartD
  have hReduced :=
    YangMillsConcreteQE3OSTimeUpgradeReducedFromPartDStatement I hPartD
  dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement,
    ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  exact hReduced.2.1

theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
  intro hSide
  have hReduced :=
    YangMillsConcreteQE3OSTimeUpgradeReducedFromSideConditions I hSide
  dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement,
    ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  exact hReduced.2.1

/--
The Route 1 theorem-content surface therefore determines the OS-side extra
ingredient exactly when it determines OS transport readiness.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportStatement
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
      (I.blueprint.objects.RD.transport_package.os_transport_ready <->
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  intro hRoute1
  constructor
  · intro _hOS
    exact
      YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContentStatement
        I hRoute1
  · intro hExtra
    have hSeam :=
      YangMillsConcreteQE3OSTimeUpgradeSeamFromRoute1TheoremContentStatement I
        hRoute1
    have hReduced :=
      YangMillsConcreteQE3OSTimeUpgradeReducedFromSeam I hSeam
    dsimp [ym_concrete_qe3_os_time_upgrade_reduced_statement] at hReduced
    exact hReduced.1

/--
Closed-manuscript Route 1 theorem-content version of the same exactness
statement.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    I.blueprint.objects.RD.transport_package.os_transport_ready <->
      ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
  exact
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportStatement
      I (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
On the Part D manuscript-facing surface, the OS-side extra ingredient likewise
collapses to plain OS transport readiness.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (I.blueprint.objects.RD.transport_package.os_transport_ready <->
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  intro hPartD
  have hReduced :=
    YangMillsConcreteQE3OSTimeUpgradeReducedFromPartDStatement I hPartD
  dsimp [ym_concrete_qe3_os_time_upgrade_reduced_statement,
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement] at hReduced
  constructor
  · intro _hOS
    exact hReduced.2.1
  · intro _hExtra
    exact hReduced.1

/--
The shared QE3 side-condition surface enjoys the same collapse: the OS-side
extra ingredient is exactly OS transport readiness.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (I.blueprint.objects.RD.transport_package.os_transport_ready <->
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  intro hSide
  have hReduced :=
    YangMillsConcreteQE3OSTimeUpgradeReducedFromSideConditions I hSide
  dsimp [ym_concrete_qe3_os_time_upgrade_reduced_statement,
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement] at hReduced
  constructor
  · intro _hOS
    exact hReduced.2.1
  · intro _hExtra
    exact hReduced.1

/--
At the live theorem level, the Route 1 theorem-content recovery of the OS-side
extra ingredient agrees directly with the proof rebuilt from plain OS transport
readiness.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContent_eq_fromRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContent I =
      (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).1
        ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).2
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContent I)) := by
  exact Subsingleton.elim _ _

/--
Part D version of the same direct proof equality with the reconstruction from
plain OS transport readiness.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement_eq_fromRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement I hPartD =
      (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromPartDStatement I hPartD).1
        ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromPartDStatement I hPartD).2
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement I hPartD)) := by
  exact Subsingleton.elim _ _

/--
Shared QE3 side-condition version of the same direct proof equality with the
reconstruction from plain OS transport readiness.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions_eq_fromRoute1OSTransport
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions I hSide =
      (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromSideConditions I hSide).1
        ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromSideConditions I hSide).2
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions I hSide)) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3DensityGraphReducedFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_density_graph_seam_reduced_statement I := by
  intro h
  simpa [ym_concrete_qe3_two_seam_synthesis_statement,
    ym_concrete_qe3_density_graph_seam_reduced_statement,
    ym_concrete_qe3_density_graph_reduced_statement] using h.1

theorem YangMillsConcreteQE3DensityGraphSeamFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_density_graph_seam_statement I := by
  intro h
  exact
    YangMillsConcreteQE3DensityGraphSeamFromReduced I
      (YangMillsConcreteQE3DensityGraphReducedFromTwoSeamSynthesis I h)

theorem YangMillsConcreteQE3ContinuumTransportReducedFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_continuum_transport_reduced_statement I := by
  intro h
  simpa [ym_concrete_qe3_two_seam_synthesis_statement,
    ym_concrete_qe3_continuum_transport_reduced_statement,
    ym_concrete_qe3_transport_gap_reduced_statement] using h.2

theorem YangMillsConcreteQE3ContinuumTransportSeamFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_continuum_transport_seam_statement I := by
  intro h
  exact
    YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
      (YangMillsConcreteQE3ContinuumTransportReducedFromTwoSeamSynthesis I h)

theorem YangMillsConcreteQE3PrimarySubSeamsFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_density_graph_seam_statement I /\
      ym_concrete_qe3_continuum_transport_seam_statement I := by
  intro h
  exact ⟨YangMillsConcreteQE3DensityGraphSeamFromTwoSeamSynthesis I h,
    YangMillsConcreteQE3ContinuumTransportSeamFromTwoSeamSynthesis I h⟩

abbrev ym_concrete_qe3_primary_subseam_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_seam_statement I /\
    ym_concrete_qe3_continuum_transport_seam_statement I

abbrev ym_concrete_qe3_primary_reduced_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_seam_reduced_statement I /\
    ym_concrete_qe3_continuum_transport_reduced_statement I

theorem YangMillsConcreteQE3TwoSeamSynthesisFromPrimarySubSeams
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_statement I ->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  intro hPrimary
  exact ⟨YangMillsConcreteQE3DensityGraphSeamReducedFromSeam I hPrimary.1,
    YangMillsConcreteQE3ContinuumTransportReducedFromSeam I hPrimary.2⟩

theorem YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_statement I <->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  constructor
  · exact YangMillsConcreteQE3TwoSeamSynthesisFromPrimarySubSeams I
  · exact YangMillsConcreteQE3PrimarySubSeamsFromTwoSeamSynthesis I

theorem YangMillsConcreteQE3PrimaryReducedPackageFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_primary_reduced_package_statement I := by
  intro hTwo
  exact ⟨hTwo.1, hTwo.2⟩

theorem YangMillsConcreteQE3TwoSeamSynthesisFromPrimaryReducedPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_statement I ->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  intro hReduced
  exact ⟨hReduced.1, hReduced.2⟩

theorem YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_statement I <->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  constructor
  · exact YangMillsConcreteQE3TwoSeamSynthesisFromPrimaryReducedPackage I
  · exact YangMillsConcreteQE3PrimaryReducedPackageFromTwoSeamSynthesis I

/--
The Route 1 theorem-content surface already recovers the bundled primary QE3
core consisting of the density/graph-core seam together with the continuum
transport seam.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_primary_subseam_package_statement I := by
  intro hRoute1
  exact
    ⟨YangMillsConcreteQE3DensityGraphSeamFromRoute1TheoremContentStatement I hRoute1,
      YangMillsConcreteQE3ContinuumTransportSeamFromRoute1TheoremContentStatement I hRoute1⟩

/--
Closed-manuscript Route 1 theorem-content version of the same primary-core
result.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_statement I := by
  exact
    YangMillsConcreteQE3PrimarySubSeamPackageFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
The Part D manuscript-facing surface also recovers the bundled primary QE3
core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_primary_subseam_package_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3PrimarySubSeamsFromTwoSeamSynthesis I
      (YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement I hPartD)

/--
The shared QE3 side-condition package likewise recovers that same bundled
primary core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_primary_subseam_package_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3PrimarySubSeamsFromTwoSeamSynthesis I
      (YangMillsConcreteQE3TwoSeamSynthesisFromSideConditions I hSide)

/--
The Route 1 theorem-content surface also already recovers the bundled reduced
primary QE3 core consisting of the reduced density/graph payload together with
the reduced continuum-transport payload.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_primary_reduced_package_statement I := by
  intro hRoute1
  exact
    ⟨YangMillsConcreteQE3DensityGraphSeamReducedFromRoute1TheoremContentStatement I hRoute1,
      YangMillsConcreteQE3ContinuumTransportReducedFromRoute1TheoremContentStatement I hRoute1⟩

/--
Closed-manuscript Route 1 theorem-content version of the same reduced primary
core result.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_statement I := by
  exact
    YangMillsConcreteQE3PrimaryReducedPackageFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
The Part D manuscript-facing surface also recovers the bundled reduced primary
QE3 core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_primary_reduced_package_statement I := by
  intro hPartD
  exact
    YangMillsConcreteQE3PrimaryReducedPackageFromTwoSeamSynthesis I
      (YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement I hPartD)

/--
The shared QE3 side-condition package likewise recovers that same bundled
reduced primary core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_primary_reduced_package_statement I := by
  intro hSide
  exact
    YangMillsConcreteQE3PrimaryReducedPackageFromTwoSeamSynthesis I
      (YangMillsConcreteQE3TwoSeamSynthesisFromSideConditions I hSide)

/--
Statement-level Route 1 theorem-content version of the exactness law between
the bundled primary QE3 core and the joint first-plus-second seam synthesis.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesisStatement
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
      (ym_concrete_qe3_primary_subseam_package_statement I <->
        ym_concrete_qe3_two_seam_synthesis_statement I) := by
  intro _hRoute1
  exact YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I

/--
Part D version of the same exactness law for the bundled primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesisFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_primary_subseam_package_statement I <->
        ym_concrete_qe3_two_seam_synthesis_statement I) := by
  intro _hPartD
  exact YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I

/--
Shared side-condition version of the same exactness law for the bundled
primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesisFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_primary_subseam_package_statement I <->
        ym_concrete_qe3_two_seam_synthesis_statement I) := by
  intro _hSide
  exact YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I

/--
Statement-level Route 1 theorem-content version of the exactness law between
the bundled reduced primary QE3 core and the joint first-plus-second seam
synthesis.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesisStatement
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
      (ym_concrete_qe3_primary_reduced_package_statement I <->
        ym_concrete_qe3_two_seam_synthesis_statement I) := by
  intro _hRoute1
  exact YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I

/--
Part D version of the same exactness law for the bundled reduced primary QE3
core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesisFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_primary_reduced_package_statement I <->
        ym_concrete_qe3_two_seam_synthesis_statement I) := by
  intro _hPartD
  exact YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I

/--
Shared side-condition version of the same exactness law for the bundled
reduced primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesisFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_primary_reduced_package_statement I <->
        ym_concrete_qe3_two_seam_synthesis_statement I) := by
  intro _hSide
  exact YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I

/--
At the live theorem level, the Route 1 theorem-content recovery of the bundled
full primary QE3 core agrees exactly with the proof rebuilt from the same
public two-seam synthesis surface.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromRoute1TheoremContent_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimarySubSeamPackageFromRoute1TheoremContent I =
      (YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2
        (YangMillsConcreteQE3TwoSeamSynthesisFromRoute1TheoremContent I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Part D recovery of the bundled full primary QE3
core agrees exactly with the proof rebuilt from the same public two-seam
synthesis surface.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromPartDStatement_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3PrimarySubSeamPackageFromPartDStatement I hPartD =
        (YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2
          (YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement I hPartD) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the shared side-condition recovery of the bundled
full primary QE3 core agrees exactly with the proof rebuilt from the same
public two-seam synthesis surface.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromSideConditions_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3PrimarySubSeamPackageFromSideConditions I hSide =
        (YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2
          (YangMillsConcreteQE3TwoSeamSynthesisFromSideConditions I hSide) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Route 1 theorem-content recovery of the bundled
reduced primary QE3 core agrees exactly with the proof rebuilt from the same
public two-seam synthesis surface.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromRoute1TheoremContent_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimaryReducedPackageFromRoute1TheoremContent I =
      (YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2
        (YangMillsConcreteQE3TwoSeamSynthesisFromRoute1TheoremContent I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Part D recovery of the bundled reduced primary
QE3 core agrees exactly with the proof rebuilt from the same public two-seam
synthesis surface.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromPartDStatement_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3PrimaryReducedPackageFromPartDStatement I hPartD =
        (YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2
          (YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement I hPartD) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the shared side-condition recovery of the bundled
reduced primary QE3 core agrees exactly with the proof rebuilt from the same
public two-seam synthesis surface.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromSideConditions_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3PrimaryReducedPackageFromSideConditions I hSide =
        (YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2
          (YangMillsConcreteQE3TwoSeamSynthesisFromSideConditions I hSide) := by
  exact Subsingleton.elim _ _

theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromTwoSeamSynthesisAndExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I ->
      ym_concrete_qe3_os_time_upgrade_reduced_statement I := by
  intro hTwoSeam hExtra
  have hMin : ym_concrete_qe3_minimal_payload_statement I :=
    YangMillsConcreteQE3MinimalPayloadFromTwoSeamSynthesis I hTwoSeam
  dsimp [ym_concrete_qe3_minimal_payload_statement,
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement,
    ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  exact ⟨hMin.2.1, hExtra, hMin.2.2.2.2⟩

theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromTwoSeamSynthesisAndExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I ->
      ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  intro hTwoSeam hExtra
  exact
    YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
      (YangMillsConcreteQE3OSTimeUpgradeReducedFromTwoSeamSynthesisAndExtraIngredient
        I hTwoSeam hExtra)

theorem YangMillsConcreteQE3SubSeamsFromTwoSeamSynthesisAndChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_density_graph_seam_statement I /\
      ym_concrete_qe3_continuum_transport_seam_statement I /\
      ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  intro h
  exact ⟨YangMillsConcreteQE3DensityGraphSeamFromTwoSeamSynthesis I h,
    YangMillsConcreteQE3ContinuumTransportSeamFromTwoSeamSynthesis I h,
    YangMillsConcreteQE3OSTimeUpgradeSeamFromTwoSeamSynthesisAndExtraIngredient I
      h (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I)⟩

abbrev ym_concrete_qe3_three_subseam_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_seam_statement I /\
    ym_concrete_qe3_continuum_transport_seam_statement I /\
    ym_concrete_qe3_os_time_upgrade_seam_statement I

theorem YangMillsConcreteQE3ThreeSubSeamPackageFromTwoSeamSynthesisAndExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I ->
      ym_concrete_qe3_three_subseam_package_statement I := by
  intro hTwoSeam hExtra
  exact
    ⟨YangMillsConcreteQE3DensityGraphSeamFromTwoSeamSynthesis I hTwoSeam,
      YangMillsConcreteQE3ContinuumTransportSeamFromTwoSeamSynthesis I hTwoSeam,
      YangMillsConcreteQE3OSTimeUpgradeSeamFromTwoSeamSynthesisAndExtraIngredient
        I hTwoSeam hExtra⟩

theorem YangMillsConcreteQE3TwoSeamSynthesisAndExtraIngredientFromThreeSubSeamPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I ->
      (ym_concrete_qe3_two_seam_synthesis_statement I /\
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  intro hPkg
  rcases hPkg with ⟨hDensity, hContinuum, hOS⟩
  have hDensityReduced :
      ym_concrete_qe3_density_graph_seam_reduced_statement I :=
    YangMillsConcreteQE3DensityGraphSeamReducedFromSeam I hDensity
  have hContinuumReduced :
      ym_concrete_qe3_continuum_transport_reduced_statement I :=
    YangMillsConcreteQE3ContinuumTransportReducedFromSeam I hContinuum
  have hOSReduced :
      ym_concrete_qe3_os_time_upgrade_reduced_statement I :=
    YangMillsConcreteQE3OSTimeUpgradeReducedFromSeam I hOS
  have hTwoSeam : ym_concrete_qe3_two_seam_synthesis_statement I :=
    ⟨hDensityReduced, hContinuumReduced⟩
  have hExtra : ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I := by
    dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement,
      ym_concrete_qe3_os_time_upgrade_reduced_statement] at hOSReduced
    exact hOSReduced.2.1
  exact ⟨hTwoSeam, hExtra⟩

theorem YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I <->
      (ym_concrete_qe3_two_seam_synthesis_statement I /\
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  constructor
  · exact
      YangMillsConcreteQE3TwoSeamSynthesisAndExtraIngredientFromThreeSubSeamPackage I
  · intro h
    exact
      YangMillsConcreteQE3ThreeSubSeamPackageFromTwoSeamSynthesisAndExtraIngredient
        I h.1 h.2

theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I <->
      (ym_concrete_qe3_primary_subseam_package_statement I /\
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  constructor
  · intro hThree
    have hTwoExtra :=
      YangMillsConcreteQE3TwoSeamSynthesisAndExtraIngredientFromThreeSubSeamPackage I hThree
    exact
      ⟨YangMillsConcreteQE3PrimarySubSeamsFromTwoSeamSynthesis I hTwoExtra.1,
        hTwoExtra.2⟩
  · intro hPrimaryExtra
    have hTwo :
        ym_concrete_qe3_two_seam_synthesis_statement I :=
      YangMillsConcreteQE3TwoSeamSynthesisFromPrimarySubSeams I hPrimaryExtra.1
    exact
      YangMillsConcreteQE3ThreeSubSeamPackageFromTwoSeamSynthesisAndExtraIngredient
        I hTwo hPrimaryExtra.2

theorem YangMillsConcreteQE3PrimarySubSeamsFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_seam_statement I /\
      ym_concrete_qe3_continuum_transport_seam_statement I := by
  exact
    YangMillsConcreteQE3PrimarySubSeamsFromTwoSeamSynthesis I
      (YangMillsConcreteQE3TwoSeamSynthesisStatement I)

theorem YangMillsConcreteQE3SubSeamsFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_seam_statement I /\
      ym_concrete_qe3_continuum_transport_seam_statement I /\
      ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  exact
    YangMillsConcreteQE3SubSeamsFromTwoSeamSynthesisAndChosenSiteBridge I
      (YangMillsConcreteQE3TwoSeamSynthesisStatement I)

theorem YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndExtraIngredientClosed
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I <->
      (ym_concrete_qe3_two_seam_synthesis_statement I /\
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  exact
    YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndExtraIngredient I

theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredientClosed
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I <->
      (ym_concrete_qe3_primary_subseam_package_statement I /\
        ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I) := by
  exact
    YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I

/--
On the closed Route 1 theorem-content surface, the full three-sub-seam package
is exactly the primary QE3 core together with plain OS transport readiness.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I <->
      (ym_concrete_qe3_primary_subseam_package_statement I /\
        I.blueprint.objects.RD.transport_package.os_transport_ready) := by
  constructor
  · intro hThree
    rcases
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).1 hThree
      with ⟨hPrimary, hExtra⟩
    exact ⟨hPrimary, (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).2 hExtra⟩
  · intro hPrimaryTransport
    rcases hPrimaryTransport with ⟨hPrimary, hTransport⟩
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).2
        ⟨hPrimary,
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).1 hTransport⟩

/--
Equivalently, on the closed Route 1 theorem-content surface the full
three-sub-seam package is exactly the joint first-plus-second seam synthesis
together with plain OS transport readiness.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I <->
      (ym_concrete_qe3_two_seam_synthesis_statement I /\
        I.blueprint.objects.RD.transport_package.os_transport_ready) := by
  constructor
  · intro hThree
    rcases
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I).1 hThree
      with ⟨hPrimary, hTransport⟩
    exact ⟨(YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).1 hPrimary, hTransport⟩
  · intro hTwoTransport
    rcases hTwoTransport with ⟨hTwo, hTransport⟩
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I).2
        ⟨(YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2 hTwo, hTransport⟩

/--
Statement-level Route 1 theorem-content version of the same exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransportStatement
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
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_primary_subseam_package_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hRoute1
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I

/--
Statement-level Route 1 theorem-content version of the two-seam-plus-OS form of
the same exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransportStatement
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
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_two_seam_synthesis_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hRoute1
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I

/--
The Route 1 theorem-content surface already recovers the full current
three-sub-seam QE3 package.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContentStatement
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
      ym_concrete_qe3_three_subseam_package_statement I := by
  intro hRoute1
  have hPrimary :=
    YangMillsConcreteQE3PrimarySubSeamPackageFromRoute1TheoremContentStatement I hRoute1
  have hExtra :=
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContentStatement
      I hRoute1
  have hTransport :
      I.blueprint.objects.RD.transport_package.os_transport_ready :=
    (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportStatement
      I hRoute1).2 hExtra
  exact
    (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I).2
      ⟨hPrimary, hTransport⟩

/--
Closed-manuscript Route 1 theorem-content version of the same full QE3 result.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContent
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I := by
  exact
    YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContentStatement I
      (YangMillsConcreteVacuumGapRoute1TheoremContentStatement I)

/--
The Part D surface likewise recovers the full current three-sub-seam QE3
package.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_three_subseam_package_statement I := by
  intro hPartD
  have hTwo := YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement I hPartD
  have hExtra := YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement I hPartD
  exact
    YangMillsConcreteQE3ThreeSubSeamPackageFromTwoSeamSynthesisAndExtraIngredient
      I hTwo hExtra

/--
And the shared QE3 side-condition package already recovers that same full
three-sub-seam surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_three_subseam_package_statement I := by
  intro hSide
  have hTwo := YangMillsConcreteQE3TwoSeamSynthesisFromSideConditions I hSide
  have hExtra := YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions I hSide
  exact
    YangMillsConcreteQE3ThreeSubSeamPackageFromTwoSeamSynthesisAndExtraIngredient
      I hTwo hExtra

/--
At the live theorem level, the Route 1 theorem-content recovery of the full
three-sub-seam QE3 package agrees exactly with the proof rebuilt from the
smaller reduced primary QE3 core plus plain OS transport readiness on that
same manuscript-facing surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContent_eq_fromTwoSeamSynthesisAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContent I =
      (YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I).2
        (And.intro (YangMillsConcreteQE3TwoSeamSynthesisFromRoute1TheoremContent I)
          ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).2 (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContent I))) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Part D recovery of the full three-sub-seam QE3
package agrees exactly with the proof rebuilt from the smaller reduced primary
QE3 core plus plain OS transport readiness on that same manuscript-facing
surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromPartDStatement_eq_fromTwoSeamSynthesisAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3ThreeSubSeamPackageFromPartDStatement I hPartD =
        (YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I).2
          (And.intro (YangMillsConcreteQE3TwoSeamSynthesisFromPartDStatement I hPartD)
            ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromPartDStatement I hPartD).2 (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement I hPartD))) := by
  exact Subsingleton.elim _ _


/--
At the live theorem level, the shared side-condition recovery of the full
three-sub-seam QE3 package agrees exactly with the proof rebuilt from the
smaller reduced primary QE3 core plus plain OS transport readiness on that
same manuscript-facing surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromSideConditions_eq_fromTwoSeamSynthesisAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3ThreeSubSeamPackageFromSideConditions I hSide =
        (YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I).2
          (And.intro (YangMillsConcreteQE3TwoSeamSynthesisFromSideConditions I hSide)
            ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromSideConditions I hSide).2 (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions I hSide))) := by
  exact Subsingleton.elim _ _


/--
Part D version of the manuscript-shaped exactness law: the full current
three-sub-seam QE3 package is exactly the primary QE3 core together with plain
OS transport readiness.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransportFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_primary_subseam_package_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hPartD
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I

/--
Shared side-condition version of the same manuscript-shaped exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransportFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_primary_subseam_package_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hSide
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I

/--
At the live theorem level, the Route 1 theorem-content recovery of the full
three-sub-seam QE3 package agrees exactly with the proof rebuilt from the
manuscript-shaped primary-sub-seam package together with plain OS transport
readiness on that same surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContent_eq_fromPrimarySubSeamsAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContent I =
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I).2
        (And.intro (YangMillsConcreteQE3PrimarySubSeamPackageFromRoute1TheoremContent I)
          ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).2
            (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContent I))) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Part D recovery of the full three-sub-seam QE3
package agrees exactly with the proof rebuilt from the manuscript-shaped
primary-sub-seam package together with plain OS transport readiness on that
same surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromPartDStatement_eq_fromPrimarySubSeamsAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3ThreeSubSeamPackageFromPartDStatement I hPartD =
        (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I).2
          (And.intro (YangMillsConcreteQE3PrimarySubSeamPackageFromPartDStatement I hPartD)
            ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromPartDStatement I hPartD).2
              (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement I hPartD))) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the shared side-condition recovery of the full
three-sub-seam QE3 package agrees exactly with the proof rebuilt from the
manuscript-shaped primary-sub-seam package together with plain OS transport
readiness on that same surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromSideConditions_eq_fromPrimarySubSeamsAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3ThreeSubSeamPackageFromSideConditions I hSide =
        (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndRoute1OSTransport I).2
          (And.intro (YangMillsConcreteQE3PrimarySubSeamPackageFromSideConditions I hSide)
            ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromSideConditions I hSide).2
              (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions I hSide))) := by
  exact Subsingleton.elim _ _

/--
Part D version of the two-seam-plus-OS form of the same exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransportFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_two_seam_synthesis_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hPartD
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I

/--
Shared side-condition version of the two-seam-plus-OS form of the same
exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransportFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_two_seam_synthesis_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hSide
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I

/--
Equivalent reduced-primary-core form of the full three-sub-seam closure law on
the closed Route 1 theorem-content surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I <->
      (ym_concrete_qe3_primary_reduced_package_statement I /\
        I.blueprint.objects.RD.transport_package.os_transport_ready) := by
  constructor
  · intro hThree
    rcases
      (YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I).1 hThree
      with ⟨hTwo, hTransport⟩
    exact ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2 hTwo,
      hTransport⟩
  · intro hReducedTransport
    rcases hReducedTransport with ⟨hReduced, hTransport⟩
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageIffTwoSeamSynthesisAndRoute1OSTransport I).2
        ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).1 hReduced,
          hTransport⟩

/--
Statement-level Route 1 theorem-content version of the same reduced-primary
plus OS-transport exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransportStatement
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
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_primary_reduced_package_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hRoute1
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I

/--
Part D version of the same reduced-primary plus OS-transport exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransportFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_primary_reduced_package_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hPartD
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I

/--
Shared side-condition version of the same reduced-primary plus OS-transport
exactness law.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransportFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_three_subseam_package_statement I <->
        (ym_concrete_qe3_primary_reduced_package_statement I /\
          I.blueprint.objects.RD.transport_package.os_transport_ready)) := by
  intro _hSide
  exact YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I

/--
At the live theorem level, the Route 1 theorem-content recovery of the full
three-sub-seam QE3 package agrees exactly with the proof rebuilt from the
smaller reduced primary QE3 core plus plain OS transport readiness on that
same manuscript-facing surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContent_eq_fromPrimaryReducedAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromRoute1TheoremContent I =
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I).2
        (And.intro (YangMillsConcreteQE3PrimaryReducedPackageFromRoute1TheoremContent I)
          ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).2
            (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromRoute1TheoremContent I))) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Part D recovery of the full three-sub-seam QE3
package agrees exactly with the proof rebuilt from the smaller reduced primary
QE3 core plus plain OS transport readiness on that same manuscript-facing
surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromPartDStatement_eq_fromPrimaryReducedAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3ThreeSubSeamPackageFromPartDStatement I hPartD =
        (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I).2
          (And.intro (YangMillsConcreteQE3PrimaryReducedPackageFromPartDStatement I hPartD)
            ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromPartDStatement I hPartD).2
              (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromPartDStatement I hPartD))) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the shared side-condition recovery of the full
three-sub-seam QE3 package agrees exactly with the proof rebuilt from the
smaller reduced primary QE3 core plus plain OS transport readiness on that
same manuscript-facing surface.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromSideConditions_eq_fromPrimaryReducedAndRoute1OSTransport
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3ThreeSubSeamPackageFromSideConditions I hSide =
        (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I).2
          (And.intro (YangMillsConcreteQE3PrimaryReducedPackageFromSideConditions I hSide)
            ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransportFromSideConditions I hSide).2
              (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromSideConditions I hSide))) := by
  exact Subsingleton.elim _ _

end MaleyLean
