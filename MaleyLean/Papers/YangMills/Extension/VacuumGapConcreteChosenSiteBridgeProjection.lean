import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteProofHomeProjection
import MaleyLean.Papers.YangMills.Kernel.VacuumGapChosenSiteBridgeObjects

namespace MaleyLean

/--
Source-specific name for the reduced density/graph payload recovered from the
chosen-site bridge layer.
-/
abbrev ym_concrete_qe3_density_graph_reduced_from_chosen_site_bridge_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_reduced_statement I

/--
Source-specific name for the full density/graph seam recovered from the
chosen-site bridge layer.
-/
abbrev ym_concrete_qe3_density_graph_seam_from_chosen_site_bridge_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_statement I

/--
Concrete chosen-site bridge export recovered directly from the closed
instantiated manuscript object.
-/
theorem YangMillsConcreteVacuumGapChosenSiteBridgeStatement
    (I : YMClosedInstantiatedManuscript) :
    let RD := I.blueprint.objects.RD
    Nonempty (YMVacuumGapChosenSiteBridgeObject RD) /\
      ym_route1_explicit_statement RD /\
      ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
      ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
      ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
      RD.transport_package.os_transport_ready /\
      RD.transport_package.lattice_gap_input /\
      RD.reconstruction_ready /\
      RD.reconstruction_package.os_sector_ready := by
  let RD := I.blueprint.objects.RD
  let hww := I.blueprint.witnesses.hww
  have h :=
    YangMillsVacuumGapChosenSiteBridgeExportStatement
      RD hww (ym_transport I) (ym_H I) (ym_Hloc I) (ym_corr I) (ym_gapf I)
      (ym_hgap I)
  dsimp [RD]
  exact
    ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1, h.2.2.2.2.1, h.2.2.2.2.2.1,
      h.2.2.2.2.2.2.1, h.2.2.2.2.2.2.2.1, h.2.2.2.2.2.2.2.2.1⟩

/--
The chosen-site bridge layer already contains the reduced density/graph payload
for the first QE3 kill-switch seam.
-/
theorem YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_reduced_statement I := by
  have hBridge := YangMillsConcreteVacuumGapChosenSiteBridgeStatement I
  have hNative := YangMillsConcreteVacuumGapNativeProofHomesStatement I
  dsimp [ym_concrete_qe3_density_graph_reduced_statement] at *
  rcases hBridge with
    ⟨_hObj, _hRoute1, _hF216, _hF5, _hM5, _hOSTransport, _hLattice,
      _hRecon, hOSSector⟩
  rcases hNative with
    ⟨_hHome, _hF216', _hF5', _hM5', _hTransport, _hOSTransport',
      hPositiveGap, _hLattice', _hRecon', _hOSSector', _hMinkowski, hOrigin⟩
  exact ⟨hPositiveGap, hOSSector, hOrigin⟩

/--
Consequently the chosen-site bridge layer recovers the concrete density and
graph-core factor itself.
-/
theorem YangMillsConcreteQE3DensityGraphFromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_statement I := by
  exact
    YangMillsConcreteQE3DensityGraphFactorFromReduced I
      (YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge I)

/--
At the live theorem level, the chosen-site-bridge recovery of the reduced
density/graph payload agrees exactly with the proof rebuilt from its own
positive-gap, OS-sector, and transport-origin ingredients.
-/
theorem YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge I =
      by
        have hBridge := YangMillsConcreteVacuumGapChosenSiteBridgeStatement I
        have hNative := YangMillsConcreteVacuumGapNativeProofHomesStatement I
        dsimp [ym_concrete_qe3_density_graph_reduced_statement] at hBridge hNative ⊢
        rcases hBridge with
          ⟨_hObj, _hRoute1, _hF216, _hF5, _hM5, _hOSTransport, _hLattice,
            _hRecon, hOSSector⟩
        rcases hNative with
          ⟨_hHome, _hF216', _hF5', _hM5', _hTransport, _hOSTransport',
            hPositiveGap, _hLattice', _hRecon', _hOSSector', _hMinkowski, hOrigin⟩
        exact ⟨hPositiveGap, hOSSector, hOrigin⟩ := by
  exact Subsingleton.elim _ _

/--
At the current theorem surface, the reduced density/graph payload recovered
from the chosen-site bridge layer is exactly the same payload exposed on the
manuscript-facing Route 1 / Part D / side-condition surfaces.
-/
theorem YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridgeIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_density_graph_reduced_statement I)
      (ym_concrete_qe3_density_graph_reduced_from_chosen_site_bridge_statement I) := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full density/graph seam level for the
chosen-site bridge source.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromChosenSiteBridgeIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_density_graph_statement I)
      (ym_concrete_qe3_density_graph_seam_from_chosen_site_bridge_statement I) := by
  constructor <;> intro h <;> exact h

/--
At the current theorem surface, the two actual upstream source routes into the
reduced density/graph payload agree exactly with one another.
-/
theorem YangMillsConcreteQE3DensityGraphReducedSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_density_graph_reduced_from_native_proof_homes_statement I)
      (ym_concrete_qe3_density_graph_reduced_from_chosen_site_bridge_statement I) := by
  constructor
  intro h
  exact
    (YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridgeIffRoute1Surface I).1
      ((YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomesIffRoute1Surface I).2 h)
  intro h
  exact
    (YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomesIffRoute1Surface I).1
      ((YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridgeIffRoute1Surface I).2 h)

/--
The same exact source-agreement holds at the full density/graph seam level.
-/
theorem YangMillsConcreteQE3DensityGraphSeamSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_density_graph_seam_from_native_proof_homes_statement I)
      (ym_concrete_qe3_density_graph_seam_from_chosen_site_bridge_statement I) := by
  constructor
  intro h
  exact
    (YangMillsConcreteQE3DensityGraphSeamFromChosenSiteBridgeIffRoute1Surface I).1
      ((YangMillsConcreteQE3DensityGraphSeamFromNativeProofHomesIffRoute1Surface I).2 h)
  intro h
  exact
    (YangMillsConcreteQE3DensityGraphSeamFromNativeProofHomesIffRoute1Surface I).1
      ((YangMillsConcreteQE3DensityGraphSeamFromChosenSiteBridgeIffRoute1Surface I).2 h)

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the reduced density/graph payload.
-/
theorem YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes_eq_fromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes I =
      YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the two actual upstream source routes also recover
exactly the same proof of the full density/graph seam.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromNativeProofHomes_eq_fromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3DensityGraphFromNativeProofHomes I =
      YangMillsConcreteQE3DensityGraphFromChosenSiteBridge I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the chosen-site-bridge recovery of the full
density/graph seam agrees exactly with the proof rebuilt from its own reduced
payload.
-/
theorem YangMillsConcreteQE3DensityGraphFromChosenSiteBridge_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3DensityGraphFromChosenSiteBridge I =
      YangMillsConcreteQE3DensityGraphFactorFromReduced I
        (YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge I) := by
  exact Subsingleton.elim _ _

end MaleyLean
