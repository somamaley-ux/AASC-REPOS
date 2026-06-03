import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteCriticalSeam

namespace MaleyLean

/--
Concrete density / graph-core factor extracted from the QE3 critical seam of a
closed instantiated manuscript.
-/
def ym_concrete_qe3_density_graph_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  ym_density_of_bounded_base_algebra_statement RD /\
    ym_graph_core_approximation_at_qe3_seam_statement RD

/--
Concrete continuum-transport / sharp-local-gap factor extracted from the QE3
critical seam of a closed instantiated manuscript.
-/
def ym_concrete_qe3_transport_gap_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  ym_continuum_vacuum_gap_transport_statement RD /\
    ym_continuum_sharp_local_vacuum_gap_statement RD

/--
Reduced common payload carried jointly by the density and graph-core factors in
the current manuscript-facing Route 1 / QE3 surface.
-/
def ym_concrete_qe3_density_graph_reduced_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  RD.transport_package.positive_gap_exhibited /\
    RD.reconstruction_package.os_sector_ready /\
    RD.reconstruction_package.obtained_from_transport

/--
Reduced common payload carried jointly by the continuum-transport and
sharp-local-gap factors in the current manuscript-facing Route 1 / QE3
surface.
-/
def ym_concrete_qe3_transport_gap_reduced_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  RD.transport_package.positive_gap_exhibited /\
    RD.reconstruction_package.minkowski_gap_ready /\
    RD.reconstruction_package.obtained_from_transport

/--
Minimal combined manuscript-facing payload of the current QE3 critical seam.

At the present theorem surface, the full cluster of manuscript-facing QE3
claims reduces to positive gap, OS-sector readiness, Minkowski-gap readiness,
OS-transport readiness, and transport origin.
-/
def ym_concrete_qe3_minimal_payload_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  RD.transport_package.positive_gap_exhibited /\
    RD.transport_package.os_transport_ready /\
    RD.reconstruction_package.os_sector_ready /\
    RD.reconstruction_package.minkowski_gap_ready /\
    RD.reconstruction_package.obtained_from_transport

theorem YangMillsConcreteQE3DensityGraphFromCriticalSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I ->
      ym_concrete_qe3_density_graph_statement I := by
  intro h
  dsimp [ym_concrete_qe3_critical_seam_statement,
    ym_concrete_qe3_density_graph_statement] at *
  exact ⟨h.2.1, h.2.2.1⟩

theorem YangMillsConcreteQE3TransportGapFromCriticalSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I ->
      ym_concrete_qe3_transport_gap_statement I := by
  intro h
  dsimp [ym_concrete_qe3_critical_seam_statement,
    ym_concrete_qe3_transport_gap_statement] at *
  exact ⟨h.2.2.2.1, h.2.2.2.2⟩

theorem YangMillsConcreteQE3DensityGraphStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_statement I := by
  exact
    YangMillsConcreteQE3DensityGraphFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamStatement I)

theorem YangMillsConcreteQE3TransportGapStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_statement I := by
  exact
    YangMillsConcreteQE3TransportGapFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamStatement I)

theorem YangMillsConcreteQE3TransportGapReducedFromFactor
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_statement I ->
      ym_concrete_qe3_transport_gap_reduced_statement I := by
  intro h
  dsimp [ym_concrete_qe3_transport_gap_statement,
    ym_concrete_qe3_transport_gap_reduced_statement] at *
  exact ⟨h.1.1, h.1.2, h.2.2⟩

theorem YangMillsConcreteQE3TransportGapFactorFromReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_reduced_statement I ->
      ym_concrete_qe3_transport_gap_statement I := by
  intro h
  dsimp [ym_concrete_qe3_transport_gap_statement,
    ym_concrete_qe3_transport_gap_reduced_statement] at *
  exact ⟨⟨h.1, h.2.1⟩, ⟨h.2.1, h.2.2⟩⟩

theorem YangMillsConcreteQE3TransportGapFactorIffReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_statement I <->
      ym_concrete_qe3_transport_gap_reduced_statement I := by
  exact ⟨YangMillsConcreteQE3TransportGapReducedFromFactor I,
    YangMillsConcreteQE3TransportGapFactorFromReduced I⟩

