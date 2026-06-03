import MaleyLean.Papers.YangMills.Kernel.VacuumGapPrimitiveConstructions

namespace MaleyLean

/-- Primitive OS-sector realization stage for the vacuum-gap heart. -/
structure YMVacuumGapOSSectorConstructionStage (R : YMVacuumGapRoute) where
  constructions : YMVacuumGapPrimitiveConstructions R
  chosen_reconstructed_sector := constructions.trace.chosen_reconstructed_sector
  chosen_correlation_family := constructions.trace.chosen_correlation_family
  constructed_os_sector := constructions.constructed_os_sector
  os_sector_construction :
    constructions.trace.certificates.law_atoms.interface.bundle.realize_os_sector
      chosen_reconstructed_sector
      chosen_correlation_family =
    constructed_os_sector

def YangMillsVacuumGapOSSectorConstructionStageData
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
  YMVacuumGapOSSectorConstructionStage R := by
  let C := YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap
  exact
    { constructions := C
      os_sector_construction := C.os_sector_construction }

theorem YangMillsVacuumGapOSSectorConstructionStageExportStatement
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
  Nonempty (YMVacuumGapOSSectorConstructionStage R) /\
  ((YangMillsVacuumGapOSSectorConstructionStageData R hww tm obs rsec corr gapf hgap).constructions.trace.certificates.law_atoms.interface.bundle.realize_os_sector
      (YangMillsVacuumGapOSSectorConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_reconstructed_sector
      (YangMillsVacuumGapOSSectorConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_correlation_family =
    (YangMillsVacuumGapOSSectorConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_os_sector) := by
  let T := YangMillsVacuumGapOSSectorConstructionStageData R hww tm obs rsec corr gapf hgap
  exact And.intro (Nonempty.intro T) T.os_sector_construction

end MaleyLean
