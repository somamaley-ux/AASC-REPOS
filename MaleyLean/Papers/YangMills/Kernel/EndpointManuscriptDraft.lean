import MaleyLean.Papers.YangMills.Kernel.ManuscriptNamedObjects

namespace MaleyLean

/--
Endpoint-side manuscript draft instantiated from a closed Yang--Mills
manuscript object.

This turns the manuscript names `Omega_loc`, `phi_star`, and `E_ren` into the
actual endpoint relational and law-package witnesses required by the kernel.
-/
theorem YangMillsEndpointManuscriptDraftStatement
  (I : YMClosedInstantiatedManuscript) :
  let RE := I.blueprint.objects.RE
  Nonempty (YMEndpointRelationalInterface RE) /\
  Nonempty (YMEndpointCorrelationLawPackage RE) /\
  ym_Omega_loc I = I.chosen_sites.endpoint.vac /\
  ym_phi_star I = I.chosen_sites.endpoint.testFn /\
  ym_E_ren I = I.chosen_sites.endpoint.field /\
  ym_hgap_statement I := by
  dsimp [ym_Omega_loc, ym_phi_star, ym_E_ren, ym_hgap_statement]
  let RE := I.blueprint.objects.RE
  let hE := I.blueprint.witnesses.hE
  let hP := I.blueprint.witnesses.hP
  have hRel :
      Nonempty (YMEndpointRelationalInterface RE) :=
    YangMillsEndpointRelationalInterfaceExistsStatement
      RE
      hE
      hP
      I.chosen_sites.endpoint.vac
      I.chosen_sites.endpoint.testFn
      I.chosen_sites.endpoint.field
  have hLaw :
      Nonempty (YMEndpointCorrelationLawPackage RE) :=
    YangMillsEndpointCorrelationLawPackageExistsStatement
      RE
      hE
      hP
      I.chosen_sites.endpoint.vac
      I.chosen_sites.endpoint.testFn
      I.chosen_sites.endpoint.field
  exact
    And.intro hRel <|
      And.intro hLaw <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl I.chosen_sites.vacuum_gap.hgap

end MaleyLean
