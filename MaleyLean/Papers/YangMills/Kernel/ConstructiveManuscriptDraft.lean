import MaleyLean.Papers.YangMills.Kernel.ManuscriptNamedObjects

namespace MaleyLean

/--
Constructive-side manuscript draft instantiated from a closed Yang--Mills
manuscript object.

This turns the manuscript names `DeltaMax`, `omega_bd`, and `omega_sharp` into
the actual constructive relational and law-package witnesses required by the
kernel.
-/
theorem YangMillsConstructiveManuscriptDraftStatement
  (I : YMClosedInstantiatedManuscript) :
  let RC := I.blueprint.objects.RC
  Nonempty (YMConstructiveRelationalInterface RC) /\
  Nonempty (YMConstructiveExtendAssembleLawPackage RC) /\
  ym_DeltaMax I = I.chosen_sites.constructive.win /\
  ym_finite_cap_bridge I = I.chosen_sites.constructive.bridge /\
  ym_bounded_base_one I = I.chosen_sites.constructive.base /\
  ym_omega_bd I = I.chosen_sites.constructive.state /\
  ym_omega_sharp I = I.chosen_sites.constructive.unionData := by
  dsimp
    [ym_DeltaMax, ym_finite_cap_bridge, ym_bounded_base_one, ym_omega_bd,
      ym_omega_sharp]
  let RC := I.blueprint.objects.RC
  have hRel :
      Nonempty (YMConstructiveRelationalInterface RC) :=
    YangMillsConstructiveRelationalInterfaceExistsStatement
      RC
      I.blueprint.witnesses.htrunc
      I.blueprint.witnesses.hext
      I.blueprint.witnesses.hcompat
      I.blueprint.witnesses.hunion
      I.chosen_sites.constructive.win
      I.chosen_sites.constructive.bridge
      I.chosen_sites.constructive.base
      I.chosen_sites.constructive.state
      I.chosen_sites.constructive.unionData
  have hLaw :
      Nonempty (YMConstructiveExtendAssembleLawPackage RC) :=
    YangMillsConstructiveExtendAssembleLawPackageExistsStatement
      RC
      I.blueprint.witnesses.htrunc
      I.blueprint.witnesses.hext
      I.blueprint.witnesses.hcompat
      I.blueprint.witnesses.hunion
      I.chosen_sites.constructive.win
      I.chosen_sites.constructive.bridge
      I.chosen_sites.constructive.base
      I.chosen_sites.constructive.state
      I.chosen_sites.constructive.unionData
  exact
    And.intro hRel <|
      And.intro hLaw <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl rfl

end MaleyLean
