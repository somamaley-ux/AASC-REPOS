import MaleyLean.Papers.YangMills.Kernel.ConstructiveOperatorApplicationCertificates

namespace MaleyLean

/-- Explicit chosen-site constructive inputs and outputs carried by the current operator layer. -/
structure YMConstructiveChosenSiteExecutionTrace (R : YMConstructiveRoute) where
  certificates : YMConstructiveOperatorApplicationCertificates R
  chosen_window := certificates.law_atoms.interface.chosen_window
  chosen_bridge_map := certificates.law_atoms.interface.chosen_bridge_map
  chosen_extension_data := certificates.law_atoms.interface.chosen_extension_data
  chosen_bounded_base := certificates.law_atoms.interface.chosen_bounded_base
  chosen_bounded_state := certificates.law_atoms.interface.chosen_bounded_state
  chosen_inductive_union := certificates.law_atoms.interface.chosen_inductive_union
  chosen_sharp_local_state := certificates.law_atoms.interface.chosen_sharp_local_state

def YangMillsConstructiveChosenSiteExecutionTraceData
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
  YMConstructiveChosenSiteExecutionTrace R := by
  exact
    { certificates :=
        YangMillsConstructiveOperatorApplicationCertificatesData
          R htrunc hext hcompat hunion win bridge base state unionData }

theorem YangMillsConstructiveChosenSiteExecutionTraceExportStatement
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
  Nonempty (YMConstructiveChosenSiteExecutionTrace R) /\
  ((YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData).certificates.law_atoms.interface.bundle.extend_finite_cap
      (YangMillsConstructiveChosenSiteExecutionTraceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_window
      (YangMillsConstructiveChosenSiteExecutionTraceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bridge_map =
    (YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData).chosen_extension_data) /\
  ((YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData).certificates.law_atoms.interface.bundle.assemble_sharp_local_state
      (YangMillsConstructiveChosenSiteExecutionTraceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_base
      (YangMillsConstructiveChosenSiteExecutionTraceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_state
      (YangMillsConstructiveChosenSiteExecutionTraceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_inductive_union =
    (YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData).chosen_sharp_local_state) := by
  let T :=
    YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    And.intro (Nonempty.intro T) <|
      And.intro T.certificates.extension_application T.certificates.sharp_local_application

end MaleyLean
