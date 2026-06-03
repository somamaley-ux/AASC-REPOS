import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartImageConsequences
import MaleyLean.Papers.YangMills.Kernel.TheoremAssemblyNativeCrossHeartLawAlignment

namespace MaleyLean

/--
Alignment layer tying the theorem/native/native-cross-heart-law surface to the
native cross-heart image consequence layer.
-/
structure YMTheoremAssemblyNativeCrossHeartImageAlignment
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  theorem_native_cross_heart_law_alignment :
    YMTheoremAssemblyNativeCrossHeartLawAlignment S RC RD RE
  native_cross_heart_image_consequences :
    YMNativeCrossHeartImageConsequences RC RD RE

def YangMillsTheoremAssemblyNativeCrossHeartImageAlignmentData
  (S : YMLoadBearingSpine)
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
  (hCalign :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
      S.theorem_parts.partC_sharp_local_construction)
  (hDalign :
    RD.transport_package.os_transport_ready ->
      S.theorem_parts.partD_vacuum_gap)
  (hEalign :
    RE.endpoint_object.exact_local_net_endpoint ->
      S.theorem_parts.endpoint_exact_object) :
  YMTheoremAssemblyNativeCrossHeartImageAlignment S RC RD RE := by
  refine
    { theorem_native_cross_heart_law_alignment :=
        YangMillsTheoremAssemblyNativeCrossHeartLawAlignmentData
          S RC RD RE
          htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
          hww vtm vobs vrsec vcorr vgapf vhgap
          hE hP evac etest efield
          hCalign hDalign hEalign
      native_cross_heart_image_consequences :=
        YangMillsNativeCrossHeartImageConsequencesData
          RC RD RE
          htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
          hww vtm vobs vrsec vcorr vgapf vhgap
          hE hP evac etest efield }

theorem YangMillsTheoremAssemblyNativeCrossHeartImageAlignmentExportStatement
  (S : YMLoadBearingSpine)
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
  (hCalign :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
      S.theorem_parts.partC_sharp_local_construction)
  (hDalign :
    RD.transport_package.os_transport_ready ->
      S.theorem_parts.partD_vacuum_gap)
  (hEalign :
    RE.endpoint_object.exact_local_net_endpoint ->
      S.theorem_parts.endpoint_exact_object) :
  Nonempty (YMTheoremAssemblyNativeCrossHeartImageAlignment S RC RD RE) /\
  Nonempty (YMTheoremAssemblyNativeCrossHeartLawAlignment S RC RD RE) /\
  Nonempty (YMNativeCrossHeartImageConsequences RC RD RE) /\
  Nonempty (YMNativeCrossHeartImageAssembly RC RD RE) /\
  Nonempty (PLift RD.reconstruction_package.minkowski_gap_ready) /\
  S.theorem_parts.partC_sharp_local_construction /\
  S.theorem_parts.partD_vacuum_gap /\
  S.theorem_parts.endpoint_exact_object := by
  let A := YangMillsTheoremAssemblyNativeCrossHeartImageAlignmentData
    S RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
    hCalign hDalign hEalign
  exact
    And.intro ⟨A⟩ <|
      And.intro ⟨A.theorem_native_cross_heart_law_alignment⟩ <|
        And.intro ⟨A.native_cross_heart_image_consequences⟩ <|
          And.intro
            ⟨YangMillsNativeCrossHeartImageAssemblyData
              RC RD RE
              htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
              hww vtm vobs vrsec vcorr vgapf vhgap
              hE hP evac etest efield⟩ <|
            And.intro ⟨A.native_cross_heart_image_consequences.constructive_state_image⟩ <|
              And.intro
                A.theorem_native_cross_heart_law_alignment.theorem_native_inter_heart_alignment.theorem_native_alignment.theorem_witness.partC_witness <|
                And.intro
                  A.theorem_native_cross_heart_law_alignment.theorem_native_inter_heart_alignment.theorem_native_alignment.theorem_witness.partD_witness
                  A.theorem_native_cross_heart_law_alignment.theorem_native_inter_heart_alignment.theorem_native_alignment.theorem_witness.endpoint_part_witness

end MaleyLean
