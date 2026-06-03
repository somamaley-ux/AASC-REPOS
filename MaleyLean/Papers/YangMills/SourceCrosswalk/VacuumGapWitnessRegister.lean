import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register

namespace MaleyLean

/--
Additive crosswalk register for the stronger Part D witness bundle exported by
the enriched vacuum-gap core.
-/
inductive YMVacuumGapWitnessOutput
  | osTransportWitness
  | positiveGapWitness
  | transportOriginWitness
  | minkowskiGapReadinessWitness
  deriving DecidableEq, Repr

def ym_vacuum_gap_witness_primary_packet : YMVacuumGapWitnessOutput -> YMPacket
  | .osTransportWitness => .packet8QE3Transport
  | .positiveGapWitness => .packet8QE3Transport
  | .transportOriginWitness => .packet9Reconstruction
  | .minkowskiGapReadinessWitness => .packet9Reconstruction

def ym_vacuum_gap_witness_primary_owner : YMVacuumGapWitnessOutput -> YMCompanion
  | .osTransportWitness => .ultravioletGateAndRoute1
  | .positiveGapWitness => .ultravioletGateAndRoute1
  | .transportOriginWitness => .reconstructionAndUniversality
  | .minkowskiGapReadinessWitness => .reconstructionAndUniversality

def ym_vacuum_gap_witness_source_labels : YMVacuumGapWitnessOutput -> List String
  | .osTransportWitness => ["F.216"]
  | .positiveGapWitness => ["F.216", "F.5"]
  | .transportOriginWitness => ["M.5"]
  | .minkowskiGapReadinessWitness => ["M.5"]

theorem YangMillsVacuumGapWitnessPacketStatement :
  ym_vacuum_gap_witness_primary_packet .osTransportWitness = .packet8QE3Transport /\
  ym_vacuum_gap_witness_primary_packet .positiveGapWitness = .packet8QE3Transport /\
  ym_vacuum_gap_witness_primary_packet .transportOriginWitness = .packet9Reconstruction /\
  ym_vacuum_gap_witness_primary_packet .minkowskiGapReadinessWitness = .packet9Reconstruction := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsVacuumGapWitnessOwnerStatement :
  ym_vacuum_gap_witness_primary_owner .osTransportWitness = .ultravioletGateAndRoute1 /\
  ym_vacuum_gap_witness_primary_owner .positiveGapWitness = .ultravioletGateAndRoute1 /\
  ym_vacuum_gap_witness_primary_owner .transportOriginWitness = .reconstructionAndUniversality /\
  ym_vacuum_gap_witness_primary_owner .minkowskiGapReadinessWitness = .reconstructionAndUniversality := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsVacuumGapWitnessSourceLabelStatement :
  ym_vacuum_gap_witness_source_labels .osTransportWitness = ["F.216"] /\
  ym_vacuum_gap_witness_source_labels .positiveGapWitness = ["F.216", "F.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  ym_vacuum_gap_witness_source_labels .minkowskiGapReadinessWitness = ["M.5"] := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsVacuumGapWitnessCrosswalkExamplesStatement :
  ym_vacuum_gap_witness_primary_packet .osTransportWitness = .packet8QE3Transport /\
  ym_vacuum_gap_witness_primary_packet .transportOriginWitness = .packet9Reconstruction /\
  ym_vacuum_gap_witness_primary_owner .positiveGapWitness = .ultravioletGateAndRoute1 /\
  ym_vacuum_gap_witness_primary_owner .minkowskiGapReadinessWitness = .reconstructionAndUniversality /\
  ym_vacuum_gap_witness_source_labels .osTransportWitness = ["F.216"] /\
  ym_vacuum_gap_witness_source_labels .positiveGapWitness = ["F.216", "F.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl rfl

end MaleyLean
