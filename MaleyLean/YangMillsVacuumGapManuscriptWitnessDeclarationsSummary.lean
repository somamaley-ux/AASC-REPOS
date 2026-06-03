import MaleyLean.Papers.YangMills.Surface.VacuumGapManuscriptWitnessDeclarationsSummary

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptWitnessDeclarationsSummaryTopExportStatement :
  ym_vacuum_gap_manuscript_object.transport = vacuum_transport /\
  ym_vacuum_gap_manuscript_object.H = vacuum_H /\
  ym_vacuum_gap_manuscript_object.Hloc = vacuum_Hloc /\
  ym_vacuum_gap_manuscript_object.corr = vacuum_corr /\
  ym_vacuum_gap_manuscript_object.gapf = vacuum_gapf /\
  ym_vacuum_gap_manuscript_object.hgap = vacuum_hgap := by
  exact YangMillsVacuumGapManuscriptWitnessDeclarationsSummaryStatement

end MaleyLean
