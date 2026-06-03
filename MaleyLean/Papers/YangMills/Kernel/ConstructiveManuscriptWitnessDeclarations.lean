import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptCarrierDeclarations
import MaleyLean.Papers.YangMills.Kernel.ConstructiveSemanticDefinitions
import MaleyLean.Papers.YangMills.Kernel.ManuscriptDeclarations
import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptWitnessData

namespace MaleyLean

abbrev ym_constructive_492_flowed_state_statement : Prop :=
  YMConstructiveFlowedStateReady ym_constructive_manuscript_carrier_base

abbrev ym_constructive_494_bounded_base_export_statement : Prop :=
  ym_constructive_492_flowed_state_statement

abbrev ym_constructive_569_truncation_statement : Prop :=
  YMConstructiveTruncationWindowReady ym_constructive_manuscript_carrier_base

abbrev ym_constructive_570_closure_package_statement : Prop :=
  ym_constructive_569_truncation_statement

abbrev ym_constructive_574A_bridge_statement : Prop :=
  YMConstructivePositiveBridgeReady ym_constructive_manuscript_carrier_base

abbrev ym_constructive_574_extension_statement : Prop :=
  YMConstructiveFiniteCapExtensionPackageReady
    ym_constructive_manuscript_carrier_base

abbrev ym_constructive_575_compatibility_statement : Prop :=
  YMConstructiveSharpLocalBoundedStateCompatibilityReady
    ym_constructive_manuscript_carrier_base

abbrev ym_constructive_576_union_statement : Prop :=
  YMConstructive576ExtensionPayload ym_constructive_manuscript_carrier_base

abbrev ym_constructive_577_cyclicity_statement : Prop :=
  ym_constructive_576_union_statement

abbrev ym_constructive_decl_flowed_state_ready : Prop :=
  ym_constructive_492_flowed_state_statement
abbrev ym_constructive_decl_finite_truncation_ready : Prop :=
  ym_constructive_569_truncation_statement
abbrev ym_constructive_decl_finite_cap_extension_ready : Prop :=
  ym_constructive_574_extension_statement
abbrev ym_constructive_decl_bounded_state_compatibility_ready : Prop :=
  ym_constructive_575_compatibility_statement
abbrev ym_constructive_decl_inductive_union_ready : Prop :=
  ym_constructive_576_union_statement
abbrev ym_constructive_decl_cyclicity_ready : Prop :=
  ym_constructive_decl_inductive_union_ready
abbrev ym_constructive_decl_finite_cap_bridge_ready : Prop :=
  ym_constructive_574A_bridge_statement

theorem ym_constructive_decl_htrunc :
  ym_constructive_decl_finite_truncation_ready := by
  exact ym_constructive_decl_bundle.h569

theorem ym_constructive_decl_hext :
  ym_constructive_decl_finite_cap_extension_ready := by
  exact ym_constructive_decl_bundle.h574.2

theorem ym_constructive_492 :
  ym_constructive_492_flowed_state_statement := by
  exact ym_constructive_decl_bundle.h492

theorem ym_constructive_494 :
  ym_constructive_492_flowed_state_statement ->
  ym_constructive_494_bounded_base_export_statement := by
  intro h494
  exact h494

theorem ym_constructive_569 : ym_constructive_569_truncation_statement := by
  exact ym_constructive_decl_bundle.h569

theorem ym_constructive_570 : ym_constructive_570_closure_package_statement := by
  exact ym_constructive_569

theorem ym_constructive_574A : ym_constructive_574A_bridge_statement := by
  exact ym_constructive_decl_bundle.h574.1

theorem ym_constructive_574 : ym_constructive_574_extension_statement := by
  exact ym_constructive_decl_bundle.h574.2

theorem ym_constructive_575 :
  ym_constructive_574_extension_statement ->
  ym_constructive_575_compatibility_statement := by
  intro _
  exact
    ym_constructive_sharp_local_bounded_state_compatibility_ready_holds
      ym_constructive_manuscript_carrier_base

