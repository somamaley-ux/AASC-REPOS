import MaleyLean.Papers.YangMills.Kernel.VacuumGapChosenSiteLawAtoms

namespace MaleyLean

/-- Primitive vacuum-gap operators underlying the current semantic bundle. -/
structure YMVacuumGapOperatorPrimitives (R : YMVacuumGapRoute) where
  bundle : YMVacuumGapSemanticBundle R
  transport_operator :
    bundle.transport_map -> bundle.lattice_observable_family -> bundle.transport_state
  realize_operator :
    bundle.reconstructed_sector -> bundle.os_correlation_family -> bundle.os_sector
  gap_operator :
    bundle.minkowski_gap_functional -> bundle.os_sector -> Prop

def YangMillsVacuumGapOperatorPrimitivesData
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  YMVacuumGapOperatorPrimitives R := by
  let B := YangMillsVacuumGapSemanticBundleData R hww
  exact
    { bundle := B
      transport_operator := B.transport_observable
      realize_operator := B.realize_os_sector
      gap_operator := B.evaluate_minkowski_gap }

theorem YangMillsVacuumGapOperatorPrimitivesExportStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready)
  (tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map)
  (obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family)
  (rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector)
  (corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family)
  (gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional)
  (osec : (YangMillsVacuumGapSemanticBundleData R hww).os_sector) :
  Nonempty (YMVacuumGapOperatorPrimitives R) /\
  (YangMillsVacuumGapOperatorPrimitivesData R hww).transport_operator tm obs =
    (YangMillsVacuumGapSemanticBundleData R hww).transport_observable tm obs /\
  (YangMillsVacuumGapOperatorPrimitivesData R hww).realize_operator rsec corr =
    (YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr /\
  ((YangMillsVacuumGapOperatorPrimitivesData R hww).gap_operator gapf osec ↔
    (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap gapf osec) := by
  let P := YangMillsVacuumGapOperatorPrimitivesData R hww
  exact And.intro (Nonempty.intro P) <| And.intro rfl <| And.intro rfl Iff.rfl

end MaleyLean
