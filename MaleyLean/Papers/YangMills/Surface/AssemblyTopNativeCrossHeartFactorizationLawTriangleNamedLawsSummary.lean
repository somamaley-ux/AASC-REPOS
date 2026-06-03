import MaleyLean.Papers.YangMills.Kernel.TheoremAssemblyNativeCrossHeartFactorizationLawTriangleNamedLawsAlignment

namespace MaleyLean

theorem YangMillsAssemblyTopNativeCrossHeartFactorizationLawTriangleNamedLawsSummaryStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (_cwin : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window)
  (_cbridge :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map)
  (_cbase :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier)
  (_cstate :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data)
  (_cunion :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data)
  (hww : RD.weak_window_certificate_ready)
  (_vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map)
  (_vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family)
  (_vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector)
  (_vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family)
  (_vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional)
  (_vhgap :
    (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
      _vgapf
      ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector _vrsec _vcorr))
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (_evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector)
  (_etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space)
  (_efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family)
  (_hCalign :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base ->
      S.theorem_parts.partC_sharp_local_construction)
  (_hDalign :
    RD.transport_package.os_transport_ready ->
      S.theorem_parts.partD_vacuum_gap)
  (_hEalign :
    RE.endpoint_object.exact_local_net_endpoint ->
      S.theorem_parts.endpoint_exact_object) :
  Nonempty (YMTheoremAssemblyNativeCrossHeartFactorizationLawTriangleNamedLawsAlignment S RC RD RE) /\
  Nonempty (YMTheoremAssemblyNativeCrossHeartFactorizationLawTrianglePackageAlignment S RC RD RE) /\
  Nonempty (YMNativeCrossHeartFactorizationLawTriangleNamedLaws RC RD RE) /\
  Nonempty (YMNativeCrossHeartFactorizationLawTrianglePackage RC RD RE) /\
  S.theorem_parts.partC_sharp_local_construction /\
  S.theorem_parts.partD_vacuum_gap /\
  S.theorem_parts.endpoint_exact_object :=
  YangMillsTheoremAssemblyNativeCrossHeartFactorizationLawTriangleNamedLawsAlignmentExportStatement
    S RC RD RE
    htrunc hext hcompat hunion _cwin _cbridge _cbase _cstate _cunion
    hww _vtm _vobs _vrsec _vcorr _vgapf _vhgap
    hE hP _evac _etest _efield
    _hCalign _hDalign _hEalign

end MaleyLean
