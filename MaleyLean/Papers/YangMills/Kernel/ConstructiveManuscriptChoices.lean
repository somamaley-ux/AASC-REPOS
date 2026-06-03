import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite

namespace MaleyLean

/--
Manuscript-specific constructive choices over an already chosen constructive
route and its readiness witnesses.

This is the exact authoring site for the remaining constructive manuscript
terms: the engineering cap, bridge, bounded-base carrier element, bounded base
state, and sharp-local inductive-union datum.
-/
structure YMConstructiveManuscriptChoices
    (RC : YMConstructiveRoute)
    (htrunc : RC.finite_truncation_ready)
    (hext : RC.finite_cap_extension_ready)
    (hcompat : RC.bounded_state_compatibility_ready)
    (hunion : RC.inductive_union_ready) where
  DeltaMax :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).finite_cap_window
  finite_cap_bridge :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).positive_bridge_map
  bounded_base_one :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_base_carrier
  omega_bd :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_state_data
  omega_sharp :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).inductive_union_data

def YangMillsConstructiveManuscriptChoicesData
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (DeltaMax :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).finite_cap_window)
    (finite_cap_bridge :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).positive_bridge_map)
    (bounded_base_one :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).bounded_base_carrier)
    (omega_bd :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).bounded_state_data)
    (omega_sharp :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).inductive_union_data) :
  YMConstructiveManuscriptChoices RC htrunc hext hcompat hunion :=
  { DeltaMax := DeltaMax
    finite_cap_bridge := finite_cap_bridge
    bounded_base_one := bounded_base_one
    omega_bd := omega_bd
    omega_sharp := omega_sharp }

def ym_constructive_DeltaMax_of
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (C : YMConstructiveManuscriptChoices RC htrunc hext hcompat hunion) :
  (YangMillsConstructiveSemanticBundleData
    RC htrunc hext hcompat hunion).finite_cap_window :=
  C.DeltaMax

def ym_constructive_finite_cap_bridge_of
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (C : YMConstructiveManuscriptChoices RC htrunc hext hcompat hunion) :
  (YangMillsConstructiveSemanticBundleData
    RC htrunc hext hcompat hunion).positive_bridge_map :=
  C.finite_cap_bridge

def ym_constructive_bounded_base_one_of
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (C : YMConstructiveManuscriptChoices RC htrunc hext hcompat hunion) :
  (YangMillsConstructiveSemanticBundleData
    RC htrunc hext hcompat hunion).bounded_base_carrier :=
  C.bounded_base_one

def ym_constructive_omega_bd_of
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (C : YMConstructiveManuscriptChoices RC htrunc hext hcompat hunion) :
  (YangMillsConstructiveSemanticBundleData
    RC htrunc hext hcompat hunion).bounded_state_data :=
  C.omega_bd

def ym_constructive_omega_sharp_of
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (C : YMConstructiveManuscriptChoices RC htrunc hext hcompat hunion) :
  (YangMillsConstructiveSemanticBundleData
    RC htrunc hext hcompat hunion).inductive_union_data :=
  C.omega_sharp

def YangMillsConstructiveChosenSiteDataOfChoices
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C :
    YMConstructiveManuscriptChoices
      O.RC W.htrunc W.hext W.hcompat W.hunion) :
  YMConstructiveChosenSiteData
    ({ objects := O, witnesses := W } : YMClosedManuscriptBlueprint) :=
  { win := C.DeltaMax
    bridge := C.finite_cap_bridge
    base := C.bounded_base_one
    state := C.omega_bd
    unionData := C.omega_sharp }

theorem YangMillsConstructiveChoicesStatement
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C :
    YMConstructiveManuscriptChoices
      O.RC W.htrunc W.hext W.hcompat W.hunion) :
  let K := YangMillsConstructiveChosenSiteDataOfChoices W C
  K.win = C.DeltaMax /\
  K.bridge = C.finite_cap_bridge /\
  K.base = C.bounded_base_one /\
  K.state = C.omega_bd /\
  K.unionData = C.omega_sharp := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl rfl

theorem YangMillsConstructiveManuscriptChoicesBuilderStatement
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (DeltaMax :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).finite_cap_window)
    (finite_cap_bridge :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).positive_bridge_map)
    (bounded_base_one :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).bounded_base_carrier)
    (omega_bd :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).bounded_state_data)
    (omega_sharp :
      (YangMillsConstructiveSemanticBundleData
        RC htrunc hext hcompat hunion).inductive_union_data) :
  let C :=
    YangMillsConstructiveManuscriptChoicesData
      DeltaMax finite_cap_bridge bounded_base_one omega_bd omega_sharp
  C.DeltaMax = DeltaMax /\
  C.finite_cap_bridge = finite_cap_bridge /\
  C.bounded_base_one = bounded_base_one /\
  C.omega_bd = omega_bd /\
  C.omega_sharp = omega_sharp := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl rfl

theorem YangMillsConstructiveChosenInhabitantsStatement
    {RC : YMConstructiveRoute}
    {htrunc : RC.finite_truncation_ready}
    {hext : RC.finite_cap_extension_ready}
    {hcompat : RC.bounded_state_compatibility_ready}
    {hunion : RC.inductive_union_ready}
    (C : YMConstructiveManuscriptChoices RC htrunc hext hcompat hunion) :
  ym_constructive_DeltaMax_of C = C.DeltaMax /\
  ym_constructive_finite_cap_bridge_of C = C.finite_cap_bridge /\
  ym_constructive_bounded_base_one_of C = C.bounded_base_one /\
  ym_constructive_omega_bd_of C = C.omega_bd /\
  ym_constructive_omega_sharp_of C = C.omega_sharp := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl rfl

end MaleyLean
