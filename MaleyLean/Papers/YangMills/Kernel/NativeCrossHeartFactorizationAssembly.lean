import MaleyLean.Papers.YangMills.Kernel.NativeConstructiveVacuumGapFactorization
import MaleyLean.Papers.YangMills.Kernel.NativeVacuumGapEndpointFactorization
import MaleyLean.Papers.YangMills.Kernel.NativeConstructiveEndpointFactorization

namespace MaleyLean

/--
Typed assembly collecting the three native cross-heart factorization objects
into one higher-level package.
-/
structure YMNativeCrossHeartFactorizationAssembly
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  constructive_vacuum_gap :
    YMNativeConstructiveVacuumGapFactorization RC RD RE
  vacuum_gap_endpoint :
    YMNativeVacuumGapEndpointFactorization RC RD RE
  constructive_endpoint :
    YMNativeConstructiveEndpointFactorization RC RD RE

def YangMillsNativeCrossHeartFactorizationAssemblyData
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
  YMNativeCrossHeartFactorizationAssembly RC RD RE := by
  refine
    { constructive_vacuum_gap :=
        YangMillsNativeConstructiveVacuumGapFactorizationData
          RC RD RE
          htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
          hww vtm vobs vrsec vcorr vgapf vhgap
          hE hP evac etest efield
      vacuum_gap_endpoint :=
        YangMillsNativeVacuumGapEndpointFactorizationData
          RC RD RE
          htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
          hww vtm vobs vrsec vcorr vgapf vhgap
          hE hP evac etest efield
      constructive_endpoint :=
        YangMillsNativeConstructiveEndpointFactorizationData
          RC RD RE
          htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
          hww vtm vobs vrsec vcorr vgapf vhgap
          hE hP evac etest efield }

theorem YangMillsNativeCrossHeartFactorizationAssemblyWitnessStatement
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
  Nonempty (YMNativeCrossHeartFactorizationAssembly RC RD RE) /\
  Nonempty (YMNativeConstructiveVacuumGapFactorization RC RD RE) /\
  Nonempty (YMNativeVacuumGapEndpointFactorization RC RD RE) /\
  Nonempty (YMNativeConstructiveEndpointFactorization RC RD RE) := by
  let A :=
    YangMillsNativeCrossHeartFactorizationAssemblyData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro ⟨A⟩ <|
      And.intro ⟨A.constructive_vacuum_gap⟩ <|
        And.intro ⟨A.vacuum_gap_endpoint⟩ ⟨A.constructive_endpoint⟩

end MaleyLean