theorem YangMillsConcreteQE3DensityGraphReducedFromFactor
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_statement I ->
      ym_concrete_qe3_density_graph_reduced_statement I := by
  intro h
  dsimp [ym_concrete_qe3_density_graph_statement,
    ym_concrete_qe3_density_graph_reduced_statement] at *
  exact ⟨h.1.1, h.1.2, h.2.2⟩

theorem YangMillsConcreteQE3DensityGraphFactorFromReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_reduced_statement I ->
      ym_concrete_qe3_density_graph_statement I := by
  intro h
  dsimp [ym_concrete_qe3_density_graph_statement,
    ym_concrete_qe3_density_graph_reduced_statement] at *
  exact ⟨⟨h.1, h.2.1⟩, ⟨h.1, h.2.2⟩⟩

theorem YangMillsConcreteQE3DensityGraphFactorIffReduced
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_statement I <->
      ym_concrete_qe3_density_graph_reduced_statement I := by
  exact ⟨YangMillsConcreteQE3DensityGraphReducedFromFactor I,
    YangMillsConcreteQE3DensityGraphFactorFromReduced I⟩

theorem YangMillsConcreteQE3MinimalPayloadFromReducedFactors
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_reduced_statement I ->
      ym_concrete_qe3_transport_gap_reduced_statement I ->
        ym_concrete_qe3_minimal_payload_statement I := by
  intro hDG hTG
  have hCrit :=
    YangMillsConcreteQE3CriticalSeamStatement I
  have hOS :
      I.blueprint.objects.RD.transport_package.os_transport_ready := by
    exact hCrit.1.1
  dsimp [ym_concrete_qe3_density_graph_reduced_statement,
    ym_concrete_qe3_transport_gap_reduced_statement,
    ym_concrete_qe3_minimal_payload_statement] at *
  exact ⟨hDG.1, hOS, hDG.2.1, hTG.2.1, hDG.2.2⟩

theorem YangMillsConcreteQE3ReducedFactorsFromMinimalPayload
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I ->
      ym_concrete_qe3_density_graph_reduced_statement I /\
        ym_concrete_qe3_transport_gap_reduced_statement I := by
  intro h
  dsimp [ym_concrete_qe3_density_graph_reduced_statement,
    ym_concrete_qe3_transport_gap_reduced_statement,
    ym_concrete_qe3_minimal_payload_statement] at *
  exact ⟨⟨h.1, h.2.2.1, h.2.2.2.2⟩, ⟨h.1, h.2.2.2.1, h.2.2.2.2⟩⟩

theorem YangMillsConcreteQE3CriticalSeamFromMinimalPayload
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I ->
      ym_concrete_qe3_critical_seam_statement I := by
  intro h
  have hParts := YangMillsConcreteQE3ReducedFactorsFromMinimalPayload I h
  have hDG :=
    YangMillsConcreteQE3DensityGraphFactorFromReduced I hParts.1
  have hTG :=
    YangMillsConcreteQE3TransportGapFactorFromReduced I hParts.2
  dsimp [ym_concrete_qe3_critical_seam_statement,
    ym_concrete_qe3_minimal_payload_statement] at *
  exact ⟨⟨h.2.1, h.2.2.2.2⟩, hDG.1, hDG.2, hTG.1, hTG.2⟩

theorem YangMillsConcreteQE3MinimalPayloadFromCriticalSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I ->
      ym_concrete_qe3_minimal_payload_statement I := by
  intro h
  have hDG := YangMillsConcreteQE3DensityGraphReducedFromFactor I
    (YangMillsConcreteQE3DensityGraphFromCriticalSeam I h)
  have hTG := YangMillsConcreteQE3TransportGapReducedFromFactor I
    (YangMillsConcreteQE3TransportGapFromCriticalSeam I h)
  exact YangMillsConcreteQE3MinimalPayloadFromReducedFactors I hDG hTG

theorem YangMillsConcreteQE3CriticalSeamIffMinimalPayload
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I <->
      ym_concrete_qe3_minimal_payload_statement I := by
  exact ⟨YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I,
    YangMillsConcreteQE3CriticalSeamFromMinimalPayload I⟩

theorem YangMillsConcreteQE3DensityGraphFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_density_graph_statement I := by
  intro h
  exact
    YangMillsConcreteQE3DensityGraphFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamFromSideConditions I h)

theorem YangMillsConcreteQE3TransportGapFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_transport_gap_statement I := by
  intro h
  exact
    YangMillsConcreteQE3TransportGapFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamFromSideConditions I h)

