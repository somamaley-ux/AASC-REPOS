import MaleyLean.Papers.YangMills.Kernel.ConstructiveCore
import MaleyLean.Papers.YangMills.Kernel.SharpLocalConstructionPayload

namespace MaleyLean

/--
The sharp-local construction payload needed by Lane A.

This names the mathematical content of passing from finite-cap data and a
bounded compatible state to a full sharp-local inductive-union state.
-/
structure YMSharpLocalConstructionConclusion where
  BoundedBaseAlgebra : Type
  FiniteCapSystem : Type
  SharpLocalAlgebra : Type
  SharpLocalState : Type
  finite_cap_extension_ready : Prop
  positive_unital_bridge_ready : Prop
  bounded_state_compatible : Prop
  inductive_union_constructed : Prop
  sharp_local_extends_bounded_base : Prop

def YMSharpLocalConstructionConclusion.closed
    (C : YMSharpLocalConstructionConclusion) :
    Prop :=
  C.finite_cap_extension_ready /\
  C.positive_unital_bridge_ready /\
  C.bounded_state_compatible /\
  C.inductive_union_constructed /\
  C.sharp_local_extends_bounded_base

/--
Bridge from the explicit sharp-local construction payload to the existing
route-facing sharp-local conclusion socket.
-/
structure YMSharpLocalConstructionPayloadBridge where
  payload : Papers.YangMills.YMSharpLocalConstructionPayload
  conclusion : YMSharpLocalConstructionConclusion
  finite_cap_extension_from_payload :
    payload.finite_cap.finite_cap_extension_ready ->
      conclusion.finite_cap_extension_ready
  positive_bridge_from_payload :
    payload.bounded_bridge.positive_unital_bridge_ready ->
      conclusion.positive_unital_bridge_ready
  bounded_compatibility_from_payload :
    payload.bounded_bridge.bounded_state_compatible ->
      conclusion.bounded_state_compatible
  inductive_union_from_payload :
    payload.inductive_union.inductive_union_constructed ->
      conclusion.inductive_union_constructed
  extends_bounded_base_from_payload :
    payload.inductive_union.sharp_local_extends_bounded_base ->
      conclusion.sharp_local_extends_bounded_base

theorem YMSharpLocalConstructionPayloadBridge.closed
    (B : YMSharpLocalConstructionPayloadBridge) :
    B.conclusion.closed := by
  exact
    And.intro
      (B.finite_cap_extension_from_payload
        B.payload.finite_cap.finite_cap_extension_ready_holds)
      (And.intro
        (B.positive_bridge_from_payload
          B.payload.bounded_bridge.positive_unital_bridge_ready_holds)
        (And.intro
          (B.bounded_compatibility_from_payload
            B.payload.bounded_bridge.bounded_state_compatible_holds)
          (And.intro
            (B.inductive_union_from_payload
              B.payload.inductive_union.inductive_union_constructed_holds)
            (B.extends_bounded_base_from_payload
              B.payload.inductive_union.sharp_local_extends_bounded_base_holds))))

/--
Hypotheses for the standard sharp-local extension and inductive-union theorem.
-/
structure YMSharpLocalConstructionHypotheses where
  flowed_state_ready : Prop
  finite_truncation_ready : Prop
  finite_cap_extension_ready : Prop
  finite_cap_bridge_ready : Prop
  bounded_state_compatibility_ready : Prop
  cyclicity_ready : Prop
  finite_cap_coherence_external : Prop
  inductive_system_coherence_external : Prop

def YMSharpLocalConstructionHypotheses.complete
    (H : YMSharpLocalConstructionHypotheses) :
    Prop :=
  H.flowed_state_ready /\
  H.finite_truncation_ready /\
  H.finite_cap_extension_ready /\
  H.finite_cap_bridge_ready /\
  H.bounded_state_compatibility_ready /\
  H.cyclicity_ready /\
  H.finite_cap_coherence_external /\
  H.inductive_system_coherence_external

/--
Standard sharp-local theorem import.  This is the theorem-shaped socket for the
finite-cap extension, positive bridge, bounded-state compatibility, and
inductive-union construction.
-/
structure YMStandardSharpLocalConstructionTransfer where
  hypotheses : YMSharpLocalConstructionHypotheses
  conclusion : YMSharpLocalConstructionConclusion
  transfer :
    hypotheses.complete -> conclusion.closed

/--
Standard-import contract for the sharp-local construction row.

