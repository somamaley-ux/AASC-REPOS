import MaleyLean.Papers.YangMills.SourceCrosswalk.EndpointWitnessRegister

namespace MaleyLean

theorem YangMillsEndpointWitnessCrosswalkStatement :
  ym_endpoint_witness_primary_packet .reconstructionReadinessWitness = .packet9Reconstruction /\
  ym_endpoint_witness_primary_packet .exactEndpointWitness = .packet10Endpoint /\
  ym_endpoint_witness_primary_owner .wightmanFieldsWitness = .reconstructionAndUniversality /\
  ym_endpoint_witness_source_labels .reconstructionReadinessWitness = ["M.3"] /\
  ym_endpoint_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
  ym_endpoint_witness_source_labels .vacuumVectorWitness = ["M.4"] /\
  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] := by
  exact YangMillsEndpointWitnessCrosswalkExamplesStatement

end MaleyLean
