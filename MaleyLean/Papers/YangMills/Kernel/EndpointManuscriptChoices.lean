import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite

namespace MaleyLean

/--
Manuscript-specific endpoint choices over an already chosen endpoint core and
its readiness witnesses.

This is the exact authoring site for the remaining endpoint manuscript terms:
the vacuum vector, witness test function, and distinguished field-family
element.
-/
structure YMEndpointManuscriptChoices
    (RE : YMEndpointCore)
    (hE : RE.euclidean_dossier_ready)
    (hP : RE.endpoint_packet_ready) where
  Omega_loc :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).vacuum_vector
  phi_star :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).test_function_space
  E_ren :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).field_family

/--
The reconstructed Hilbert-space carrier attached to the endpoint semantic
bundle. This mirrors the manuscript's `Hloc` notation using only existing repo
objects.
-/
def ym_endpoint_Hloc_of
    (RE : YMEndpointCore)
    (hE : RE.euclidean_dossier_ready)
    (hP : RE.endpoint_packet_ready) : Type :=
  (YangMillsEndpointSemanticBundleData RE hE hP).reconstructed_hilbert

/--
Faithful repo-level analogue of the manuscript pattern

```lean
def Omega_loc : Hloc := ...
```

In the current kernel, the endpoint core stores the vacuum-vector *type* inside
the reconstruction package, and the chosen endpoint manuscript choices provide
the actual selected inhabitant.
-/
def ym_endpoint_Omega_loc_of
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (C : YMEndpointManuscriptChoices RE hE hP) :
  (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector :=
  C.Omega_loc

/--
Faithful repo-level analogue of the manuscript's chosen non-triviality witness
test function.
-/
def ym_endpoint_phi_star_of
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (C : YMEndpointManuscriptChoices RE hE hP) :
  (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space :=
  C.phi_star

/--
Faithful repo-level analogue of the manuscript's chosen centered CP-even
dimension-4 scalar witness field.
-/
def ym_endpoint_E_ren_of
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (C : YMEndpointManuscriptChoices RE hE hP) :
  (YangMillsEndpointSemanticBundleData RE hE hP).field_family :=
  C.E_ren

def YangMillsEndpointManuscriptChoicesData
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (Omega_loc :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).vacuum_vector)
    (phi_star :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).test_function_space)
    (E_ren :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).field_family) :
  YMEndpointManuscriptChoices RE hE hP :=
  { Omega_loc := Omega_loc
    phi_star := phi_star
    E_ren := E_ren }

def YangMillsEndpointChosenSiteDataOfChoices
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C : YMEndpointManuscriptChoices O.RE W.hE W.hP) :
  YMEndpointChosenSiteData
    ({ objects := O, witnesses := W } : YMClosedManuscriptBlueprint) :=
  { vac := C.Omega_loc
    testFn := C.phi_star
    field := C.E_ren }

theorem YangMillsEndpointChoicesStatement
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C : YMEndpointManuscriptChoices O.RE W.hE W.hP) :
  let K := YangMillsEndpointChosenSiteDataOfChoices W C
  K.vac = C.Omega_loc /\
  K.testFn = C.phi_star /\
  K.field = C.E_ren := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsEndpointManuscriptChoicesBuilderStatement
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (Omega_loc :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).vacuum_vector)
    (phi_star :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).test_function_space)
    (E_ren :
      (YangMillsEndpointSemanticBundleData
        RE hE hP).field_family) :
  let C := YangMillsEndpointManuscriptChoicesData Omega_loc phi_star E_ren
  C.Omega_loc = Omega_loc /\
  C.phi_star = phi_star /\
  C.E_ren = E_ren := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsEndpointChosenInhabitantsStatement
    {RE : YMEndpointCore}
    {hE : RE.euclidean_dossier_ready}
    {hP : RE.endpoint_packet_ready}
    (C : YMEndpointManuscriptChoices RE hE hP) :
  ym_endpoint_Omega_loc_of C = C.Omega_loc /\
  ym_endpoint_phi_star_of C = C.phi_star /\
  ym_endpoint_E_ren_of C = C.E_ren := by
  exact And.intro rfl <| And.intro rfl rfl

end MaleyLean
