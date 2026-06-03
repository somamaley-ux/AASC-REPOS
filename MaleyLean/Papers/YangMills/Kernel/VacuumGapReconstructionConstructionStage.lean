import MaleyLean.Papers.YangMills.Kernel.VacuumGapPrimitiveConstructions

namespace MaleyLean

/-- Primitive reconstruction-side construction stage for the vacuum-gap heart. -/
structure YMVacuumGapReconstructionConstructionStage (R : YMVacuumGapRoute) where
  constructions : YMVacuumGapPrimitiveConstructions R
  chosen_reconstructed_sector := constructions.trace.chosen_reconstructed_sector
  chosen_correlation_family := constructions.trace.chosen_correlation_family
  chosen_gap_functional := constructions.trace.chosen_gap_functional
  constructed_os_sector := constructions.constructed_os_sector
  os_sector_construction :
    constructions.trace.certificates.law_atoms.interface.bundle.realize_os_sector
      chosen_reconstructed_sector
      chosen_correlation_family =
    constructed_os_sector
  gap_evaluation_construction :
    constructions.trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
      chosen_gap_functional
      constructed_os_sector

def YangMillsVacuumGapReconstructionConstructionStageData
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
  YMVacuumGapReconstructionConstructionStage R := by
  let C := YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap
  exact
    { constructions := C
      os_sector_construction := C.os_sector_construction
      gap_evaluation_construction := C.gap_evaluation_construction }

theorem YangMillsVacuumGapReconstructionConstructionStageExportStatement
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
  Nonempty (YMVacuumGapReconstructionConstructionStage R) /\
  ((YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructions.trace.certificates.law_atoms.interface.bundle.realize_os_sector
      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_reconstructed_sector
      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_correlation_family =
    (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_os_sector) /\
  ((YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructions.trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_gap_functional
      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_os_sector) := by
  let T := YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap
  exact And.intro (Nonempty.intro T) <| And.intro T.os_sector_construction T.gap_evaluation_construction

end MaleyLean
