import MaleyLean.Papers.YangMills.Surface.DependencySkeleton

namespace MaleyLean

/--
Verbatim theorem-level register extracted from the hardened Yang--Mills core
paper.

Each entry is keyed to an actual theorem, proposition, corollary, or lemma
title appearing in the live core sections of the archive.
-/
inductive YMVerbatimTheoremEntry
  | compactSimpleA1UltravioletGate
  | publicGroupScopeExport
  | oneShotEntranceAtBoundedPhysicalScale
  | tunedFullFixedLatticeOSGap
  | sameScaleWilsonToPatchedTransport
  | weakWindowSufficiencyCertificate
  | uniqueFlowedContinuumState
  | tunedBoundedPositiveTimeBaseState
  | exactDimensionQuotientIdentity
  | coefficientExtractionOnArbitraryQuotientBlocks
  | oneShellTransportOnFiniteTruncations
  | finiteTruncationInverseControl
  | finiteTruncationSFTERemainderPackage
  | finiteMixedBoundedFamilyPackaging
  | firstMixedCorrelatorClosureAtFiniteCap
  | finiteCapSharpLocalExtension
  | passageToFullSharpLocalInductiveUnion
  | boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace
  | boundedWilsonDyadicOSLimitTheorem
  | continuumTimeOSUpgradeOfBoundedBaseState
  | densityOfBoundedBaseAlgebra
  | graphCoreApproximationAtQE3Seam
  | continuumVacuumGapTransport
  | continuumSharpLocalVacuumGap
  | euclideanOSDossierOnFullSharpLocalAlgebra
  | wightmanHaagKastlerReconstruction
  | fieldCorrespondence
  | minkowskiHamiltonianInheritsGap
  | nonTrivialityWitness
  | faithfulWilsonUniversalityHypotheses
  | qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory
  | quantitativeLedgerRemainsRhoIndexed
  | exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData
  | groupOnlyRestatementOfEndpointTheorem
  deriving DecidableEq, Repr

def ym_verbatim_theorem_title (t : YMVerbatimTheoremEntry) : String :=
  match t with
  | .compactSimpleA1UltravioletGate =>
      "Compact-simple A1 ultraviolet gate"
  | .publicGroupScopeExport =>
      "Public group-scope export"
  | .oneShotEntranceAtBoundedPhysicalScale =>
      "One-shot entrance at bounded physical scale"
  | .tunedFullFixedLatticeOSGap =>
      "Tuned full fixed-lattice OS gap"
  | .sameScaleWilsonToPatchedTransport =>
      "Same-scale Wilson-to-patched transport"
  | .weakWindowSufficiencyCertificate =>
      "Weak-window sufficiency certificate"
  | .uniqueFlowedContinuumState =>
      "Unique flowed continuum state"
  | .tunedBoundedPositiveTimeBaseState =>
      "Tuned bounded positive-time base state"
  | .exactDimensionQuotientIdentity =>
      "Exact-dimension quotient identity"
  | .coefficientExtractionOnArbitraryQuotientBlocks =>
      "Coefficient extraction on arbitrary quotient blocks"
  | .oneShellTransportOnFiniteTruncations =>
      "One-shell transport on finite truncations"
  | .finiteTruncationInverseControl =>
      "Finite-truncation inverse control"
  | .finiteTruncationSFTERemainderPackage =>
      "Finite-truncation SFTE/remainder package"
  | .finiteMixedBoundedFamilyPackaging =>
      "Finite mixed bounded-family packaging"
  | .firstMixedCorrelatorClosureAtFiniteCap =>
      "First mixed-correlator closure at finite cap"
  | .finiteCapSharpLocalExtension =>
      "Finite-cap sharp-local extension"
  | .passageToFullSharpLocalInductiveUnion =>
      "Passage to the full sharp-local inductive union"
  | .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =>
      "Bounded-base cyclicity in the reconstructed sharp-local Hilbert space"
  | .boundedWilsonDyadicOSLimitTheorem =>
      "Bounded Wilson/dyadic OS limit theorem"
  | .continuumTimeOSUpgradeOfBoundedBaseState =>
      "Continuum-time OS upgrade of the bounded base state"
  | .densityOfBoundedBaseAlgebra =>
      "Density of the bounded base algebra"
  | .graphCoreApproximationAtQE3Seam =>
      "Graph-core approximation at the QE3 seam"
  | .continuumVacuumGapTransport =>
      "Continuum vacuum-gap transport"
  | .continuumSharpLocalVacuumGap =>
      "Continuum sharp-local vacuum gap"
  | .euclideanOSDossierOnFullSharpLocalAlgebra =>
      "Euclidean OS dossier on the full sharp-local algebra"
  | .wightmanHaagKastlerReconstruction =>
      "Wightman--Haag--Kastler reconstruction"
  | .fieldCorrespondence =>
      "Field correspondence"
  | .minkowskiHamiltonianInheritsGap =>
      "Minkowski Hamiltonian inherits the gap"
  | .nonTrivialityWitness =>
      "Non-triviality witness"
  | .faithfulWilsonUniversalityHypotheses =>
      "Faithful-Wilson universality hypotheses"
  | .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory =>
      "Qualitative faithful-Wilson universality of the continuum local theory"
  | .quantitativeLedgerRemainsRhoIndexed =>
      "Quantitative ledger remains rho-indexed"
  | .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =>
      "Exact local-net endpoint and exclusion of extended-support sector data"
  | .groupOnlyRestatementOfEndpointTheorem =>
      "Group-only restatement of the endpoint theorem"

