import MaleyLean.Papers.YangMills.SourceCrosswalk.ConstructiveWitnessRegister
import MaleyLean.Papers.YangMills.SourceCrosswalk.EndpointWitnessRegister
import MaleyLean.Papers.YangMills.SourceCrosswalk.VacuumGapWitnessRegister

namespace MaleyLean

/--
Additive summary layer recording that the three theorem-heart witness bundles
are all anchored back to packets, companion owners, and source labels.
-/
theorem YangMillsWitnessHeartSummaryStatement :
  (ym_constructive_witness_primary_packet .finiteCapWindowWitness = .packet5FiniteTruncation /\
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
    ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"]) := by
  exact And.intro
      (And.intro rfl <| And.intro rfl <| And.intro rfl rfl)
    <| And.intro
      (And.intro rfl <| And.intro rfl <| And.intro rfl rfl)
      (And.intro rfl <| And.intro rfl <| And.intro rfl rfl)

end MaleyLean
