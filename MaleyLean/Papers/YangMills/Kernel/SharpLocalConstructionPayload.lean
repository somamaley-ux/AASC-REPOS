namespace MaleyLean
namespace Papers
namespace YangMills

/--
Finite-cap construction data for the sharp-local local-net build.
-/
structure YMFiniteCapConstructionPayload where
  BoundedBaseAlgebra : Type
  FiniteCapSystem : Type
  finite_cap_extension_ready : Prop
  finite_cap_extension_ready_holds : finite_cap_extension_ready
  finite_cap_coherent : Prop
  finite_cap_coherent_holds : finite_cap_coherent

def YMFiniteCapConstructionPayload.closed
    (P : YMFiniteCapConstructionPayload) :
    Prop :=
  P.finite_cap_extension_ready /\ P.finite_cap_coherent

theorem YMFiniteCapConstructionPayload.closed_holds
    (P : YMFiniteCapConstructionPayload) :
    P.closed := by
  exact And.intro
    P.finite_cap_extension_ready_holds
    P.finite_cap_coherent_holds

/--
Positive bridge and bounded-state compatibility data from bounded base to the
finite-cap/sharp-local system.
-/
structure YMBoundedStateBridgePayload where
  BoundedBaseAlgebra : Type
  FiniteCapSystem : Type
  SharpLocalAlgebra : Type
  positive_unital_bridge_ready : Prop
  positive_unital_bridge_ready_holds : positive_unital_bridge_ready
  bounded_state_compatible : Prop
  bounded_state_compatible_holds : bounded_state_compatible

def YMBoundedStateBridgePayload.closed
    (P : YMBoundedStateBridgePayload) :
    Prop :=
  P.positive_unital_bridge_ready /\ P.bounded_state_compatible

theorem YMBoundedStateBridgePayload.closed_holds
    (P : YMBoundedStateBridgePayload) :
    P.closed := by
  exact And.intro
    P.positive_unital_bridge_ready_holds
    P.bounded_state_compatible_holds

/--
Inductive-union passage for sharp-local states.
-/
structure YMSharpLocalInductiveUnionPayload where
  FiniteCapSystem : Type
  SharpLocalAlgebra : Type
  SharpLocalState : Type
  inductive_system_coherent : Prop
  inductive_system_coherent_holds : inductive_system_coherent
  inductive_union_constructed : Prop
  inductive_union_constructed_holds : inductive_union_constructed
  sharp_local_extends_bounded_base : Prop
  sharp_local_extends_bounded_base_holds :
    sharp_local_extends_bounded_base

def YMSharpLocalInductiveUnionPayload.closed
    (P : YMSharpLocalInductiveUnionPayload) :
    Prop :=
  P.inductive_system_coherent /\
    P.inductive_union_constructed /\
    P.sharp_local_extends_bounded_base

theorem YMSharpLocalInductiveUnionPayload.closed_holds
    (P : YMSharpLocalInductiveUnionPayload) :
    P.closed := by
  exact And.intro
    P.inductive_system_coherent_holds
    (And.intro
      P.inductive_union_constructed_holds
      P.sharp_local_extends_bounded_base_holds)

/--
Full sharp-local construction payload before it is identified with the
route-facing standard theorem socket.
-/
structure YMSharpLocalConstructionPayload where
  finite_cap : YMFiniteCapConstructionPayload
  bounded_bridge : YMBoundedStateBridgePayload
  inductive_union : YMSharpLocalInductiveUnionPayload

namespace YMSharpLocalConstructionPayload

theorem finite_cap_closed
    (P : YMSharpLocalConstructionPayload) :
    P.finite_cap.closed := by
  exact P.finite_cap.closed_holds

theorem bounded_bridge_closed
    (P : YMSharpLocalConstructionPayload) :
    P.bounded_bridge.closed := by
  exact P.bounded_bridge.closed_holds

theorem inductive_union_closed
    (P : YMSharpLocalConstructionPayload) :
    P.inductive_union.closed := by
  exact P.inductive_union.closed_holds

theorem closed
    (P : YMSharpLocalConstructionPayload) :
    P.finite_cap.finite_cap_extension_ready /\
      P.bounded_bridge.positive_unital_bridge_ready /\
      P.bounded_bridge.bounded_state_compatible /\
      P.inductive_union.inductive_union_constructed /\
      P.inductive_union.sharp_local_extends_bounded_base := by
  exact
    And.intro
      P.finite_cap.finite_cap_extension_ready_holds
      (And.intro
        P.bounded_bridge.positive_unital_bridge_ready_holds
        (And.intro
          P.bounded_bridge.bounded_state_compatible_holds
          (And.intro
            P.inductive_union.inductive_union_constructed_holds
            P.inductive_union.sharp_local_extends_bounded_base_holds)))

end YMSharpLocalConstructionPayload

end YangMills
end Papers
end MaleyLean
