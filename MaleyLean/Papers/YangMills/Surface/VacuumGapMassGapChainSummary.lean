import MaleyLean.Papers.YangMills.Kernel.VacuumGapMassGapChain

namespace MaleyLean

/--
Surface-level summary exposing the native vacuum-gap mass-gap chain package.
-/
theorem YangMillsVacuumGapMassGapChainSummaryStatement :
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
                  Nonempty (YMVacuumGapMassGapChain R) /\
                  ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
                  ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
                  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
                  R.continuum_gap_transport_ready /\
                  R.transport_package.positive_gap_exhibited /\
                  R.reconstruction_package.minkowski_gap_ready /\
                  R.reconstruction_package.obtained_from_transport /\
                  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
                    gapf
                    ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) := by
  intro R hww tm obs rsec corr gapf hgap
  exact
    YangMillsVacuumGapMassGapChainExportStatement
      R hww tm obs rsec corr gapf hgap

end MaleyLean
