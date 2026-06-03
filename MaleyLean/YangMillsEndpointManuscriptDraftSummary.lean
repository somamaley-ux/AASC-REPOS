import MaleyLean.Papers.YangMills.Surface.EndpointManuscriptDraftSummary

namespace MaleyLean

theorem YangMillsEndpointManuscriptDraftSummaryTopExportStatement
  (I : YMClosedInstantiatedManuscript) :
  let RE := I.blueprint.objects.RE
  Nonempty (YMEndpointRelationalInterface RE) /\
  Nonempty (YMEndpointCorrelationLawPackage RE) /\
  ym_Omega_loc I = I.chosen_sites.endpoint.vac /\
  ym_phi_star I = I.chosen_sites.endpoint.testFn /\
  ym_E_ren I = I.chosen_sites.endpoint.field /\
  ym_hgap_statement I := by
  exact YangMillsEndpointManuscriptDraftSummaryStatement I

end MaleyLean
