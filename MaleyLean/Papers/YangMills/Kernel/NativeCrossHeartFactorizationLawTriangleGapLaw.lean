import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartFactorizationLawTrianglePackage

namespace MaleyLean

/--
Named gap-route law for the packaged native factorization-law triangle. This
isolates the constructive-gap vs vacuum-gap equality as its own object.
-/
structure YMNativeCrossHeartFactorizationLawTriangleGapLaw
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  triangle_package : YMNativeCrossHeartFactorizationLawTrianglePackage RC RD RE
  constructive_gap_output : RD.reconstruction_package.minkowski_gap_ready
  vacuum_gap_output : RD.reconstruction_package.minkowski_gap_ready
  constructive_definition :
    constructive_gap_output = triangle_package.triangle_data.chosen_gap_output
  vacuum_gap_definition :
    vacuum_gap_output = triangle_package.triangle_data.chosen_vacuum_gap_output
  gap_route_law :
    constructive_gap_output = vacuum_gap_output

def YangMillsNativeCrossHeartFactorizationLawTriangleGapLawData
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
  YMNativeCrossHeartFactorizationLawTriangleGapLaw RC RD RE := by
  let P :=
    YangMillsNativeCrossHeartFactorizationLawTrianglePackageData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  refine
    { triangle_package := P
      constructive_gap_output := P.triangle_data.chosen_gap_output
      vacuum_gap_output := P.triangle_data.chosen_vacuum_gap_output
      constructive_definition := rfl
      vacuum_gap_definition := rfl
      gap_route_law := P.triangle_data.gap_output_agrees }

theorem YangMillsNativeCrossHeartFactorizationLawTriangleGapLawWitnessStatement
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
  Nonempty (YMNativeCrossHeartFactorizationLawTriangleGapLaw RC RD RE) /\
  Nonempty (YMNativeCrossHeartFactorizationLawTrianglePackage RC RD RE) /\
  RD.reconstruction_package.minkowski_gap_ready /\
  (let L :=
    YangMillsNativeCrossHeartFactorizationLawTriangleGapLawData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
   L.constructive_gap_output = L.vacuum_gap_output) := by
  let L :=
    YangMillsNativeCrossHeartFactorizationLawTriangleGapLawData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro ⟨L⟩ <|
      And.intro ⟨L.triangle_package⟩ <|
        And.intro L.vacuum_gap_output L.gap_route_law

end MaleyLean
