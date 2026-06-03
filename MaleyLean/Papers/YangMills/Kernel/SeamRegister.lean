import MaleyLean.Papers.YangMills.Kernel.PacketRegister

namespace MaleyLean

/--
Decisive seam nodes singled out by the hardened Yang--Mills proof kernel.

These are the theorem-facing seams the kernel explicitly tells an expert to
attack. They sit between packets rather than replacing packet ownership.
-/
inductive YMSeamNode
  | mixedCorrelatorClosureNode
  | finiteCapPositiveUnitalBridge
  | finiteCapSharpLocalOSNode
  | boundedStateRestrictionCompatibilityNode
  | inductiveUnionPassageNode
  | boundedBaseCyclicityNode
  | graphCoreHandoffNode
  | continuumGapTransportNode
  | weakWindowCertificateNode
  deriving DecidableEq, Repr

def ym_seam_title (s : YMSeamNode) : String :=
  match s with
  | .mixedCorrelatorClosureNode =>
      "Sole mixed-channel closure node at finite cap"
  | .finiteCapPositiveUnitalBridge =>
      "Theorem-facing positive/unital finite-cap bridge"
  | .finiteCapSharpLocalOSNode =>
      "Finite-cap sharp-local OS structure"
  | .boundedStateRestrictionCompatibilityNode =>
      "Bounded-state restriction compatibility node"
  | .inductiveUnionPassageNode =>
      "Passage to the full sharp-local inductive union"
  | .boundedBaseCyclicityNode =>
      "First bounded-base cyclicity export"
  | .graphCoreHandoffNode =>
      "Final QE3 density/graph-core handoff"
  | .continuumGapTransportNode =>
      "Unique continuum vacuum-gap transport node"
  | .weakWindowCertificateNode =>
      "Sole live weak-window sufficiency certificate"

def ym_seam_to_kernel_entry? (s : YMSeamNode) : Option YMKernelEntry :=
  match s with
  | .mixedCorrelatorClosureNode => some .firstMixedCorrelatorClosureAtFiniteCap
  | .finiteCapPositiveUnitalBridge => none
  | .finiteCapSharpLocalOSNode => some .finiteCapSharpLocalExtension
  | .boundedStateRestrictionCompatibilityNode => none
  | .inductiveUnionPassageNode => some .passageToFullSharpLocalInductiveUnion
  | .boundedBaseCyclicityNode =>
      some .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace
  | .graphCoreHandoffNode => some .graphCoreApproximationAtQE3Seam
  | .continuumGapTransportNode => some .continuumVacuumGapTransport
  | .weakWindowCertificateNode => some .weakWindowSufficiencyCertificate

def ym_seam_source_packet (s : YMSeamNode) : YMPacket :=
  match s with
  | .mixedCorrelatorClosureNode => .packet6FiniteCapClosure
  | .finiteCapPositiveUnitalBridge => .packet6FiniteCapClosure
  | .finiteCapSharpLocalOSNode => .packet6FiniteCapClosure
  | .boundedStateRestrictionCompatibilityNode => .packet6FiniteCapClosure
  | .inductiveUnionPassageNode => .packet6FiniteCapClosure
  | .boundedBaseCyclicityNode => .packet7Cyclicity
  | .graphCoreHandoffNode => .packet8QE3Transport
  | .continuumGapTransportNode => .packet8QE3Transport
  | .weakWindowCertificateNode => .auxiliaryWeakWindowCertificate

def ym_seam_target_packet (s : YMSeamNode) : YMPacket :=
  match s with
  | .mixedCorrelatorClosureNode => .packet6FiniteCapClosure
  | .finiteCapPositiveUnitalBridge => .packet6FiniteCapClosure
  | .finiteCapSharpLocalOSNode => .packet8QE3Transport
  | .boundedStateRestrictionCompatibilityNode => .packet8QE3Transport
  | .inductiveUnionPassageNode => .packet8QE3Transport
  | .boundedBaseCyclicityNode => .packet8QE3Transport
  | .graphCoreHandoffNode => .packet8QE3Transport
  | .continuumGapTransportNode => .packet9Reconstruction
  | .weakWindowCertificateNode => .packet8QE3Transport

def ym_seam_is_kernel_only_bridge (s : YMSeamNode) : Prop :=
  s = .finiteCapPositiveUnitalBridge \/
  s = .boundedStateRestrictionCompatibilityNode

def ym_seam_is_live_theorem_node (s : YMSeamNode) : Prop :=
  match ym_seam_to_kernel_entry? s with
  | some _ => True
  | none => False

theorem YangMillsSeamBridgeNodesStatement :
  ym_seam_is_kernel_only_bridge .finiteCapPositiveUnitalBridge /\
  ym_seam_is_kernel_only_bridge .boundedStateRestrictionCompatibilityNode := by
  exact And.intro (Or.inl rfl) (Or.inr rfl)

theorem YangMillsSeamPacketAlignmentStatement :
  ym_seam_source_packet .finiteCapSharpLocalOSNode = .packet6FiniteCapClosure /\
  ym_seam_target_packet .finiteCapSharpLocalOSNode = .packet8QE3Transport /\
  ym_seam_source_packet .boundedBaseCyclicityNode = .packet7Cyclicity /\
  ym_seam_target_packet .boundedBaseCyclicityNode = .packet8QE3Transport /\
  ym_seam_source_packet .graphCoreHandoffNode = .packet8QE3Transport /\
  ym_seam_target_packet .continuumGapTransportNode = .packet9Reconstruction /\
  ym_seam_source_packet .weakWindowCertificateNode = .auxiliaryWeakWindowCertificate /\
  ym_seam_target_packet .weakWindowCertificateNode = .packet8QE3Transport := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

theorem YangMillsSeamLiveNodeExamplesStatement :
  ym_seam_to_kernel_entry? .mixedCorrelatorClosureNode =
      some .firstMixedCorrelatorClosureAtFiniteCap /\
  ym_seam_to_kernel_entry? .finiteCapSharpLocalOSNode =
      some .finiteCapSharpLocalExtension /\
  ym_seam_to_kernel_entry? .graphCoreHandoffNode =
      some .graphCoreApproximationAtQE3Seam /\
  ym_seam_to_kernel_entry? .continuumGapTransportNode =
      some .continuumVacuumGapTransport /\
  ym_seam_to_kernel_entry? .weakWindowCertificateNode =
      some .weakWindowSufficiencyCertificate := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

theorem YangMillsSeamLiveNodesStayOnLiveClaimSideStatement :
  forall s : YMSeamNode,
    ym_seam_is_live_theorem_node s ->
      match ym_seam_to_kernel_entry? s with
      | some k => ym_kernel_entry_claim_kind k = .liveProofBurden
      | none => False := by
  intro s hs
  cases s <;> try cases hs <;> rfl

end MaleyLean
