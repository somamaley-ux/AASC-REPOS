import MaleyLean.Papers.YangMills.SourceCrosswalk.VacuumGapWitnessRegister

namespace MaleyLean

theorem YangMillsVacuumGapWitnessCrosswalkStatement :
  ym_vacuum_gap_witness_primary_packet .osTransportWitness = .packet8QE3Transport /\
  ym_vacuum_gap_witness_primary_packet .transportOriginWitness = .packet9Reconstruction /\
  ym_vacuum_gap_witness_primary_owner .positiveGapWitness = .ultravioletGateAndRoute1 /\
  ym_vacuum_gap_witness_primary_owner .minkowskiGapReadinessWitness = .reconstructionAndUniversality /\
  ym_vacuum_gap_witness_source_labels .osTransportWitness = ["F.216"] /\
  ym_vacuum_gap_witness_source_labels .positiveGapWitness = ["F.216", "F.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] := by
  exact YangMillsVacuumGapWitnessCrosswalkExamplesStatement

end MaleyLean
