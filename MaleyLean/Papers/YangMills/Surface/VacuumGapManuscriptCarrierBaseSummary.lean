import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptCarrierBase

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptCarrierBaseSummaryStatement
  (B : YMVacuumGapManuscriptCarrierBase) :
  B.transport = B.transport /\
  B.H = B.H /\
  B.Hloc = B.Hloc /\
  B.corr = B.corr /\
  B.gapf = B.gapf /\
  B.hgap = B.hgap := by
  exact YangMillsVacuumGapManuscriptCarrierBaseStatement B

end MaleyLean
