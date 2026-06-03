import MaleyLean.Papers.YangMills.Kernel.ConstructiveSemanticBundle

namespace MaleyLean

/--
Constructive-side relational interface expressing that the bundled finite-cap
and sharp-local operations are organized around one chosen extension site and
one chosen sharp-local assembly site.
-/
structure YMConstructiveRelationalInterface (R : YMConstructiveRoute) where
  bundle : YMConstructiveSemanticBundle R
  chosen_window : bundle.finite_cap_window
  chosen_bridge_map : bundle.positive_bridge_map
  chosen_extension_data : bundle.finite_cap_extension_data
  chosen_bounded_base : bundle.bounded_base_carrier
  chosen_bounded_state : bundle.bounded_state_data
  chosen_inductive_union : bundle.inductive_union_data
  chosen_sharp_local_state : YMSharpLocalState
  extension_relation :
    bundle.extend_finite_cap chosen_window chosen_bridge_map = chosen_extension_data
  sharp_local_relation :
    bundle.assemble_sharp_local_state
      chosen_bounded_base
      chosen_bounded_state
      chosen_inductive_union = chosen_sharp_local_state

def YangMillsConstructiveRelationalInterfaceData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
  YMConstructiveRelationalInterface R := by
  let B := YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion
  refine
    { bundle := B
      chosen_window := win
      chosen_bridge_map := bridge
      chosen_extension_data := B.extend_finite_cap win bridge
      chosen_bounded_base := base
      chosen_bounded_state := state
      chosen_inductive_union := unionData
      chosen_sharp_local_state := B.assemble_sharp_local_state base state unionData
      extension_relation := rfl
      sharp_local_relation := rfl }

theorem YangMillsConstructiveRelationalInterfaceExistsStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
  Nonempty (YMConstructiveRelationalInterface R) := by
  exact
    ⟨YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData⟩

theorem YangMillsConstructiveRelationalCompatibilityStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
  Nonempty (YMConstructiveRelationalInterface R) /\
  R.finite_cap_package.finite_cap_extension_ready /\
  R.finite_cap_package.positive_bridge_ready /\
  R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  have hI :=
    YangMillsConstructiveRelationalInterfaceExistsStatement
      R htrunc hext hcompat hunion win bridge base state unionData
  have hB := YangMillsConstructiveCoreExhibitsNamedOutputsStatement R htrunc hext hcompat hunion
  exact And.intro hI <| And.intro hB.2.1 <| And.intro hB.2.2.1 hB.2.2.2.2.2

end MaleyLean
