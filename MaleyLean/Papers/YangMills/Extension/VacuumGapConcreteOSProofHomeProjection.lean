import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteDensityGraphProjection

namespace MaleyLean

/--
Source-specific name for the reduced OS time-upgrade payload recovered from the
native proof-home layer.
-/
abbrev ym_concrete_qe3_os_time_upgrade_reduced_from_native_proof_homes_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_os_time_upgrade_reduced_statement I

/--
Source-specific name for the full OS time-upgrade seam recovered from the
native proof-home layer.
-/
abbrev ym_concrete_qe3_os_time_upgrade_seam_from_native_proof_homes_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_os_time_upgrade_seam_statement I

/--
Source-specific name for the reduced OS time-upgrade payload recovered from the
chosen-site bridge layer.
-/
abbrev ym_concrete_qe3_os_time_upgrade_reduced_from_chosen_site_bridge_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_os_time_upgrade_reduced_statement I

/--
Source-specific name for the full OS time-upgrade seam recovered from the
chosen-site bridge layer.
-/
abbrev ym_concrete_qe3_os_time_upgrade_seam_from_chosen_site_bridge_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_os_time_upgrade_seam_statement I

/--
The native proof-home layer already contains the reduced payload of the
manuscript-facing OS time-upgrade seam.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_reduced_statement I := by
  have h := YangMillsConcreteVacuumGapNativeProofHomesStatement I
  dsimp [ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  rcases h with
    ⟨_hHome, _hF216, _hF5, _hM5, _hTransport, hOSTransport, _hPositiveGap,
      hLatticeGap, _hReconstruction, _hOSSector, _hMinkowskiGap, hOrigin⟩
  exact ⟨hOSTransport, hLatticeGap, hOrigin⟩

/--
At the live theorem level, the native-proof-home recovery of the reduced OS
time-upgrade payload agrees exactly with the proof rebuilt from its own OS
transport, lattice-gap, and transport-origin ingredients.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes I =
      by
        have h := YangMillsConcreteVacuumGapNativeProofHomesStatement I
        dsimp [ym_concrete_qe3_os_time_upgrade_reduced_statement] at h ⊢
        rcases h with
          ⟨_hHome, _hF216, _hF5, _hM5, _hTransport, hOSTransport, _hPositiveGap,
            hLatticeGap, _hReconstruction, _hOSSector, _hMinkowskiGap, hOrigin⟩
        exact ⟨hOSTransport, hLatticeGap, hOrigin⟩ := by
  exact Subsingleton.elim _ _

/--
Consequently the native proof-home layer already recovers the full
manuscript-facing OS time-upgrade seam.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  exact
    YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
      (YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes I)

/--
At the current theorem surface, the reduced OS time-upgrade payload recovered
from the native proof-home layer is exactly the same payload exposed on the
manuscript-facing Route 1 / Part D / side-condition surfaces.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomesIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_os_time_upgrade_reduced_statement I)
      (ym_concrete_qe3_os_time_upgrade_reduced_from_native_proof_homes_statement I) := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full OS time-upgrade seam level for the native
proof-home source.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomesIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_os_time_upgrade_seam_statement I)
      (ym_concrete_qe3_os_time_upgrade_seam_from_native_proof_homes_statement I) := by
  constructor <;> intro h <;> exact h

/--
The chosen-site bridge layer also contains the reduced payload of the
manuscript-facing OS time-upgrade seam.

Here the chosen-site bridge contributes OS transport readiness and lattice-gap
input, while the native proof-home layer supplies the transport-origin witness.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_reduced_statement I := by
  have hBridge := YangMillsConcreteVacuumGapChosenSiteBridgeStatement I
  have hNative := YangMillsConcreteVacuumGapNativeProofHomesStatement I
  dsimp [ym_concrete_qe3_os_time_upgrade_reduced_statement] at *
  rcases hBridge with
    ⟨_hObj, _hRoute1, _hF216, _hF5, _hM5, hOSTransport, hLatticeGap,
      _hRecon, _hOSSector⟩
  rcases hNative with
    ⟨_hHome, _hF216', _hF5', _hM5', _hTransport, _hOSTransport',
      _hPositiveGap, _hLatticeGap', _hRecon', _hOSSector', _hMinkowski, hOrigin⟩
  exact ⟨hOSTransport, hLatticeGap, hOrigin⟩

