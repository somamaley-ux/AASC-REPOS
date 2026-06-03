import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptWitnessData

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptWitnessDataSummaryStatement
  {B : YMVacuumGapManuscriptCarrierBase}
  (W : YMVacuumGapManuscriptWitnessData B) :
  let O := W.toVacuumGapManuscriptObject
  O.transport = B.transport /\
  O.H = B.H /\
  O.Hloc = B.Hloc /\
  O.corr = B.corr /\
  O.gapf = B.gapf /\
  O.hgap = B.hgap := by
  exact YangMillsVacuumGapManuscriptWitnessDataStatement W

end MaleyLean
