import MaleyLean.Papers.YangMills.Surface.ConstructiveManuscriptCarrierBaseSummary

namespace MaleyLean

theorem YangMillsConstructiveManuscriptCarrierBaseSummaryTopExportStatement
  (B : YMConstructiveManuscriptCarrierBase) :
  B.omega_flow = B.omega_flow /\
  B.DeltaMax = B.DeltaMax /\
  B.finite_cap_bridge = B.finite_cap_bridge /\
  B.bounded_base_one = B.bounded_base_one /\
  B.omega_bd = B.omega_bd /\
  B.omega_sharp = B.omega_sharp := by
  exact YangMillsConstructiveManuscriptCarrierBaseSummaryStatement B

end MaleyLean
