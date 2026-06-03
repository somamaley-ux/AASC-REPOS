import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartLawObject
import MaleyLean.Papers.YangMills.Kernel.NativeInterHeartCompatibility
import MaleyLean.Papers.YangMills.Kernel.NativeLawAssembly

namespace MaleyLean

/--
Typed factorization object for the vacuum-gap-to-endpoint route through the
chosen vacuum-gap witness.
-/
structure YMNativeVacuumGapEndpointFactorization
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  law_object : YMNativeCrossHeartLawObject RC RD RE
  composite_endpoint_map :
    RD.reconstruction_package.minkowski_gap_ready ->
      RE.endpoint_object.exact_local_net_endpoint
  chosen_vacuum_gap_ready : RD.reconstruction_package.minkowski_gap_ready
  composite_endpoint_image : RE.endpoint_object.exact_local_net_endpoint
  direct_endpoint_image : RE.endpoint_object.exact_local_net_endpoint
  composite_image_definition :
    composite_endpoint_map chosen_vacuum_gap_ready = composite_endpoint_image
  direct_image_definition :
    law_object.compatibility.vacuum_gap_to_endpoint chosen_vacuum_gap_ready =
      direct_endpoint_image
  factorization_agrees :
    composite_endpoint_image = direct_endpoint_image

def YangMillsNativeVacuumGapEndpointFactorizationData
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
  YMNativeVacuumGapEndpointFactorization RC RD RE := by
  let O :=
    YangMillsNativeCrossHeartLawObjectData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  let A :=
    YangMillsNativeLawAssemblyData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  let f :
      RD.reconstruction_package.minkowski_gap_ready ->
        RE.endpoint_object.exact_local_net_endpoint :=
    O.compatibility.vacuum_gap_to_endpoint
  refine
    { law_object := O
      composite_endpoint_map := f
      chosen_vacuum_gap_ready := A.vacuum_gap.minkowski_gap_witness
      composite_endpoint_image := f A.vacuum_gap.minkowski_gap_witness
      direct_endpoint_image :=
        O.compatibility.vacuum_gap_to_endpoint A.vacuum_gap.minkowski_gap_witness
      composite_image_definition := rfl
      direct_image_definition := rfl
      factorization_agrees := by
        exact
          (YangMillsNativeVacuumGapEndpointChosenGapWitnessStatement
            RC RD RE
            htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
            hww vtm vobs vrsec vcorr vgapf vhgap
            hE hP evac etest efield).2.2 }

theorem YangMillsNativeVacuumGapEndpointFactorizationGeneralWitnessStatement
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
  (efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family)
  (hgapReady : RD.reconstruction_package.minkowski_gap_ready) :
  let F :=
    YangMillsNativeVacuumGapEndpointFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  RE.endpoint_object.exact_local_net_endpoint /\
  (F.composite_endpoint_map hgapReady =
    F.law_object.compatibility.vacuum_gap_to_endpoint hgapReady) := by
  let F :=
    YangMillsNativeVacuumGapEndpointFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    YangMillsNativeVacuumGapEndpointGeneralWitnessStatement
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
      hgapReady

theorem YangMillsNativeVacuumGapEndpointFactorizationWitnessStatement
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
  Nonempty (YMNativeVacuumGapEndpointFactorization RC RD RE) /\
  Nonempty (YMNativeCrossHeartLawObject RC RD RE) /\
  RE.endpoint_object.exact_local_net_endpoint /\
  (let F :=
    YangMillsNativeVacuumGapEndpointFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
   F.composite_endpoint_image = F.direct_endpoint_image) := by
  let F :=
    YangMillsNativeVacuumGapEndpointFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro ⟨F⟩ <|
      And.intro ⟨F.law_object⟩ <|
        And.intro F.direct_endpoint_image F.factorization_agrees

end MaleyLean
