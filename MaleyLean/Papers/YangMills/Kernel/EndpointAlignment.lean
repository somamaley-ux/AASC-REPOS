import MaleyLean.Papers.YangMills.Kernel.EndpointCore
import MaleyLean.Papers.YangMills.Kernel.TheoremPartAlignment

namespace MaleyLean

/-- Alignment layer connecting the dedicated endpoint core back to the endpoint theorem part. -/
theorem YangMillsEndpointCoreAlignsWithEndpointPartStatement
  (S : YMLoadBearingSpine)
  (R : YMEndpointCore)
  (h : R.endpoint_part -> S.theorem_parts.endpoint_exact_object) :
  R.endpoint_part -> S.theorem_parts.endpoint_exact_object := by
  intro hE
  exact h hE

theorem YangMillsSpineFeedsAlignedEndpointPartStatement
  (S : YMLoadBearingSpine)
  (R : YMEndpointCore)
  (h9E : S.packet9_reconstruction.euclidean_os_dossier)
  (h9W : S.packet9_reconstruction.wightman_reconstruction)
  (h10 : S.packet10_endpoint)
  (hE : R.euclidean_dossier_ready)
  (hR : R.reconstruction_ready)
  (hP : R.endpoint_packet_ready)
  (hbuild : ym_reconstruction_endpoint_core R)
  (halign : R.endpoint_part -> S.theorem_parts.endpoint_exact_object) :
  S.theorem_parts.endpoint_exact_object := by
  have hcore :=
    YangMillsLoadBearingSpineFeedsEndpointCoreStatement
      S R h9E h9W h10 hE hR hP hbuild
  exact YangMillsEndpointCoreAlignsWithEndpointPartStatement S R halign hcore.2.2.2

theorem YangMillsSpineFeedsAllAlignedMainTheoremPartsStatement
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
  (hww : S.auxiliary_weak_window_certificate)
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
  (hbuildE : ym_reconstruction_endpoint_core RE)
  (hCalign : RC.constructive_part -> S.theorem_parts.partC_sharp_local_construction)
  (hDalign : RD.vacuum_gap_part -> S.theorem_parts.partD_vacuum_gap)
  (hEalign : RE.endpoint_part -> S.theorem_parts.endpoint_exact_object) :
  S.theorem_parts.partC_sharp_local_construction /\
  S.theorem_parts.partD_vacuum_gap /\
  S.theorem_parts.endpoint_exact_object := by
  have hCD :=
    YangMillsSpineFeedsAlignedMainTheoremPartsStatement
      S RC RD
      h4 h5 h6 h7 hb hc hu
      huv hent hlat hww hend
      hflowed htrunc hext hcyc hbridge hcompat hunion hbuildC
      huvR hentR hlatR hwwR hgapR hrecR hendR hbuildD
      hCalign hDalign
  have hE :=
    YangMillsSpineFeedsAlignedEndpointPartStatement
      S RE h9E h9W hend hEE hER hEP hbuildE hEalign
  exact And.intro hCD.1 <| And.intro hCD.2 hE

end MaleyLean
