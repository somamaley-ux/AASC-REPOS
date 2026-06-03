import MaleyLean.Papers.YangMills.Obligations.PaperLedger
import MaleyLean.Papers.YangMills.Verbatim.TheoremRegister

namespace MaleyLean

/--
Claim-level architectural ledger for the hardened Yang--Mills suite.

The aim is to classify the manuscript-facing claim families by where they sit in
the package architecture, not to assert mathematical closure of the underlying
analytic proofs.
-/
inductive YMClaimSupportKind
  | liveProofBurden
  | auditExtraction
  | organizationalOnly
  | reserveOnly
  deriving DecidableEq, Repr

inductive YMPaperClaim
  | ultravioletPublicScopeClaim
  | route1LatticeGapClaim
  | laneASharpLocalConstructionClaim
  | qe3ContinuumGapTransportClaim
  | endpointLocalNetClaim
  | proofKernelAuditClaim
  | closureGatePackagingClaim
  | reservePacketClaim
  deriving DecidableEq, Repr

def ym_claim_section (c : YMPaperClaim) : YMPaperSection :=
  match c with
  | .ultravioletPublicScopeClaim => .uvGateSection
  | .route1LatticeGapClaim => .route1Section
  | .laneASharpLocalConstructionClaim => .laneASection
  | .qe3ContinuumGapTransportClaim => .qe3TransportSection
  | .endpointLocalNetClaim => .endpointSection
  | .proofKernelAuditClaim => .proofKernelSection
  | .closureGatePackagingClaim => .closureGateSection
  | .reservePacketClaim => .reserveSupportSection

def ym_claim_support_kind (c : YMPaperClaim) : YMClaimSupportKind :=
  match c with
  | .ultravioletPublicScopeClaim => .liveProofBurden
  | .route1LatticeGapClaim => .liveProofBurden
  | .laneASharpLocalConstructionClaim => .liveProofBurden
  | .qe3ContinuumGapTransportClaim => .liveProofBurden
  | .endpointLocalNetClaim => .liveProofBurden
  | .proofKernelAuditClaim => .auditExtraction
  | .closureGatePackagingClaim => .organizationalOnly
  | .reservePacketClaim => .reserveOnly

def ym_verbatim_theorem_to_claim (t : YMVerbatimTheoremEntry) : YMPaperClaim :=
  match t with
  | .compactSimpleA1UltravioletGate => .ultravioletPublicScopeClaim
  | .publicGroupScopeExport => .ultravioletPublicScopeClaim
  | .oneShotEntranceAtBoundedPhysicalScale => .ultravioletPublicScopeClaim
  | .tunedFullFixedLatticeOSGap => .route1LatticeGapClaim
  | .sameScaleWilsonToPatchedTransport => .route1LatticeGapClaim
  | .weakWindowSufficiencyCertificate => .route1LatticeGapClaim
  | .uniqueFlowedContinuumState => .laneASharpLocalConstructionClaim
  | .tunedBoundedPositiveTimeBaseState => .laneASharpLocalConstructionClaim
  | .exactDimensionQuotientIdentity => .laneASharpLocalConstructionClaim
  | .coefficientExtractionOnArbitraryQuotientBlocks => .laneASharpLocalConstructionClaim
  | .oneShellTransportOnFiniteTruncations => .laneASharpLocalConstructionClaim
  | .finiteTruncationInverseControl => .laneASharpLocalConstructionClaim
  | .finiteTruncationSFTERemainderPackage => .laneASharpLocalConstructionClaim
  | .finiteMixedBoundedFamilyPackaging => .laneASharpLocalConstructionClaim
  | .firstMixedCorrelatorClosureAtFiniteCap => .laneASharpLocalConstructionClaim
  | .finiteCapSharpLocalExtension => .laneASharpLocalConstructionClaim
  | .passageToFullSharpLocalInductiveUnion => .laneASharpLocalConstructionClaim
  | .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =>
      .laneASharpLocalConstructionClaim
  | .boundedWilsonDyadicOSLimitTheorem => .qe3ContinuumGapTransportClaim
  | .continuumTimeOSUpgradeOfBoundedBaseState => .qe3ContinuumGapTransportClaim
  | .densityOfBoundedBaseAlgebra => .qe3ContinuumGapTransportClaim
  | .graphCoreApproximationAtQE3Seam => .qe3ContinuumGapTransportClaim
  | .continuumVacuumGapTransport => .qe3ContinuumGapTransportClaim
  | .continuumSharpLocalVacuumGap => .qe3ContinuumGapTransportClaim
  | .euclideanOSDossierOnFullSharpLocalAlgebra => .endpointLocalNetClaim
  | .wightmanHaagKastlerReconstruction => .endpointLocalNetClaim
  | .fieldCorrespondence => .endpointLocalNetClaim
  | .minkowskiHamiltonianInheritsGap => .endpointLocalNetClaim
  | .nonTrivialityWitness => .endpointLocalNetClaim
  | .faithfulWilsonUniversalityHypotheses => .endpointLocalNetClaim
  | .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory => .endpointLocalNetClaim
  | .quantitativeLedgerRemainsRhoIndexed => .endpointLocalNetClaim
  | .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =>
      .endpointLocalNetClaim
  | .groupOnlyRestatementOfEndpointTheorem => .endpointLocalNetClaim

