import MaleyLean.Papers.YangMills.Kernel.ConstructiveCoreBuilder

namespace MaleyLean

theorem YangMillsConstructiveCoreBuilderSummaryStatement
  (flowed_state_ready : Prop)
  (finite_truncation_ready : Prop)
  (finite_cap_extension_ready : Prop)
  (cyclicity_ready : Prop)
  (finite_cap_bridge_ready : Prop)
  (bounded_state_compatibility_ready : Prop)
  (inductive_union_ready : Prop)
  (constructive_part : Prop)
  (finite_cap_package : YMFiniteCapPackage)
  (sharp_local_package : YMSharpLocalPackage)
  (build_constructive_part :
    flowed_state_ready ->
    finite_truncation_ready ->
    finite_cap_extension_ready ->
    cyclicity_ready ->
    finite_cap_bridge_ready ->
    bounded_state_compatibility_ready ->
    inductive_union_ready ->
    constructive_part)
  (truncation_yields_finite_cap_window :
    finite_truncation_ready -> finite_cap_package.truncation_window_ready)
  (finite_cap_extension_exhibits_bridge :
    finite_cap_extension_ready -> finite_cap_package.positive_bridge_ready)
  (finite_cap_extension_exhibits_package :
    finite_cap_extension_ready -> finite_cap_package.finite_cap_extension_ready)
  (compatibility_exhibits_sharp_local :
    bounded_state_compatibility_ready -> sharp_local_package.bounded_state_compatibility_ready)
  (inductive_union_exhibits_sharp_local :
    inductive_union_ready -> sharp_local_package.inductive_union_ready)
  (inductive_union_extends_bounded_base :
    inductive_union_ready -> sharp_local_package.sharp_local_state.extends_bounded_base)
  (htrunc : finite_truncation_ready)
  (hext : finite_cap_extension_ready)
  (hcompat : bounded_state_compatibility_ready)
  (hunion : inductive_union_ready) :
  let RC :=
    YangMillsConstructiveRouteData
      flowed_state_ready finite_truncation_ready finite_cap_extension_ready
      cyclicity_ready finite_cap_bridge_ready bounded_state_compatibility_ready
      inductive_union_ready constructive_part
      finite_cap_package sharp_local_package
      build_constructive_part truncation_yields_finite_cap_window
      finite_cap_extension_exhibits_bridge finite_cap_extension_exhibits_package
      compatibility_exhibits_sharp_local inductive_union_exhibits_sharp_local
      inductive_union_extends_bounded_base
  RC.finite_cap_package.truncation_window_ready /\
  RC.finite_cap_package.finite_cap_extension_ready /\
  RC.finite_cap_package.positive_bridge_ready /\
  RC.sharp_local_package.bounded_state_compatibility_ready /\
  RC.sharp_local_package.inductive_union_ready /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base := by
  exact
    YangMillsConstructiveCoreBuilderStatement
      flowed_state_ready finite_truncation_ready finite_cap_extension_ready
      cyclicity_ready finite_cap_bridge_ready bounded_state_compatibility_ready
      inductive_union_ready constructive_part
      finite_cap_package sharp_local_package
      build_constructive_part truncation_yields_finite_cap_window
      finite_cap_extension_exhibits_bridge finite_cap_extension_exhibits_package
      compatibility_exhibits_sharp_local inductive_union_exhibits_sharp_local
      inductive_union_extends_bounded_base
      htrunc hext hcompat hunion

end MaleyLean
