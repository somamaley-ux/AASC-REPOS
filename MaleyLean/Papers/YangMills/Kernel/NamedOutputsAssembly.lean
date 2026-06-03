import MaleyLean.Papers.YangMills.Kernel.EndpointAlignment

namespace MaleyLean

/--
Joint witness layer collecting the named outputs exposed by the enriched
constructive, vacuum-gap, and endpoint cores.
-/
theorem YangMillsAllCoreNamedOutputsStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hEE : RE.euclidean_dossier_ready)
  (hEP : RE.endpoint_packet_ready) :
  RC.finite_cap_package.truncation_window_ready /\
  RC.finite_cap_package.finite_cap_extension_ready /\
  RC.finite_cap_package.positive_bridge_ready /\
  RC.sharp_local_package.bounded_state_compatibility_ready /\
  RC.sharp_local_package.inductive_union_ready /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  RD.continuum_gap_transport_ready /\
  RD.transport_package.os_transport_ready /\
  RD.transport_package.positive_gap_exhibited /\
  RD.transport_package.lattice_gap_input /\
  RD.reconstruction_ready /\
  RD.reconstruction_package.os_sector_ready /\
  RD.reconstruction_package.minkowski_gap_ready /\
  RD.reconstruction_package.obtained_from_transport /\
  RE.reconstruction_ready /\
  RE.reconstruction_package.wightman_fields_present /\
  RE.reconstruction_package.vacuum_vector_present /\
  RE.reconstruction_package.smearing_defined /\
  RE.reconstruction_package.vacuum_correlations_defined /\
  RE.endpoint_object.exact_local_net_endpoint := by
  have hC :=
    YangMillsConstructiveCoreExhibitsNamedOutputsStatement
      RC htrunc hext hcompat hunion
  have hD :=
    YangMillsVacuumGapCoreExhibitsNamedOutputsStatement
      RD hww
  have hE :=
    YangMillsEndpointCoreExhibitsNamedOutputsStatement
      RE hEE hEP
  exact And.intro hC.1 <|
    And.intro hC.2.1 <|
      And.intro hC.2.2.1 <|
        And.intro hC.2.2.2.1 <|
          And.intro hC.2.2.2.2.1 <|
            And.intro hC.2.2.2.2.2 <|
              And.intro hD.1 <|
                And.intro hD.2.1 <|
                  And.intro hD.2.2.1 <|
                    And.intro hD.2.2.2.1 <|
                      And.intro hD.2.2.2.2.1 <|
                        And.intro hD.2.2.2.2.2.1 <|
                          And.intro hD.2.2.2.2.2.2.1 <|
                            And.intro hD.2.2.2.2.2.2.2 <|
                              And.intro hE.1 <|
                                And.intro hE.2.1 <|
                                  And.intro hE.2.2.1 <|
                                    And.intro hE.2.2.2.1 <|
                                      And.intro hE.2.2.2.2.1 hE.2.2.2.2.2

theorem YangMillsSpineFeedsAllNamedOutputsStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (h4 : S.packet4_flowed_state)
  (h5 : S.packet5_finite_truncation)
  (h6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (h7 : S.packet7_cyclicity)
  (hb : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hc : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hu : S.packet6_finite_cap_closure.inductive_union_passage)
  (huv : S.packet1_uv_gate)
  (hent : S.packet2_entrance)
  (hlat : S.packet3_fixed_lattice_gap)
  (hwwS : S.auxiliary_weak_window_certificate)
  (hend : S.packet10_endpoint)
  (hflowed : RC.flowed_state_ready)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcyc : RC.cyclicity_ready)
  (hbridge : RC.finite_cap_bridge_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hbuildC : ym_laneA_constructive_core RC)
  (huvR : RD.ultraviolet_scope_ready)
  (hentR : RD.entrance_ready)
  (hlatR : RD.fixed_lattice_gap_ready)
  (hwwR : RD.weak_window_certificate_ready)
  (hgapR : RD.continuum_gap_transport_ready)
  (hrecR : RD.reconstruction_ready)
  (hendR : RD.endpoint_ready)
  (hbuildD : ym_route1_vacuum_gap_core RD)
  (h9E : S.packet9_reconstruction.euclidean_os_dossier)
  (h9W : S.packet9_reconstruction.wightman_reconstruction)
  (hEE : RE.euclidean_dossier_ready)
  (hER : RE.reconstruction_ready)
  (hEP : RE.endpoint_packet_ready)
  (hbuildE : ym_reconstruction_endpoint_core RE) :
  RC.constructive_part /\
  RD.vacuum_gap_part /\
  RE.endpoint_part /\
  RC.finite_cap_package.positive_bridge_ready /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  RD.transport_package.positive_gap_exhibited /\
  RD.reconstruction_package.minkowski_gap_ready /\
  RE.reconstruction_package.wightman_fields_present /\
  RE.endpoint_object.exact_local_net_endpoint := by
  have hboth :=
    YangMillsLoadBearingSpineFeedsBothCoresStatement
      S RC RD
      h4 h5 h6 h7 hb hc hu
      huv hent hlat hwwS hend
      hflowed htrunc hext hcyc hbridge hcompat hunion hbuildC
      huvR hentR hlatR hwwR hgapR hrecR hendR hbuildD
  have hendpoint :=
    YangMillsLoadBearingSpineFeedsEndpointCoreStatement
      S RE h9E h9W hend hEE hER hEP hbuildE
  have hwitnesses :=
    YangMillsAllCoreNamedOutputsStatement
      RC RD RE htrunc hext hcompat hunion hwwR hEE hEP
  have hCbridge : RC.finite_cap_package.positive_bridge_ready :=
    hwitnesses.2.2.1
  have hCstate : RC.sharp_local_package.sharp_local_state.extends_bounded_base :=
    hwitnesses.2.2.2.2.2.1
  have hDpos : RD.transport_package.positive_gap_exhibited :=
    hwitnesses.2.2.2.2.2.2.2.2.1
  have hDmink : RD.reconstruction_package.minkowski_gap_ready :=
    hwitnesses.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hEfields : RE.reconstruction_package.wightman_fields_present :=
    hwitnesses.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hEexact : RE.endpoint_object.exact_local_net_endpoint :=
    hwitnesses.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2
  exact And.intro hboth.1 <|
    And.intro hboth.2 <|
      And.intro hendpoint.2.2.2 <|
        And.intro hCbridge <|
          And.intro hCstate <|
            And.intro hDpos <|
              And.intro hDmink <|
                And.intro hEfields hEexact

end MaleyLean
