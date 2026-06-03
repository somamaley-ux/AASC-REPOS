import MaleyLean.Papers.YangMills.Kernel.VacuumGapChosenSiteBridgeObjects
import MaleyLean.Papers.YangMills.Kernel.EndpointTheoremObjects
import MaleyLean.Papers.YangMills.Kernel.NativeVacuumGapEndpointFactorization

namespace MaleyLean

/--
Native theorem-facing bridge object for the `M.5 -> O.2 / O.3 / O.5` passage.

This bundles:
- the chosen-site vacuum-gap bridge object carrying the `M.5` side,
- the endpoint theorem-object package carrying the `O.2 / O.3 / O.5` side,
- and the native inter-heart factorization witnessing that the chosen
  Minkowski-gap readiness witness lands in the exact endpoint.
-/
structure YMVacuumGapEndpointBridgeObject
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  vacuum_gap_bridge : YMVacuumGapChosenSiteBridgeObject RD
  endpoint_objects : YMEndpointNativeTheoremObjects RE
  factorization : YMNativeVacuumGapEndpointFactorization RC RD RE
  chosen_gap_feeds_exact_endpoint :
    factorization.law_object.compatibility.vacuum_gap_to_endpoint
      factorization.chosen_vacuum_gap_ready =
    factorization.direct_endpoint_image
  chosen_gap_image_is_exact_endpoint :
    factorization.direct_endpoint_image =
    endpoint_objects.chosen_site_object.exact_endpoint_witness

def YangMillsVacuumGapEndpointBridgeObjectData
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (cwin : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window)
  (cbridge :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map)
  (cbase :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier)
  (cstate :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data)
  (cunion :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data)
  (hww : RD.weak_window_certificate_ready)
  (vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map)
  (vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family)
  (vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector)
  (vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family)
  (vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional)
  (vhgap :
    (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
      vgapf
      ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr))
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector)
  (etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space)
  (efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family) :
  YMVacuumGapEndpointBridgeObject RC RD RE := by
  let V :=
    YangMillsVacuumGapChosenSiteBridgeObjectData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let E :=
    YangMillsEndpointNativeTheoremObjectsData
      RE hE hP evac etest efield
  let F :=
    YangMillsNativeVacuumGapEndpointFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    { vacuum_gap_bridge := V
      endpoint_objects := E
      factorization := F
      chosen_gap_feeds_exact_endpoint := F.direct_image_definition
      chosen_gap_image_is_exact_endpoint := by
        exact
          (YangMillsNativeVacuumGapEndpointChosenGapWitnessStatement
            RC RD RE
            htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
            hww vtm vobs vrsec vcorr vgapf vhgap
            hE hP evac etest efield).2.2 }

theorem YangMillsVacuumGapEndpointBridgeExportStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (cwin : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window)
  (cbridge :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map)
  (cbase :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier)
  (cstate :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data)
  (cunion :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data)
  (hww : RD.weak_window_certificate_ready)
  (vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map)
  (vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family)
  (vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector)
  (vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family)
  (vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional)
  (vhgap :
    (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
      vgapf
      ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr))
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector)
  (etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space)
  (efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family) :
  Nonempty (YMVacuumGapEndpointBridgeObject RC RD RE) /\
  ym_source_labels .minkowskiHamiltonianInheritsGap = ["M.5"] /\
  ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
  ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
  ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
  RD.reconstruction_package.minkowski_gap_ready /\
  RE.endpoint_object.exact_local_net_endpoint /\
  ym_faithful_wilson_universality_hypotheses_statement RE /\
  ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement RE /\
  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE /\
  ((YangMillsNativeVacuumGapEndpointFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield).law_object.compatibility.vacuum_gap_to_endpoint
      (YangMillsNativeVacuumGapEndpointFactorizationData
        RC RD RE
        htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
        hww vtm vobs vrsec vcorr vgapf vhgap
        hE hP evac etest efield).chosen_vacuum_gap_ready =
    (YangMillsNativeVacuumGapEndpointFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield).direct_endpoint_image) := by
  let B :=
    YangMillsVacuumGapEndpointBridgeObjectData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  have hM5 : RD.reconstruction_package.minkowski_gap_ready :=
    B.vacuum_gap_bridge.compatibility.chain.native_objects.reconstruction_transfer_object.minkowski_gap_ready
  have hO5 : RE.endpoint_object.exact_local_net_endpoint :=
    B.endpoint_objects.chosen_site_object.exact_endpoint_witness
  have hO2 : ym_faithful_wilson_universality_hypotheses_statement RE :=
    B.endpoint_objects.universality_object.faithful_wilson_universality_hypotheses
  have hO3 : ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement RE :=
    B.endpoint_objects.universality_object.qualitative_faithful_wilson_universality
  have hO5stmt :
      ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE :=
    B.endpoint_objects.universality_object.exact_endpoint_exclusion_statement
  exact
    And.intro (Nonempty.intro B) <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro hM5 <|
                    And.intro hO5 <|
                      And.intro hO2 <|
                        And.intro hO3 <|
                          And.intro hO5stmt
                            B.chosen_gap_feeds_exact_endpoint

end MaleyLean
