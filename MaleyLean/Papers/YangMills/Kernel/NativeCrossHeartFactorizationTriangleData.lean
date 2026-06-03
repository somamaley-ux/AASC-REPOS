import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartFactorizationAssembly

namespace MaleyLean

/--
Typed chosen-image object for the native factorization triangle. This makes the
three selected bridge images explicit data, together with the equalities that
relate them.
-/
structure YMNativeCrossHeartFactorizationTriangleData
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  factorization_assembly : YMNativeCrossHeartFactorizationAssembly RC RD RE
  chosen_constructive_state : YMSharpLocalState
  chosen_gap_image : PLift RD.reconstruction_package.minkowski_gap_ready
  chosen_vacuum_gap_witness : RD.reconstruction_package.minkowski_gap_ready
  stepwise_endpoint_image : RE.endpoint_object.exact_local_net_endpoint
  vacuum_gap_endpoint_image : RE.endpoint_object.exact_local_net_endpoint
  direct_constructive_endpoint_image : RE.endpoint_object.exact_local_net_endpoint
  constructive_state_definition :
    chosen_constructive_state =
      factorization_assembly.constructive_vacuum_gap.chosen_constructive_state
  gap_image_definition :
    chosen_gap_image =
      factorization_assembly.constructive_vacuum_gap.composite_gap_ready
  vacuum_gap_witness_definition :
    chosen_vacuum_gap_witness =
      factorization_assembly.vacuum_gap_endpoint.chosen_vacuum_gap_ready
  stepwise_endpoint_definition :
    stepwise_endpoint_image =
      factorization_assembly.vacuum_gap_endpoint.composite_endpoint_map
        chosen_gap_image.down
  vacuum_gap_endpoint_definition :
    vacuum_gap_endpoint_image =
      factorization_assembly.vacuum_gap_endpoint.direct_endpoint_image
  direct_constructive_endpoint_definition :
    direct_constructive_endpoint_image =
      factorization_assembly.constructive_endpoint.direct_endpoint_image
  gap_image_agrees : chosen_gap_image.down = chosen_vacuum_gap_witness
  stepwise_endpoint_agrees : stepwise_endpoint_image = vacuum_gap_endpoint_image
  direct_endpoint_agrees :
    vacuum_gap_endpoint_image = direct_constructive_endpoint_image

def YangMillsNativeCrossHeartFactorizationTriangleDataData
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
  YMNativeCrossHeartFactorizationTriangleData RC RD RE := by
  let A :=
    YangMillsNativeCrossHeartFactorizationAssemblyData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  let s := A.constructive_vacuum_gap.chosen_constructive_state
  let g := A.constructive_vacuum_gap.composite_gap_ready
  let vg := A.vacuum_gap_endpoint.chosen_vacuum_gap_ready
  let ee := A.vacuum_gap_endpoint.composite_endpoint_map g.down
  let ve := A.vacuum_gap_endpoint.direct_endpoint_image
  let ce := A.constructive_endpoint.direct_endpoint_image
  refine
    { factorization_assembly := A
      chosen_constructive_state := s
      chosen_gap_image := g
      chosen_vacuum_gap_witness := vg
      stepwise_endpoint_image := ee
      vacuum_gap_endpoint_image := ve
      direct_constructive_endpoint_image := ce
      constructive_state_definition := rfl
      gap_image_definition := rfl
      vacuum_gap_witness_definition := rfl
      stepwise_endpoint_definition := rfl
      vacuum_gap_endpoint_definition := rfl
      direct_constructive_endpoint_definition := rfl
      gap_image_agrees := rfl
      stepwise_endpoint_agrees := rfl
      direct_endpoint_agrees := rfl }

theorem YangMillsNativeCrossHeartFactorizationTriangleDataWitnessStatement
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
  Nonempty (YMNativeCrossHeartFactorizationTriangleData RC RD RE) /\
  Nonempty (YMNativeCrossHeartFactorizationAssembly RC RD RE) /\
  RE.endpoint_object.exact_local_net_endpoint /\
  (let T :=
    YangMillsNativeCrossHeartFactorizationTriangleDataData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
   T.stepwise_endpoint_image = T.direct_constructive_endpoint_image) := by
  let T :=
    YangMillsNativeCrossHeartFactorizationTriangleDataData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro ⟨T⟩ <|
      And.intro ⟨T.factorization_assembly⟩ <|
        And.intro T.direct_constructive_endpoint_image <|
          Eq.trans T.stepwise_endpoint_agrees T.direct_endpoint_agrees

end MaleyLean
