import MaleyLean.Papers.YangMills.Kernel.ConstructiveFiniteCapConstructionStage
import MaleyLean.Papers.YangMills.Kernel.ConstructiveBoundedStateConstructionStage
import MaleyLean.Papers.YangMills.Kernel.ConstructiveInductiveUnionConstructionStage
import MaleyLean.Papers.YangMills.Kernel.ConstructiveSharpLocalConstructionStage

namespace MaleyLean

/-- Aggregate primitive-construction package for the constructive heart. -/
structure YMConstructivePrimitiveConstructions (R : YMConstructiveRoute) where
  finite_cap_stage : YMConstructiveFiniteCapConstructionStage R
  bounded_state_stage : YMConstructiveBoundedStateConstructionStage R
  inductive_union_stage : YMConstructiveInductiveUnionConstructionStage R
  sharp_local_stage : YMConstructiveSharpLocalConstructionStage R

def YangMillsConstructivePrimitiveConstructionsData
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
  YMConstructivePrimitiveConstructions R := by
  exact
    { finite_cap_stage :=
        YangMillsConstructiveFiniteCapConstructionStageData
          R htrunc hext hcompat hunion win bridge base state unionData
      bounded_state_stage :=
        YangMillsConstructiveBoundedStateConstructionStageData
          R htrunc hext hcompat hunion win bridge base state unionData
      inductive_union_stage :=
        YangMillsConstructiveInductiveUnionConstructionStageData
          R htrunc hext hcompat hunion win bridge base state unionData
      sharp_local_stage :=
        YangMillsConstructiveSharpLocalConstructionStageData
          R htrunc hext hcompat hunion win bridge base state unionData }

theorem YangMillsConstructivePrimitiveConstructionsExportStatement
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
  Nonempty (YMConstructivePrimitiveConstructions R) /\
  Nonempty (YMConstructiveFiniteCapConstructionStage R) /\
  Nonempty (YMConstructiveBoundedStateConstructionStage R) /\
  Nonempty (YMConstructiveInductiveUnionConstructionStage R) /\
  Nonempty (YMConstructiveSharpLocalConstructionStage R) := by
  let C :=
    YangMillsConstructivePrimitiveConstructionsData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    And.intro (Nonempty.intro C) <|
      And.intro (Nonempty.intro C.finite_cap_stage) <|
        And.intro (Nonempty.intro C.bounded_state_stage) <|
          And.intro (Nonempty.intro C.inductive_union_stage)
            (Nonempty.intro C.sharp_local_stage)

end MaleyLean
