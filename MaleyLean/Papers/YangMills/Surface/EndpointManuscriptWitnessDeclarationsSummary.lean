import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptWitnessDeclarations

namespace MaleyLean

theorem YangMillsEndpointManuscriptWitnessDeclarationsSummaryStatement :
  ym_endpoint_manuscript_object.Omega_loc = Omega_loc /\
  ym_endpoint_manuscript_object.phi_star = phi_star /\
  ym_endpoint_manuscript_object.E_ren = E_ren := by
  exact ym_endpoint_manuscript_object_named_inhabitants

end MaleyLean
