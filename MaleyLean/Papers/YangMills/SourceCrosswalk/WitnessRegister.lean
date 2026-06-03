import MaleyLean.Papers.YangMills.Kernel.NamedOutputsAssembly
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register

namespace MaleyLean

/--
Crosswalk register for the named abstract witnesses exported by the enriched
load-bearing Yang--Mills proof spine.
-/
inductive YMWitnessOutput
  | finiteCapPositiveBridgeWitness
  | sharpLocalBoundedBaseExtensionWitness
  | positiveGapWitness
  | minkowskiGapReadinessWitness
  | wightmanFieldsWitness
  | exactEndpointWitness
  deriving DecidableEq, Repr

def ym_witness_primary_packet : YMWitnessOutput -> YMPacket
  | .finiteCapPositiveBridgeWitness => .packet6FiniteCapClosure
  | .sharpLocalBoundedBaseExtensionWitness => .packet6FiniteCapClosure
  | .positiveGapWitness => .packet8QE3Transport
  | .minkowskiGapReadinessWitness => .packet9Reconstruction
  | .wightmanFieldsWitness => .packet9Reconstruction
  | .exactEndpointWitness => .packet10Endpoint

def ym_witness_primary_owner : YMWitnessOutput -> YMCompanion
  | .finiteCapPositiveBridgeWitness => .laneASharpLocalConstruction
  | .sharpLocalBoundedBaseExtensionWitness => .laneASharpLocalConstruction
  | .positiveGapWitness => .ultravioletGateAndRoute1
  | .minkowskiGapReadinessWitness => .reconstructionAndUniversality
  | .wightmanFieldsWitness => .reconstructionAndUniversality
  | .exactEndpointWitness => .reconstructionAndUniversality

def ym_witness_source_labels : YMWitnessOutput -> List String
  | .finiteCapPositiveBridgeWitness => ["5.74A"]
  | .sharpLocalBoundedBaseExtensionWitness => ["5.76"]
  | .positiveGapWitness => ["F.216", "F.5"]
  | .minkowskiGapReadinessWitness => ["M.5"]
  | .wightmanFieldsWitness => ["M.3", "M.4"]
  | .exactEndpointWitness => ["O.5"]

def ym_witness_packet_labels_follow_crosswalk (w : YMWitnessOutput) : Prop :=
  ∀ s ∈ ym_witness_source_labels w, s ∈ ym_packet_source_labels (ym_witness_primary_packet w)

theorem YangMillsWitnessPacketOwnershipStatement :
  ym_witness_primary_packet .finiteCapPositiveBridgeWitness = .packet6FiniteCapClosure /\
  ym_witness_primary_packet .positiveGapWitness = .packet8QE3Transport /\
  ym_witness_primary_packet .wightmanFieldsWitness = .packet9Reconstruction /\
  ym_witness_primary_packet .exactEndpointWitness = .packet10Endpoint := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsWitnessOwnerStatement :
  ym_witness_primary_owner .finiteCapPositiveBridgeWitness = .laneASharpLocalConstruction /\
  ym_witness_primary_owner .positiveGapWitness = .ultravioletGateAndRoute1 /\
  ym_witness_primary_owner .minkowskiGapReadinessWitness = .reconstructionAndUniversality /\
  ym_witness_primary_owner .exactEndpointWitness = .reconstructionAndUniversality := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsWitnessSourceLabelStatement :
  ym_witness_source_labels .finiteCapPositiveBridgeWitness = ["5.74A"] /\
  ym_witness_source_labels .sharpLocalBoundedBaseExtensionWitness = ["5.76"] /\
  ym_witness_source_labels .positiveGapWitness = ["F.216", "F.5"] /\
  ym_witness_source_labels .minkowskiGapReadinessWitness = ["M.5"] /\
  ym_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
  ym_witness_source_labels .exactEndpointWitness = ["O.5"] := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl rfl

