import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteFullCoreProofHomeProjection
import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteSeamFactors

namespace MaleyLean

/--
Source-specific name for the QE3 minimal payload recovered from the native
proof-home layer together with the mass-gap chain.
-/
abbrev ym_concrete_qe3_minimal_payload_from_native_proof_homes_and_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_minimal_payload_statement I

/--
Source-specific name for the QE3 critical seam recovered from the native
proof-home layer together with the mass-gap chain.
-/
abbrev ym_concrete_qe3_critical_seam_from_native_proof_homes_and_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_critical_seam_statement I

/--
Source-specific name for the QE3 minimal payload recovered from the chosen-
site bridge together with the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_minimal_payload_from_chosen_site_bridge_and_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_minimal_payload_statement I

/--
Source-specific name for the QE3 critical seam recovered from the chosen-site
bridge together with the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_critical_seam_from_chosen_site_bridge_and_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_critical_seam_statement I

/--
The native proof-home layer together with the mass-gap chain already recovers
the QE3 minimal payload.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I := by
  exact
    YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomes I)

/--
Consequently, that same source pair also recovers the full QE3 critical seam.
-/
theorem YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I := by
  exact
    YangMillsConcreteQE3CriticalSeamFromMinimalPayload I
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain I)

/--
The chosen-site bridge together with the Route 1 endpoint package also
recovers the QE3 minimal payload.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I := by
  exact
    YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackage I)

/--
At the current theorem surface, the QE3 minimal payload recovered from the
native proof-home layer together with the mass-gap chain is exactly the same
payload exposed on the manuscript-facing Route 1 / Part D / side-condition
surfaces.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I ↔
      ym_concrete_qe3_minimal_payload_from_native_proof_homes_and_mass_gap_chain_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the QE3 critical-seam level for that source pair.
-/
theorem YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I ↔
      ym_concrete_qe3_critical_seam_from_native_proof_homes_and_mass_gap_chain_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The QE3 minimal payload recovered from the chosen-site bridge together with
the Route 1 endpoint package is likewise exactly the same as the manuscript-
facing minimal payload.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I ↔
      ym_concrete_qe3_minimal_payload_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h <;> exact h

/--
And the same exactness holds at the QE3 critical-seam level for that second
source pair as well.
-/
theorem YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I ↔
      ym_concrete_qe3_critical_seam_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The native-proof-home/mass-gap-chain recovery of the QE3 minimal payload is
therefore also exact on the manuscript-facing Part D surface.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_minimal_payload_statement I ↔
        ym_concrete_qe3_minimal_payload_from_native_proof_homes_and_mass_gap_chain_statement
          I) := by
  intro _hPartD
  exact YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffRoute1Surface I

/--
The same exactness holds for the chosen-site/Route-1-endpoint recovery of the
QE3 minimal payload on the Part D surface.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_minimal_payload_statement I ↔
        ym_concrete_qe3_minimal_payload_from_chosen_site_bridge_and_route1_endpoint_package_statement
          I) := by
  intro _hPartD
  exact YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I

/--
The native-proof-home/mass-gap-chain recovery of the QE3 critical seam is also
exact on the manuscript-facing Part D surface.
-/
theorem YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_critical_seam_statement I ↔
        ym_concrete_qe3_critical_seam_from_native_proof_homes_and_mass_gap_chain_statement
          I) := by
  intro _hPartD
  exact YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffRoute1Surface I

/--
The same exactness holds for the chosen-site/Route-1-endpoint recovery of the
QE3 critical seam on the Part D surface.
-/
theorem YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffPartDStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_partD_statement I ->
      (ym_concrete_qe3_critical_seam_statement I ↔
        ym_concrete_qe3_critical_seam_from_chosen_site_bridge_and_route1_endpoint_package_statement
          I) := by
  intro _hPartD
  exact YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I

/--
The native-proof-home/mass-gap-chain recovery of the QE3 minimal payload is
likewise exact on the shared side-condition surface.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_minimal_payload_statement I ↔
        ym_concrete_qe3_minimal_payload_from_native_proof_homes_and_mass_gap_chain_statement
          I) := by
  intro _hSide
  exact YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffRoute1Surface I

/--
The same exactness holds for the chosen-site/Route-1-endpoint recovery of the
QE3 minimal payload on the side-condition surface.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_minimal_payload_statement I ↔
        ym_concrete_qe3_minimal_payload_from_chosen_site_bridge_and_route1_endpoint_package_statement
          I) := by
  intro _hSide
  exact YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I

