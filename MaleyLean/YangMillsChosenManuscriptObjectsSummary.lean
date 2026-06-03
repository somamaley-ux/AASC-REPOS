import MaleyLean.Papers.YangMills.Surface.ChosenManuscriptObjectsSummary

namespace MaleyLean

theorem YangMillsChosenManuscriptObjectsSummaryTopExportStatement
  (M : YMFormalizedManuscript) :
  Nonempty (YMChosenManuscriptObjects M) /\
  Nonempty (YMChosenSpineObject M) /\
  Nonempty (YMChosenConstructiveObject M) /\
  Nonempty (YMChosenVacuumGapObject M) /\
  Nonempty (YMChosenEndpointObject M) := by
  exact YangMillsChosenManuscriptObjectsSummaryStatement M

end MaleyLean
