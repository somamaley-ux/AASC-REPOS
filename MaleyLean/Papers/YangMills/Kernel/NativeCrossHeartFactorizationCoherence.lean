import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartFactorizationAssembly

namespace MaleyLean

/--
Typed coherence object witnessing that the factorized endpoint image obtained
by routing constructive data through the vacuum-gap side agrees with the direct
constructive-to-endpoint factorization image.
-/
structure YMNativeCrossHeartFactorizationCoherence
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  factorization_assembly : YMNativeCrossHeartFactorizationAssembly RC RD RE
  stepwise_endpoint_image : RE.endpoint_object.exact_local_net_endpoint
  stepwise_endpoint_definition :
    stepwise_endpoint_image =
      factorization_assembly.vacuum_gap_endpoint.composite_endpoint_map
        factorization_assembly.constructive_vacuum_gap.direct_gap_ready
  direct_factorized_image :
    stepwise_endpoint_image =
      factorization_assembly.constructive_endpoint.direct_endpoint_image

def YangMillsNativeCrossHeartFactorizationCoherenceData
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
  YMNativeCrossHeartFactorizationCoherence RC RD RE := by
  let A :=
    YangMillsNativeCrossHeartFactorizationAssemblyData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  refine
    { factorization_assembly := A
      stepwise_endpoint_image :=
        A.vacuum_gap_endpoint.composite_endpoint_map
          A.constructive_vacuum_gap.direct_gap_ready
      stepwise_endpoint_definition := rfl
      direct_factorized_image := rfl }

theorem YangMillsNativeCrossHeartFactorizationCoherenceWitnessStatement
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
  Nonempty (YMNativeCrossHeartFactorizationCoherence RC RD RE) /\
  Nonempty (YMNativeCrossHeartFactorizationAssembly RC RD RE) /\
  RE.endpoint_object.exact_local_net_endpoint /\
  (let C :=
    YangMillsNativeCrossHeartFactorizationCoherenceData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
   C.stepwise_endpoint_image =
     C.factorization_assembly.constructive_endpoint.direct_endpoint_image) := by
  let C :=
    YangMillsNativeCrossHeartFactorizationCoherenceData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro ⟨C⟩ <|
      And.intro ⟨C.factorization_assembly⟩ <|
        And.intro C.stepwise_endpoint_image C.direct_factorized_image

end MaleyLean
