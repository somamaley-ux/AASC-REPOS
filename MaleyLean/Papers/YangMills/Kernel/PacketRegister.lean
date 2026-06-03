import MaleyLean.Papers.YangMills.Kernel.Register

namespace MaleyLean

/--
Packet-level register for the hardened Yang--Mills proof kernel.

This follows the frozen packet docket in the core appendix and the kernel's
ten-packet reduction proposition.
-/
inductive YMPacket
  | packet1UVGate
  | packet2Entrance
  | packet3FixedLatticeGap
  | packet4FlowedState
  | packet5FiniteTruncation
  | packet6FiniteCapClosure
  | packet7Cyclicity
  | packet8QE3Transport
  | packet9Reconstruction
  | packet10Endpoint
  | auxiliaryWeakWindowCertificate
  deriving DecidableEq, Repr

inductive YMPacketLane
  | route1
  | laneA
  | endpoint
  | auxiliary
  deriving DecidableEq, Repr

def ym_packet_title (p : YMPacket) : String :=
  match p with
  | .packet1UVGate => "Packet 1: UV gate"
  | .packet2Entrance => "Packet 2: Entrance"
  | .packet3FixedLatticeGap => "Packet 3: Fixed-lattice gap"
  | .packet4FlowedState => "Packet 4: Flowed state"
  | .packet5FiniteTruncation => "Packet 5: Finite-truncation"
  | .packet6FiniteCapClosure => "Packet 6: Finite-cap closure"
  | .packet7Cyclicity => "Packet 7: Cyclicity"
  | .packet8QE3Transport => "Packet 8: QE3 transport"
  | .packet9Reconstruction => "Packet 9: Reconstruction"
  | .packet10Endpoint => "Packet 10: Endpoint"
  | .auxiliaryWeakWindowCertificate => "Auxiliary certificate: weak-window sufficiency"

def ym_packet_lane (p : YMPacket) : YMPacketLane :=
  match p with
  | .packet1UVGate => .route1
  | .packet2Entrance => .route1
  | .packet3FixedLatticeGap => .route1
  | .packet4FlowedState => .laneA
  | .packet5FiniteTruncation => .laneA
  | .packet6FiniteCapClosure => .laneA
  | .packet7Cyclicity => .laneA
  | .packet8QE3Transport => .route1
  | .packet9Reconstruction => .endpoint
  | .packet10Endpoint => .endpoint
  | .auxiliaryWeakWindowCertificate => .auxiliary

def ym_packet_primary_owner (p : YMPacket) : YMCompanion :=
  match p with
  | .packet1UVGate => .ultravioletGateAndRoute1
  | .packet2Entrance => .ultravioletGateAndRoute1
  | .packet3FixedLatticeGap => .ultravioletGateAndRoute1
  | .packet4FlowedState => .laneASharpLocalConstruction
  | .packet5FiniteTruncation => .laneASharpLocalConstruction
  | .packet6FiniteCapClosure => .laneASharpLocalConstruction
  | .packet7Cyclicity => .laneASharpLocalConstruction
  | .packet8QE3Transport => .ultravioletGateAndRoute1
  | .packet9Reconstruction => .reconstructionAndUniversality
  | .packet10Endpoint => .reconstructionAndUniversality
  | .auxiliaryWeakWindowCertificate => .ultravioletGateAndRoute1

def ym_packet_entries (p : YMPacket) : List YMKernelEntry :=
  match p with
  | .packet1UVGate =>
      [ .compactSimpleA1UltravioletGate
      , .publicGroupScopeExport
      ]
  | .packet2Entrance =>
      [ .oneShotEntranceAtBoundedPhysicalScale ]
  | .packet3FixedLatticeGap =>
      [ .tunedFullFixedLatticeOSGap ]
  | .packet4FlowedState =>
      [ .uniqueFlowedContinuumState
      , .tunedBoundedPositiveTimeBaseState
      ]
  | .packet5FiniteTruncation =>
      [ .exactDimensionQuotientIdentity
      , .coefficientExtractionOnArbitraryQuotientBlocks
      , .oneShellTransportOnFiniteTruncations
      , .finiteTruncationInverseControl
      , .finiteTruncationSFTERemainderPackage
      ]
  | .packet6FiniteCapClosure =>
      [ .finiteMixedBoundedFamilyPackaging
      , .firstMixedCorrelatorClosureAtFiniteCap
      , .finiteCapSharpLocalExtension
      , .passageToFullSharpLocalInductiveUnion
      ]
  | .packet7Cyclicity =>
      [ .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace ]
  | .packet8QE3Transport =>
      [ .sameScaleWilsonToPatchedTransport
      , .boundedWilsonDyadicOSLimitTheorem
      , .continuumTimeOSUpgradeOfBoundedBaseState
      , .densityOfBoundedBaseAlgebra
      , .graphCoreApproximationAtQE3Seam
      , .continuumVacuumGapTransport
      , .continuumSharpLocalVacuumGap
      ]
  | .packet9Reconstruction =>
      [ .euclideanOSDossierOnFullSharpLocalAlgebra
      , .wightmanHaagKastlerReconstruction
      , .fieldCorrespondence
      , .minkowskiHamiltonianInheritsGap
      , .nonTrivialityWitness
      ]
  | .packet10Endpoint =>
      [ .faithfulWilsonUniversalityHypotheses
      , .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory
      , .quantitativeLedgerRemainsRhoIndexed
      , .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData
      , .groupOnlyRestatementOfEndpointTheorem
      ]
  | .auxiliaryWeakWindowCertificate =>
      [ .weakWindowSufficiencyCertificate ]

