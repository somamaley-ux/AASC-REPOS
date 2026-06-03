import MaleyLean.Papers.YangMills.Surface.VacuumGapManuscriptWitnessDataSummary

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptWitnessDataSummaryTopExportStatement
  {B : YMVacuumGapManuscriptCarrierBase}
  (W : YMVacuumGapManuscriptWitnessData B) :
  let O := W.toVacuumGapManuscriptObject
  O.transport = B.transport /\
  O.H = B.H /\
  O.Hloc = B.Hloc /\
  O.corr = B.corr /\
  O.gapf = B.gapf /\
  O.hgap = B.hgap := by
  exact YangMillsVacuumGapManuscriptWitnessDataSummaryStatement W

end MaleyLean