theorem YangMillsWitnessPacketCrosswalkStatement :
  ym_witness_packet_labels_follow_crosswalk .finiteCapPositiveBridgeWitness /\
  ym_witness_packet_labels_follow_crosswalk .positiveGapWitness /\
  ym_witness_packet_labels_follow_crosswalk .minkowskiGapReadinessWitness /\
  ym_witness_packet_labels_follow_crosswalk .wightmanFieldsWitness /\
  ym_witness_packet_labels_follow_crosswalk .exactEndpointWitness := by
  refine And.intro ?_ <| And.intro ?_ <| And.intro ?_ <| And.intro ?_ ?_
  · intro s hs
    have hs' : s = "5.74A" := List.mem_singleton.mp hs
    rcases hs' with rfl
    exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · intro s hs
    have hs' : s = "F.216" ∨ s = "F.5" := by
      rcases List.mem_cons.mp hs with h | hs'
      · exact Or.inl h
      · exact Or.inr (List.mem_singleton.mp hs')
    rcases hs' with rfl | rfl
    · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
        Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
    · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
        Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
        Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · intro s hs
    have hs' : s = "M.5" := List.mem_singleton.mp hs
    rcases hs' with rfl
    exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · intro s hs
    have hs' : s = "M.3" ∨ s = "M.4" := by
      rcases List.mem_cons.mp hs with h | hs'
      · exact Or.inl h
      · exact Or.inr (List.mem_singleton.mp hs')
    rcases hs' with rfl | rfl
    · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
    · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
        Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · intro s hs
    have hs' : s = "O.5" := List.mem_singleton.mp hs
    rcases hs' with rfl
    exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inl rfl

theorem YangMillsWitnessPacketCrosswalkConstructiveStatement :
  ym_witness_primary_packet .finiteCapPositiveBridgeWitness = .packet6FiniteCapClosure /\
  ym_witness_primary_packet .positiveGapWitness = .packet8QE3Transport /\
  ym_witness_primary_packet .wightmanFieldsWitness = .packet9Reconstruction /\
  ym_witness_primary_packet .exactEndpointWitness = .packet10Endpoint /\
  "5.74A" ∈ ym_packet_source_labels .packet6FiniteCapClosure /\
  "F.216" ∈ ym_packet_source_labels .packet8QE3Transport /\
  "F.5" ∈ ym_packet_source_labels .packet8QE3Transport /\
  "M.5" ∈ ym_packet_source_labels .packet9Reconstruction /\
  "M.3" ∈ ym_packet_source_labels .packet9Reconstruction /\
  "M.4" ∈ ym_packet_source_labels .packet9Reconstruction /\
  "O.5" ∈ ym_packet_source_labels .packet10Endpoint := by
  refine And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <|
    And.intro ?_ <| And.intro ?_ <| And.intro ?_ <| And.intro ?_ <| And.intro ?_ <| And.intro ?_ ?_
  · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inl rfl
  · exact List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <| Or.inr <| List.mem_cons.2 <|
      Or.inr <| List.mem_cons.2 <| Or.inl rfl

theorem YangMillsWitnessCrosswalkExamplesStatement :
  ym_witness_primary_packet .finiteCapPositiveBridgeWitness = .packet6FiniteCapClosure /\
  ym_witness_primary_packet .positiveGapWitness = .packet8QE3Transport /\
  ym_witness_primary_packet .wightmanFieldsWitness = .packet9Reconstruction /\
  ym_witness_primary_packet .exactEndpointWitness = .packet10Endpoint /\
  ym_witness_primary_owner .finiteCapPositiveBridgeWitness = .laneASharpLocalConstruction /\
  ym_witness_primary_owner .positiveGapWitness = .ultravioletGateAndRoute1 /\
  ym_witness_primary_owner .exactEndpointWitness = .reconstructionAndUniversality /\
  ym_witness_source_labels .finiteCapPositiveBridgeWitness = ["5.74A"] /\
  ym_witness_source_labels .positiveGapWitness = ["F.216", "F.5"] /\
  ym_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
  ym_witness_source_labels .exactEndpointWitness = ["O.5"] := by
  refine And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <|
    And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

end MaleyLean
