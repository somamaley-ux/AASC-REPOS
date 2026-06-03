import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantExistence

namespace MaleyLean

theorem YangMillsManuscriptConstantExistenceSummaryStatement :
  ym_closed_manuscript_completion ↔
    Nonempty YMClosedInstantiatedManuscriptInput := by
  exact YangMillsClosedManuscriptCompletionIffInputStatement

end MaleyLean
