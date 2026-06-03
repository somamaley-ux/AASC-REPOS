import MaleyLean.Papers.YangMills.Kernel.ManuscriptNamedObjects

namespace MaleyLean

/--
Vacuum-gap-side manuscript draft instantiated from a closed Yang--Mills
manuscript object.

This turns the manuscript names `transport`, `H`, `Hloc`, `corr`, `gapf`, and
`hgap` into the actual vacuum-gap relational and law-package witnesses required
by the kernel.
-/
theorem YangMillsVacuumGapManuscriptDraftStatement
  (I : YMClosedInstantiatedManuscript) :
  let RD := I.blueprint.objects.RD
  Nonempty (YMVacuumGapRelationalInterface RD) /\
  Nonempty (YMVacuumGapTransportRealizeLawPackage RD) /\
  ym_transport I = I.chosen_sites.vacuum_gap.tm /\
  ym_H I = I.chosen_sites.vacuum_gap.obs /\
  ym_Hloc I = I.chosen_sites.vacuum_gap.rsec /\
  ym_corr I = I.chosen_sites.vacuum_gap.corr /\
  ym_gapf I = I.chosen_sites.vacuum_gap.gapf /\
  ym_hgap_statement I := by
  dsimp [ym_transport, ym_H, ym_Hloc, ym_corr, ym_gapf, ym_hgap_statement]
  let RD := I.blueprint.objects.RD
  have hRel :
      Nonempty (YMVacuumGapRelationalInterface RD) :=
    YangMillsVacuumGapRelationalInterfaceExistsStatement
      RD
      I.blueprint.witnesses.hww
      I.chosen_sites.vacuum_gap.tm
      I.chosen_sites.vacuum_gap.obs
      I.chosen_sites.vacuum_gap.rsec
      I.chosen_sites.vacuum_gap.corr
      I.chosen_sites.vacuum_gap.gapf
      I.chosen_sites.vacuum_gap.hgap
  have hLaw :
      Nonempty (YMVacuumGapTransportRealizeLawPackage RD) :=
    YangMillsVacuumGapTransportRealizeLawPackageExistsStatement
      RD
      I.blueprint.witnesses.hww
      I.chosen_sites.vacuum_gap.tm
      I.chosen_sites.vacuum_gap.obs
      I.chosen_sites.vacuum_gap.rsec
      I.chosen_sites.vacuum_gap.corr
      I.chosen_sites.vacuum_gap.gapf
      I.chosen_sites.vacuum_gap.hgap
  exact
    And.intro hRel <|
      And.intro hLaw <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl I.chosen_sites.vacuum_gap.hgap

end MaleyLean
