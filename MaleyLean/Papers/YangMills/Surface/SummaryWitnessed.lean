import MaleyLean.Papers.YangMills.Surface.Summary
import MaleyLean.Papers.YangMills.SourceCrosswalk.WitnessRegister
import MaleyLean.Papers.YangMills.Surface.WitnessHeartSummary

namespace MaleyLean

/--
Additive witnessed summary layer for the hardened Yang--Mills suite.

This theorem records the witness-crosswalk facts that extend the existing
top-level manuscript-facing summary.
-/
theorem YangMillsPaperSurfaceSummaryWitnessedStatement :
  (ym_witness_primary_packet .finiteCapPositiveBridgeWitness = .packet6FiniteCapClosure /\
    ym_witness_primary_packet .positiveGapWitness = .packet8QE3Transport /\
    ym_witness_primary_packet .wightmanFieldsWitness = .packet9Reconstruction /\
    ym_witness_primary_packet .exactEndpointWitness = .packet10Endpoint /\
    ym_witness_primary_owner .finiteCapPositiveBridgeWitness = .laneASharpLocalConstruction /\
    ym_witness_primary_owner .positiveGapWitness = .ultravioletGateAndRoute1 /\
    ym_witness_primary_owner .exactEndpointWitness = .reconstructionAndUniversality /\
    ym_witness_source_labels .finiteCapPositiveBridgeWitness = ["5.74A"] /\
    ym_witness_source_labels .positiveGapWitness = ["F.216", "F.5"] /\
    ym_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
    ym_witness_source_labels .exactEndpointWitness = ["O.5"]) /\
  ((ym_constructive_witness_primary_packet .finiteCapWindowWitness = .packet5FiniteTruncation /\
      ym_constructive_witness_primary_packet .finiteCapPositiveBridgeWitness = .packet6FiniteCapClosure /\
      ym_constructive_witness_primary_owner .boundedBaseExtensionWitness = .laneASharpLocalConstruction /\
      ym_constructive_witness_source_labels .boundedBaseExtensionWitness = ["5.76"]) /\
    (ym_vacuum_gap_witness_primary_packet .osTransportWitness = .packet8QE3Transport /\
      ym_vacuum_gap_witness_primary_packet .transportOriginWitness = .packet9Reconstruction /\
      ym_vacuum_gap_witness_primary_owner .positiveGapWitness = .ultravioletGateAndRoute1 /\
      ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"]) /\
    (ym_endpoint_witness_primary_packet .reconstructionReadinessWitness = .packet9Reconstruction /\
      ym_endpoint_witness_primary_packet .exactEndpointWitness = .packet10Endpoint /\
      ym_endpoint_witness_primary_owner .wightmanFieldsWitness = .reconstructionAndUniversality /\
      ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"])) := by
  exact And.intro
      (And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <|
        And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <|
          And.intro rfl <| And.intro rfl rfl)
      YangMillsWitnessHeartSummaryStatement

end MaleyLean
