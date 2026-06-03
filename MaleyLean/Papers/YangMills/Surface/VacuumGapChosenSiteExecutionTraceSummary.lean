import MaleyLean.Papers.YangMills.Kernel.VacuumGapChosenSiteExecutionTrace

namespace MaleyLean

theorem YangMillsVacuumGapChosenSiteExecutionTraceSummaryStatement :
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
                  Nonempty (YMVacuumGapChosenSiteExecutionTrace R) /\
                  ((YangMillsVacuumGapChosenSiteExecutionTraceData
                      R hww tm obs rsec corr gapf hgap).certificates.law_atoms.interface.bundle.transport_observable
                      (YangMillsVacuumGapChosenSiteExecutionTraceData
                        R hww tm obs rsec corr gapf hgap).chosen_transport_map
                      (YangMillsVacuumGapChosenSiteExecutionTraceData
                        R hww tm obs rsec corr gapf hgap).chosen_observable =
                    (YangMillsVacuumGapChosenSiteExecutionTraceData
                      R hww tm obs rsec corr gapf hgap).chosen_transport_state) /\
                  ((YangMillsVacuumGapChosenSiteExecutionTraceData
                      R hww tm obs rsec corr gapf hgap).certificates.law_atoms.interface.bundle.realize_os_sector
                      (YangMillsVacuumGapChosenSiteExecutionTraceData
                        R hww tm obs rsec corr gapf hgap).chosen_reconstructed_sector
                      (YangMillsVacuumGapChosenSiteExecutionTraceData
                        R hww tm obs rsec corr gapf hgap).chosen_correlation_family =
                    (YangMillsVacuumGapChosenSiteExecutionTraceData
                      R hww tm obs rsec corr gapf hgap).chosen_os_sector) /\
                  ((YangMillsVacuumGapChosenSiteExecutionTraceData
                      R hww tm obs rsec corr gapf hgap).certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
                      (YangMillsVacuumGapChosenSiteExecutionTraceData
                        R hww tm obs rsec corr gapf hgap).chosen_gap_functional
                      (YangMillsVacuumGapChosenSiteExecutionTraceData
                        R hww tm obs rsec corr gapf hgap).chosen_os_sector) := by
  exact YangMillsVacuumGapChosenSiteExecutionTraceExportStatement

end MaleyLean