theorem ym_constructive_576 :
  ym_constructive_576_union_statement := by
  exact ym_constructive_decl_bundle.h576

theorem ym_constructive_577 :
  ym_constructive_576_union_statement ->
  ym_constructive_577_cyclicity_statement := by
  intro h577
  exact h577

theorem ym_constructive_decl_hunion :
  ym_constructive_decl_inductive_union_ready := by
  exact ym_constructive_576

theorem ym_constructive_decl_hcompat :
  ym_constructive_decl_bounded_state_compatibility_ready := by
  exact ym_constructive_575 ym_constructive_574

abbrev ym_constructive_decl_constructive_part : Prop :=
  ym_constructive_decl_flowed_state_ready /\
  ym_constructive_decl_finite_truncation_ready /\
  ym_constructive_decl_finite_cap_extension_ready /\
  ym_constructive_decl_cyclicity_ready /\
  ym_constructive_decl_finite_cap_bridge_ready /\
  ym_constructive_decl_bounded_state_compatibility_ready /\
  ym_constructive_decl_inductive_union_ready
abbrev ym_constructive_decl_truncation_window_ready : Prop :=
  YMConstructiveTruncationWindowReady ym_constructive_manuscript_carrier_base
abbrev ym_constructive_decl_finite_cap_extension_package_ready : Prop :=
  YMConstructiveFiniteCapExtensionPackageReady ym_constructive_manuscript_carrier_base
abbrev ym_constructive_decl_positive_bridge_ready : Prop :=
  YMConstructivePositiveBridgeReady ym_constructive_manuscript_carrier_base
abbrev ym_constructive_decl_sharp_local_bounded_state_compatibility_ready : Prop :=
  YMConstructiveSharpLocalBoundedStateCompatibilityReady
    ym_constructive_manuscript_carrier_base
abbrev ym_constructive_decl_sharp_local_inductive_union_ready : Prop :=
  YMConstructiveSharpLocalInductiveUnionReady
    ym_constructive_manuscript_carrier_base

theorem ym_constructive_decl_build_constructive_part :
  ym_constructive_decl_flowed_state_ready ->
  ym_constructive_decl_finite_truncation_ready ->
  ym_constructive_decl_finite_cap_extension_ready ->
  ym_constructive_decl_cyclicity_ready ->
  ym_constructive_decl_finite_cap_bridge_ready ->
  ym_constructive_decl_bounded_state_compatibility_ready ->
  ym_constructive_decl_inductive_union_ready ->
  ym_constructive_decl_constructive_part := by
  intro hFlow hTrunc hExt hCyc hBridge hCompat hUnion
  exact
    And.intro hFlow <|
      And.intro hTrunc <|
        And.intro hExt <|
          And.intro hCyc <|
            And.intro hBridge <|
              And.intro hCompat hUnion

theorem ym_constructive_decl_truncation_yields_finite_cap_window :
  ym_constructive_decl_finite_truncation_ready ->
  ym_constructive_decl_truncation_window_ready := by
  intro _
  exact ym_constructive_truncation_window_ready_holds ym_constructive_manuscript_carrier_base

theorem ym_constructive_decl_finite_cap_extension_exhibits_bridge :
  ym_constructive_decl_finite_cap_extension_ready ->
  ym_constructive_decl_positive_bridge_ready := by
  intro _
  exact ym_constructive_positive_bridge_ready_holds ym_constructive_manuscript_carrier_base

theorem ym_constructive_decl_finite_cap_extension_exhibits_package :
  ym_constructive_decl_finite_cap_extension_ready ->
  ym_constructive_decl_finite_cap_extension_package_ready := by
  intro _
  exact
    ym_constructive_finite_cap_extension_package_ready_holds
      ym_constructive_manuscript_carrier_base