The manuscript/library import must provide the construction payload, the
payload-to-conclusion bridge, and the standard transfer theorem as one coherent
package.  The coherence fields record that the bridge and transfer are tied to
the same manuscript payload/conclusion; this contract does not create those
objects by itself.
-/
structure YMStandardSharpLocalConstructionImport where
  payload : Papers.YangMills.YMSharpLocalConstructionPayload
  payload_bridge : YMSharpLocalConstructionPayloadBridge
  standard_transfer : YMStandardSharpLocalConstructionTransfer
  source_document_key : String
  source_labels : List String
  payload_bridge_matches_payload :
    payload_bridge.payload = payload
  transfer_conclusion_matches_bridge :
    standard_transfer.conclusion = payload_bridge.conclusion
  source_matches_manuscript : Prop
  source_matches_manuscript_verified : source_matches_manuscript

theorem YMStandardSharpLocalConstructionImport.payload_nonempty
    (I : YMStandardSharpLocalConstructionImport) :
    Nonempty Papers.YangMills.YMSharpLocalConstructionPayload := by
  exact Nonempty.intro I.payload

theorem YMStandardSharpLocalConstructionImport.payload_bridge_nonempty
    (I : YMStandardSharpLocalConstructionImport) :
    Nonempty YMSharpLocalConstructionPayloadBridge := by
  exact Nonempty.intro I.payload_bridge

theorem YMStandardSharpLocalConstructionImport.standard_transfer_nonempty
    (I : YMStandardSharpLocalConstructionImport) :
    Nonempty YMStandardSharpLocalConstructionTransfer := by
  exact Nonempty.intro I.standard_transfer

theorem ymSharpLocalConstructionPayload_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty Papers.YangMills.YMSharpLocalConstructionPayload := by
  rcases hImport with ⟨I⟩
  exact I.payload_nonempty

theorem ymSharpLocalConstructionPayloadBridge_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMSharpLocalConstructionPayloadBridge := by
  rcases hImport with ⟨I⟩
  exact I.payload_bridge_nonempty

theorem ymStandardSharpLocalConstructionTransfer_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMStandardSharpLocalConstructionTransfer := by
  rcases hImport with ⟨I⟩
  exact I.standard_transfer_nonempty

structure YMSharpLocalHypothesisMap
    (RC : YMConstructiveRoute) where
  flowed_state_ready :
    RC.flowed_state_ready
  finite_truncation_ready :
    RC.finite_truncation_ready
  finite_cap_extension_ready :
    RC.finite_cap_extension_ready
  finite_cap_bridge_ready :
    RC.finite_cap_bridge_ready
  bounded_state_compatibility_ready :
    RC.bounded_state_compatibility_ready
  cyclicity_ready :
    RC.cyclicity_ready
  finite_cap_coherence_external :
    Prop
  inductive_system_coherence_external :
    Prop

def YMSharpLocalHypothesisMap.externalComplete
    {RC : YMConstructiveRoute}
    (M : YMSharpLocalHypothesisMap RC) :
    Prop :=
  M.finite_cap_coherence_external /\
  M.inductive_system_coherence_external

def YMSharpLocalHypothesisMap.toTransferHypotheses
    {RC : YMConstructiveRoute}
    (M : YMSharpLocalHypothesisMap RC) :
    YMSharpLocalConstructionHypotheses where
  flowed_state_ready := RC.flowed_state_ready
  finite_truncation_ready := RC.finite_truncation_ready
  finite_cap_extension_ready := RC.finite_cap_extension_ready
  finite_cap_bridge_ready := RC.finite_cap_bridge_ready
  bounded_state_compatibility_ready :=
    RC.bounded_state_compatibility_ready
  cyclicity_ready := RC.cyclicity_ready
  finite_cap_coherence_external := M.finite_cap_coherence_external
  inductive_system_coherence_external :=
    M.inductive_system_coherence_external

theorem YMSharpLocalHypothesisMap.completeTransferHypotheses
    {RC : YMConstructiveRoute}
    (M : YMSharpLocalHypothesisMap RC)
    (hexternal : M.externalComplete) :
    M.toTransferHypotheses.complete := by
  exact
    And.intro M.flowed_state_ready <|
      And.intro M.finite_truncation_ready <|
        And.intro M.finite_cap_extension_ready <|
          And.intro M.finite_cap_bridge_ready <|
            And.intro M.bounded_state_compatibility_ready <|
              And.intro M.cyclicity_ready <|
                And.intro hexternal.1 hexternal.2

