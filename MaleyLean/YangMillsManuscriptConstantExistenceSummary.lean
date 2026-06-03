import MaleyLean.Papers.YangMills.Surface.ManuscriptConstantExistenceSummary

namespace MaleyLean

theorem YangMillsManuscriptConstantExistenceSummaryTopExportStatement :
  ym_closed_manuscript_completion ↔
    Nonempty YMClosedInstantiatedManuscriptInput := by
  exact YangMillsManuscriptConstantExistenceSummaryStatement

end MaleyLean
