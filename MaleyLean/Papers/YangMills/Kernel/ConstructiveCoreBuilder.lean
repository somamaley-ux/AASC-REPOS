import MaleyLean.Papers.YangMills.Kernel.ConstructiveSemanticBundle

namespace MaleyLean

/--
Named builder for a manuscript finite-cap package.
-/
def YangMillsFiniteCapPackageData
  (finite_cap_window : Type)
  (finite_cap_extension_data : Type)
  (positive_bridge_map : Type)
  (extend_finite_cap :
    finite_cap_window -> positive_bridge_map -> finite_cap_extension_data)
  (truncation_window_ready : Prop)
  (finite_cap_extension_ready : Prop)
  (positive_bridge_ready : Prop) :
  YMFiniteCapPackage :=
  { finite_cap_window := finite_cap_window
    finite_cap_extension_data := finite_cap_extension_data
    positive_bridge_map := positive_bridge_map
    extend_finite_cap := extend_finite_cap
    truncation_window_ready := truncation_window_ready
    finite_cap_extension_ready := finite_cap_extension_ready
    positive_bridge_ready := positive_bridge_ready }

/--
Named builder for a manuscript sharp-local package.
-/
def YangMillsSharpLocalPackageData
  (sharp_local_state : YMSharpLocalState)
  (bounded_base_carrier : Type)
  (bounded_state_data : Type)
  (inductive_union_data : Type)
  (assemble_sharp_local_state :
    bounded_base_carrier -> bounded_state_data -> inductive_union_data -> YMSharpLocalState)
  (bounded_state_compatibility_ready : Prop)
  (inductive_union_ready : Prop) :
  YMSharpLocalPackage :=
  { sharp_local_state := sharp_local_state
    bounded_base_carrier := bounded_base_carrier
    bounded_state_data := bounded_state_data
    inductive_union_data := inductive_union_data
    assemble_sharp_local_state := assemble_sharp_local_state
    bounded_state_compatibility_ready := bounded_state_compatibility_ready
    inductive_union_ready := inductive_union_ready }

/--
Named builder for a manuscript constructive route object.

This makes the remaining object-level work explicit: a closed constructive
constant can now be authored by supplying the finite-cap package,
sharp-local package, and the readiness/projection fields directly.
-/
def YangMillsConstructiveRouteData
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
    inductive_union_ready -> sharp_local_package.sharp_local_state.extends_bounded_base) :
  YMConstructiveRoute :=
  { flowed_state_ready := flowed_state_ready
    finite_truncation_ready := finite_truncation_ready
    finite_cap_extension_ready := finite_cap_extension_ready
    cyclicity_ready := cyclicity_ready
    finite_cap_bridge_ready := finite_cap_bridge_ready
    bounded_state_compatibility_ready := bounded_state_compatibility_ready
    inductive_union_ready := inductive_union_ready
    constructive_part := constructive_part
    finite_cap_package := finite_cap_package
    sharp_local_package := sharp_local_package
    build_constructive_part := build_constructive_part
    truncation_yields_finite_cap_window := truncation_yields_finite_cap_window
    finite_cap_extension_exhibits_bridge := finite_cap_extension_exhibits_bridge
    finite_cap_extension_exhibits_package := finite_cap_extension_exhibits_package
    compatibility_exhibits_sharp_local := compatibility_exhibits_sharp_local
    inductive_union_exhibits_sharp_local := inductive_union_exhibits_sharp_local
    inductive_union_extends_bounded_base := inductive_union_extends_bounded_base }

theorem YangMillsConstructiveCoreBuilderStatement
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
  dsimp [YangMillsConstructiveRouteData]
  exact
    And.intro (truncation_yields_finite_cap_window htrunc) <|
      And.intro (finite_cap_extension_exhibits_package hext) <|
        And.intro (finite_cap_extension_exhibits_bridge hext) <|
          And.intro (compatibility_exhibits_sharp_local hcompat) <|
            And.intro
              (inductive_union_exhibits_sharp_local hunion)
              (inductive_union_extends_bounded_base hunion)

end MaleyLean
