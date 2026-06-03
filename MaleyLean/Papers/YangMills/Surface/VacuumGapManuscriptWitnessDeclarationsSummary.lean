import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptWitnessDeclarations

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptWitnessDeclarationsSummaryStatement :
  ym_vacuum_gap_manuscript_object.transport = vacuum_transport /\
  ym_vacuum_gap_manuscript_object.H = vacuum_H /\
  ym_vacuum_gap_manuscript_object.Hloc = vacuum_Hloc /\
  ym_vacuum_gap_manuscript_object.corr = vacuum_corr /\
  ym_vacuum_gap_manuscript_object.gapf = vacuum_gapf /\
  ym_vacuum_gap_manuscript_object.hgap = vacuum_hgap := by
  exact ym_vacuum_gap_manuscript_object_named_inhabitants

end MaleyLean
