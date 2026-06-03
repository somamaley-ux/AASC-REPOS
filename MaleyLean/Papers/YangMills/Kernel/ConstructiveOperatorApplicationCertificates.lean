import MaleyLean.Papers.YangMills.Kernel.ConstructiveOperatorPrimitives

namespace MaleyLean

/-- Chosen-site application certificates for the primitive constructive operators. -/
structure YMConstructiveOperatorApplicationCertificates (R : YMConstructiveRoute) where
  primitives_present : Nonempty (YMConstructiveOperatorPrimitives R)
  law_atoms : YMConstructiveChosenSiteLawAtoms R
  extension_application :
    law_atoms.interface.bundle.extend_finite_cap
      law_atoms.interface.chosen_window
      law_atoms.interface.chosen_bridge_map =
    law_atoms.interface.chosen_extension_data
  sharp_local_application :
    law_atoms.interface.bundle.assemble_sharp_local_state
      law_atoms.interface.chosen_bounded_base
      law_atoms.interface.chosen_bounded_state
      law_atoms.interface.chosen_inductive_union =
    law_atoms.interface.chosen_sharp_local_state

def YangMillsConstructiveOperatorApplicationCertificatesData
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
  YMConstructiveOperatorApplicationCertificates R := by
  let P := YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion
  let A :=
    YangMillsConstructiveChosenSiteLawAtomsData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { primitives_present := Nonempty.intro P
      law_atoms := A
      extension_application := by
        exact A.extension_relation
      sharp_local_application := by
        exact A.sharp_local_relation }

theorem YangMillsConstructiveOperatorApplicationCertificatesExportStatement
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
  Nonempty (YMConstructiveOperatorApplicationCertificates R) /\
  ((YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion).extend_operator
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_window
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bridge_map =
    (YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData).chosen_extension_data) /\
  ((YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion).assemble_operator
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_base
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_state
      (YangMillsConstructiveRelationalInterfaceData
        R htrunc hext hcompat hunion win bridge base state unionData).chosen_inductive_union =
    (YangMillsConstructiveRelationalInterfaceData
      R htrunc hext hcompat hunion win bridge base state unionData).chosen_sharp_local_state) := by
  let C :=
    YangMillsConstructiveOperatorApplicationCertificatesData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    And.intro (Nonempty.intro C) <|
      And.intro C.extension_application C.sharp_local_application

end MaleyLean
