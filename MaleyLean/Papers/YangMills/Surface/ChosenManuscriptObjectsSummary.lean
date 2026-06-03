import MaleyLean.Papers.YangMills.Kernel.ChosenManuscriptObjects

namespace MaleyLean

theorem YangMillsChosenManuscriptObjectsSummaryStatement
  (M : YMFormalizedManuscript) :
  Nonempty (YMChosenManuscriptObjects M) /\
  Nonempty (YMChosenSpineObject M) /\
  Nonempty (YMChosenConstructiveObject M) /\
  Nonempty (YMChosenVacuumGapObject M) /\
  Nonempty (YMChosenEndpointObject M) := by
  exact YangMillsChosenManuscriptObjectsExportStatement M

end MaleyLean
