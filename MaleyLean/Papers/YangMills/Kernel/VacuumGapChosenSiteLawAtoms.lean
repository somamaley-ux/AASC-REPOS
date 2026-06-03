import MaleyLean.Papers.YangMills.Kernel.VacuumGapNativeProofHomes

namespace MaleyLean

/--
Atomic chosen-site law support object for the vacuum-gap heart.

This splits the current proof-home package into the smallest transport,
reconstruction, and realized-gap relations carried at one selected site.
-/
structure YMVacuumGapChosenSiteLawAtoms (R : YMVacuumGapRoute) where
  interface : YMVacuumGapRelationalInterface R
  transport_relation :
    interface.bundle.transport_observable
      interface.chosen_transport_map
      interface.chosen_observable =
    interface.chosen_transport_state
  reconstruction_relation :
    interface.bundle.realize_os_sector
      interface.chosen_reconstructed_sector
      interface.chosen_correlation_family =
    interface.chosen_os_sector
  realized_gap_relation :
    interface.bundle.evaluate_minkowski_gap
      interface.chosen_gap_functional
      interface.chosen_os_sector

def YangMillsVacuumGapChosenSiteLawAtomsData
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
  YMVacuumGapChosenSiteLawAtoms R := by
  let I := YangMillsVacuumGapRelationalInterfaceData R hww tm obs rsec corr gapf hgap
  exact
    { interface := I
      transport_relation := I.transport_relation
      reconstruction_relation := I.reconstruction_relation
      realized_gap_relation := I.gap_relation }

theorem YangMillsVacuumGapChosenSiteLawAtomsExportStatement
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
  Nonempty (YMVacuumGapChosenSiteLawAtoms R) /\
  ((YangMillsVacuumGapRelationalInterfaceData
      R hww tm obs rsec corr gapf hgap).bundle.transport_observable
      (YangMillsVacuumGapRelationalInterfaceData
        R hww tm obs rsec corr gapf hgap).chosen_transport_map
      (YangMillsVacuumGapRelationalInterfaceData
        R hww tm obs rsec corr gapf hgap).chosen_observable =
    (YangMillsVacuumGapRelationalInterfaceData
      R hww tm obs rsec corr gapf hgap).chosen_transport_state) /\
  ((YangMillsVacuumGapRelationalInterfaceData
      R hww tm obs rsec corr gapf hgap).bundle.realize_os_sector
      (YangMillsVacuumGapRelationalInterfaceData
        R hww tm obs rsec corr gapf hgap).chosen_reconstructed_sector
      (YangMillsVacuumGapRelationalInterfaceData
        R hww tm obs rsec corr gapf hgap).chosen_correlation_family =
    (YangMillsVacuumGapRelationalInterfaceData
      R hww tm obs rsec corr gapf hgap).chosen_os_sector) /\
  (YangMillsVacuumGapRelationalInterfaceData
      R hww tm obs rsec corr gapf hgap).bundle.evaluate_minkowski_gap
      (YangMillsVacuumGapRelationalInterfaceData
        R hww tm obs rsec corr gapf hgap).chosen_gap_functional
      (YangMillsVacuumGapRelationalInterfaceData
        R hww tm obs rsec corr gapf hgap).chosen_os_sector := by
  let A := YangMillsVacuumGapChosenSiteLawAtomsData R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro A) <|
      And.intro A.transport_relation <|
        And.intro A.reconstruction_relation A.realized_gap_relation

end MaleyLean
