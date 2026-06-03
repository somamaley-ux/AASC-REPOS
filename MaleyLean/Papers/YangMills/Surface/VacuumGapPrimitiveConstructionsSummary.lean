import MaleyLean.Papers.YangMills.Kernel.VacuumGapPrimitiveConstructions

namespace MaleyLean

theorem YangMillsVacuumGapPrimitiveConstructionsSummaryStatement :
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
                  Nonempty (YMVacuumGapPrimitiveConstructions R) /\
                  ((YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.certificates.law_atoms.interface.bundle.transport_observable
                      (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.chosen_transport_map
                      (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.chosen_observable =
                    (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).constructed_transport_state) /\
                  ((YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.certificates.law_atoms.interface.bundle.realize_os_sector
                      (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.chosen_reconstructed_sector
                      (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.chosen_correlation_family =
                    (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).constructed_os_sector) /\
                  ((YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
                      (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).trace.chosen_gap_functional
                      (YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap).constructed_os_sector) := by
  exact YangMillsVacuumGapPrimitiveConstructionsExportStatement

end MaleyLean
