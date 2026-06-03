import MaleyLean.Papers.YangMills.Kernel.VacuumGapNativeProofHomes

namespace MaleyLean

/--
Surface-level summary exposing the current vacuum-gap proof-home layer.
-/
theorem YangMillsVacuumGapNativeProofHomesSummaryStatement :
  forall R : YMVacuumGapRoute,
    forall hww : R.weak_window_certificate_ready,
      forall _tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map,
        forall _obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family,
          forall rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector,
            forall corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family,
              forall gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional,
                forall hgap :
                  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
                    gapf
                    ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr),
                    Nonempty (YMVacuumGapNativeProofHomes R) /\
                    ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
                    ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
                    ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
                    R.continuum_gap_transport_ready /\
                    R.transport_package.os_transport_ready /\
                    R.transport_package.positive_gap_exhibited /\
                    R.transport_package.lattice_gap_input /\
                    R.reconstruction_ready /\
                    R.reconstruction_package.os_sector_ready /\
                    R.reconstruction_package.minkowski_gap_ready /\
                    R.reconstruction_package.obtained_from_transport /\
                    ((YangMillsVacuumGapMassGapCompatibilityData
                        R hww _tm _obs rsec corr gapf hgap).interface.bundle.transport_observable
                        (YangMillsVacuumGapMassGapCompatibilityData
                          R hww _tm _obs rsec corr gapf hgap).interface.chosen_transport_map
                        (YangMillsVacuumGapMassGapCompatibilityData
                          R hww _tm _obs rsec corr gapf hgap).interface.chosen_observable =
                      (YangMillsVacuumGapMassGapCompatibilityData
                        R hww _tm _obs rsec corr gapf hgap).interface.chosen_transport_state) /\
                    ((YangMillsVacuumGapMassGapCompatibilityData
                        R hww _tm _obs rsec corr gapf hgap).interface.bundle.realize_os_sector
                        (YangMillsVacuumGapMassGapCompatibilityData
                          R hww _tm _obs rsec corr gapf hgap).interface.chosen_reconstructed_sector
                        (YangMillsVacuumGapMassGapCompatibilityData
                          R hww _tm _obs rsec corr gapf hgap).interface.chosen_correlation_family =
                      (YangMillsVacuumGapMassGapCompatibilityData
                        R hww _tm _obs rsec corr gapf hgap).interface.chosen_os_sector) /\
                    (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
                        gapf
                        ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) := by
  exact YangMillsVacuumGapNativeProofHomesExportStatement

end MaleyLean