theorem ym_constructive_decl_compatibility_exhibits_sharp_local :
  ym_constructive_decl_bounded_state_compatibility_ready ->
  ym_constructive_decl_sharp_local_bounded_state_compatibility_ready := by
  intro _
  exact
    ym_constructive_sharp_local_bounded_state_compatibility_ready_holds
      ym_constructive_manuscript_carrier_base

theorem ym_constructive_decl_inductive_union_exhibits_sharp_local :
  ym_constructive_decl_inductive_union_ready ->
  ym_constructive_decl_sharp_local_inductive_union_ready := by
  intro _
  exact
    ym_constructive_sharp_local_inductive_union_ready_holds
      ym_constructive_manuscript_carrier_base

theorem ym_constructive_decl_inductive_union_extends_bounded_base :
  ym_constructive_decl_inductive_union_ready ->
  YMConstructive576ExtensionPayload ym_constructive_manuscript_carrier_base := by
  intro hUnion
  exact hUnion

noncomputable def ym_constructive_manuscript_witness_data :
  YMConstructiveManuscriptWitnessData ym_constructive_manuscript_carrier_base :=
  { flowed_state_ready := ym_constructive_decl_flowed_state_ready
    finite_truncation_ready := ym_constructive_decl_finite_truncation_ready
    finite_cap_extension_ready := ym_constructive_decl_finite_cap_extension_ready
    cyclicity_ready := ym_constructive_decl_cyclicity_ready
    finite_cap_bridge_ready := ym_constructive_decl_finite_cap_bridge_ready
    bounded_state_compatibility_ready := ym_constructive_decl_bounded_state_compatibility_ready
    inductive_union_ready := ym_constructive_decl_inductive_union_ready
    htrunc := ym_constructive_decl_htrunc
    hext := ym_constructive_decl_hext
    hcompat := ym_constructive_decl_hcompat
    hunion := ym_constructive_decl_hunion
    constructive_part := ym_constructive_decl_constructive_part
    truncation_window_ready := ym_constructive_decl_truncation_window_ready
    finite_cap_extension_package_ready := ym_constructive_decl_finite_cap_extension_package_ready
    positive_bridge_ready := ym_constructive_decl_positive_bridge_ready
    sharp_local_bounded_state_compatibility_ready :=
      ym_constructive_decl_sharp_local_bounded_state_compatibility_ready
    sharp_local_inductive_union_ready :=
      ym_constructive_decl_sharp_local_inductive_union_ready
    build_constructive_part := ym_constructive_decl_build_constructive_part
    truncation_yields_finite_cap_window :=
      ym_constructive_decl_truncation_yields_finite_cap_window
    finite_cap_extension_exhibits_bridge :=
      ym_constructive_decl_finite_cap_extension_exhibits_bridge
    finite_cap_extension_exhibits_package :=
      ym_constructive_decl_finite_cap_extension_exhibits_package
    compatibility_exhibits_sharp_local :=
      ym_constructive_decl_compatibility_exhibits_sharp_local
    inductive_union_exhibits_sharp_local :=
      ym_constructive_decl_inductive_union_exhibits_sharp_local
    inductive_union_extends_bounded_base :=
      ym_constructive_decl_inductive_union_extends_bounded_base }

noncomputable def ym_constructive_manuscript_object :
  YMConstructiveManuscriptObject :=
  ym_constructive_manuscript_witness_data.toConstructiveManuscriptObject

theorem ym_constructive_manuscript_object_named_inhabitants :
  ym_constructive_manuscript_object.DeltaMax = DeltaMax /\
  ym_constructive_manuscript_object.finite_cap_bridge = constructive_finite_cap_bridge /\
  ym_constructive_manuscript_object.bounded_base_one = constructive_bounded_base_one /\
  ym_constructive_manuscript_object.omega_bd = constructive_omega_bd /\
  ym_constructive_manuscript_object.omega_sharp = constructive_omega_sharp := by
  simpa [ym_constructive_manuscript_object] using
    YangMillsConstructiveManuscriptWitnessDataStatement ym_constructive_manuscript_witness_data

end MaleyLean
