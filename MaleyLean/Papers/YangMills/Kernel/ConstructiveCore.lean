import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpine

namespace MaleyLean

/--
Dedicated abstract core for the load-bearing Part~C constructive route.

This isolates the Lane~A theorem-facing chain:
flowed state, finite truncation, finite-cap extension, cyclicity,
finite-cap bridge, bounded-state compatibility, and inductive union.
-/
structure YMFiniteCapPackage where
  finite_cap_window : Type
  finite_cap_extension_data : Type
  positive_bridge_map : Type
  extend_finite_cap :
    finite_cap_window -> positive_bridge_map -> finite_cap_extension_data
  truncation_window_ready : Prop
  finite_cap_extension_ready : Prop
  positive_bridge_ready : Prop

structure YMSharpLocalPackage where
  sharp_local_state : YMSharpLocalState
  bounded_base_carrier : Type
  bounded_state_data : Type
  inductive_union_data : Type
  assemble_sharp_local_state :
    bounded_base_carrier -> bounded_state_data -> inductive_union_data -> YMSharpLocalState
  bounded_state_compatibility_ready : Prop
  inductive_union_ready : Prop

structure YMConstructiveRoute where
  flowed_state_ready : Prop
  finite_truncation_ready : Prop
  finite_cap_extension_ready : Prop
  cyclicity_ready : Prop
  finite_cap_bridge_ready : Prop
  bounded_state_compatibility_ready : Prop
  inductive_union_ready : Prop
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

/-- Abstract statement that the finite-cap bridge is only useful once extension is in place. -/
def ym_finite_cap_bridge_core (R : YMConstructiveRoute) : Prop :=
  R.finite_cap_extension_ready -> R.finite_cap_bridge_ready -> R.constructive_part

/-- Abstract statement that inductive union closes the Lane~A constructive packet chain. -/
def ym_inductive_union_core (R : YMConstructiveRoute) : Prop :=
  R.inductive_union_ready -> R.constructive_part

/-- Abstract statement that the full Lane~A chain closes Part C. -/
def ym_laneA_constructive_core (R : YMConstructiveRoute) : Prop :=
  R.flowed_state_ready ->
  R.finite_truncation_ready ->
  R.finite_cap_extension_ready ->
  R.cyclicity_ready ->
  R.finite_cap_bridge_ready ->
  R.bounded_state_compatibility_ready ->
  R.inductive_union_ready ->
  R.constructive_part

/--
Explicit paper-facing Lane~A statement carried by the current constructive core.

Unlike `constructive_part`, this does not hide behind an abstract placeholder:
it names the concrete finite-cap and sharp-local outputs that the current
constructive route exposes.
-/
def ym_laneA_explicit_statement (R : YMConstructiveRoute) : Prop :=
  R.finite_cap_package.truncation_window_ready /\
  R.finite_cap_package.finite_cap_extension_ready /\
  R.finite_cap_package.positive_bridge_ready /\
  R.sharp_local_package.bounded_state_compatibility_ready /\
  R.sharp_local_package.inductive_union_ready /\
  R.sharp_local_package.sharp_local_state.extends_bounded_base

theorem YangMillsFiniteCapBridgeCoreStatement
  (R : YMConstructiveRoute)
  (h : ym_finite_cap_bridge_core R)
  (hext : R.finite_cap_extension_ready)
  (hbridge : R.finite_cap_bridge_ready) :
  R.constructive_part := by
  exact h hext hbridge

theorem YangMillsInductiveUnionCoreStatement
  (R : YMConstructiveRoute)
  (h : ym_inductive_union_core R)
  (hunion : R.inductive_union_ready) :
  R.constructive_part := by
  exact h hunion

theorem YangMillsLaneAConstructiveCoreStatement
  (R : YMConstructiveRoute)
  (h : ym_laneA_constructive_core R)
  (hflowed : R.flowed_state_ready)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcyc : R.cyclicity_ready)
  (hbridge : R.finite_cap_bridge_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  R.constructive_part := by
  exact h hflowed htrunc hext hcyc hbridge hcompat hunion

theorem YangMillsConstructiveRouteBuildStatement
  (R : YMConstructiveRoute)
  (hflowed : R.flowed_state_ready)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcyc : R.cyclicity_ready)
  (hbridge : R.finite_cap_bridge_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  R.constructive_part := by
  exact R.build_constructive_part hflowed htrunc hext hcyc hbridge hcompat hunion

theorem YangMillsFiniteCapPackageStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready) :
  R.finite_cap_package.truncation_window_ready /\
  R.finite_cap_package.finite_cap_extension_ready /\
  R.finite_cap_package.positive_bridge_ready := by
  exact And.intro
    (R.truncation_yields_finite_cap_window htrunc)
    (And.intro
      (R.finite_cap_extension_exhibits_package hext)
      (R.finite_cap_extension_exhibits_bridge hext))

