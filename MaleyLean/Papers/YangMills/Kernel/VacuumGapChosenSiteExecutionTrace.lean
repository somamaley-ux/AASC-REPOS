import MaleyLean.Papers.YangMills.Kernel.VacuumGapOperatorApplicationCertificates

namespace MaleyLean

/-- Explicit chosen-site vacuum-gap inputs and outputs carried by the current operator layer. -/
structure YMVacuumGapChosenSiteExecutionTrace (R : YMVacuumGapRoute) where
  certificates : YMVacuumGapOperatorApplicationCertificates R
  chosen_transport_map := certificates.law_atoms.interface.chosen_transport_map
  chosen_observable := certificates.law_atoms.interface.chosen_observable
  chosen_transport_state := certificates.law_atoms.interface.chosen_transport_state
  chosen_reconstructed_sector := certificates.law_atoms.interface.chosen_reconstructed_sector
  chosen_correlation_family := certificates.law_atoms.interface.chosen_correlation_family
  chosen_os_sector := certificates.law_atoms.interface.chosen_os_sector
  chosen_gap_functional := certificates.law_atoms.interface.chosen_gap_functional
  chosen_gap_judgement := certificates.law_atoms.realized_gap_relation

def YangMillsVacuumGapChosenSiteExecutionTraceData
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready)
  (tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map)
  (obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family)
  (rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector)
  (corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family)
  (gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional)
  (hgap :
    (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr)) :
  YMVacuumGapChosenSiteExecutionTrace R := by
  exact
    { certificates :=
        YangMillsVacuumGapOperatorApplicationCertificatesData
          R hww tm obs rsec corr gapf hgap }

theorem YangMillsVacuumGapChosenSiteExecutionTraceExportStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready)
  (tm : (YangMillsVacuumGapSemanticBundleData R hww).transport_map)
  (obs : (YangMillsVacuumGapSemanticBundleData R hww).lattice_observable_family)
  (rsec : (YangMillsVacuumGapSemanticBundleData R hww).reconstructed_sector)
  (corr : (YangMillsVacuumGapSemanticBundleData R hww).os_correlation_family)
  (gapf : (YangMillsVacuumGapSemanticBundleData R hww).minkowski_gap_functional)
  (hgap :
    (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr)) :
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
  let T := YangMillsVacuumGapChosenSiteExecutionTraceData R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro T) <|
      And.intro T.certificates.transport_application <|
        And.intro T.certificates.realization_application T.certificates.gap_application

end MaleyLean