def YMSharpLocalHypothesisMap.fromReadiness
    (RC : YMConstructiveRoute)
    (hflowed : RC.flowed_state_ready)
    (htrunc : RC.finite_truncation_ready)
    (hext : RC.finite_cap_extension_ready)
    (hbridge : RC.finite_cap_bridge_ready)
    (hcompat : RC.bounded_state_compatibility_ready)
    (hcyc : RC.cyclicity_ready)
    (finite_cap_coherence_external : Prop)
    (inductive_system_coherence_external : Prop) :
    YMSharpLocalHypothesisMap RC where
  flowed_state_ready := hflowed
  finite_truncation_ready := htrunc
  finite_cap_extension_ready := hext
  finite_cap_bridge_ready := hbridge
  bounded_state_compatibility_ready := hcompat
  cyclicity_ready := hcyc
  finite_cap_coherence_external := finite_cap_coherence_external
  inductive_system_coherence_external := inductive_system_coherence_external

structure YMRouteSharpLocalConstructionImport
    (RC : YMConstructiveRoute) where
  standard_sharp_local : YMStandardSharpLocalConstructionTransfer
  hypotheses_verified :
    standard_sharp_local.hypotheses.complete
  route_finite_cap_extension_from_standard :
    standard_sharp_local.conclusion.closed ->
      RC.finite_cap_package.finite_cap_extension_ready
  route_positive_bridge_from_standard :
    standard_sharp_local.conclusion.closed ->
      RC.finite_cap_package.positive_bridge_ready
  route_bounded_compatibility_from_standard :
    standard_sharp_local.conclusion.closed ->
      RC.sharp_local_package.bounded_state_compatibility_ready
  route_inductive_union_from_standard :
    standard_sharp_local.conclusion.closed ->
      RC.sharp_local_package.inductive_union_ready
  route_extends_bounded_base_from_standard :
    standard_sharp_local.conclusion.closed ->
      RC.sharp_local_package.sharp_local_state.extends_bounded_base

theorem YMRouteSharpLocalConstructionImport.dischargeSharpLocalOutputs
    {RC : YMConstructiveRoute}
    (I : YMRouteSharpLocalConstructionImport RC) :
    RC.finite_cap_package.finite_cap_extension_ready /\
    RC.finite_cap_package.positive_bridge_ready /\
    RC.sharp_local_package.bounded_state_compatibility_ready /\
    RC.sharp_local_package.inductive_union_ready /\
    RC.sharp_local_package.sharp_local_state.extends_bounded_base := by
  have hclosed := I.standard_sharp_local.transfer I.hypotheses_verified
  exact
    And.intro (I.route_finite_cap_extension_from_standard hclosed) <|
      And.intro (I.route_positive_bridge_from_standard hclosed) <|
        And.intro (I.route_bounded_compatibility_from_standard hclosed) <|
          And.intro
            (I.route_inductive_union_from_standard hclosed)
            (I.route_extends_bounded_base_from_standard hclosed)

def YMRouteSharpLocalConstructionImport.fromHypothesisMap
    {RC : YMConstructiveRoute}
    (M : YMSharpLocalHypothesisMap RC)
    (standard_sharp_local : YMStandardSharpLocalConstructionTransfer)
    (hstandard :
      standard_sharp_local.hypotheses = M.toTransferHypotheses)
    (hexternal : M.externalComplete)
    (route_finite_cap_extension_from_standard :
      standard_sharp_local.conclusion.closed ->
        RC.finite_cap_package.finite_cap_extension_ready)
    (route_positive_bridge_from_standard :
      standard_sharp_local.conclusion.closed ->
        RC.finite_cap_package.positive_bridge_ready)
    (route_bounded_compatibility_from_standard :
      standard_sharp_local.conclusion.closed ->
        RC.sharp_local_package.bounded_state_compatibility_ready)
    (route_inductive_union_from_standard :
      standard_sharp_local.conclusion.closed ->
        RC.sharp_local_package.inductive_union_ready)
    (route_extends_bounded_base_from_standard :
      standard_sharp_local.conclusion.closed ->
        RC.sharp_local_package.sharp_local_state.extends_bounded_base) :
    YMRouteSharpLocalConstructionImport RC where
  standard_sharp_local := standard_sharp_local
  hypotheses_verified := by
    rw [hstandard]
    exact M.completeTransferHypotheses hexternal
  route_finite_cap_extension_from_standard :=
    route_finite_cap_extension_from_standard
  route_positive_bridge_from_standard := route_positive_bridge_from_standard
  route_bounded_compatibility_from_standard :=
    route_bounded_compatibility_from_standard
  route_inductive_union_from_standard := route_inductive_union_from_standard
  route_extends_bounded_base_from_standard :=
    route_extends_bounded_base_from_standard

end MaleyLean
