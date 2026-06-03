import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite
import MaleyLean.Papers.YangMills.Kernel.ConstructiveCoreBuilder

namespace MaleyLean

def YangMillsConstructiveRouteOfInput
  (M : YMClosedInstantiatedManuscriptInput) :
  YMConstructiveRoute :=
  YangMillsConstructiveRouteData
    M.RC.flowed_state_ready
    M.RC.finite_truncation_ready
    M.RC.finite_cap_extension_ready
    M.RC.cyclicity_ready
    M.RC.finite_cap_bridge_ready
    M.RC.bounded_state_compatibility_ready
    M.RC.inductive_union_ready
    M.RC.constructive_part
    M.RC.finite_cap_package
    M.RC.sharp_local_package
    M.RC.build_constructive_part
    M.RC.truncation_yields_finite_cap_window
    M.RC.finite_cap_extension_exhibits_bridge
    M.RC.finite_cap_extension_exhibits_package
    M.RC.compatibility_exhibits_sharp_local
    M.RC.inductive_union_exhibits_sharp_local
    M.RC.inductive_union_extends_bounded_base

theorem YangMillsConstructiveRouteOfInputIsOriginalStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  YangMillsConstructiveRouteOfInput M = M.RC := by
  rfl

theorem YangMillsConstructiveRouteOfInputNamedOutputsStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  let RC := YangMillsConstructiveRouteOfInput M
  RC = M.RC /\
  RC.finite_cap_package = M.RC.finite_cap_package /\
  RC.sharp_local_package = M.RC.sharp_local_package /\
  RC.finite_cap_package.finite_cap_window =
    M.RC.finite_cap_package.finite_cap_window /\
  RC.finite_cap_package.positive_bridge_map =
    M.RC.finite_cap_package.positive_bridge_map /\
  RC.sharp_local_package.bounded_base_carrier =
    M.RC.sharp_local_package.bounded_base_carrier /\
  RC.sharp_local_package.bounded_state_data =
    M.RC.sharp_local_package.bounded_state_data /\
  RC.sharp_local_package.inductive_union_data =
    M.RC.sharp_local_package.inductive_union_data := by
  dsimp [YangMillsConstructiveRouteOfInput]
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl rfl

end MaleyLean
