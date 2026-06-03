import MaleyLean.Papers.YangMills.Surface.VacuumGapManuscriptDraftSummary

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptDraftSummaryTopExportStatement
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
  exact YangMillsVacuumGapManuscriptDraftSummaryStatement I

end MaleyLean
