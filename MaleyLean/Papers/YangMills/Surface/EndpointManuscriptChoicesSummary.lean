import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptChoices

namespace MaleyLean

theorem YangMillsEndpointManuscriptChoicesSummaryStatement
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C : YMEndpointManuscriptChoices O.RE W.hE W.hP) :
  let K := YangMillsEndpointChosenSiteDataOfChoices W C
  K.vac = C.Omega_loc /\
  K.testFn = C.phi_star /\
  K.field = C.E_ren := by
  exact YangMillsEndpointChoicesStatement W C

theorem YangMillsEndpointManuscriptChoicesBuilderSummaryStatement
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (Omega_loc :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).vacuum_vector)
    (phi_star :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).test_function_space)
    (E_ren :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).field_family) :
  let C := YangMillsEndpointManuscriptChoicesData Omega_loc phi_star E_ren
  C.Omega_loc = Omega_loc /\
  C.phi_star = phi_star /\
  C.E_ren = E_ren := by
  exact YangMillsEndpointManuscriptChoicesBuilderStatement Omega_loc phi_star E_ren

theorem YangMillsEndpointChosenInhabitantsSummaryStatement
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (C : YMEndpointManuscriptChoices RE hE hP) :
  ym_endpoint_Omega_loc_of C = C.Omega_loc /\
  ym_endpoint_phi_star_of C = C.phi_star /\
  ym_endpoint_E_ren_of C = C.E_ren := by
  exact YangMillsEndpointChosenInhabitantsStatement C

end MaleyLean
