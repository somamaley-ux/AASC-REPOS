import MaleyLean.Papers.YangMills.Verbatim.DependencySpineSimple
import MaleyLean.Papers.YangMills.Obligations.ClaimLedger

namespace MaleyLean

/--
Kernel-facing entries extracted from `proofkernel.tex`.

The proof kernel is an expert-audit extraction from the live proof surface. It
adds a kernel main theorem and an explicit ten-packet reduction proposition,
then re-exposes selected live theorem nodes in dependency order.
-/
inductive YMKernelEntry
  | kernelMainTheorem
  | tenPacketProofKernel
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

def ym_kernel_entry_title (k : YMKernelEntry) : String :=
  match k with
  | .kernelMainTheorem => "Kernel main theorem"
  | .tenPacketProofKernel => "Ten-packet proof kernel"
  | .compactSimpleA1UltravioletGate => "Compact-simple A1 ultraviolet gate"
  | .publicGroupScopeExport => "Public group-scope export"
  | .oneShotEntranceAtBoundedPhysicalScale => "One-shot entrance at bounded physical scale"
  | .tunedFullFixedLatticeOSGap => "Tuned full fixed-lattice OS gap"
  | .sameScaleWilsonToPatchedTransport => "Same-scale Wilson-to-patched transport"
  | .weakWindowSufficiencyCertificate => "Weak-window sufficiency certificate"
  | .uniqueFlowedContinuumState => "Unique flowed continuum state"
  | .tunedBoundedPositiveTimeBaseState => "Tuned bounded positive-time base state"
  | .exactDimensionQuotientIdentity => "Exact-dimension quotient identity"
  | .coefficientExtractionOnArbitraryQuotientBlocks =>
      "Coefficient extraction on arbitrary quotient blocks"
  | .oneShellTransportOnFiniteTruncations => "One-shell transport on finite truncations"
  | .finiteTruncationInverseControl => "Finite-truncation inverse control"
  | .finiteTruncationSFTERemainderPackage => "Finite-truncation SFTE/remainder package"
  | .finiteMixedBoundedFamilyPackaging => "Finite mixed bounded-family packaging"
  | .firstMixedCorrelatorClosureAtFiniteCap =>
      "First mixed-correlator closure at finite cap"
  | .finiteCapSharpLocalExtension => "Finite-cap sharp-local extension"
  | .passageToFullSharpLocalInductiveUnion =>
      "Passage to the full sharp-local inductive union"
  | .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =>
      "Bounded-base cyclicity in the reconstructed sharp-local Hilbert space"
  | .boundedWilsonDyadicOSLimitTheorem => "Bounded Wilson/dyadic OS limit theorem"
  | .continuumTimeOSUpgradeOfBoundedBaseState =>
      "Continuum-time OS upgrade of the bounded base state"
  | .densityOfBoundedBaseAlgebra => "Density of the bounded base algebra"
  | .graphCoreApproximationAtQE3Seam => "Graph-core approximation at the QE3 seam"
  | .continuumVacuumGapTransport => "Continuum vacuum-gap transport"
  | .continuumSharpLocalVacuumGap => "Continuum sharp-local vacuum gap"
  | .euclideanOSDossierOnFullSharpLocalAlgebra =>
      "Euclidean OS dossier on the full sharp-local algebra"
  | .wightmanHaagKastlerReconstruction => "Wightman--Haag--Kastler reconstruction"
  | .fieldCorrespondence => "Field correspondence"
  | .minkowskiHamiltonianInheritsGap => "Minkowski Hamiltonian inherits the gap"
  | .nonTrivialityWitness => "Non-triviality witness"
  | .faithfulWilsonUniversalityHypotheses => "Faithful-Wilson universality hypotheses"
  | .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory =>
      "Qualitative faithful-Wilson universality of the continuum local theory"
  | .quantitativeLedgerRemainsRhoIndexed => "Quantitative ledger remains rho-indexed"
  | .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =>
      "Exact local-net endpoint and exclusion of extended-support sector data"
  | .groupOnlyRestatementOfEndpointTheorem =>
      "Group-only restatement of the endpoint theorem"

