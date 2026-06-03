import MaleyLean.Papers.YangMills.Surface.VacuumGapManuscriptCarrierBaseSummary

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptCarrierBaseSummaryTopExportStatement
  (B : YMVacuumGapManuscriptCarrierBase) :
  B.transport = B.transport /\
  B.H = B.H /\
  B.Hloc = B.Hloc /\
  B.corr = B.corr /\
  B.gapf = B.gapf /\
  B.hgap = B.hgap := by
  exact YangMillsVacuumGapManuscriptCarrierBaseSummaryStatement B

end MaleyLean
