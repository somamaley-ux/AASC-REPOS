import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptCarrierBase

namespace MaleyLean

/--
Carrier-level semantic shadow for the unique flowed continuum state selected in
the constructive manuscript packet.
-/
def YMConstructiveFlowedStateReady
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  Exists fun omega : B.FlowedStateData => omega = B.omega_flow

/--
Carrier-level semantic shadow for the finite-cap window selected in the
constructive manuscript packet.
-/
def YMConstructiveTruncationWindowReady
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  Exists fun delta : B.FiniteCapWindow => delta = B.DeltaMax

/--
Carrier-level semantic shadow for the finite-cap extension package attached to
the chosen cap and positive bridge.
-/
def YMConstructiveFiniteCapExtensionPackageReady
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  Exists fun pkg : B.FiniteCapExtensionData =>
    pkg = B.extend_finite_cap B.DeltaMax B.finite_cap_bridge

/--
Carrier-level semantic shadow for the positivity bridge selected by the
constructive manuscript.
-/
def YMConstructivePositiveBridgeReady
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  Exists fun br : B.PositiveBridgeMap => br = B.finite_cap_bridge

/--
Carrier-level semantic shadow for the assembled sharp-local state used on the
constructive side of the manuscript.
-/
def YMConstructiveSharpLocalStatePresent
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  Exists fun s : YMSharpLocalState =>
    s =
      B.assemble_sharp_local_state
        B.bounded_base_one
        B.omega_bd
        B.omega_sharp

/--
The bounded-state compatibility shadow and the sharp-local inductive-union
shadow both amount, at this carrier level, to the presence of the assembled
sharp-local state.
-/
def YMConstructiveSharpLocalBoundedStateCompatibilityReady
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  YMConstructiveSharpLocalStatePresent B

def YMConstructiveSharpLocalInductiveUnionReady
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  YMConstructiveSharpLocalStatePresent B

theorem ym_constructive_flowed_state_ready_holds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructiveFlowedStateReady B := by
  exact ⟨B.omega_flow, rfl⟩

theorem ym_constructive_truncation_window_ready_holds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructiveTruncationWindowReady B := by
  exact ⟨B.DeltaMax, rfl⟩

theorem ym_constructive_finite_cap_extension_package_ready_holds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructiveFiniteCapExtensionPackageReady B := by
  exact ⟨B.extend_finite_cap B.DeltaMax B.finite_cap_bridge, rfl⟩

theorem ym_constructive_positive_bridge_ready_holds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructivePositiveBridgeReady B := by
  exact ⟨B.finite_cap_bridge, rfl⟩

theorem ym_constructive_sharp_local_state_present_holds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructiveSharpLocalStatePresent B := by
  exact
    ⟨B.assemble_sharp_local_state B.bounded_base_one B.omega_bd B.omega_sharp, rfl⟩

theorem ym_constructive_sharp_local_bounded_state_compatibility_ready_holds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructiveSharpLocalBoundedStateCompatibilityReady B := by
  exact ym_constructive_sharp_local_state_present_holds B

theorem ym_constructive_sharp_local_inductive_union_ready_holds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructiveSharpLocalInductiveUnionReady B := by
  exact ym_constructive_sharp_local_state_present_holds B

end MaleyLean
