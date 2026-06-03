import MaleyLean.Papers.YangMills.Kernel.SeamRegister

namespace MaleyLean

/--
Canonical-source crosswalk for the hardened Yang--Mills public surface.

This register links cleaned core/kernel-facing theorem nodes back to the source
labels explicitly advertised by the packet docket and companion crosschecks.
-/
def ym_source_labels (t : YMVerbatimTheoremEntry) : List String :=
  match t with
  | .compactSimpleA1UltravioletGate => ["N.20"]
  | .publicGroupScopeExport => ["N.21"]
  | .oneShotEntranceAtBoundedPhysicalScale => ["F.3", "F.317", "F.318"]
  | .tunedFullFixedLatticeOSGap => ["F.4", "F.308"]
  | .sameScaleWilsonToPatchedTransport => ["III.18"]
  | .weakWindowSufficiencyCertificate => ["F.298"]
  | .uniqueFlowedContinuumState => ["4.92", "4.93"]
  | .tunedBoundedPositiveTimeBaseState => ["4.94"]
  | .exactDimensionQuotientIdentity => ["L.8"]
  | .coefficientExtractionOnArbitraryQuotientBlocks => ["L.11"]
  | .oneShellTransportOnFiniteTruncations => ["5.39"]
  | .finiteTruncationInverseControl => ["5.69"]
  | .finiteTruncationSFTERemainderPackage => ["F.245"]
  | .finiteMixedBoundedFamilyPackaging => ["F.330A"]
  | .firstMixedCorrelatorClosureAtFiniteCap => ["F.331"]
  | .finiteCapSharpLocalExtension => ["5.74A", "5.74", "5.75"]
  | .passageToFullSharpLocalInductiveUnion => ["5.76"]
  | .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace => ["5.77"]
  | .boundedWilsonDyadicOSLimitTheorem => ["F.211"]
  | .continuumTimeOSUpgradeOfBoundedBaseState => ["F.212"]
  | .densityOfBoundedBaseAlgebra => ["F.213"]
  | .graphCoreApproximationAtQE3Seam => ["F.214"]
  | .continuumVacuumGapTransport => ["F.216"]
  | .continuumSharpLocalVacuumGap => ["F.5"]
  | .euclideanOSDossierOnFullSharpLocalAlgebra => ["M.1", "M.2"]
  | .wightmanHaagKastlerReconstruction => ["M.3"]
  | .fieldCorrespondence => ["M.4"]
  | .minkowskiHamiltonianInheritsGap => ["M.5"]
  | .nonTrivialityWitness => ["M.6"]
  | .faithfulWilsonUniversalityHypotheses => ["O.2"]
  | .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory => ["O.3"]
  | .quantitativeLedgerRemainsRhoIndexed => ["O.4"]
  | .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData => ["O.5"]
  | .groupOnlyRestatementOfEndpointTheorem => ["O.7"]

def ym_packet_source_labels (p : YMPacket) : List String :=
  match p with
  | .packet1UVGate => ["N.20", "N.21"]
  | .packet2Entrance => ["F.3", "F.317", "F.318"]
  | .packet3FixedLatticeGap => ["F.4", "F.308"]
  | .packet4FlowedState => ["4.92", "4.93", "4.94", "4.95"]
  | .packet5FiniteTruncation => ["L.8", "L.11", "5.39", "5.69", "F.245"]
  | .packet6FiniteCapClosure => ["F.330A", "F.331", "5.74A", "5.74", "5.75", "5.76"]
  | .packet7Cyclicity => ["5.77"]
  | .packet8QE3Transport => ["III.18", "F.211", "F.212", "F.213", "F.214", "F.216", "F.5"]
  | .packet9Reconstruction => ["M.1", "M.2", "M.3", "M.4", "M.5", "M.6"]
  | .packet10Endpoint => ["O.2", "O.3", "O.4", "O.5", "O.7"]
  | .auxiliaryWeakWindowCertificate => ["F.298"]

def ym_seam_source_label? (s : YMSeamNode) : Option String :=
  match s with
  | .mixedCorrelatorClosureNode => some "F.331"
  | .finiteCapPositiveUnitalBridge => some "5.74A"
  | .finiteCapSharpLocalOSNode => some "5.74"
  | .boundedStateRestrictionCompatibilityNode => some "5.75"
  | .inductiveUnionPassageNode => some "5.76"
  | .boundedBaseCyclicityNode => some "5.77"
  | .graphCoreHandoffNode => some "F.214"
  | .continuumGapTransportNode => some "F.216"
  | .weakWindowCertificateNode => some "F.298"

theorem YangMillsCrosswalkExamplesStatement :
  ym_source_labels .compactSimpleA1UltravioletGate = ["N.20"] /\
  ym_source_labels .sameScaleWilsonToPatchedTransport = ["III.18"] /\
  ym_source_labels .firstMixedCorrelatorClosureAtFiniteCap = ["F.331"] /\
  ym_source_labels .finiteCapSharpLocalExtension = ["5.74A", "5.74", "5.75"] /\
  ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
  ym_source_labels .wightmanHaagKastlerReconstruction = ["M.3"] /\
  ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

theorem YangMillsPacketCrosswalkExamplesStatement :
  ym_packet_source_labels .packet4FlowedState = ["4.92", "4.93", "4.94", "4.95"] /\
  ym_packet_source_labels .packet6FiniteCapClosure =
    ["F.330A", "F.331", "5.74A", "5.74", "5.75", "5.76"] /\
  ym_packet_source_labels .packet8QE3Transport =
    ["III.18", "F.211", "F.212", "F.213", "F.214", "F.216", "F.5"] /\
  ym_packet_source_labels .packet10Endpoint =
    ["O.2", "O.3", "O.4", "O.5", "O.7"] := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsSeamCrosswalkExamplesStatement :
  ym_seam_source_label? .finiteCapPositiveUnitalBridge = some "5.74A" /\
  ym_seam_source_label? .boundedStateRestrictionCompatibilityNode = some "5.75" /\
  ym_seam_source_label? .graphCoreHandoffNode = some "F.214" /\
  ym_seam_source_label? .weakWindowCertificateNode = some "F.298" := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsSourceCrosswalkFollowsPacketMapStatement :
  ym_source_labels .weakWindowSufficiencyCertificate =
      ym_packet_source_labels .auxiliaryWeakWindowCertificate /\
    ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
    ym_seam_source_label? .continuumGapTransportNode = some "F.216" := by
  exact And.intro rfl <| And.intro rfl rfl

end MaleyLean
