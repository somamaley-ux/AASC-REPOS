import MaleyLean.Papers.YangMills.Kernel.ConstructiveCore
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register

namespace MaleyLean

/--
Additive crosswalk register for the stronger Part C witness bundle exported by
the enriched constructive core.
-/
inductive YMConstructiveWitnessOutput
  | finiteCapWindowWitness
  | finiteCapExtensionWitness
  | finiteCapPositiveBridgeWitness
  | boundedStateCompatibilityWitness
  | inductiveUnionWitness
  | boundedBaseExtensionWitness
  deriving DecidableEq, Repr

def ym_constructive_witness_primary_packet : YMConstructiveWitnessOutput -> YMPacket
  | .finiteCapWindowWitness => .packet5FiniteTruncation
  | .finiteCapExtensionWitness => .packet6FiniteCapClosure
  | .finiteCapPositiveBridgeWitness => .packet6FiniteCapClosure
  | .boundedStateCompatibilityWitness => .packet6FiniteCapClosure
  | .inductiveUnionWitness => .packet6FiniteCapClosure
  | .boundedBaseExtensionWitness => .packet6FiniteCapClosure

def ym_constructive_witness_primary_owner : YMConstructiveWitnessOutput -> YMCompanion
  | .finiteCapWindowWitness => .laneASharpLocalConstruction
  | .finiteCapExtensionWitness => .laneASharpLocalConstruction
  | .finiteCapPositiveBridgeWitness => .laneASharpLocalConstruction
  | .boundedStateCompatibilityWitness => .laneASharpLocalConstruction
  | .inductiveUnionWitness => .laneASharpLocalConstruction
  | .boundedBaseExtensionWitness => .laneASharpLocalConstruction

def ym_constructive_witness_source_labels : YMConstructiveWitnessOutput -> List String
  | .finiteCapWindowWitness => ["5.74"]
  | .finiteCapExtensionWitness => ["5.74A"]
  | .finiteCapPositiveBridgeWitness => ["5.74A"]
  | .boundedStateCompatibilityWitness => ["5.75"]
  | .inductiveUnionWitness => ["5.76"]
  | .boundedBaseExtensionWitness => ["5.76"]

theorem YangMillsConstructiveWitnessPacketStatement :
  ym_constructive_witness_primary_packet .finiteCapWindowWitness = .packet5FiniteTruncation /\
  ym_constructive_witness_primary_packet .finiteCapExtensionWitness = .packet6FiniteCapClosure /\
  ym_constructive_witness_primary_packet .boundedStateCompatibilityWitness = .packet6FiniteCapClosure /\
  ym_constructive_witness_primary_packet .boundedBaseExtensionWitness = .packet6FiniteCapClosure := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsConstructiveWitnessOwnerStatement :
  ym_constructive_witness_primary_owner .finiteCapWindowWitness = .laneASharpLocalConstruction /\
  ym_constructive_witness_primary_owner .finiteCapPositiveBridgeWitness = .laneASharpLocalConstruction /\
  ym_constructive_witness_primary_owner .boundedBaseExtensionWitness = .laneASharpLocalConstruction := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsConstructiveWitnessSourceLabelStatement :
  ym_constructive_witness_source_labels .finiteCapWindowWitness = ["5.74"] /\
  ym_constructive_witness_source_labels .finiteCapExtensionWitness = ["5.74A"] /\
  ym_constructive_witness_source_labels .finiteCapPositiveBridgeWitness = ["5.74A"] /\
  ym_constructive_witness_source_labels .boundedStateCompatibilityWitness = ["5.75"] /\
  ym_constructive_witness_source_labels .inductiveUnionWitness = ["5.76"] /\
  ym_constructive_witness_source_labels .boundedBaseExtensionWitness = ["5.76"] := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl rfl

theorem YangMillsConstructiveWitnessCrosswalkExamplesStatement :
  ym_constructive_witness_primary_packet .finiteCapWindowWitness = .packet5FiniteTruncation /\
  ym_constructive_witness_primary_packet .finiteCapPositiveBridgeWitness = .packet6FiniteCapClosure /\
  ym_constructive_witness_primary_owner .boundedBaseExtensionWitness = .laneASharpLocalConstruction /\
  ym_constructive_witness_source_labels .finiteCapWindowWitness = ["5.74"] /\
  ym_constructive_witness_source_labels .finiteCapPositiveBridgeWitness = ["5.74A"] /\
  ym_constructive_witness_source_labels .boundedStateCompatibilityWitness = ["5.75"] /\
  ym_constructive_witness_source_labels .boundedBaseExtensionWitness = ["5.76"] := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl rfl

end MaleyLean
