import MaleyLean.Papers.YangMills.Kernel.ConstructiveBoundedStateConstructionStage

namespace MaleyLean

/-- Primitive inductive-union passage stage for the constructive heart. -/
structure YMConstructiveInductiveUnionConstructionStage (R : YMConstructiveRoute) where
  bounded_state_stage : YMConstructiveBoundedStateConstructionStage R
  chosen_inductive_union := bounded_state_stage.trace.chosen_inductive_union
  constructed_sharp_local_state := bounded_state_stage.constructed_sharp_local_state
  inductive_union_ready_certificate :
    R.sharp_local_package.inductive_union_ready
  sharp_local_extension_witness :
    R.sharp_local_package.sharp_local_state.extends_bounded_base

def YangMillsConstructiveInductiveUnionConstructionStageData
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
  YMConstructiveInductiveUnionConstructionStage R := by
  let S := YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion
  let B :=
    YangMillsConstructiveBoundedStateConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { bounded_state_stage := B
      inductive_union_ready_certificate := S.inductive_union_ready
      sharp_local_extension_witness := S.bounded_base_extension }

theorem YangMillsConstructiveInductiveUnionConstructionStageExportStatement
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
  Nonempty (YMConstructiveInductiveUnionConstructionStage R) /\
  R.sharp_local_package.inductive_union_ready /\
  R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  let T :=
    YangMillsConstructiveInductiveUnionConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    And.intro (Nonempty.intro T) <|
      And.intro T.inductive_union_ready_certificate T.sharp_local_extension_witness

end MaleyLean
