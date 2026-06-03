import MaleyLean.Papers.YangMills.Kernel.VacuumGapTransportConstructionStage

namespace MaleyLean

theorem YangMillsVacuumGapTransportConstructionStageSummaryStatement :
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
                  Nonempty (YMVacuumGapTransportConstructionStage R) /\
                  ((YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).constructions.trace.certificates.law_atoms.interface.bundle.transport_observable
                      (YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_transport_map
                      (YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_observable =
                    (YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_transport_state) := by
  exact YangMillsVacuumGapTransportConstructionStageExportStatement

end MaleyLean
