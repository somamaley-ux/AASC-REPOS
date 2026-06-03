import MaleyLean.Papers.YangMills.Kernel.ConstructiveChosenSiteLawAtoms

namespace MaleyLean

/-- Primitive constructive operators underlying the current semantic bundle. -/
structure YMConstructiveOperatorPrimitives (R : YMConstructiveRoute) where
  bundle : YMConstructiveSemanticBundle R
  extend_operator :
    bundle.finite_cap_window -> bundle.positive_bridge_map -> bundle.finite_cap_extension_data
  assemble_operator :
    bundle.bounded_base_carrier ->
    bundle.bounded_state_data ->
    bundle.inductive_union_data ->
    YMSharpLocalState

def YangMillsConstructiveOperatorPrimitivesData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  YMConstructiveOperatorPrimitives R := by
  let B := YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion
  exact
    { bundle := B
      extend_operator := B.extend_finite_cap
      assemble_operator := B.assemble_sharp_local_state }

theorem YangMillsConstructiveOperatorPrimitivesExportStatement
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
  Nonempty (YMConstructiveOperatorPrimitives R) /\
  (YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion).extend_operator
      win
      bridge =
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).extend_finite_cap
      win
      bridge /\
  (YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion).assemble_operator
      base
      state
      unionData =
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).assemble_sharp_local_state
      base
      state
      unionData := by
  let P := YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion
  exact And.intro (Nonempty.intro P) <| And.intro rfl rfl

end MaleyLean