theorem YangMillsSharpLocalPackageStatement
  (R : YMConstructiveRoute)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  R.sharp_local_package.bounded_state_compatibility_ready /\
  R.sharp_local_package.inductive_union_ready /\
  R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  exact And.intro
    (R.compatibility_exhibits_sharp_local hcompat)
    (And.intro
      (R.inductive_union_exhibits_sharp_local hunion)
      (R.inductive_union_extends_bounded_base hunion))

theorem YangMillsLoadBearingSpineFeedsConstructiveCoreStatement
  (S : YMLoadBearingSpine)
  (R : YMConstructiveRoute)
  (h4 : S.packet4_flowed_state)
  (h5 : S.packet5_finite_truncation)
  (h6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (h7 : S.packet7_cyclicity)
  (hb : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hc : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hu : S.packet6_finite_cap_closure.inductive_union_passage)
  (hflowed : R.flowed_state_ready)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcyc : R.cyclicity_ready)
  (hbridge : R.finite_cap_bridge_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (hbuild : ym_laneA_constructive_core R) :
  S.packet4_flowed_state /\
  S.packet5_finite_truncation /\
  S.packet6_finite_cap_closure.finite_cap_sharp_local_extension /\
  S.packet7_cyclicity /\
  S.packet6_finite_cap_closure.positive_unital_bridge /\
  S.packet6_finite_cap_closure.bounded_state_compatibility /\
  S.packet6_finite_cap_closure.inductive_union_passage /\
  R.constructive_part := by
  have hpart :=
    YangMillsLaneAConstructiveCoreStatement
      R hbuild hflowed htrunc hext hcyc hbridge hcompat hunion
  exact And.intro h4 <|
    And.intro h5 <|
    And.intro h6 <|
    And.intro h7 <|
    And.intro hb <|
    And.intro hc <|
    And.intro hu hpart

theorem YangMillsConstructiveCoreExhibitsNamedOutputsStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  R.finite_cap_package.truncation_window_ready /\
  R.finite_cap_package.finite_cap_extension_ready /\
  R.finite_cap_package.positive_bridge_ready /\
  R.sharp_local_package.bounded_state_compatibility_ready /\
  R.sharp_local_package.inductive_union_ready /\
  R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  have hcap := YangMillsFiniteCapPackageStatement R htrunc hext
  have hsharp := YangMillsSharpLocalPackageStatement R hcompat hunion
  exact And.intro hcap.1 <|
    And.intro hcap.2.1 <|
      And.intro hcap.2.2 <|
        And.intro hsharp.1 <|
          And.intro hsharp.2.1 hsharp.2.2

theorem YangMillsLaneAExplicitStatementFromReadinessStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  ym_laneA_explicit_statement R := by
  exact
    YangMillsConstructiveCoreExhibitsNamedOutputsStatement
      R htrunc hext hcompat hunion

theorem YangMillsLoadBearingSpineFeedsLaneAExplicitStatement
  (S : YMLoadBearingSpine)
  (R : YMConstructiveRoute)
  (h4 : S.packet4_flowed_state)
  (h5 : S.packet5_finite_truncation)
  (h6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (h7 : S.packet7_cyclicity)
  (hb : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hc : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hu : S.packet6_finite_cap_closure.inductive_union_passage)
  (hflowed : R.flowed_state_ready)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcyc : R.cyclicity_ready)
  (hbridge : R.finite_cap_bridge_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (hbuild : ym_laneA_constructive_core R) :
  S.packet4_flowed_state /\
  S.packet5_finite_truncation /\
  S.packet6_finite_cap_closure.finite_cap_sharp_local_extension /\
  S.packet7_cyclicity /\
  S.packet6_finite_cap_closure.positive_unital_bridge /\
  S.packet6_finite_cap_closure.bounded_state_compatibility /\
  S.packet6_finite_cap_closure.inductive_union_passage /\
  ym_laneA_explicit_statement R := by
  have hspine :=
    YangMillsLoadBearingSpineFeedsConstructiveCoreStatement
      S R h4 h5 h6 h7 hb hc hu
      hflowed htrunc hext hcyc hbridge hcompat hunion hbuild
  have hexplicit :=
    YangMillsLaneAExplicitStatementFromReadinessStatement
      R htrunc hext hcompat hunion
  exact And.intro hspine.1 <|
    And.intro hspine.2.1 <|
      And.intro hspine.2.2.1 <|
        And.intro hspine.2.2.2.1 <|
          And.intro hspine.2.2.2.2.1 <|
            And.intro hspine.2.2.2.2.2.1 <|
              And.intro hspine.2.2.2.2.2.2.1 hexplicit

end MaleyLean
