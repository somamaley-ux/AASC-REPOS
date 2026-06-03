import MaleyLean.Papers.YangMills.Kernel.ManuscriptDeclarations
namespace MaleyLean

noncomputable section

abbrev ConstructiveFlowedStateData : Type :=
  ym_constructive_carrier_decls.ConstructiveFlowedStateData

/--
Concrete manuscript-facing constructive carrier declarations.

These are object-level declarations only: carrier types, chosen inhabitants,
and basic operations needed to instantiate the constructive packet's manuscript
base. They do not add theorem-strengthening proof data.
-/
abbrev ConstructiveFiniteCapWindow : Type :=
  ym_constructive_carrier_decls.ConstructiveFiniteCapWindow

abbrev ConstructiveFiniteCapExtensionData : Type :=
  ym_constructive_carrier_decls.ConstructiveFiniteCapExtensionData

abbrev ConstructivePositiveBridgeMap : Type :=
  ym_constructive_carrier_decls.ConstructivePositiveBridgeMap

abbrev ConstructiveBoundedBaseCarrier : Type :=
  ym_constructive_carrier_decls.ConstructiveBoundedBaseCarrier

abbrev ConstructiveBoundedStateData : Type :=
  ym_constructive_carrier_decls.ConstructiveBoundedStateData

abbrev ConstructiveInductiveUnionData : Type :=
  ym_constructive_carrier_decls.ConstructiveInductiveUnionData

abbrev constructive_extend_finite_cap :
  ConstructiveFiniteCapWindow ->
  ConstructivePositiveBridgeMap ->
  ConstructiveFiniteCapExtensionData :=
  ym_constructive_carrier_decls.constructive_extend_finite_cap

abbrev constructive_assemble_sharp_local_state :
  ConstructiveBoundedBaseCarrier ->
  ConstructiveBoundedStateData ->
  ConstructiveInductiveUnionData ->
  YMSharpLocalState :=
  ym_constructive_carrier_decls.constructive_assemble_sharp_local_state

abbrev constructive_omega_flow : ConstructiveFlowedStateData :=
  ym_constructive_carrier_decls.constructive_omega_flow

abbrev DeltaMax : ConstructiveFiniteCapWindow :=
  ym_constructive_carrier_decls.DeltaMax

abbrev constructive_finite_cap_bridge : ConstructivePositiveBridgeMap :=
  ym_constructive_carrier_decls.constructive_finite_cap_bridge

abbrev constructive_bounded_base_one : ConstructiveBoundedBaseCarrier :=
  ym_constructive_carrier_decls.constructive_bounded_base_one

abbrev constructive_omega_bd : ConstructiveBoundedStateData :=
  ym_constructive_carrier_decls.constructive_omega_bd

abbrev constructive_omega_sharp : ConstructiveInductiveUnionData :=
  ym_constructive_carrier_decls.constructive_omega_sharp

noncomputable def ym_constructive_manuscript_carrier_base :
  YMConstructiveManuscriptCarrierBase :=
  { FlowedStateData := ConstructiveFlowedStateData
    FiniteCapWindow := ConstructiveFiniteCapWindow
    FiniteCapExtensionData := ConstructiveFiniteCapExtensionData
    PositiveBridgeMap := ConstructivePositiveBridgeMap
    BoundedBaseCarrier := ConstructiveBoundedBaseCarrier
    BoundedStateData := ConstructiveBoundedStateData
    InductiveUnionData := ConstructiveInductiveUnionData
    extend_finite_cap := constructive_extend_finite_cap
    assemble_sharp_local_state := constructive_assemble_sharp_local_state
    omega_flow := constructive_omega_flow
    DeltaMax := DeltaMax
    finite_cap_bridge := constructive_finite_cap_bridge
    bounded_base_one := constructive_bounded_base_one
    omega_bd := constructive_omega_bd
    omega_sharp := constructive_omega_sharp }

theorem ym_constructive_manuscript_carrier_base_named_inhabitants :
  ym_constructive_manuscript_carrier_base.omega_flow = constructive_omega_flow /\
  ym_constructive_manuscript_carrier_base.DeltaMax = DeltaMax /\
  ym_constructive_manuscript_carrier_base.finite_cap_bridge = constructive_finite_cap_bridge /\
  ym_constructive_manuscript_carrier_base.bounded_base_one = constructive_bounded_base_one /\
  ym_constructive_manuscript_carrier_base.omega_bd = constructive_omega_bd /\
  ym_constructive_manuscript_carrier_base.omega_sharp = constructive_omega_sharp := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

end

end MaleyLean
