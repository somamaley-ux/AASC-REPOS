import MaleyLean.Papers.YangMills.Kernel.ConstructiveChosenSiteExecutionTrace

namespace MaleyLean

/-- Primitive bounded-state assembly stage for the constructive heart. -/
structure YMConstructiveBoundedStateConstructionStage (R : YMConstructiveRoute) where
  trace : YMConstructiveChosenSiteExecutionTrace R
  chosen_bounded_base := trace.chosen_bounded_base
  chosen_bounded_state := trace.chosen_bounded_state
  chosen_inductive_union := trace.chosen_inductive_union
  constructed_sharp_local_state := trace.chosen_sharp_local_state
  bounded_state_assembly :
    trace.certificates.law_atoms.interface.bundle.assemble_sharp_local_state
      chosen_bounded_base
      chosen_bounded_state
      chosen_inductive_union =
    constructed_sharp_local_state

def YangMillsConstructiveBoundedStateConstructionStageData
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
  YMConstructiveBoundedStateConstructionStage R := by
  let T :=
    YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { trace := T
      bounded_state_assembly := T.certificates.sharp_local_application }

theorem YangMillsConstructiveBoundedStateConstructionStageExportStatement
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
  Nonempty (YMConstructiveBoundedStateConstructionStage R) /\
  ((YangMillsConstructiveBoundedStateConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData).trace.certificates.law_atoms.interface.bundle.assemble_sharp_local_state
      (YangMillsConstructiveBoundedStateConstructionStageData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_base
      (YangMillsConstructiveBoundedStateConstructionStageData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_state
      (YangMillsConstructiveBoundedStateConstructionStageData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_inductive_union =
    (YangMillsConstructiveBoundedStateConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData).constructed_sharp_local_state) := by
  let T :=
    YangMillsConstructiveBoundedStateConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact And.intro (Nonempty.intro T) T.bounded_state_assembly

end MaleyLean