theorem YangMillsClaimSupportClassificationStatement :
  forall c : YMPaperClaim,
    ym_claim_support_kind c = .liveProofBurden \/
    ym_claim_support_kind c = .auditExtraction \/
    ym_claim_support_kind c = .organizationalOnly \/
    ym_claim_support_kind c = .reserveOnly := by
  intro c
  cases c
  · exact Or.inl rfl
  · exact Or.inl rfl
  · exact Or.inl rfl
  · exact Or.inl rfl
  · exact Or.inl rfl
  · exact Or.inr (Or.inl rfl)
  · exact Or.inr (Or.inr (Or.inl rfl))
  · exact Or.inr (Or.inr (Or.inr rfl))

theorem YangMillsLiveClaimLedgerStatement :
  ym_claim_support_kind .ultravioletPublicScopeClaim = .liveProofBurden /\
  ym_claim_support_kind .route1LatticeGapClaim = .liveProofBurden /\
  ym_claim_support_kind .laneASharpLocalConstructionClaim = .liveProofBurden /\
  ym_claim_support_kind .qe3ContinuumGapTransportClaim = .liveProofBurden /\
  ym_claim_support_kind .endpointLocalNetClaim = .liveProofBurden := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

theorem YangMillsNonLiveClaimLedgerStatement :
  ym_claim_support_kind .proofKernelAuditClaim = .auditExtraction /\
  ym_claim_support_kind .closureGatePackagingClaim = .organizationalOnly /\
  ym_claim_support_kind .reservePacketClaim = .reserveOnly := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsClaimSectionAlignmentStatement :
  forall c : YMPaperClaim,
    (ym_claim_support_kind c = .liveProofBurden ->
      ym_section_is_live_theorem_burden (ym_claim_section c)) /\
    (ym_claim_support_kind c = .auditExtraction ->
      ym_section_is_audit_extraction (ym_claim_section c)) /\
    (ym_claim_support_kind c = .organizationalOnly ->
      ym_section_is_organizational_only (ym_claim_section c)) /\
    (ym_claim_support_kind c = .reserveOnly ->
      ym_section_is_reserve_only (ym_claim_section c)) := by
  intro c
  cases c <;>
    simp [ym_claim_support_kind, ym_claim_section,
      ym_section_is_live_theorem_burden, ym_section_is_audit_extraction,
      ym_section_is_organizational_only, ym_section_is_reserve_only,
      ym_section_obligation, ym_inventory_is_live_theorem_burden,
      ym_inventory_is_audit_extraction, ym_inventory_is_organizational_only,
      ym_inventory_is_reserve_only]

theorem YangMillsVerbatimRegisterAgreesWithClaimLedgerStatement :
  forall t : YMVerbatimTheoremEntry,
    ym_claim_support_kind (ym_verbatim_theorem_to_claim t) = .liveProofBurden := by
  intro t
  cases t <;> rfl

end MaleyLean