theorem YangMillsConcreteQE3TransportGapReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_transport_gap_reduced_statement I := by
  intro h
  exact
    YangMillsConcreteQE3TransportGapReducedFromFactor I
      (YangMillsConcreteQE3TransportGapFromSideConditions I h)

theorem YangMillsConcreteQE3DensityGraphReducedFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_density_graph_reduced_statement I := by
  intro h
  exact
    YangMillsConcreteQE3DensityGraphReducedFromFactor I
      (YangMillsConcreteQE3DensityGraphFromSideConditions I h)

theorem YangMillsConcreteQE3DensityGraphReducedStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_reduced_statement I := by
  exact
    YangMillsConcreteQE3DensityGraphReducedFromFactor I
      (YangMillsConcreteQE3DensityGraphStatement I)

theorem YangMillsConcreteQE3TransportGapReducedStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_reduced_statement I := by
  exact
    YangMillsConcreteQE3TransportGapReducedFromFactor I
      (YangMillsConcreteQE3TransportGapStatement I)

theorem YangMillsConcreteQE3MinimalPayloadFromPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      ym_concrete_qe3_minimal_payload_statement I := by
  intro h
  exact
    YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamFromPartDStatement I h)

theorem YangMillsConcreteQE3MinimalPayloadFromSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      ym_concrete_qe3_minimal_payload_statement I := by
  intro h
  exact
    YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamFromSideConditions I h)

theorem YangMillsConcreteQE3MinimalPayloadStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I := by
  exact
    YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamStatement I)

/--
At the live theorem level, the closed-manuscript recovery of the QE3 critical
seam agrees exactly with the proof rebuilt from the corresponding closed-
manuscript QE3 minimal payload.
-/
theorem YangMillsConcreteQE3CriticalSeamStatement_eq_fromMinimalPayload
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3CriticalSeamStatement I =
      YangMillsConcreteQE3CriticalSeamFromMinimalPayload I
        (YangMillsConcreteQE3MinimalPayloadStatement I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Part D recovery of the QE3 critical seam agrees
exactly with the proof rebuilt from the corresponding Part D QE3 minimal
payload.
-/
theorem YangMillsConcreteQE3CriticalSeamFromPartDStatement_eq_fromMinimalPayload
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3CriticalSeamFromPartDStatement I hPartD =
        YangMillsConcreteQE3CriticalSeamFromMinimalPayload I
          (YangMillsConcreteQE3MinimalPayloadFromPartDStatement I hPartD) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the shared side-condition recovery of the QE3
critical seam agrees exactly with the proof rebuilt from the corresponding
side-condition QE3 minimal payload.
-/
theorem YangMillsConcreteQE3CriticalSeamFromSideConditions_eq_fromMinimalPayload
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3CriticalSeamFromSideConditions I hSide =
        YangMillsConcreteQE3CriticalSeamFromMinimalPayload I
          (YangMillsConcreteQE3MinimalPayloadFromSideConditions I hSide) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the closed-manuscript recovery of the QE3 minimal
payload agrees exactly with the proof rebuilt from the corresponding closed-
manuscript QE3 critical seam.
-/
theorem YangMillsConcreteQE3MinimalPayloadStatement_eq_fromCriticalSeam
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3MinimalPayloadStatement I =
      YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
        (YangMillsConcreteQE3CriticalSeamStatement I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Part D recovery of the QE3 minimal payload
agrees exactly with the proof rebuilt from the corresponding Part D QE3
critical seam.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromPartDStatement_eq_fromCriticalSeam
    (I : YMClosedInstantiatedManuscript)
    (hPartD : ym_concrete_vacuum_gap_partD_statement I) :
      YangMillsConcreteQE3MinimalPayloadFromPartDStatement I hPartD =
        YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
          (YangMillsConcreteQE3CriticalSeamFromPartDStatement I hPartD) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the shared side-condition recovery of the QE3
minimal payload agrees exactly with the proof rebuilt from the corresponding
side-condition QE3 critical seam.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromSideConditions_eq_fromCriticalSeam
    (I : YMClosedInstantiatedManuscript)
    (hSide : ym_concrete_vacuum_gap_side_conditions_statement I) :
      YangMillsConcreteQE3MinimalPayloadFromSideConditions I hSide =
        YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
          (YangMillsConcreteQE3CriticalSeamFromSideConditions I hSide) := by
  exact Subsingleton.elim _ _

end MaleyLean