def ym_kernel_entry_to_verbatim_theorem? (k : YMKernelEntry) :
    Option YMVerbatimTheoremEntry :=
  match k with
  | .kernelMainTheorem => none
  | .tenPacketProofKernel => none
  | .compactSimpleA1UltravioletGate => some .compactSimpleA1UltravioletGate
  | .publicGroupScopeExport => some .publicGroupScopeExport
  | .oneShotEntranceAtBoundedPhysicalScale => some .oneShotEntranceAtBoundedPhysicalScale
  | .tunedFullFixedLatticeOSGap => some .tunedFullFixedLatticeOSGap
  | .sameScaleWilsonToPatchedTransport => some .sameScaleWilsonToPatchedTransport
  | .weakWindowSufficiencyCertificate => some .weakWindowSufficiencyCertificate
  | .uniqueFlowedContinuumState => some .uniqueFlowedContinuumState
  | .tunedBoundedPositiveTimeBaseState => some .tunedBoundedPositiveTimeBaseState
  | .exactDimensionQuotientIdentity => some .exactDimensionQuotientIdentity
  | .coefficientExtractionOnArbitraryQuotientBlocks =>
      some .coefficientExtractionOnArbitraryQuotientBlocks
  | .oneShellTransportOnFiniteTruncations => some .oneShellTransportOnFiniteTruncations
  | .finiteTruncationInverseControl => some .finiteTruncationInverseControl
  | .finiteTruncationSFTERemainderPackage => some .finiteTruncationSFTERemainderPackage
  | .finiteMixedBoundedFamilyPackaging => some .finiteMixedBoundedFamilyPackaging
  | .firstMixedCorrelatorClosureAtFiniteCap => some .firstMixedCorrelatorClosureAtFiniteCap
  | .finiteCapSharpLocalExtension => some .finiteCapSharpLocalExtension
  | .passageToFullSharpLocalInductiveUnion => some .passageToFullSharpLocalInductiveUnion
  | .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =>
      some .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace
  | .boundedWilsonDyadicOSLimitTheorem => some .boundedWilsonDyadicOSLimitTheorem
  | .continuumTimeOSUpgradeOfBoundedBaseState => some .continuumTimeOSUpgradeOfBoundedBaseState
  | .densityOfBoundedBaseAlgebra => some .densityOfBoundedBaseAlgebra
  | .graphCoreApproximationAtQE3Seam => some .graphCoreApproximationAtQE3Seam
  | .continuumVacuumGapTransport => some .continuumVacuumGapTransport
  | .continuumSharpLocalVacuumGap => some .continuumSharpLocalVacuumGap
  | .euclideanOSDossierOnFullSharpLocalAlgebra => some .euclideanOSDossierOnFullSharpLocalAlgebra
  | .wightmanHaagKastlerReconstruction => some .wightmanHaagKastlerReconstruction
  | .fieldCorrespondence => some .fieldCorrespondence
  | .minkowskiHamiltonianInheritsGap => some .minkowskiHamiltonianInheritsGap
  | .nonTrivialityWitness => some .nonTrivialityWitness
  | .faithfulWilsonUniversalityHypotheses => some .faithfulWilsonUniversalityHypotheses
  | .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory =>
      some .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory
  | .quantitativeLedgerRemainsRhoIndexed => some .quantitativeLedgerRemainsRhoIndexed
  | .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =>
      some .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData
  | .groupOnlyRestatementOfEndpointTheorem => some .groupOnlyRestatementOfEndpointTheorem

def ym_kernel_entry_is_extracted_live_node (k : YMKernelEntry) : Prop :=
  match ym_kernel_entry_to_verbatim_theorem? k with
  | some _ => True
  | none => False

def ym_kernel_entry_is_kernel_only_packaging (k : YMKernelEntry) : Prop :=
  k = .kernelMainTheorem \/ k = .tenPacketProofKernel

def ym_kernel_entry_claim_kind (k : YMKernelEntry) : YMClaimSupportKind :=
  match ym_kernel_entry_to_verbatim_theorem? k with
  | some t => ym_claim_support_kind (ym_verbatim_theorem_to_claim t)
  | none => .auditExtraction

theorem YangMillsKernelPackagingEntriesStatement :
  ym_kernel_entry_is_kernel_only_packaging .kernelMainTheorem /\
  ym_kernel_entry_is_kernel_only_packaging .tenPacketProofKernel := by
  exact And.intro (Or.inl rfl) (Or.inr rfl)

theorem YangMillsKernelLiveExtractionExamplesStatement :
  ym_kernel_entry_to_verbatim_theorem? .compactSimpleA1UltravioletGate =
      some .compactSimpleA1UltravioletGate /\
    ym_kernel_entry_to_verbatim_theorem? .finiteCapSharpLocalExtension =
      some .finiteCapSharpLocalExtension /\
    ym_kernel_entry_to_verbatim_theorem? .continuumVacuumGapTransport =
      some .continuumVacuumGapTransport /\
    ym_kernel_entry_to_verbatim_theorem? .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
      some .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsKernelLiveEntriesStayOnLiveClaimSideStatement :
  forall k : YMKernelEntry,
    ym_kernel_entry_is_extracted_live_node k ->
      ym_kernel_entry_claim_kind k = .liveProofBurden := by
  intro k hk
  cases k <;> try cases hk <;> rfl

theorem YangMillsKernelAddsNoNewMathematicsStatement :
  ym_kernel_adds_new_mathematics = False /\
  ym_root_role .proofKernel = .expertAuditKernel := by
  exact And.intro rfl rfl

end MaleyLean
