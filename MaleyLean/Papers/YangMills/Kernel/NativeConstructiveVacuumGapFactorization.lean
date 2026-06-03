import MaleyLean.Papers.YangMills.Kernel.NativeCrossHeartLawObject
import MaleyLean.Papers.YangMills.Kernel.NativeInterHeartCompatibility
import MaleyLean.Papers.YangMills.Kernel.NativeLawAssembly

namespace MaleyLean

/--
Typed factorization object for the constructive-to-vacuum-gap route through the
state-level bridge.
-/
structure YMNativeConstructiveVacuumGapFactorization
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  law_object : YMNativeCrossHeartLawObject RC RD RE
  composite_gap_map : YMSharpLocalState -> PLift RD.reconstruction_package.minkowski_gap_ready
  chosen_constructive_state : YMSharpLocalState
  composite_gap_ready : PLift RD.reconstruction_package.minkowski_gap_ready
  chosen_constructive_bounded_base :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base
  direct_gap_ready : RD.reconstruction_package.minkowski_gap_ready
  composite_gap_definition :
    composite_gap_map chosen_constructive_state = composite_gap_ready
  direct_gap_definition :
    law_object.compatibility.constructive_to_vacuum_gap chosen_constructive_bounded_base =
      direct_gap_ready
  factorization_agrees :
    composite_gap_ready.down = direct_gap_ready

def YangMillsNativeConstructiveVacuumGapFactorizationData
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
  YMNativeConstructiveVacuumGapFactorization RC RD RE := by
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
      YMSharpLocalState -> PLift RD.reconstruction_package.minkowski_gap_ready :=
    O.compatibility.constructive_state_to_vacuum_gap
  refine
    { law_object := O
      composite_gap_map := f
      chosen_constructive_state := A.constructive.interface.chosen_sharp_local_state
      composite_gap_ready := f A.constructive.interface.chosen_sharp_local_state
      chosen_constructive_bounded_base := A.constructive.bounded_base_witness
      direct_gap_ready :=
        O.compatibility.constructive_to_vacuum_gap A.constructive.bounded_base_witness
      composite_gap_definition := rfl
      direct_gap_definition := rfl
      factorization_agrees := by
        have h :=
          YangMillsNativeConstructiveStateToVacuumGapChosenAgreementStatement
            RC RD RE
            htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
            hww vtm vobs vrsec vcorr vgapf vhgap
            hE hP evac etest efield
        exact congrArg PLift.down h }

theorem YangMillsNativeConstructiveVacuumGapFactorizationGeneralStateStatement
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
  (s : YMSharpLocalState) :
  let F :=
    YangMillsNativeConstructiveVacuumGapFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  F.composite_gap_map s =
    ⟨F.law_object.compatibility.constructive_to_vacuum_gap
      ((YangMillsNativeLawAssemblyData
        RC RD RE
        htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
        hww vtm vobs vrsec vcorr vgapf vhgap
        hE hP evac etest efield).constructive.bounded_base_from_assembly s)⟩ := by
  exact
    YangMillsNativeConstructiveStateToVacuumGapFactorsThroughAssemblyStatement
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
      s

theorem YangMillsNativeConstructiveVacuumGapFactorizationAssembledStateStatement
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
  (base : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data) :
  let A :=
    YangMillsNativeLawAssemblyData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  let F :=
    YangMillsNativeConstructiveVacuumGapFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  F.composite_gap_map (A.constructive.assemble_state base state unionData) =
    ⟨F.law_object.compatibility.constructive_to_vacuum_gap
      A.constructive.bounded_base_witness⟩ := by
  exact
    YangMillsNativeConstructiveAssembledStateFeedsVacuumGapStatement
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
      base state unionData

theorem YangMillsNativeConstructiveVacuumGapFactorizationWitnessStatement
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
  Nonempty (YMNativeConstructiveVacuumGapFactorization RC RD RE) /\
  Nonempty (YMNativeCrossHeartLawObject RC RD RE) /\
  RD.reconstruction_package.minkowski_gap_ready /\
  (let F :=
    YangMillsNativeConstructiveVacuumGapFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
   F.composite_gap_ready.down = F.direct_gap_ready) := by
  let F :=
    YangMillsNativeConstructiveVacuumGapFactorizationData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro ⟨F⟩ <|
      And.intro ⟨F.law_object⟩ <|
        And.intro F.direct_gap_ready F.factorization_agrees

end MaleyLean
