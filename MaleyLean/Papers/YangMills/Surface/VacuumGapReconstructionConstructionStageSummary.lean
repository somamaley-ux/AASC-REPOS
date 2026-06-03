import MaleyLean.Papers.YangMills.Kernel.VacuumGapReconstructionConstructionStage

namespace MaleyLean

theorem YangMillsVacuumGapReconstructionConstructionStageSummaryStatement :
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
                  Nonempty (YMVacuumGapReconstructionConstructionStage R) /\
                  ((YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructions.trace.certificates.law_atoms.interface.bundle.realize_os_sector
                      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_reconstructed_sector
                      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_correlation_family =
                    (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_os_sector) /\
                  ((YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructions.trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
                      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_gap_functional
                      (YangMillsVacuumGapReconstructionConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_os_sector) := by
  exact YangMillsVacuumGapReconstructionConstructionStageExportStatement

end MaleyLean
