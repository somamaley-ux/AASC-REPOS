import MaleyLean.Papers.YangMills.Kernel.RelationalAssembly

namespace MaleyLean

/--
Named inter-heart relation from the constructive relational heart to the
vacuum-gap relational heart.
-/
def YMConstructiveToVacuumGapCompatibility
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute) : Prop :=
  RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
  RD.reconstruction_package.minkowski_gap_ready

/--
Named inter-heart relation from the vacuum-gap relational heart to the
endpoint relational heart.
-/
def YMVacuumGapToEndpointCompatibility
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore) : Prop :=
  RD.reconstruction_package.minkowski_gap_ready ->
  RE.endpoint_object.exact_local_net_endpoint

/--
Named inter-heart relation from the constructive relational heart directly to
the endpoint relational heart.
-/
def YMConstructiveToEndpointCompatibility
  (RC : YMConstructiveRoute)
  (RE : YMEndpointCore) : Prop :=
  RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
  RE.endpoint_object.exact_local_net_endpoint

theorem YangMillsConstructiveToVacuumGapCompatibilityStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (A : YMRelationalAssembly RC RD RE) :
  YMConstructiveToVacuumGapCompatibility RC RD := by
  intro _
  exact A.vacuum_gap.bundle.minkowski_gap_ready

theorem YangMillsVacuumGapToEndpointCompatibilityStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (A : YMRelationalAssembly RC RD RE) :
  YMVacuumGapToEndpointCompatibility RD RE := by
  intro _
  exact A.endpoint.bundle.exact_endpoint

theorem YangMillsConstructiveToEndpointCompatibilityStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (A : YMRelationalAssembly RC RD RE) :
  YMConstructiveToEndpointCompatibility RC RE := by
  intro _
  exact A.endpoint.bundle.exact_endpoint

theorem YangMillsInterHeartCompatibilityWitnessStatement
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
  Nonempty (YMRelationalAssembly RC RD RE) /\
  YMConstructiveToVacuumGapCompatibility RC RD /\
  YMVacuumGapToEndpointCompatibility RD RE /\
  YMConstructiveToEndpointCompatibility RC RE := by
  have hA := YangMillsRelationalAssemblyExistsStatement
    RC RD RE
    htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
    hww vtm vobs vrsec vcorr vgapf vhgap
    hE hP evac etest efield
  rcases hA with ⟨A⟩
  exact And.intro
    ⟨A⟩
    (And.intro
      (YangMillsConstructiveToVacuumGapCompatibilityStatement RC RD RE A)
      (And.intro
        (YangMillsVacuumGapToEndpointCompatibilityStatement RC RD RE A)
        (YangMillsConstructiveToEndpointCompatibilityStatement RC RD RE A)))

end MaleyLean