/--
At the live theorem level, the chosen-site-bridge recovery of the reduced OS
time-upgrade payload agrees exactly with the proof rebuilt from its own OS
transport, lattice-gap, and transport-origin ingredients.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridge_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridge I =
      by
        have hBridge := YangMillsConcreteVacuumGapChosenSiteBridgeStatement I
        have hNative := YangMillsConcreteVacuumGapNativeProofHomesStatement I
        dsimp [ym_concrete_qe3_os_time_upgrade_reduced_statement] at hBridge hNative ⊢
        rcases hBridge with
          ⟨_hObj, _hRoute1, _hF216, _hF5, _hM5, hOSTransport, hLatticeGap,
            _hRecon, _hOSSector⟩
        rcases hNative with
          ⟨_hHome, _hF216', _hF5', _hM5', _hTransport, _hOSTransport',
            _hPositiveGap, _hLatticeGap', _hRecon', _hOSSector', _hMinkowski, hOrigin⟩
        exact ⟨hOSTransport, hLatticeGap, hOrigin⟩ := by
  exact Subsingleton.elim _ _

/--
Consequently the chosen-site bridge layer also recovers the full
manuscript-facing OS time-upgrade seam.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_seam_statement I := by
  exact
    YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
      (YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridge I)

/--
At the current theorem surface, the reduced OS time-upgrade payload recovered
from the chosen-site bridge layer is exactly the same payload exposed on the
manuscript-facing Route 1 / Part D / side-condition surfaces.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridgeIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_os_time_upgrade_reduced_statement I)
      (ym_concrete_qe3_os_time_upgrade_reduced_from_chosen_site_bridge_statement I) := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full OS time-upgrade seam level for the
chosen-site bridge source.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromChosenSiteBridgeIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_os_time_upgrade_seam_statement I)
      (ym_concrete_qe3_os_time_upgrade_seam_from_chosen_site_bridge_statement I) := by
  constructor <;> intro h <;> exact h

/--
At the current theorem surface, the two actual upstream source routes into the
reduced OS time-upgrade payload agree exactly with one another.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_os_time_upgrade_reduced_from_native_proof_homes_statement I)
      (ym_concrete_qe3_os_time_upgrade_reduced_from_chosen_site_bridge_statement I) := by
  constructor
  intro h
  exact
    (YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridgeIffRoute1Surface I).1
      ((YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomesIffRoute1Surface I).2 h)
  intro h
  exact
    (YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomesIffRoute1Surface I).1
      ((YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridgeIffRoute1Surface I).2 h)

/--
The same exact source-agreement holds at the full OS time-upgrade seam level.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_os_time_upgrade_seam_from_native_proof_homes_statement I)
      (ym_concrete_qe3_os_time_upgrade_seam_from_chosen_site_bridge_statement I) := by
  constructor
  intro h
  exact
    (YangMillsConcreteQE3OSTimeUpgradeSeamFromChosenSiteBridgeIffRoute1Surface I).1
      ((YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomesIffRoute1Surface I).2 h)
  intro h
  exact
    (YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomesIffRoute1Surface I).1
      ((YangMillsConcreteQE3OSTimeUpgradeSeamFromChosenSiteBridgeIffRoute1Surface I).2 h)

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the reduced OS time-upgrade payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes_eq_fromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes I =
      YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridge I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the two actual upstream source routes also recover
exactly the same proof of the full OS time-upgrade seam.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomes_eq_fromChosenSiteBridge
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomes I =
      YangMillsConcreteQE3OSTimeUpgradeSeamFromChosenSiteBridge I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home recovery of the full OS
time-upgrade seam agrees exactly with the proof rebuilt from its own reduced
payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomes_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeSeamFromNativeProofHomes I =
      YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
        (YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the chosen-site-bridge recovery of the full OS
time-upgrade seam agrees exactly with the proof rebuilt from its own reduced
payload.
-/
theorem YangMillsConcreteQE3OSTimeUpgradeSeamFromChosenSiteBridge_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeSeamFromChosenSiteBridge I =
      YangMillsConcreteQE3OSTimeUpgradeSeamFromReduced I
        (YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridge I) := by
  exact Subsingleton.elim _ _

end MaleyLean
