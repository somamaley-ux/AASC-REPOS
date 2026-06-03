import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartLawObject
import MaleyLean.Papers.YangMills.Kernel.NativeLawConsequences

namespace MaleyLean

/--
Typed consequence package sitting above the native cross-heart law object and
the heart-level native-law consequence layer.
-/
structure YMNativeCrossHeartLawConsequences
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  law_object : YMNativeCrossHeartLawObject RC RD RE
  native_consequences : YMNativeLawConsequences RC RD RE

def YangMillsNativeCrossHeartLawConsequencesData
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
  YMNativeCrossHeartLawConsequences RC RD RE := by
  refine
    { law_object :=
        YangMillsNativeCrossHeartLawObjectData
          RC RD RE
          htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
          hww vtm vobs vrsec vcorr vgapf vhgap
          hE hP evac etest efield
      native_consequences :=
        YangMillsNativeLawConsequencesData
          RC RD RE
          htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
          hww vtm vobs vrsec vcorr vgapf vhgap
          hE hP evac etest efield }

theorem YangMillsNativeCrossHeartLawConsequencesWitnessStatement
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
  Nonempty (YMNativeCrossHeartLawConsequences RC RD RE) /\
  Nonempty (YMNativeCrossHeartLawObject RC RD RE) /\
  Nonempty (YMNativeLawConsequences RC RD RE) /\
  Nonempty (YMNativeInterHeartCompatibility RC RD RE) /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  RD.reconstruction_package.minkowski_gap_ready /\
  RE.endpoint_object.exact_local_net_endpoint := by
  let C :=
    YangMillsNativeCrossHeartLawConsequencesData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro (Nonempty.intro C) <|
      And.intro (Nonempty.intro C.law_object) <|
        And.intro (Nonempty.intro C.native_consequences) <|
          And.intro (Nonempty.intro C.law_object.compatibility) <|
            And.intro C.native_consequences.constructive_bounded_base <|
              And.intro C.law_object.vacuum_gap_ready C.law_object.endpoint_exact

end MaleyLean