def ym_verbatim_theorem_section (t : YMVerbatimTheoremEntry) : YMCoreSection :=
  match t with
  | .compactSimpleA1UltravioletGate => .uvGate
  | .publicGroupScopeExport => .uvGate
  | .oneShotEntranceAtBoundedPhysicalScale => .uvGate
  | .tunedFullFixedLatticeOSGap => .route1LatticeGap
  | .sameScaleWilsonToPatchedTransport => .route1LatticeGap
  | .weakWindowSufficiencyCertificate => .route1LatticeGap
  | .uniqueFlowedContinuumState => .laneASharpLocalConstruction
  | .tunedBoundedPositiveTimeBaseState => .laneASharpLocalConstruction
  | .exactDimensionQuotientIdentity => .laneASharpLocalConstruction
  | .coefficientExtractionOnArbitraryQuotientBlocks => .laneASharpLocalConstruction
  | .oneShellTransportOnFiniteTruncations => .laneASharpLocalConstruction
  | .finiteTruncationInverseControl => .laneASharpLocalConstruction
  | .finiteTruncationSFTERemainderPackage => .laneASharpLocalConstruction
  | .finiteMixedBoundedFamilyPackaging => .laneASharpLocalConstruction
  | .firstMixedCorrelatorClosureAtFiniteCap => .laneASharpLocalConstruction
  | .finiteCapSharpLocalExtension => .laneASharpLocalConstruction
  | .passageToFullSharpLocalInductiveUnion => .laneASharpLocalConstruction
  | .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =>
      .laneASharpLocalConstruction
  | .boundedWilsonDyadicOSLimitTheorem => .qe3Transport
  | .continuumTimeOSUpgradeOfBoundedBaseState => .qe3Transport
  | .densityOfBoundedBaseAlgebra => .qe3Transport
  | .graphCoreApproximationAtQE3Seam => .qe3Transport
  | .continuumVacuumGapTransport => .qe3Transport
  | .continuumSharpLocalVacuumGap => .qe3Transport
  | .euclideanOSDossierOnFullSharpLocalAlgebra => .endpointPacket
  | .wightmanHaagKastlerReconstruction => .endpointPacket
  | .fieldCorrespondence => .endpointPacket
  | .minkowskiHamiltonianInheritsGap => .endpointPacket
  | .nonTrivialityWitness => .endpointPacket
  | .faithfulWilsonUniversalityHypotheses => .endpointPacket
  | .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory => .endpointPacket
  | .quantitativeLedgerRemainsRhoIndexed => .endpointPacket
  | .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData => .endpointPacket
  | .groupOnlyRestatementOfEndpointTheorem => .endpointPacket

