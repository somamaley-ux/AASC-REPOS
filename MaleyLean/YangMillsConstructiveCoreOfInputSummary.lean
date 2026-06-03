import MaleyLean.Papers.YangMills.Surface.ConstructiveCoreOfInputSummary

namespace MaleyLean

theorem YangMillsConstructiveRouteOfInputSummaryTopExportStatement
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
  exact YangMillsConstructiveRouteOfInputSummaryStatement M

end MaleyLean
