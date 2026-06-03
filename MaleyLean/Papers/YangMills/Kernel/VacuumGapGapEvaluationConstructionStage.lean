import MaleyLean.Papers.YangMills.Kernel.VacuumGapOSSectorConstructionStage

namespace MaleyLean

/-- Primitive gap-evaluation stage for the vacuum-gap heart. -/
structure YMVacuumGapGapEvaluationConstructionStage (R : YMVacuumGapRoute) where
  os_sector_stage : YMVacuumGapOSSectorConstructionStage R
  chosen_gap_functional := os_sector_stage.constructions.trace.chosen_gap_functional
  constructed_os_sector := os_sector_stage.constructed_os_sector
  gap_evaluation_construction :
    os_sector_stage.constructions.trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
      chosen_gap_functional
      constructed_os_sector

def YangMillsVacuumGapGapEvaluationConstructionStageData
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready)
  (tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map)
  (obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family)
  (rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector)
  (corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family)
  (gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional)
  (hgap :
    (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr)) :
  YMVacuumGapGapEvaluationConstructionStage R := by
  let O := YangMillsVacuumGapOSSectorConstructionStageData R hww tm obs rsec corr gapf hgap
  exact
    { os_sector_stage := O
      gap_evaluation_construction := O.constructions.gap_evaluation_construction }

theorem YangMillsVacuumGapGapEvaluationConstructionStageExportStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready)
  (tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map)
  (obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family)
  (rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector)
  (corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family)
  (gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional)
  (hgap :
    (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr)) :
  Nonempty (YMVacuumGapGapEvaluationConstructionStage R) /\
  ((YangMillsVacuumGapGapEvaluationConstructionStageData R hww tm obs rsec corr gapf hgap).os_sector_stage.constructions.trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
      (YangMillsVacuumGapGapEvaluationConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_gap_functional
      (YangMillsVacuumGapGapEvaluationConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_os_sector) := by
  let T := YangMillsVacuumGapGapEvaluationConstructionStageData R hww tm obs rsec corr gapf hgap
  exact And.intro (Nonempty.intro T) T.gap_evaluation_construction

end MaleyLean
