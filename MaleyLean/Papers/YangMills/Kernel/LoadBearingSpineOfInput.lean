import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite
import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpineBuilder

namespace MaleyLean

def YangMillsLoadBearingSpineOfInput
  (M : YMClosedInstantiatedManuscriptInput) :
  YMLoadBearingSpine :=
  YangMillsLoadBearingSpineData
    M.S.packet1_uv_gate
    M.S.packet2_entrance
    M.S.packet3_fixed_lattice_gap
    M.S.packet4_flowed_state
    M.S.packet5_finite_truncation
    M.S.packet6_finite_cap_closure
    M.S.packet7_cyclicity
    M.S.packet8_qe3_transport
    M.S.packet9_reconstruction
    M.S.packet10_endpoint
    M.S.auxiliary_weak_window_certificate
    M.S.seam_finite_cap_bridge
    M.S.seam_bounded_state_compatibility
    M.S.seam_graph_core_handoff
    M.S.theorem_parts
    M.S.partC_route
    M.S.partD_route
    M.S.endpoint_route

theorem YangMillsLoadBearingSpineOfInputIsOriginalStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  YangMillsLoadBearingSpineOfInput M = M.S := by
  rfl

theorem YangMillsLoadBearingSpineOfInputNamedOutputsStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  let S := YangMillsLoadBearingSpineOfInput M
  S = M.S /\
  S.packet6_finite_cap_closure = M.S.packet6_finite_cap_closure /\
  S.packet8_qe3_transport = M.S.packet8_qe3_transport /\
  S.packet9_reconstruction = M.S.packet9_reconstruction /\
  S.theorem_parts = M.S.theorem_parts /\
  S.partC_route = M.S.partC_route /\
  S.partD_route = M.S.partD_route /\
  S.endpoint_route = M.S.endpoint_route := by
  dsimp [YangMillsLoadBearingSpineOfInput]
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl rfl

end MaleyLean
