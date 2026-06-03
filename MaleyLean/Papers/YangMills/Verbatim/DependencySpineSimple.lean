import MaleyLean.Papers.YangMills.Verbatim.TheoremRegister

namespace MaleyLean

/-- The frozen Route~1 lattice-to-continuum transport chain advertised in the core paper. -/
def ym_route1_transport_spine : List YMVerbatimTheoremEntry :=
  [ .publicGroupScopeExport
  , .oneShotEntranceAtBoundedPhysicalScale
  , .tunedFullFixedLatticeOSGap
  , .sameScaleWilsonToPatchedTransport
  , .boundedWilsonDyadicOSLimitTheorem
  , .continuumTimeOSUpgradeOfBoundedBaseState
  , .continuumVacuumGapTransport
  , .continuumSharpLocalVacuumGap
  ]

/-- The Lane~A constructive spine highlighted by the core paper. -/
def ym_laneA_spine : List YMVerbatimTheoremEntry :=
  [ .uniqueFlowedContinuumState
  , .exactDimensionQuotientIdentity
  , .coefficientExtractionOnArbitraryQuotientBlocks
  , .oneShellTransportOnFiniteTruncations
  , .finiteTruncationInverseControl
  , .finiteMixedBoundedFamilyPackaging
  , .firstMixedCorrelatorClosureAtFiniteCap
  , .finiteCapSharpLocalExtension
  , .passageToFullSharpLocalInductiveUnion
  , .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace
  ]

/-- The endpoint packet as exposed in core Section VII. -/
def ym_endpoint_spine : List YMVerbatimTheoremEntry :=
  [ .euclideanOSDossierOnFullSharpLocalAlgebra
  , .wightmanHaagKastlerReconstruction
  , .fieldCorrespondence
  , .minkowskiHamiltonianInheritsGap
  , .nonTrivialityWitness
  , .faithfulWilsonUniversalityHypotheses
  , .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory
  , .quantitativeLedgerRemainsRhoIndexed
  , .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData
  , .groupOnlyRestatementOfEndpointTheorem
  ]

theorem YangMillsRoute1TransportSpineStatement :
  ym_route1_transport_spine =
    [ .publicGroupScopeExport
    , .oneShotEntranceAtBoundedPhysicalScale
    , .tunedFullFixedLatticeOSGap
    , .sameScaleWilsonToPatchedTransport
    , .boundedWilsonDyadicOSLimitTheorem
    , .continuumTimeOSUpgradeOfBoundedBaseState
    , .continuumVacuumGapTransport
    , .continuumSharpLocalVacuumGap
    ] := by
  rfl

theorem YangMillsLaneASpineOwnershipStatement :
  ym_verbatim_theorem_owner .uniqueFlowedContinuumState =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .exactDimensionQuotientIdentity =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .coefficientExtractionOnArbitraryQuotientBlocks =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .oneShellTransportOnFiniteTruncations =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .finiteTruncationInverseControl =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .finiteMixedBoundedFamilyPackaging =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .firstMixedCorrelatorClosureAtFiniteCap =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .finiteCapSharpLocalExtension =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .passageToFullSharpLocalInductiveUnion =
      .laneASharpLocalConstruction /\
    ym_verbatim_theorem_owner .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =
      .laneASharpLocalConstruction := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

theorem YangMillsQE3TransportOwnershipStatement :
  ym_verbatim_theorem_owner .boundedWilsonDyadicOSLimitTheorem =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .continuumTimeOSUpgradeOfBoundedBaseState =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .densityOfBoundedBaseAlgebra =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .graphCoreApproximationAtQE3Seam =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .continuumVacuumGapTransport =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .continuumSharpLocalVacuumGap =
      .ultravioletGateAndRoute1 := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

theorem YangMillsEndpointSpineOwnershipStatement :
  ym_verbatim_theorem_owner .euclideanOSDossierOnFullSharpLocalAlgebra =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .wightmanHaagKastlerReconstruction =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .fieldCorrespondence =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .minkowskiHamiltonianInheritsGap =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .nonTrivialityWitness =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .faithfulWilsonUniversalityHypotheses =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .quantitativeLedgerRemainsRhoIndexed =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
      .reconstructionAndUniversality /\
    ym_verbatim_theorem_owner .groupOnlyRestatementOfEndpointTheorem =
      .reconstructionAndUniversality := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

end MaleyLean
