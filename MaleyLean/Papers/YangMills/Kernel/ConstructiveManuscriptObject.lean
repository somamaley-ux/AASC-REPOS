import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptChoices
import MaleyLean.Papers.YangMills.Kernel.ConstructiveCoreBuilder

namespace MaleyLean

structure YMConstructiveManuscriptObject where
  flowed_state_ready : Prop
  finite_truncation_ready : Prop
  finite_cap_extension_ready : Prop
  cyclicity_ready : Prop
  finite_cap_bridge_ready : Prop
  bounded_state_compatibility_ready : Prop
  inductive_union_ready : Prop
  htrunc : finite_truncation_ready
  hext : finite_cap_extension_ready
  hcompat : bounded_state_compatibility_ready
  hunion : inductive_union_ready
  constructive_part : Prop
  finite_cap_package : YMFiniteCapPackage
  sharp_local_package : YMSharpLocalPackage
  build_constructive_part :
    flowed_state_ready ->
    finite_truncation_ready ->
    finite_cap_extension_ready ->
    cyclicity_ready ->
    finite_cap_bridge_ready ->
    bounded_state_compatibility_ready ->
    inductive_union_ready ->
    constructive_part
  truncation_yields_finite_cap_window :
    finite_truncation_ready -> finite_cap_package.truncation_window_ready
  finite_cap_extension_exhibits_bridge :
    finite_cap_extension_ready -> finite_cap_package.positive_bridge_ready
  finite_cap_extension_exhibits_package :
    finite_cap_extension_ready -> finite_cap_package.finite_cap_extension_ready
  compatibility_exhibits_sharp_local :
    bounded_state_compatibility_ready -> sharp_local_package.bounded_state_compatibility_ready
  inductive_union_exhibits_sharp_local :
    inductive_union_ready -> sharp_local_package.inductive_union_ready
  inductive_union_extends_bounded_base :
    inductive_union_ready -> sharp_local_package.sharp_local_state.extends_bounded_base
  DeltaMax : finite_cap_package.finite_cap_window
  finite_cap_bridge : finite_cap_package.positive_bridge_map
  bounded_base_one : sharp_local_package.bounded_base_carrier
  omega_bd : sharp_local_package.bounded_state_data
  omega_sharp : sharp_local_package.inductive_union_data

def YMConstructiveManuscriptObject.toConstructiveRoute
  (P : YMConstructiveManuscriptObject) :
  YMConstructiveRoute :=
  YangMillsConstructiveRouteData
    P.flowed_state_ready
    P.finite_truncation_ready
    P.finite_cap_extension_ready
    P.cyclicity_ready
    P.finite_cap_bridge_ready
    P.bounded_state_compatibility_ready
    P.inductive_union_ready
    P.constructive_part
    P.finite_cap_package
    P.sharp_local_package
    P.build_constructive_part
    P.truncation_yields_finite_cap_window
    P.finite_cap_extension_exhibits_bridge
    P.finite_cap_extension_exhibits_package
    P.compatibility_exhibits_sharp_local
    P.inductive_union_exhibits_sharp_local
    P.inductive_union_extends_bounded_base

def YMConstructiveManuscriptObject.toChoices
  (P : YMConstructiveManuscriptObject) :
  YMConstructiveManuscriptChoices
    P.toConstructiveRoute
    P.htrunc
    P.hext
    P.hcompat
    P.hunion :=
  YangMillsConstructiveManuscriptChoicesData
    (RC := P.toConstructiveRoute)
    (htrunc := P.htrunc)
    (hext := P.hext)
    (hcompat := P.hcompat)
    (hunion := P.hunion)
    P.DeltaMax
    P.finite_cap_bridge
    P.bounded_base_one
    P.omega_bd
    P.omega_sharp

theorem YangMillsConstructiveManuscriptObjectStatement
  (P : YMConstructiveManuscriptObject) :
  let RC := P.toConstructiveRoute
  let C := P.toChoices
  RC.finite_cap_package = P.finite_cap_package /\
  RC.sharp_local_package = P.sharp_local_package /\
  ym_constructive_DeltaMax_of C = P.DeltaMax /\
  ym_constructive_finite_cap_bridge_of C = P.finite_cap_bridge /\
  ym_constructive_bounded_base_one_of C = P.bounded_base_one /\
  ym_constructive_omega_bd_of C = P.omega_bd /\
  ym_constructive_omega_sharp_of C = P.omega_sharp := by
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl rfl

end MaleyLean
