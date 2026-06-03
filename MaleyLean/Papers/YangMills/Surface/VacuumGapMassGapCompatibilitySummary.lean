import MaleyLean.Papers.YangMills.Kernel.VacuumGapMassGapCompatibility

namespace MaleyLean

/--
Surface-level summary exposing the chosen-site compatibility package for the
vacuum-gap mass-gap chain.
-/
theorem YangMillsVacuumGapMassGapCompatibilitySummaryStatement :
  forall R : YMVacuumGapRoute,
    forall hww : R.weak_window_certificate_ready,
      forall _tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map,
        forall _obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family,
          forall rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector,
            forall corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family,
              forall gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional,
                forall _hgap :
                  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
                    gapf
                    ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr),
                  Nonempty (YMVacuumGapMassGapCompatibility R) /\
                  ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
                  ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
                  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
                  R.transport_package.positive_gap_exhibited /\
                  R.reconstruction_package.minkowski_gap_ready /\
                  R.reconstruction_package.obtained_from_transport /\
                  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
                    gapf
                    ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) /\
                  ((YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
                      gapf
                      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) ->
                    R.reconstruction_package.minkowski_gap_ready) := by
  exact YangMillsVacuumGapMassGapCompatibilityExportStatement

end MaleyLean
