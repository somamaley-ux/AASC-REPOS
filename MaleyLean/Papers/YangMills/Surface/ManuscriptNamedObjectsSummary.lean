import MaleyLean.Papers.YangMills.Kernel.ManuscriptNamedObjects

namespace MaleyLean

theorem YangMillsManuscriptNamedObjectsSummaryStatement
  (I : YMClosedInstantiatedManuscript) :
  ym_DeltaMax I = I.chosen_sites.constructive.win /\
  ym_finite_cap_bridge I = I.chosen_sites.constructive.bridge /\
  ym_bounded_base_one I = I.chosen_sites.constructive.base /\
  ym_omega_bd I = I.chosen_sites.constructive.state /\
  ym_omega_sharp I = I.chosen_sites.constructive.unionData /\
  ym_transport I = I.chosen_sites.vacuum_gap.tm /\
  ym_H I = I.chosen_sites.vacuum_gap.obs /\
  ym_Hloc I = I.chosen_sites.vacuum_gap.rsec /\
  ym_corr I = I.chosen_sites.vacuum_gap.corr /\
  ym_gapf I = I.chosen_sites.vacuum_gap.gapf /\
  ym_hgap_statement I /\
  ym_endpoint_dossier I = I.blueprint.objects.RE.dossier /\
  ym_A_loc_omega_uren I = (ym_endpoint_bundle I).euclidean_input /\
  ym_endpoint_reflection_positive I = I.blueprint.objects.RE.dossier.reflection_positive /\
  ym_endpoint_os_data_complete I = I.blueprint.objects.RE.dossier.os_data_complete /\
  ym_endpoint_H_loc I = (ym_endpoint_bundle I).reconstructed_hilbert /\
  ym_Phi_P I = (ym_endpoint_bundle I).field_family /\
  ym_Schwartz_MinkowskiSpace I = (ym_endpoint_bundle I).test_function_space /\
  ym_operator_on_domain_H_loc I = (ym_endpoint_bundle I).smeared_field_operator /\
  ym_vacuum_Wightman_correlation_family I =
    (ym_endpoint_bundle I).vacuum_correlation_family /\
  ym_smear_field I = (ym_endpoint_bundle I).smear_field /\
  ym_evaluate_vacuum_correlation I =
    (ym_endpoint_bundle I).evaluate_vacuum_correlation /\
  ym_A_loc_G I = I.blueprint.objects.RE.endpoint_object.local_net /\
  ym_endpoint_vacuum_sector I = I.blueprint.objects.RE.endpoint_object.vacuum_sector /\
  ym_endpoint_faithful_wilson_universality I =
    I.blueprint.objects.RE.endpoint_object.faithful_wilson_universality /\
  ym_Omega_loc I = I.chosen_sites.endpoint.vac /\
  ym_phi_star I = I.chosen_sites.endpoint.testFn /\
  ym_E_ren I = I.chosen_sites.endpoint.field := by
  exact YangMillsManuscriptNamedObjectsStatement I

end MaleyLean
