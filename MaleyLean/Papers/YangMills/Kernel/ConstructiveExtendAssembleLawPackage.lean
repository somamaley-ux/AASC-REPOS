import MaleyLean.Papers.YangMills.Kernel.ConstructiveRelationalInterface

namespace MaleyLean

/--
Structured constructive-side law package organizing finite-cap extension and
sharp-local assembly around one chosen relational evaluation site.
-/
structure YMConstructiveExtendAssembleLawPackage (R : YMConstructiveRoute) where
  interface : YMConstructiveRelationalInterface R
  assemble_state :
    interface.bundle.bounded_base_carrier ->
    interface.bundle.bounded_state_data ->
    interface.bundle.inductive_union_data ->
    YMSharpLocalState
  extend_then_assemble :
    interface.bundle.finite_cap_window ->
    interface.bundle.positive_bridge_map ->
    interface.bundle.bounded_base_carrier ->
    interface.bundle.bounded_state_data ->
    interface.bundle.inductive_union_data ->
    YMSharpLocalState
  assembly_compatibility :
    forall win : interface.bundle.finite_cap_window,
      forall bridge : interface.bundle.positive_bridge_map,
        forall base : interface.bundle.bounded_base_carrier,
          forall state : interface.bundle.bounded_state_data,
            forall unionData : interface.bundle.inductive_union_data,
              extend_then_assemble win bridge base state unionData =
                assemble_state base state unionData
  chosen_site_law :
    extend_then_assemble
      interface.chosen_window
      interface.chosen_bridge_map
      interface.chosen_bounded_base
      interface.chosen_bounded_state
      interface.chosen_inductive_union =
      interface.chosen_sharp_local_state
  bounded_base_from_assembly :
    YMSharpLocalState ->
    R.sharp_local_package.sharp_local_state.extends_bounded_base
  bounded_base_witness : R.sharp_local_package.sharp_local_state.extends_bounded_base

def YangMillsConstructiveExtendAssembleLawPackageData
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
  YMConstructiveExtendAssembleLawPackage R := by
  let I := YangMillsConstructiveRelationalInterfaceData
    R htrunc hext hcompat hunion win bridge base state unionData
  refine
    { interface := I
      assemble_state := fun base' state' unionData' =>
        I.bundle.assemble_sharp_local_state base' state' unionData'
      extend_then_assemble := fun _ _ base' state' unionData' =>
        I.bundle.assemble_sharp_local_state base' state' unionData'
      assembly_compatibility := by
        intro _ _ base' state' unionData'
        rfl
      chosen_site_law := by
        exact I.sharp_local_relation
      bounded_base_from_assembly := by
        intro _
        exact (YangMillsSharpLocalPackageStatement R hcompat hunion).2.2
      bounded_base_witness := (YangMillsSharpLocalPackageStatement R hcompat hunion).2.2 }

theorem YangMillsConstructiveExtendAssembleLawPackageExistsStatement
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
  Nonempty (YMConstructiveExtendAssembleLawPackage R) := by
  exact Nonempty.intro
    (YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData)

theorem YangMillsConstructiveExtendAssembleLawPackageWitnessStatement
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
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  Nonempty (YMConstructiveExtendAssembleLawPackage R) /\
  P.extend_then_assemble win bridge base state unionData = P.interface.chosen_sharp_local_state /\
  R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  exact And.intro
    (Nonempty.intro P)
    (And.intro P.chosen_site_law P.bounded_base_witness)

theorem YangMillsConstructiveAssemblyCompatibilityStatement
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
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  P.extend_then_assemble win bridge base state unionData =
    P.assemble_state base state unionData := by
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  exact P.assembly_compatibility win bridge base state unionData

theorem YangMillsConstructiveAssemblyBoundedBaseStatement
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
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  P.bounded_base_from_assembly (P.assemble_state base state unionData) =
    P.bounded_base_witness := by
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  rfl

theorem YangMillsConstructiveExtendAssembleBoundedBaseStatement
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
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  P.bounded_base_from_assembly (P.extend_then_assemble win bridge base state unionData) =
    P.bounded_base_witness := by
  rfl

theorem YangMillsConstructiveBoundedBaseFactorsThroughSharpLocalCoreStatement
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
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data)
  (s : YMSharpLocalState) :
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  P.bounded_base_from_assembly s =
    (YangMillsSharpLocalPackageStatement R hcompat hunion).2.2 := by
  rfl

theorem YangMillsConstructiveChosenSharpLocalFeedsBoundedBaseStatement
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
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  P.bounded_base_from_assembly P.interface.chosen_sharp_local_state =
    P.bounded_base_witness := by
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  calc
    P.bounded_base_from_assembly P.interface.chosen_sharp_local_state =
      P.bounded_base_from_assembly
        (P.extend_then_assemble
          P.interface.chosen_window
          P.interface.chosen_bridge_map
          P.interface.chosen_bounded_base
          P.interface.chosen_bounded_state
          P.interface.chosen_inductive_union) := by
            exact congrArg P.bounded_base_from_assembly P.chosen_site_law.symm
    _ =
      P.bounded_base_from_assembly
        (P.assemble_state
          P.interface.chosen_bounded_base
          P.interface.chosen_bounded_state
          P.interface.chosen_inductive_union) := by
            exact congrArg P.bounded_base_from_assembly <|
              P.assembly_compatibility
                P.interface.chosen_window
                P.interface.chosen_bridge_map
                P.interface.chosen_bounded_base
                P.interface.chosen_bounded_state
                P.interface.chosen_inductive_union
    _ = P.bounded_base_witness := by
            exact
              YangMillsConstructiveAssemblyBoundedBaseStatement
                R htrunc hext hcompat hunion win bridge base state unionData

theorem YangMillsConstructiveBoundedBaseConstantOnStatesStatement
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
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data)
  (s1 s2 : YMSharpLocalState) :
  let P := YangMillsConstructiveExtendAssembleLawPackageData
    R htrunc hext hcompat hunion win bridge base state unionData
  P.bounded_base_from_assembly s1 =
    P.bounded_base_from_assembly s2 := by
  rfl

end MaleyLean
