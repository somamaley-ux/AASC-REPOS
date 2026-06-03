import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpineBuilder

namespace MaleyLean

structure YMLoadBearingSpineManuscriptObject where
  packet1_uv_gate : Prop
  packet2_entrance : Prop
  packet3_fixed_lattice_gap : Prop
  packet4_flowed_state : Prop
  packet5_finite_truncation : Prop
  packet6_finite_cap_closure : YMPacket6Interface
  packet7_cyclicity : Prop
  packet8_qe3_transport : YMPacket8Interface
  packet9_reconstruction : YMPacket9Interface
  packet10_endpoint : Prop
  auxiliary_weak_window_certificate : Prop
  seam_finite_cap_bridge : Prop
  seam_bounded_state_compatibility : Prop
  seam_graph_core_handoff : Prop
  theorem_parts : YMMainTheoremParts
  partC_route : YMPartCRouteInterface
  partD_route : YMPartDRouteInterface
  endpoint_route : YMEndpointRouteInterface
  hp1 : packet1_uv_gate
  hp2 : packet2_entrance
  hAroute :
    packet1_uv_gate ->
    packet2_entrance ->
    theorem_parts.partA_public_scope

def YMLoadBearingSpineManuscriptObject.toSpine
  (P : YMLoadBearingSpineManuscriptObject) :
  YMLoadBearingSpine :=
  YangMillsLoadBearingSpineData
    P.packet1_uv_gate
    P.packet2_entrance
    P.packet3_fixed_lattice_gap
    P.packet4_flowed_state
    P.packet5_finite_truncation
    P.packet6_finite_cap_closure
    P.packet7_cyclicity
    P.packet8_qe3_transport
    P.packet9_reconstruction
    P.packet10_endpoint
    P.auxiliary_weak_window_certificate
    P.seam_finite_cap_bridge
    P.seam_bounded_state_compatibility
    P.seam_graph_core_handoff
    P.theorem_parts
    P.partC_route
    P.partD_route
    P.endpoint_route

theorem YangMillsLoadBearingSpineManuscriptObjectStatement
  (P : YMLoadBearingSpineManuscriptObject) :
  let S := P.toSpine
  S.packet6_finite_cap_closure = P.packet6_finite_cap_closure /\
  S.packet8_qe3_transport = P.packet8_qe3_transport /\
  S.packet9_reconstruction = P.packet9_reconstruction /\
  S.theorem_parts = P.theorem_parts /\
  S.partC_route = P.partC_route /\
  S.partD_route = P.partD_route /\
  S.endpoint_route = P.endpoint_route /\
  S.packet1_uv_gate /\
  S.packet2_entrance /\
  ym_public_scope_route S := by
  dsimp [YMLoadBearingSpineManuscriptObject.toSpine, ym_public_scope_route]
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro P.hp1 <|
                    And.intro P.hp2 P.hAroute

end MaleyLean
