import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteChosenSiteBridgeProjection
import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteContinuumTransportProofHomeProjection
import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteTwoSeamFanoutProjection

namespace MaleyLean

/--
Source-specific name for the bundled reduced primary QE3 core recovered from
the native proof-home layer together with the mass-gap chain.
-/
abbrev ym_concrete_qe3_primary_reduced_package_from_native_proof_homes_and_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_primary_reduced_package_statement I

/--
Source-specific name for the bundled full primary QE3 core recovered from the
native proof-home layer together with the mass-gap chain.
-/
abbrev ym_concrete_qe3_primary_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_primary_subseam_package_statement I

/--
Source-specific name for the bundled reduced primary QE3 core recovered from
the chosen-site bridge together with the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_primary_reduced_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_primary_reduced_package_statement I

/--
Source-specific name for the bundled full primary QE3 core recovered from the
chosen-site bridge together with the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_primary_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_primary_subseam_package_statement I

/--
Source-specific name for the live two-seam synthesis surface recovered from
the native proof-home layer together with the mass-gap chain.
-/
abbrev ym_concrete_qe3_two_seam_synthesis_from_native_proof_homes_and_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_two_seam_synthesis_statement I

/--
Source-specific name for the live two-seam synthesis surface recovered from
the chosen-site bridge together with the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_two_seam_synthesis_from_chosen_site_bridge_and_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_two_seam_synthesis_statement I

/--
The native proof-home layer together with the mass-gap chain already recovers
the bundled reduced primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_statement I := by
  exact
    ⟨YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes I,
      YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChain I⟩

/--
Consequently, the same source pair also recovers the bundled full primary QE3
core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_statement I := by
  exact
    ⟨YangMillsConcreteQE3DensityGraphFromNativeProofHomes I,
      YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChain I⟩

/--
The chosen-site bridge together with the Route 1 endpoint package already
recovers the bundled reduced primary QE3 core as well.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_statement I := by
  exact
    ⟨YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge I,
      YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackage I⟩

/--
Consequently, that second source pair also recovers the bundled full primary
QE3 core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_statement I := by
  exact
    ⟨YangMillsConcreteQE3DensityGraphFromChosenSiteBridge I,
      YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackage I⟩

/--
Each of those two actual upstream source pairs therefore already recovers the
live two-seam synthesis theorem surface.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I := by
  exact
    YangMillsConcreteQE3TwoSeamSynthesisFromPrimaryReducedPackage I
      (YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain I)

/--
Chosen-site bridge plus Route 1 endpoint package version of the same source-
layer two-seam synthesis recovery.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I := by
  exact
    YangMillsConcreteQE3TwoSeamSynthesisFromPrimaryReducedPackage I
      (YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage I)

/--
At the current theorem surface, the bundled reduced primary QE3 core recovered
from the native proof-home layer together with the mass-gap chain is exactly
the same as the manuscript-facing bundled reduced primary core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_statement I ↔
      ym_concrete_qe3_primary_reduced_package_from_native_proof_homes_and_mass_gap_chain_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full primary-core seam level for that source
pair.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_statement I ↔
      ym_concrete_qe3_primary_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The bundled reduced primary QE3 core recovered from the chosen-site bridge
together with the Route 1 endpoint package is likewise exactly the same as the
manuscript-facing bundled reduced primary core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_statement I ↔
      ym_concrete_qe3_primary_reduced_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full primary-core seam level for that second
source pair as well.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_statement I ↔
      ym_concrete_qe3_primary_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h <;> exact h

/--
At the current theorem surface, the two actual upstream source routes into the
bundled reduced primary QE3 core agree exactly with one another.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_reduced_package_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      ym_concrete_qe3_primary_reduced_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h
  · exact
      (YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
          I).2 h)
  · exact
      (YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
          I).2 h)

/--
The same exact source-agreement holds at the bundled full primary-core level.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_primary_subseam_package_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      ym_concrete_qe3_primary_subseam_package_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h
  · exact
      (YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
          I).2 h)
  · exact
      (YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChainIffRoute1Surface
        I).1
        ((YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackageIffRoute1Surface
          I).2 h)

/--
At the current theorem surface, the two actual upstream source routes into the
live two-seam synthesis theorem surface agree exactly with one another.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_from_native_proof_homes_and_mass_gap_chain_statement I ↔
      ym_concrete_qe3_two_seam_synthesis_from_chosen_site_bridge_and_route1_endpoint_package_statement
        I := by
  constructor <;> intro h <;> exact h

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the bundled reduced primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain_eq_fromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain I =
      YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the bundled full primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChain_eq_fromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChain I =
      YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the two actual upstream source routes also recover
exactly the same proof of the two-seam synthesis surface itself.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain_eq_fromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain I =
      YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the bundled reduced primary QE3 core is exactly the proof rebuilt from that
same source route's live two-seam synthesis.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimaryReducedPackageFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2
        (YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain I) := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality for the bundled reduced primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimaryReducedPackageFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3PrimaryReducedPackageIffTwoSeamSynthesis I).2
        (YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the bundled full primary QE3 core is exactly the proof rebuilt from that same
source route's live two-seam synthesis.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChain_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimarySubSeamPackageFromNativeProofHomesAndMassGapChain I =
      (YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2
        (YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain I) := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality for the bundled full primary QE3 core.
-/
theorem YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3PrimarySubSeamPackageFromChosenSiteBridgeAndRoute1EndpointPackage I =
      (YangMillsConcreteQE3PrimarySubSeamPackageIffTwoSeamSynthesis I).2
        (YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the native-proof-home/mass-gap-chain recovery of
the joint two-seam synthesis agrees exactly with the proof rebuilt directly
from that source route's two isolated reduced seam recoveries.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain_eq_fromReducedFactors
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3TwoSeamSynthesisFromNativeProofHomesAndMassGapChain I =
      ⟨YangMillsConcreteQE3DensityGraphReducedFromNativeProofHomes I,
        YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChain I⟩ := by
  exact Subsingleton.elim _ _

/--
Chosen-site-bridge/Route-1-endpoint-package version of the same direct proof
equality for the live two-seam synthesis.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage_eq_fromReducedFactors
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3TwoSeamSynthesisFromChosenSiteBridgeAndRoute1EndpointPackage I =
      ⟨YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge I,
        YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackage I⟩ := by
  exact Subsingleton.elim _ _

end MaleyLean
