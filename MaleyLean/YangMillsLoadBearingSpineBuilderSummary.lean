import MaleyLean.Papers.YangMills.Surface.LoadBearingSpineBuilderSummary

namespace MaleyLean

theorem YangMillsLoadBearingSpineBuilderSummaryTopExportStatement
  (packet1_uv_gate : Prop)
  (packet2_entrance : Prop)
  (packet3_fixed_lattice_gap : Prop)
  (packet4_flowed_state : Prop)
  (packet5_finite_truncation : Prop)
  (packet6_finite_cap_closure : YMPacket6Interface)
  (packet7_cyclicity : Prop)
  (packet8_qe3_transport : YMPacket8Interface)
  (packet9_reconstruction : YMPacket9Interface)
  (packet10_endpoint : Prop)
  (auxiliary_weak_window_certificate : Prop)
  (seam_finite_cap_bridge : Prop)
  (seam_bounded_state_compatibility : Prop)
  (seam_graph_core_handoff : Prop)
  (theorem_parts : YMMainTheoremParts)
  (partC_route : YMPartCRouteInterface)
  (partD_route : YMPartDRouteInterface)
  (endpoint_route : YMEndpointRouteInterface)
  (hp1 : packet1_uv_gate)
  (hp2 : packet2_entrance) :
  let S :=
    YangMillsLoadBearingSpineData
      packet1_uv_gate packet2_entrance packet3_fixed_lattice_gap
      packet4_flowed_state packet5_finite_truncation packet6_finite_cap_closure
      packet7_cyclicity packet8_qe3_transport packet9_reconstruction packet10_endpoint
      auxiliary_weak_window_certificate seam_finite_cap_bridge
      seam_bounded_state_compatibility seam_graph_core_handoff
      theorem_parts partC_route partD_route endpoint_route
  S.packet1_uv_gate /\
  S.packet2_entrance := by
  exact
    YangMillsLoadBearingSpineBuilderSummaryStatement
      packet1_uv_gate packet2_entrance packet3_fixed_lattice_gap
      packet4_flowed_state packet5_finite_truncation packet6_finite_cap_closure
      packet7_cyclicity packet8_qe3_transport packet9_reconstruction packet10_endpoint
      auxiliary_weak_window_certificate seam_finite_cap_bridge
      seam_bounded_state_compatibility seam_graph_core_handoff
      theorem_parts partC_route partD_route endpoint_route
      hp1 hp2

end MaleyLean
