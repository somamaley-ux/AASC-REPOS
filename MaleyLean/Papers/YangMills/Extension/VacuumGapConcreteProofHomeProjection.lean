import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteSeamFactors

namespace MaleyLean

/--
Source-specific name for the reduced density/graph payload recovered from the
native proof-home layer.
-/
abbrev ym_concrete_qe3_density_graph_reduced_from_native_proof_homes_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_reduced_statement I

/--
Source-specific name for the full density/graph seam recovered from the native
proof-home layer.
-/
abbrev ym_concrete_qe3_density_graph_seam_from_native_proof_homes_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_statement I

/--
Concrete density/graph reduced payload extracted from the native proof-home
layer of a closed instantiated manuscript.
-/
theorem YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_reduced_statement I := by
  have h := YangMillsConcreteVacuumGapNativeProofHomesStatement I
  dsimp [ym_concrete_qe3_density_graph_reduced_statement] at *
  rcases h with
    ⟨_hHome, _hF216, _hF5, _hM5, _hTransport, _hOSTransport, hPositiveGap,
      _hLatticeGap, _hReconstruction, hOSSector, _hMinkowskiGap, hOrigin⟩
  exact ⟨hPositiveGap, hOSSector, hOrigin⟩

/--
At the live theorem level, the native-proof-home recovery of the reduced
density/graph payload agrees exactly with the proof rebuilt from its own
positive-gap, OS-sector, and transport-origin ingredients.
-/
theorem YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes I =
      by
        have h := YangMillsConcreteVacuumGapNativeProofHomesStatement I
        dsimp [ym_concrete_qe3_density_graph_reduced_statement] at h ⊢
        rcases h with
          ⟨_hHome, _hF216, _hF5, _hM5, _hTransport, _hOSTransport, hPositiveGap,
            _hLatticeGap, _hReconstruction, hOSSector, _hMinkowskiGap, hOrigin⟩
        exact ⟨hPositiveGap, hOSSector, hOrigin⟩ := by
  exact Subsingleton.elim _ _

/--
Concrete transport/gap reduced payload extracted from the mass-gap chain
package of a closed instantiated manuscript.
-/
theorem YangMillsConcreteQE3TransportGapReducedFromMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_reduced_statement I := by
  have h := YangMillsConcreteVacuumGapMassGapChainStatement I
  dsimp [ym_concrete_qe3_transport_gap_reduced_statement] at *
  rcases h with
    ⟨_hChain, _hF216, _hF5, _hM5, _hTransport, hPositiveGap, hMinkowski, hOrigin⟩
  exact ⟨hPositiveGap, hMinkowski, hOrigin⟩

/--
At the live theorem level, the mass-gap-chain recovery of the reduced
transport/gap payload agrees exactly with the proof rebuilt from its own
positive-gap, Minkowski-gap, and transport-origin ingredients.
-/
theorem YangMillsConcreteQE3TransportGapReducedFromMassGapChain_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3TransportGapReducedFromMassGapChain I =
      by
        have h := YangMillsConcreteVacuumGapMassGapChainStatement I
        dsimp [ym_concrete_qe3_transport_gap_reduced_statement] at h ⊢
        rcases h with
          ⟨_hChain, _hF216, _hF5, _hM5, _hTransport, hPositiveGap, hMinkowski, hOrigin⟩
        exact ⟨hPositiveGap, hMinkowski, hOrigin⟩ := by
  exact Subsingleton.elim _ _

/--
The native proof-home layer already contains the full reduced QE3 minimal
payload on the current manuscript-facing route surface.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I := by
  have h := YangMillsConcreteVacuumGapNativeProofHomesStatement I
  dsimp [ym_concrete_qe3_minimal_payload_statement] at *
  rcases h with
    ⟨_hHome, _hF216, _hF5, _hM5, _hTransport, hOSTransport, hPositiveGap,
      _hLatticeGap, _hReconstruction, hOSSector, hMinkowskiGap, hOrigin⟩
  exact ⟨hPositiveGap, hOSTransport, hOSSector, hMinkowskiGap, hOrigin⟩

/--
Consequently, the native proof-home layer already recovers the full concrete
QE3 critical seam on the present formal theorem surface.
-/
theorem YangMillsConcreteQE3CriticalSeamFromNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I := by
  exact
    YangMillsConcreteQE3CriticalSeamFromMinimalPayload I
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomes I)

/--
The native proof-home layer also suffices to recover the concrete density and
graph-core factor directly.
-/
theorem YangMillsConcreteQE3DensityGraphFromNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_statement I := by
  exact
    YangMillsConcreteQE3DensityGraphFactorFromReduced I
      (YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes I)

/--
At the current theorem surface, the reduced density/graph payload recovered
from the native proof-home layer is exactly the same payload exposed on the
manuscript-facing Route 1 / Part D / side-condition surfaces.
-/
theorem YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomesIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_reduced_statement I ↔
      ym_concrete_qe3_density_graph_reduced_from_native_proof_homes_statement I := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full density/graph seam level for the native
proof-home source.
-/
theorem YangMillsConcreteQE3DensityGraphSeamFromNativeProofHomesIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_density_graph_statement I ↔
      ym_concrete_qe3_density_graph_seam_from_native_proof_homes_statement I := by
  constructor <;> intro h <;> exact h

/--
At the live theorem level, the native-proof-home recovery of the full
density/graph seam agrees exactly with the proof rebuilt from its own reduced
payload.
-/
theorem YangMillsConcreteQE3DensityGraphFromNativeProofHomes_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3DensityGraphFromNativeProofHomes I =
      YangMillsConcreteQE3DensityGraphFactorFromReduced I
        (YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes I) := by
  exact Subsingleton.elim _ _

/--
The mass-gap chain already suffices to recover the concrete transport/gap
factor directly.
-/
theorem YangMillsConcreteQE3TransportGapFromMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_statement I := by
  exact
    YangMillsConcreteQE3TransportGapFactorFromReduced I
      (YangMillsConcreteQE3TransportGapReducedFromMassGapChain I)

/--
At the live theorem level, the mass-gap-chain recovery of the full
transport/gap factor agrees exactly with the proof rebuilt from its own
reduced transport/gap payload.
-/
theorem YangMillsConcreteQE3TransportGapFromMassGapChain_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3TransportGapFromMassGapChain I =
      YangMillsConcreteQE3TransportGapFactorFromReduced I
        (YangMillsConcreteQE3TransportGapReducedFromMassGapChain I) := by
  exact Subsingleton.elim _ _

end MaleyLean
