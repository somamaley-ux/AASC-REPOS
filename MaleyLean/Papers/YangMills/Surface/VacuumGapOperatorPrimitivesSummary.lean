import MaleyLean.Papers.YangMills.Kernel.VacuumGapOperatorPrimitives

namespace MaleyLean

theorem YangMillsVacuumGapOperatorPrimitivesSummaryStatement :
  forall R : YMVacuumGapRoute,
    forall hww : R.weak_window_certificate_ready,
      forall tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map,
        forall obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family,
          forall rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector,
            forall corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family,
              forall gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional,
                forall osec : (YangMillsVacuumGapSemanticBundleData R hww).os_sector,
                  Nonempty (YMVacuumGapOperatorPrimitives R) /\
                  (YangMillsVacuumGapOperatorPrimitivesData R hww).transport_operator tm obs =
                    (YangMillsVacuumGapSemanticBundleData R hww).transport_observable tm obs /\
                  (YangMillsVacuumGapOperatorPrimitivesData R hww).realize_operator rsec corr =
                    (YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr /\
                  ((YangMillsVacuumGapOperatorPrimitivesData R hww).gap_operator gapf osec ↔
                    (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap gapf osec) := by
  exact YangMillsVacuumGapOperatorPrimitivesExportStatement

end MaleyLean