def ym_verbatim_theorem_owner (t : YMVerbatimTheoremEntry) : YMCompanion :=
  match t with
  | .compactSimpleA1UltravioletGate => .ultravioletGateAndRoute1
  | .publicGroupScopeExport => .ultravioletGateAndRoute1
  | .oneShotEntranceAtBoundedPhysicalScale => .ultravioletGateAndRoute1
  | .tunedFullFixedLatticeOSGap => .ultravioletGateAndRoute1
  | .sameScaleWilsonToPatchedTransport => .ultravioletGateAndRoute1
  | .weakWindowSufficiencyCertificate => .ultravioletGateAndRoute1
  | .uniqueFlowedContinuumState => .laneASharpLocalConstruction
  | .tunedBoundedPositiveTimeBaseState => .laneASharpLocalConstruction
  | .exactDimensionQuotientIdentity => .laneASharpLocalConstruction
  | .coefficientExtractionOnArbitraryQuotientBlocks => .laneASharpLocalConstruction
  | .oneShellTransportOnFiniteTruncations => .laneASharpLocalConstruction
  | .finiteTruncationInverseControl => .laneASharpLocalConstruction
  | .finiteTruncationSFTERemainderPackage => .laneASharpLocalConstruction
  | .finiteMixedBoundedFamilyPackaging => .laneASharpLocalConstruction
  | .firstMixedCorrelatorClosureAtFiniteCap => .laneASharpLocalConstruction
  | .finiteCapSharpLocalExtension => .laneASharpLocalConstruction
  | .passageToFullSharpLocalInductiveUnion => .laneASharpLocalConstruction
  | .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =>
      .laneASharpLocalConstruction
  | .boundedWilsonDyadicOSLimitTheorem => .ultravioletGateAndRoute1
  | .continuumTimeOSUpgradeOfBoundedBaseState => .ultravioletGateAndRoute1
  | .densityOfBoundedBaseAlgebra => .ultravioletGateAndRoute1
  | .graphCoreApproximationAtQE3Seam => .ultravioletGateAndRoute1
  | .continuumVacuumGapTransport => .ultravioletGateAndRoute1
  | .continuumSharpLocalVacuumGap => .ultravioletGateAndRoute1
  | .euclideanOSDossierOnFullSharpLocalAlgebra => .reconstructionAndUniversality
  | .wightmanHaagKastlerReconstruction => .reconstructionAndUniversality
  | .fieldCorrespondence => .reconstructionAndUniversality
  | .minkowskiHamiltonianInheritsGap => .reconstructionAndUniversality
  | .nonTrivialityWitness => .reconstructionAndUniversality
  | .faithfulWilsonUniversalityHypotheses => .reconstructionAndUniversality
  | .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory =>
      .reconstructionAndUniversality
  | .quantitativeLedgerRemainsRhoIndexed => .reconstructionAndUniversality
  | .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =>
      .reconstructionAndUniversality
  | .groupOnlyRestatementOfEndpointTheorem => .reconstructionAndUniversality

theorem YangMillsVerbatimTheoremSectionAlignmentStatement :
  ym_verbatim_theorem_section .compactSimpleA1UltravioletGate = .uvGate /\
  ym_verbatim_theorem_section .tunedFullFixedLatticeOSGap = .route1LatticeGap /\
  ym_verbatim_theorem_section .uniqueFlowedContinuumState =
    .laneASharpLocalConstruction /\
  ym_verbatim_theorem_section .boundedWilsonDyadicOSLimitTheorem = .qe3Transport /\
  ym_verbatim_theorem_section .euclideanOSDossierOnFullSharpLocalAlgebra =
    .endpointPacket := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsVerbatimTheoremOwnershipStatement :
  ym_verbatim_theorem_owner .compactSimpleA1UltravioletGate =
    .ultravioletGateAndRoute1 /\
  ym_verbatim_theorem_owner .sameScaleWilsonToPatchedTransport =
    .ultravioletGateAndRoute1 /\
  ym_verbatim_theorem_owner .finiteCapSharpLocalExtension =
    .laneASharpLocalConstruction /\
  ym_verbatim_theorem_owner .continuumVacuumGapTransport =
    .ultravioletGateAndRoute1 /\
  ym_verbatim_theorem_owner .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
    .reconstructionAndUniversality := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsVerbatimTheoremOwnerMatchesSectionStatement :
  forall t : YMVerbatimTheoremEntry,
    ym_core_section_owner (ym_verbatim_theorem_section t) =
      some (ym_verbatim_theorem_owner t) := by
  intro t
  cases t <;> rfl

end MaleyLean
