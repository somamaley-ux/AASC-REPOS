import MaleyLean.Papers.YangMills.Kernel.ConstructiveNativeProofHomes

namespace MaleyLean

/-- Atomic chosen-site law support object for the constructive heart. -/
structure YMConstructiveChosenSiteLawAtoms (R : YMConstructiveRoute) where
  interface : YMConstructiveRelationalInterface R
  extension_relation :
    interface.bundle.extend_finite_cap
      interface.chosen_window
      interface.chosen_bridge_map =
    interface.chosen_extension_data
  sharp_local_relation :
    interface.bundle.assemble_sharp_local_state
      interface.chosen_bounded_base
      interface.chosen_bounded_state
      interface.chosen_inductive_union =
    interface.chosen_sharp_local_state

def YangMillsConstructiveChosenSiteLawAtomsData
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
  YMConstructiveChosenSiteLawAtoms R := by
  let I :=
    YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData
  let P :=
    YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { interface := I
      extension_relation := I.extension_relation
      sharp_local_relation := I.sharp_local_relation }

theorem YangMillsConstructiveChosenSiteLawAtomsExportStatement
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
  Nonempty (YMConstructiveChosenSiteLawAtoms R) /\
  ((YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData).bundle.extend_finite_cap
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_window
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bridge_map =
    (YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData).chosen_extension_data) /\
  ((YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData).bundle.assemble_sharp_local_state
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_base
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_state
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_inductive_union =
    (YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData).chosen_sharp_local_state) := by
  let A :=
    YangMillsConstructiveChosenSiteLawAtomsData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    And.intro (Nonempty.intro A) <|
      And.intro A.extension_relation A.sharp_local_relation

end MaleyLean
