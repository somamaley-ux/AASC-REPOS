import MaleyLean.Papers.YangMills.Kernel.ConstructiveChosenSiteExecutionTrace

namespace MaleyLean

/-- Primitive finite-cap construction stage for the constructive heart. -/
structure YMConstructiveFiniteCapConstructionStage (R : YMConstructiveRoute) where
  trace : YMConstructiveChosenSiteExecutionTrace R
  chosen_window := trace.chosen_window
  chosen_bridge_map := trace.chosen_bridge_map
  constructed_extension_data := trace.chosen_extension_data
  extension_construction :
    trace.certificates.law_atoms.interface.bundle.extend_finite_cap
      chosen_window
      chosen_bridge_map =
    constructed_extension_data

def YangMillsConstructiveFiniteCapConstructionStageData
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
  YMConstructiveFiniteCapConstructionStage R := by
  let T :=
    YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { trace := T
      extension_construction := T.certificates.extension_application }

theorem YangMillsConstructiveFiniteCapConstructionStageExportStatement
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
  Nonempty (YMConstructiveFiniteCapConstructionStage R) /\
  ((YangMillsConstructiveFiniteCapConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData).trace.certificates.law_atoms.interface.bundle.extend_finite_cap
      (YangMillsConstructiveFiniteCapConstructionStageData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_window
      (YangMillsConstructiveFiniteCapConstructionStageData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bridge_map =
    (YangMillsConstructiveFiniteCapConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData).constructed_extension_data) := by
  let T :=
    YangMillsConstructiveFiniteCapConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact And.intro (Nonempty.intro T) T.extension_construction

end MaleyLean