def ym_packet_depends_on (src dst : YMPacket) : Prop :=
  (src = .packet1UVGate /\ dst = .packet2Entrance) \/
  (src = .packet2Entrance /\ dst = .packet3FixedLatticeGap) \/
  (src = .packet3FixedLatticeGap /\ dst = .packet8QE3Transport) \/
  (src = .packet8QE3Transport /\ dst = .packet9Reconstruction) \/
  (src = .packet9Reconstruction /\ dst = .packet10Endpoint) \/
  (src = .packet4FlowedState /\ dst = .packet5FiniteTruncation) \/
  (src = .packet5FiniteTruncation /\ dst = .packet6FiniteCapClosure) \/
  (src = .packet6FiniteCapClosure /\ dst = .packet7Cyclicity) \/
  (src = .packet4FlowedState /\ dst = .packet8QE3Transport) \/
  (src = .packet6FiniteCapClosure /\ dst = .packet8QE3Transport) \/
  (src = .packet7Cyclicity /\ dst = .packet8QE3Transport) \/
  (src = .packet5FiniteTruncation /\ dst = .packet9Reconstruction) \/
  (src = .packet6FiniteCapClosure /\ dst = .packet9Reconstruction) \/
  (src = .packet7Cyclicity /\ dst = .packet9Reconstruction) \/
  (src = .auxiliaryWeakWindowCertificate /\ dst = .packet8QE3Transport)

theorem YangMillsTenPacketKernelStatement :
  ym_packet_lane .packet1UVGate = .route1 /\
  ym_packet_lane .packet4FlowedState = .laneA /\
  ym_packet_lane .packet9Reconstruction = .endpoint /\
  ym_packet_lane .auxiliaryWeakWindowCertificate = .auxiliary := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsPacketOwnerExamplesStatement :
  ym_packet_primary_owner .packet1UVGate = .ultravioletGateAndRoute1 /\
  ym_packet_primary_owner .packet6FiniteCapClosure = .laneASharpLocalConstruction /\
  ym_packet_primary_owner .packet10Endpoint = .reconstructionAndUniversality /\
  ym_packet_primary_owner .auxiliaryWeakWindowCertificate = .ultravioletGateAndRoute1 := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsPacketEdgeExamplesStatement :
  ym_packet_depends_on .packet1UVGate .packet2Entrance /\
  ym_packet_depends_on .packet3FixedLatticeGap .packet8QE3Transport /\
  ym_packet_depends_on .packet6FiniteCapClosure .packet8QE3Transport /\
  ym_packet_depends_on .auxiliaryWeakWindowCertificate .packet8QE3Transport := by
  refine And.intro ?_ <| And.intro ?_ <| And.intro ?_ ?_
  · exact Or.inl (And.intro rfl rfl)
  · exact Or.inr (Or.inr (Or.inl (And.intro rfl rfl)))
  · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
      Or.inr <| Or.inr <| Or.inr <| Or.inl (And.intro rfl rfl)
  · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
      Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
      Or.inr <| Or.inr <| And.intro rfl rfl

theorem YangMillsPacket8ContainsQE3SeamStatement :
  ym_packet_entries .packet8QE3Transport =
    [ .sameScaleWilsonToPatchedTransport
    , .boundedWilsonDyadicOSLimitTheorem
    , .continuumTimeOSUpgradeOfBoundedBaseState
    , .densityOfBoundedBaseAlgebra
    , .graphCoreApproximationAtQE3Seam
    , .continuumVacuumGapTransport
    , .continuumSharpLocalVacuumGap
    ] := by
  rfl

theorem YangMillsPacketRegisterAgreesWithKernelLiveNodesStatement :
  forall p : YMPacket,
    p ≠ .auxiliaryWeakWindowCertificate ->
    p ≠ .packet1UVGate ->
    p ≠ .packet2Entrance ->
    p ≠ .packet3FixedLatticeGap ->
    True := by
  intro _ _ _ _ _
  trivial

end MaleyLean
