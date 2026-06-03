import MaleyLean.Papers.YangMills.Kernel.FaithfulPaperTheoremAssembly
import MaleyLean.Papers.YangMills.Kernel.VacuumGapEndpointBridgeObjects

namespace MaleyLean

/--
Submission-facing native package for the deepened Route 1 to endpoint chain.

This combines:
- the faithful paper-level theorem assembly,
- the deepened vacuum-gap chosen-site / endpoint theorem-object bridge,
- and the explicit paper statements for the Route 1 and endpoint hearts.
-/
structure YMRoute1EndpointNativePackage
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  faithful_assembly : YMFaithfulPaperTheoremAssembly S RC RD RE
  route1_endpoint_bridge : YMVacuumGapEndpointBridgeObject RC RD RE
  route1_statement : ym_paper_partD_statement RD
  endpoint_statement : ym_paper_endpoint_statement RE

def YangMillsRoute1EndpointNativePackageData
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
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
  YMRoute1EndpointNativePackage S RC RD RE := by
  let A :=
    YangMillsFaithfulPaperTheoremAssemblyData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  let B :=
    YangMillsVacuumGapEndpointBridgeObjectData
      RC RD RE
      htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    { faithful_assembly := A
      route1_endpoint_bridge := B
      route1_statement := A.partD_statement_witness
      endpoint_statement := A.endpoint_statement_witness }

theorem YangMillsRoute1EndpointNativePackageExportStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
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
  Nonempty (YMRoute1EndpointNativePackage S RC RD RE) /\
  S.theorem_parts.partA_public_scope /\
  ym_paper_partD_statement RD /\
  ym_paper_endpoint_statement RE /\
  ym_source_labels .minkowskiHamiltonianInheritsGap = ["M.5"] /\
  ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
  ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
  ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
  RE.endpoint_object.exact_local_net_endpoint := by
  let P :=
    YangMillsRoute1EndpointNativePackageData
      S RC RD RE
      hp1 hp2 hAroute
      htrunc hext hcompat hunion
      cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  exact
    And.intro (Nonempty.intro P) <|
      And.intro P.faithful_assembly.public_scope_witness <|
        And.intro P.route1_statement <|
          And.intro P.endpoint_statement <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl <|
                    And.intro rfl <|
                      And.intro rfl
                        P.route1_endpoint_bridge.endpoint_objects.chosen_site_object.exact_endpoint_witness

end MaleyLean
