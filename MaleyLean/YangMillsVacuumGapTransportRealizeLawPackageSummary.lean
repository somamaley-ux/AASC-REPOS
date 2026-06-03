import MaleyLean.Papers.YangMills.Surface.VacuumGapTransportRealizeLawPackageSummary

namespace MaleyLean

theorem YangMillsVacuumGapTransportRealizeLawPackageSummaryExportStatement :
  forall R : YMVacuumGapRoute,
    forall hww : R.weak_window_certificate_ready,
      forall tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map,
        forall obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family,
          forall rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector,
            forall corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family,
              forall gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional,
                forall hgap :
                  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
                    gapf
                    ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr),
                  let P := YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap
                  Nonempty (YMVacuumGapTransportRealizeLawPackage R) /\
                  P.transport_then_realize tm obs rsec corr = P.interface.chosen_os_sector /\
                  R.reconstruction_package.minkowski_gap_ready := by
  intro R hww tm obs rsec corr gapf hgap
  exact YangMillsVacuumGapTransportRealizeLawPackageSummaryStatement
    R hww tm obs rsec corr gapf hgap

end MaleyLean
