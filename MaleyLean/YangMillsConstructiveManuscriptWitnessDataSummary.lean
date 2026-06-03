import MaleyLean.Papers.YangMills.Surface.ConstructiveManuscriptWitnessDataSummary

namespace MaleyLean

theorem YangMillsConstructiveManuscriptWitnessDataSummaryTopExportStatement
  {B : YMConstructiveManuscriptCarrierBase}
  (W : YMConstructiveManuscriptWitnessData B) :
  let O := W.toConstructiveManuscriptObject
  O.DeltaMax = B.DeltaMax /\
  O.finite_cap_bridge = B.finite_cap_bridge /\
  O.bounded_base_one = B.bounded_base_one /\
  O.omega_bd = B.omega_bd /\
  O.omega_sharp = B.omega_sharp := by
  exact YangMillsConstructiveManuscriptWitnessDataSummaryStatement W

end MaleyLean
