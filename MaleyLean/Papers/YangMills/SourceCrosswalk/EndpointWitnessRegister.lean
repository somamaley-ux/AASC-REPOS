import MaleyLean.Papers.YangMills.Kernel.EndpointCore
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register

namespace MaleyLean

/--
Additive crosswalk register for the endpoint-side witness bundle exported by
the enriched reconstruction and endpoint core.
-/
inductive YMEndpointWitnessOutput
  | reconstructionReadinessWitness
  | wightmanFieldsWitness
  | vacuumVectorWitness
  | exactEndpointWitness
  deriving DecidableEq, Repr

def ym_endpoint_witness_primary_packet : YMEndpointWitnessOutput -> YMPacket
  | .reconstructionReadinessWitness => .packet9Reconstruction
  | .wightmanFieldsWitness => .packet9Reconstruction
  | .vacuumVectorWitness => .packet9Reconstruction
  | .exactEndpointWitness => .packet10Endpoint

def ym_endpoint_witness_primary_owner : YMEndpointWitnessOutput -> YMCompanion
  | .reconstructionReadinessWitness => .reconstructionAndUniversality
  | .wightmanFieldsWitness => .reconstructionAndUniversality
  | .vacuumVectorWitness => .reconstructionAndUniversality
  | .exactEndpointWitness => .reconstructionAndUniversality

def ym_endpoint_witness_source_labels : YMEndpointWitnessOutput -> List String
  | .reconstructionReadinessWitness => ["M.3"]
  | .wightmanFieldsWitness => ["M.3", "M.4"]
  | .vacuumVectorWitness => ["M.4"]
  | .exactEndpointWitness => ["O.5"]

theorem YangMillsEndpointWitnessPacketStatement :
  ym_endpoint_witness_primary_packet .reconstructionReadinessWitness = .packet9Reconstruction /\
  ym_endpoint_witness_primary_packet .wightmanFieldsWitness = .packet9Reconstruction /\
  ym_endpoint_witness_primary_packet .vacuumVectorWitness = .packet9Reconstruction /\
  ym_endpoint_witness_primary_packet .exactEndpointWitness = .packet10Endpoint := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsEndpointWitnessOwnerStatement :
  ym_endpoint_witness_primary_owner .reconstructionReadinessWitness = .reconstructionAndUniversality /\
  ym_endpoint_witness_primary_owner .wightmanFieldsWitness = .reconstructionAndUniversality /\
  ym_endpoint_witness_primary_owner .exactEndpointWitness = .reconstructionAndUniversality := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsEndpointWitnessSourceLabelStatement :
  ym_endpoint_witness_source_labels .reconstructionReadinessWitness = ["M.3"] /\
  ym_endpoint_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
  ym_endpoint_witness_source_labels .vacuumVectorWitness = ["M.4"] /\
  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsEndpointWitnessCrosswalkExamplesStatement :
  ym_endpoint_witness_primary_packet .reconstructionReadinessWitness = .packet9Reconstruction /\
  ym_endpoint_witness_primary_packet .exactEndpointWitness = .packet10Endpoint /\
  ym_endpoint_witness_primary_owner .wightmanFieldsWitness = .reconstructionAndUniversality /\
  ym_endpoint_witness_source_labels .reconstructionReadinessWitness = ["M.3"] /\
  ym_endpoint_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
  ym_endpoint_witness_source_labels .vacuumVectorWitness = ["M.4"] /\
  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl rfl

end MaleyLean
