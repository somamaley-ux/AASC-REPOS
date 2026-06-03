import MaleyLean.Papers.YangMills.Kernel.NamedOutputsAssembly

namespace MaleyLean

/--
Structured bundle collecting the representative named outputs exposed by the
constructive, vacuum-gap, and endpoint theorem hearts.
-/
structure YMWitnessBundle (RC : YMConstructiveRoute) (RD : YMVacuumGapRoute) (RE : YMEndpointCore) where
  finite_cap_positive_bridge : RC.finite_cap_package.positive_bridge_ready
  bounded_base_extension : RC.sharp_local_package.sharp_local_state.extends_bounded_base
  positive_gap : RD.transport_package.positive_gap_exhibited
  minkowski_gap_ready : RD.reconstruction_package.minkowski_gap_ready
  wightman_fields_present : RE.reconstruction_package.wightman_fields_present
  exact_endpoint : RE.endpoint_object.exact_local_net_endpoint

theorem YangMillsWitnessBundleFromNamedOutputsStatement
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
  YMWitnessBundle RC RD RE := by
  have h :=
    YangMillsAllCoreNamedOutputsStatement
      RC RD RE htrunc hext hcompat hunion hww hEE hEP
  refine
    { finite_cap_positive_bridge := h.2.2.1
      bounded_base_extension := h.2.2.2.2.2.1
      positive_gap := h.2.2.2.2.2.2.2.2.1
      minkowski_gap_ready := h.2.2.2.2.2.2.2.2.2.2.2.2.1
      wightman_fields_present := h.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.1
      exact_endpoint := h.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2 }

theorem YangMillsSpineFeedsWitnessBundleStatement
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
  RC.constructive_part /\ RD.vacuum_gap_part /\ RE.endpoint_part /\ YMWitnessBundle RC RD RE := by
  have hparts :=
    YangMillsSpineFeedsAllNamedOutputsStatement
      S RC RD RE
      h4 h5 h6 h7 hb hc hu
      huv hent hlat hwwS hend
      hflowed htrunc hext hcyc hbridge hcompat hunion hbuildC
      huvR hentR hlatR hwwR hgapR hrecR hendR hbuildD
      h9E h9W hEE hER hEP hbuildE
  have hwitness :=
    YangMillsWitnessBundleFromNamedOutputsStatement
      RC RD RE htrunc hext hcompat hunion hwwR hEE hEP
  exact And.intro hparts.1 <| And.intro hparts.2.1 <| And.intro hparts.2.2.1 hwitness

end MaleyLean
