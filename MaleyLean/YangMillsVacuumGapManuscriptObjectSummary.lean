import MaleyLean.Papers.YangMills.Surface.VacuumGapManuscriptObjectSummary

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptObjectSummaryTopExportStatement
  (P : YMVacuumGapManuscriptObject) :
  let RD := P.toVacuumGapRoute
  let C := P.toChoices
  RD.transport_package = P.transport_package /\
  RD.reconstruction_package = P.reconstruction_package /\
  ym_vacuum_transport_of C = P.transport /\
  ym_vacuum_H_of C = P.H /\
  ym_vacuum_Hloc_of C = P.Hloc /\
  ym_vacuum_corr_of C = P.corr /\
  ym_vacuum_gapf_of C = P.gapf /\
  ym_vacuum_hgap_of C = P.hgap := by
  exact YangMillsVacuumGapManuscriptObjectSummaryStatement P

end MaleyLean
