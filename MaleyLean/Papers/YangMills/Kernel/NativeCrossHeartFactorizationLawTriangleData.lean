import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartFactorizationLawAssembly

namespace MaleyLean

/--
Typed chosen-output object for the native factorization-law triangle. This
makes the selected law outputs explicit data, together with the equalities that
relate them.
-/
structure YMNativeCrossHeartFactorizationLawTriangleData
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  law_assembly : YMNativeCrossHeartFactorizationLawAssembly RC RD RE
  chosen_gap_output : RD.reconstruction_package.minkowski_gap_ready
  chosen_vacuum_gap_output : RD.reconstruction_package.minkowski_gap_ready
  induced_endpoint_output : RE.endpoint_object.exact_local_net_endpoint
  vacuum_gap_endpoint_output : RE.endpoint_object.exact_local_net_endpoint
  direct_constructive_endpoint_output : RE.endpoint_object.exact_local_net_endpoint
  gap_output_definition :
    chosen_gap_output = law_assembly.constructive_vacuum_gap.direct_gap_ready
  vacuum_gap_output_definition :
    chosen_vacuum_gap_output =
      law_assembly.vacuum_gap_endpoint.factorization.chosen_vacuum_gap_ready
  induced_endpoint_definition :
    induced_endpoint_output =
      law_assembly.vacuum_gap_endpoint.stepwise_endpoint_image
  vacuum_gap_endpoint_definition :
    vacuum_gap_endpoint_output =
      law_assembly.vacuum_gap_endpoint.direct_endpoint_image
  direct_constructive_endpoint_definition :
    direct_constructive_endpoint_output =
      law_assembly.constructive_endpoint.direct_endpoint_image
  gap_output_agrees : chosen_gap_output = chosen_vacuum_gap_output
  induced_endpoint_agrees :
    induced_endpoint_output = vacuum_gap_endpoint_output
  direct_endpoint_agrees :
    vacuum_gap_endpoint_output = direct_constructive_endpoint_output

def YangMillsNativeCrossHeartFactorizationLawTriangleDataData
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
  YMNativeCrossHeartFactorizationLawTriangleData RC RD RE := by
  let A :=
    YangMillsNativeCrossHeartFactorizationLawAssemblyData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  let g := A.constructive_vacuum_gap.direct_gap_ready
  let vg := A.vacuum_gap_endpoint.factorization.chosen_vacuum_gap_ready
  let ie := A.vacuum_gap_endpoint.stepwise_endpoint_image
  let ve := A.vacuum_gap_endpoint.direct_endpoint_image
  let ce := A.constructive_endpoint.direct_endpoint_image
  refine
    { law_assembly := A
      chosen_gap_output := g
      chosen_vacuum_gap_output := vg
      induced_endpoint_output := ie
      vacuum_gap_endpoint_output := ve
      direct_constructive_endpoint_output := ce
      gap_output_definition := rfl
      vacuum_gap_output_definition := rfl
      induced_endpoint_definition := rfl
      vacuum_gap_endpoint_definition := rfl
      direct_constructive_endpoint_definition := rfl
      gap_output_agrees := rfl
      induced_endpoint_agrees := rfl
      direct_endpoint_agrees := rfl }

theorem YangMillsNativeCrossHeartFactorizationLawTriangleDataWitnessStatement
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
  Nonempty (YMNativeCrossHeartFactorizationLawTriangleData RC RD RE) /\
  Nonempty (YMNativeCrossHeartFactorizationLawAssembly RC RD RE) /\
  RE.endpoint_object.exact_local_net_endpoint /\
  (let T :=
    YangMillsNativeCrossHeartFactorizationLawTriangleDataData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
   T.induced_endpoint_output = T.direct_constructive_endpoint_output) := by
  let T :=
    YangMillsNativeCrossHeartFactorizationLawTriangleDataData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro ⟨T⟩ <|
      And.intro ⟨T.law_assembly⟩ <|
        And.intro T.direct_constructive_endpoint_output <|
          Eq.trans T.induced_endpoint_agrees T.direct_endpoint_agrees

end MaleyLean