/--
The native-proof-home/mass-gap-chain recovery of the QE3 critical seam is also
exact on the shared side-condition surface.
-/
theorem YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_critical_seam_statement I ↔
        ym_concrete_qe3_critical_seam_from_native_proof_homes_and_mass_gap_chain_statement
          I) := by
  intro _hSide
  exact YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffRoute1Surface I

/--
The same exactness holds for the chosen-site/Route-1-endpoint recovery of the
QE3 critical seam on the side-condition surface.
-/
theorem YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffSideConditions
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I ->
      (ym_concrete_qe3_critical_seam_statement I ↔
        ym_concrete_qe3_critical_seam_from_chosen_site_bridge_and_route1_endpoint_package_statement
          I) := by
  intro _hSide
  exact YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I

/--
At the current theorem surface, the two actual upstream source routes into the
QE3 minimal payload agree exactly with one another.
-/
theorem YangMillsConcreteQE3MinimalPayloadSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      ym_concrete_qe3_minimal_payload_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h
  · exact
      (YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffRoute1Surface
          I).2 h)
  · exact
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
          I).2 h)

/--
The same exact source-agreement holds at the full QE3 critical-seam level.
-/
theorem YangMillsConcreteQE3CriticalSeamSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      ym_concrete_qe3_critical_seam_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h
  · exact
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffRoute1Surface
          I).2 h)
  · exact
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
          I).2 h)

/--
Within the native-proof-home/mass-gap-chain source route itself, the higher QE3
critical seam collapses exactly to that route's live two-seam synthesis plus
its single OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      (ym_concrete_qe3_two_seam_synthesis_from_native_proof_homes_and_mass_gap_chain_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I) := by
  constructor
  · intro hCritical
    have hRoute1Crit :=
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffRoute1Surface I).2 hCritical
    have hRoute1Min :=
      YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I hRoute1Crit
    have hTwo :
        ym_concrete_qe3_two_seam_synthesis_from_native_proof_homes_and_mass_gap_chain_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).2 hRoute1Min
    exact ⟨hTwo, YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩
  · intro hTwoExtra
    have hRoute1Min :
        ym_concrete_qe3_minimal_payload_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).1 hTwoExtra.1
    have hRoute1Crit :=
      YangMillsConcreteQE3CriticalSeamFromMinimalPayload I hRoute1Min
    exact
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffRoute1Surface I).1
        hRoute1Crit

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same higher-source
collapse to live two-seam synthesis plus the route's single OS-side extra
ingredient.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      (ym_concrete_qe3_two_seam_synthesis_from_chosen_site_bridge_and_route1_endpoint_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I) := by
  constructor
  · intro hCritical
    have hRoute1Crit :=
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).2
        hCritical
    have hRoute1Min :=
      YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I hRoute1Crit
    have hTwo :
        ym_concrete_qe3_two_seam_synthesis_from_chosen_site_bridge_and_route1_endpoint_package_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).2 hRoute1Min
    exact ⟨hTwo, YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩
  · intro hTwoExtra
    have hRoute1Min :
        ym_concrete_qe3_minimal_payload_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).1 hTwoExtra.1
    have hRoute1Crit :=
      YangMillsConcreteQE3CriticalSeamFromMinimalPayload I hRoute1Min
    exact
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).1
        hRoute1Crit

/--
At the native-proof-home/mass-gap-chain source route, even the higher QE3
minimal payload collapses to the same live two-seam synthesis plus OS-side
extra ingredient.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      (ym_concrete_qe3_two_seam_synthesis_from_native_proof_homes_and_mass_gap_chain_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I) := by
  constructor
  · intro hMin
    have hRoute1Min :=
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffRoute1Surface I).2 hMin
    have hTwo :
        ym_concrete_qe3_two_seam_synthesis_from_native_proof_homes_and_mass_gap_chain_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).2 hRoute1Min
    exact ⟨hTwo, YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩
  · intro hTwoExtra
    have hRoute1Min :
        ym_concrete_qe3_minimal_payload_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).1 hTwoExtra.1
    exact
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffRoute1Surface I).1
        hRoute1Min

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same minimal-payload
collapse to live two-seam synthesis plus the route's single OS-side extra
ingredient.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      (ym_concrete_qe3_two_seam_synthesis_from_chosen_site_bridge_and_route1_endpoint_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I) := by
  constructor
  · intro hMin
    have hRoute1Min :=
      (YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).2 hMin
    have hTwo :
        ym_concrete_qe3_two_seam_synthesis_from_chosen_site_bridge_and_route1_endpoint_package_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).2 hRoute1Min
    exact ⟨hTwo, YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩
  · intro hTwoExtra
    have hRoute1Min :
        ym_concrete_qe3_minimal_payload_statement I :=
      (YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload I).1 hTwoExtra.1
    exact
      (YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface I).1
        hRoute1Min

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the QE3 minimal payload.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain_eq_fromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain I =
      YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the two actual upstream source routes also recover
