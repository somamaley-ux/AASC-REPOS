import MaleyLean.Papers.YangMills.Kernel.VacuumGapSemanticBundle

namespace MaleyLean

theorem YangMillsVacuumGapSemanticBundleExportStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  Nonempty (YMVacuumGapSemanticBundle R) := by
  exact YangMillsVacuumGapSemanticBundleExistsStatement R hww

end MaleyLean
