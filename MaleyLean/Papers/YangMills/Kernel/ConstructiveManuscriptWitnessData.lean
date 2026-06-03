import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptCarrierBase

namespace MaleyLean

structure YMConstructiveManuscriptWitnessData
    (B : YMConstructiveManuscriptCarrierBase) where
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
  truncation_window_ready : Prop
  finite_cap_extension_package_ready : Prop
  positive_bridge_ready : Prop
  sharp_local_bounded_state_compatibility_ready : Prop
  sharp_local_inductive_union_ready : Prop
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
    finite_truncation_ready -> truncation_window_ready
  finite_cap_extension_exhibits_bridge :
    finite_cap_extension_ready -> positive_bridge_ready
  finite_cap_extension_exhibits_package :
    finite_cap_extension_ready -> finite_cap_extension_package_ready
  compatibility_exhibits_sharp_local :
    bounded_state_compatibility_ready ->
    sharp_local_bounded_state_compatibility_ready
  inductive_union_exhibits_sharp_local :
    inductive_union_ready ->
    sharp_local_inductive_union_ready
  inductive_union_extends_bounded_base :
    inductive_union_ready ->
    (B.assemble_sharp_local_state
      B.bounded_base_one
      B.omega_bd
      B.omega_sharp).extends_bounded_base

def YMConstructiveManuscriptWitnessData.toFiniteCapPackage
  {B : YMConstructiveManuscriptCarrierBase}
  (W : YMConstructiveManuscriptWitnessData B) :
  YMFiniteCapPackage :=
  YangMillsFiniteCapPackageData
    B.FiniteCapWindow
    B.FiniteCapExtensionData
    B.PositiveBridgeMap
    B.extend_finite_cap
    W.truncation_window_ready
    W.finite_cap_extension_package_ready
    W.positive_bridge_ready

def YMConstructiveManuscriptWitnessData.toSharpLocalPackage
  {B : YMConstructiveManuscriptCarrierBase}
  (W : YMConstructiveManuscriptWitnessData B) :
  YMSharpLocalPackage :=
  YangMillsSharpLocalPackageData
    (B.assemble_sharp_local_state
      B.bounded_base_one
      B.omega_bd
      B.omega_sharp)
    B.BoundedBaseCarrier
    B.BoundedStateData
    B.InductiveUnionData
    B.assemble_sharp_local_state
    W.sharp_local_bounded_state_compatibility_ready
    W.sharp_local_inductive_union_ready

def YMConstructiveManuscriptWitnessData.toConstructiveManuscriptObject
  {B : YMConstructiveManuscriptCarrierBase}
  (W : YMConstructiveManuscriptWitnessData B) :
  YMConstructiveManuscriptObject :=
  { flowed_state_ready := W.flowed_state_ready
    finite_truncation_ready := W.finite_truncation_ready
    finite_cap_extension_ready := W.finite_cap_extension_ready
    cyclicity_ready := W.cyclicity_ready
    finite_cap_bridge_ready := W.finite_cap_bridge_ready
    bounded_state_compatibility_ready := W.bounded_state_compatibility_ready
    inductive_union_ready := W.inductive_union_ready
    htrunc := W.htrunc
    hext := W.hext
    hcompat := W.hcompat
    hunion := W.hunion
    constructive_part := W.constructive_part
    finite_cap_package := W.toFiniteCapPackage
    sharp_local_package := W.toSharpLocalPackage
    build_constructive_part := W.build_constructive_part
    truncation_yields_finite_cap_window := W.truncation_yields_finite_cap_window
    finite_cap_extension_exhibits_bridge := W.finite_cap_extension_exhibits_bridge
    finite_cap_extension_exhibits_package := W.finite_cap_extension_exhibits_package
    compatibility_exhibits_sharp_local := W.compatibility_exhibits_sharp_local
    inductive_union_exhibits_sharp_local := W.inductive_union_exhibits_sharp_local
    inductive_union_extends_bounded_base := W.inductive_union_extends_bounded_base
    DeltaMax := B.DeltaMax
    finite_cap_bridge := B.finite_cap_bridge
    bounded_base_one := B.bounded_base_one
    omega_bd := B.omega_bd
    omega_sharp := B.omega_sharp }

theorem YangMillsConstructiveManuscriptWitnessDataStatement
  {B : YMConstructiveManuscriptCarrierBase}
  (W : YMConstructiveManuscriptWitnessData B) :
  let O := W.toConstructiveManuscriptObject
  O.DeltaMax = B.DeltaMax /\
  O.finite_cap_bridge = B.finite_cap_bridge /\
  O.bounded_base_one = B.bounded_base_one /\
  O.omega_bd = B.omega_bd /\
  O.omega_sharp = B.omega_sharp := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

end MaleyLean
