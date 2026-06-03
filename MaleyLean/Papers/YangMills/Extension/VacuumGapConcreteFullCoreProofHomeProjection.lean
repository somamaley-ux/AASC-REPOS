import MaleyLean.Papers.YangMills.Extension.VacuumGapConcretePrimaryCoreProofHomeProjection
import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteOSProofHomeProjection

namespace MaleyLean

/--
Source-specific name for the full QE3 three-sub-seam package recovered from
the native proof-home layer together with the mass-gap chain.
-/
abbrev ym_concrete_qe3_three_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_three_subseam_package_statement I

/--
Source-specific name for the full QE3 three-sub-seam package recovered from
the chosen-site bridge together with the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_three_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_three_subseam_package_statement I

/--
Source-specific name for the single OS-side extra ingredient recovered from
the native proof-home layer together with the mass-gap chain.
-/
abbrev ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I

/--
Source-specific name for the single OS-side extra ingredient recovered from
the chosen-site bridge together with the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I

/--
The native proof-home layer together with the mass-gap chain already recovers
the full QE3 three-sub-seam package.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I := by
  exact
    (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).2
      ⟨YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChain I,
        by
          dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement]
          exact (YangMillsConcreteQE3OSTimeUpgradeReducedFromNativeProofHomes I).2.1⟩

/--
The chosen-site bridge together with the Route 1 endpoint package likewise
recovers the full QE3 three-sub-seam package.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I := by
  exact
    (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).2
      ⟨YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage I,
        by
          dsimp [ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement]
          exact (YangMillsConcreteQE3OSTimeUpgradeReducedFromChosenSiteBridge I).2.1⟩

/--
At the current theorem surface, the OS-side extra ingredient recovered from the
native proof-home layer together with the mass-gap chain is exactly the same
ingredient exposed on the manuscript-facing Route 1 / Part D / side-condition
surfaces.
-/
theorem YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I ↔
      ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds for the OS-side extra ingredient recovered from the
chosen-site bridge together with the Route 1 endpoint package.
-/
theorem YangMillsConcreteQE3OSExtraIngredientFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_time_upgrade_extra_ingredient_statement I ↔
      ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h <;> exact h

/--
At the current theorem surface, the two actual upstream source routes into the
single OS-side extra ingredient agree exactly with one another.
-/
theorem YangMillsConcreteQE3OSExtraIngredientSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor
  · intro h
    exact
      (YangMillsConcreteQE3OSExtraIngredientFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChainIffRoute1Surface
          I).2 h)
  · intro h
    exact
      (YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChainIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3OSExtraIngredientFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
          I).2 h)

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the single OS-side extra ingredient as well.
-/
theorem YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChain_eq_fromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I =
      YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I := by
  exact Subsingleton.elim _ _

/--
At the source-route level, the native-proof-home/mass-gap-chain OS-side extra
ingredient is already exactly plain OS transport readiness.
-/
theorem YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChainIffRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      I.blueprint.objects.RD.transport_package.os_transport_ready := by
  exact
    (YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChainIffRoute1Surface I).symm.trans
      (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).symm

/--
The chosen-site/Route-1-endpoint-package OS-side extra ingredient enjoys the
same source-level collapse to plain OS transport readiness.
-/
theorem YangMillsConcreteQE3OSExtraIngredientFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      I.blueprint.objects.RD.transport_package.os_transport_ready := by
  exact
    (YangMillsConcreteQE3OSExtraIngredientFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).symm.trans
      (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).symm

/--
At the live theorem level, the native-proof-home/mass-gap-chain OS-side extra
ingredient agrees exactly with the proof rebuilt from plain OS transport
readiness.
-/
theorem YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChain_eq_fromRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I =
      (YangMillsConcreteQE3OSExtraIngredientFromNativeProofHomesAndMassGapChainIffRoute1OSTransport I).2
        ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).2
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I)) := by
  exact Subsingleton.elim _ _

/--
Chosen-site/Route-1-endpoint-package version of the same direct proof equality
with the reconstruction from plain OS transport readiness.
-/
theorem YangMillsConcreteQE3OSExtraIngredientFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromRoute1OSTransport
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I =
      (YangMillsConcreteQE3OSExtraIngredientFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1OSTransport I).2
        ((YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).2
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I)) := by
  exact Subsingleton.elim _ _

/--
At the current theorem surface, the full QE3 three-sub-seam package recovered
from the native proof-home layer together with the mass-gap chain is exactly
the same package exposed on the manuscript-facing Route 1 / Part D /
side-condition surfaces.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I ↔
      ym_concrete_qe3_three_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds for the chosen-site bridge plus Route 1 endpoint
package source pair.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_statement I ↔
      ym_concrete_qe3_three_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h <;> exact h

/--
At the current theorem surface, the two actual upstream source routes into the
full QE3 three-sub-seam package agree exactly with one another.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      ym_concrete_qe3_three_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h
  · exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
          I).2 h)
  · exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
          I).2 h)