exactly the same proof of the full QE3 critical seam.
-/
theorem YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChain_eq_fromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChain I =
      YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the QE3 minimal payload is exactly the proof rebuilt from that same source
route's smaller live two-seam synthesis plus OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain_eq_fromTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality for the QE3 minimal payload.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩ := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the full QE3 critical seam is exactly the proof rebuilt from that same source
route's smaller live two-seam synthesis plus OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChain_eq_fromTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality for the full QE3 critical seam.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromTwoSeamSynthesisAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩ := by
  exact Subsingleton.elim _ _

/--
Within the native-proof-home/mass-gap-chain source route itself, even the QE3
minimal payload is already exactly the smaller reduced primary QE3 core
together with the same source route's single OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      (ym_concrete_qe3_primary_reduced_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I) := by
  constructor
  · intro hMin
    have hTwoExtra :=
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient I).1
        hMin
    exact ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2 hTwoExtra.1, hTwoExtra.2⟩
  · intro hReducedExtra
    exact
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).1 hReducedExtra.1,
          hReducedExtra.2⟩

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same sharper
minimal-payload collapse to the reduced primary QE3 core plus the single
OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      (ym_concrete_qe3_primary_reduced_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I) := by
  constructor
  · intro hMin
    have hTwoExtra :=
      (YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient I).1
        hMin
    exact ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2 hTwoExtra.1, hTwoExtra.2⟩
  · intro hReducedExtra
    exact
      (YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).1 hReducedExtra.1,
          hReducedExtra.2⟩

/--
The same sharper internal collapse already holds one level higher for the full
QE3 critical seam on the native-proof-home/mass-gap-chain source route.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      (ym_concrete_qe3_primary_reduced_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_native_proof_homes_and_mass_gap_chain_statement I) := by
  constructor
  · intro hCrit
    have hTwoExtra :=
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient I).1
        hCrit
    exact ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2 hTwoExtra.1, hTwoExtra.2⟩
  · intro hReducedExtra
    exact
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffTwoSeamSynthesisAndOSExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).1 hReducedExtra.1,
          hReducedExtra.2⟩

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same sharper
critical-seam collapse to the reduced primary QE3 core plus the single
OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_from_chosen_site_bridge_and_route1_endpoint_package_statement I ↔
      (ym_concrete_qe3_primary_reduced_package_statement I ∧
        ym_concrete_qe3_os_extra_ingredient_from_chosen_site_bridge_and_route1_endpoint_package_statement I) := by
  constructor
  · intro hCrit
    have hTwoExtra :=
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient I).1
        hCrit
    exact ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2 hTwoExtra.1, hTwoExtra.2⟩
  · intro hReducedExtra
    exact
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffTwoSeamSynthesisAndOSExtraIngredient I).2
        ⟨(YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).1 hReducedExtra.1,
          hReducedExtra.2⟩

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the QE3 minimal payload is exactly the proof rebuilt from that same source
route's smaller reduced primary QE3 core plus OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain_eq_fromPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3MinimalPayloadFromNativeProofHomesAndMassGapChainIffPrimaryReducedAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality for the QE3 minimal payload.
-/
theorem
    YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3MinimalPayloadFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryReducedAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩ := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the full QE3 critical seam is exactly the proof rebuilt from that same source
route's smaller reduced primary QE3 core plus OS-side extra ingredient.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChain_eq_fromPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3CriticalSeamFromNativeProofHomesAndMassGapChainIffPrimaryReducedAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality for the full QE3 critical seam.
-/
theorem
    YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromPrimaryReducedAndOSExtraIngredient
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackageIffPrimaryReducedAndOSExtraIngredient
        I).2
        ⟨YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage I,
          YangMillsConcreteQE3OSTimeUpgradeExtraIngredientFromChosenSiteBridge I⟩ := by
  exact Subsingleton.elim _ _

end MaleyLean
