import MaleyLean.Papers.YangMills.Kernel.VacuumGapOperatorApplicationCertificates

namespace MaleyLean

theorem YangMillsVacuumGapOperatorApplicationCertificatesSummaryStatement :
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
                  Nonempty (YMVacuumGapOperatorApplicationCertificates R) /\
                  ((YangMillsVacuumGapOperatorPrimitivesData R hww).transport_operator
                      (YangMillsVacuumGapRelationalInterfaceData
                        R hww tm obs rsec corr gapf hgap).chosen_transport_map
                      (YangMillsVacuumGapRelationalInterfaceData
                        R hww tm obs rsec corr gapf hgap).chosen_observable =
                    (YangMillsVacuumGapRelationalInterfaceData
                      R hww tm obs rsec corr gapf hgap).chosen_transport_state) /\
                  ((YangMillsVacuumGapOperatorPrimitivesData R hww).realize_operator
                      (YangMillsVacuumGapRelationalInterfaceData
                        R hww tm obs rsec corr gapf hgap).chosen_reconstructed_sector
                      (YangMillsVacuumGapRelationalInterfaceData
                        R hww tm obs rsec corr gapf hgap).chosen_correlation_family =
                    (YangMillsVacuumGapRelationalInterfaceData
                      R hww tm obs rsec corr gapf hgap).chosen_os_sector) /\
                  (YangMillsVacuumGapOperatorPrimitivesData R hww).gap_operator
                      (YangMillsVacuumGapRelationalInterfaceData
                        R hww tm obs rsec corr gapf hgap).chosen_gap_functional
                      (YangMillsVacuumGapRelationalInterfaceData
                        R hww tm obs rsec corr gapf hgap).chosen_os_sector := by
  exact YangMillsVacuumGapOperatorApplicationCertificatesExportStatement

end MaleyLean