/--
Within the native-proof-home/mass-gap-chain source route itself, the full QE3
three-sub-seam package is exactly the primary QE3 core together with the
single OS-side extra ingredient carried by that same source route.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffPrimaryCoreAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      (ym_concrete_qe3_primary_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I) := by
  constructor
  · intro hThree
    have hRoute1 :=
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface I).2
        hThree
    have hSplit :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).1 hRoute1
    exact
      ⟨(YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface I).1
          hSplit.1,
        hSplit.2⟩
  · intro hSource
    have hRoute1 :
        ym_concrete_qe3_three_subseam_package_statement I :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface I).2
            hSource.1,
          hSource.2⟩
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface I).1
        hRoute1

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same internal
collapse: the full QE3 three-sub-seam package is exactly the primary QE3 core
together with that source route's single OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryCoreAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      (ym_concrete_qe3_primary_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I) := by
  constructor
  · intro hThree
    have hRoute1 :=
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).2
        hThree
    have hSplit :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).1 hRoute1
    exact
      ⟨(YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).1
          hSplit.1,
        hSplit.2⟩
  · intro hSource
    have hRoute1 :
        ym_concrete_qe3_three_subseam_package_statement I :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimarySubSeamsAndExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).2
            hSource.1,
          hSource.2⟩
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).1
        hRoute1

/--
Within the native-proof-home/mass-gap-chain source route itself, the full QE3
three-sub-seam package is exactly the live two-seam synthesis together with
the same source route's single OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      (ym_concrete_qe3_two_seam_synthesis_from_native_proof_homes_and_mass_gap_chain_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I) := by
  constructor
  · intro hThree
    have hPrimaryExtra :=
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffPrimaryCoreAndOSExtraIngredient I).1
        hThree
    exact
      ⟨(YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).1 hPrimaryExtra.1,
        hPrimaryExtra.2⟩
  · intro hTwoExtra
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffPrimaryCoreAndOSExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2 hTwoExtra.1,
          hTwoExtra.2⟩

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same internal
collapse to live two-seam synthesis plus the source route's single OS-side
extra ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      (ym_concrete_qe3_two_seam_synthesis_from_chosen_site_bridge_and_route1_endpoint_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I) := by
  constructor
  · intro hThree
    have hPrimaryExtra :=
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryCoreAndOSExtraIngredient I).1
        hThree
    exact
      ⟨(YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).1 hPrimaryExtra.1,
        hPrimaryExtra.2⟩
  · intro hTwoExtra
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryCoreAndOSExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2 hTwoExtra.1,
          hTwoExtra.2⟩

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the full QE3 three-sub-seam package.
-/
theorem YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChain_eq_fromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChain I =
      YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the full QE3 three-sub-seam package is exactly the proof rebuilt from that
same source route's smaller live two-seam synthesis plus OS-side extra
ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChain_eq_fromTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality with the reconstruction from that source route's own smaller live
two-seam synthesis plus OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩ := by
  exact Subsingleton.elim _ _

/--
Within the native-proof-home/mass-gap-chain source route itself, the full QE3
three-sub-seam package is already exactly the smaller reduced primary QE3 core
together with the same source route's single OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      (ym_concrete_qe3_primary_reduced_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I) := by
  constructor
  · intro hThree
    have hRoute1 :=
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface I).2
        hThree
    have hSplit :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I).1 hRoute1
    exact
      ⟨hSplit.1,
        (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).mp hSplit.2⟩
  · intro hSource
    have hRoute1 :
        ym_concrete_qe3_three_subseam_package_statement I :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I).2
        ⟨hSource.1,
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).mpr hSource.2⟩
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface I).1
        hRoute1

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same sharper
internal collapse to the reduced primary QE3 core plus the single OS-side
extra ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_three_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      (ym_concrete_qe3_primary_reduced_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I) := by
  constructor
  · intro hThree
    have hRoute1 :=
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).2
        hThree
    have hSplit :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I).1 hRoute1
    exact
      ⟨hSplit.1,
        (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).mp hSplit.2⟩
  · intro hSource
    have hRoute1 :
        ym_concrete_qe3_three_subseam_package_statement I :=
      (YangMillsConcreteQE3ThreeSubSeamPackageIffPrimaryReducedAndRoute1OSTransport I).2
        ⟨hSource.1,
          (YangMillsConcreteQE3OSTimeUpgradeExtraIngredientIffRoute1OSTransport I).mpr hSource.2⟩
    exact
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).1
        hRoute1

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the full QE3 three-sub-seam package is exactly the proof rebuilt from that
same source route's smaller reduced primary QE3 core plus OS-side extra
ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChain_eq_fromPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3ThreeSubSeamPackageFromNativeProofHomesAndMassGapChainIffPrimaryReducedAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality with the reconstruction from that source route's own reduced primary
QE3 core plus OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3ThreeSubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryReducedAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩ := by
  exact Subsingleton.elim _ _

end MaleyLean
