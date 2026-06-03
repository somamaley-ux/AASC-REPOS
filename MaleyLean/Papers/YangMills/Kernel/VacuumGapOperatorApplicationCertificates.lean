import MaleyLean.Papers.YangMills.Kernel.VacuumGapOperatorPrimitives

namespace MaleyLean

/-- Chosen-site application certificates for the primitive vacuum-gap operators. -/
structure YMVacuumGapOperatorApplicationCertificates (R : YMVacuumGapRoute) where
  primitives_present : Nonempty (YMVacuumGapOperatorPrimitives R)
  law_atoms : YMVacuumGapChosenSiteLawAtoms R
  transport_application :
    law_atoms.interface.bundle.transport_observable
      law_atoms.interface.chosen_transport_map
      law_atoms.interface.chosen_observable =
    law_atoms.interface.chosen_transport_state
  realization_application :
    law_atoms.interface.bundle.realize_os_sector
      law_atoms.interface.chosen_reconstructed_sector
      law_atoms.interface.chosen_correlation_family =
    law_atoms.interface.chosen_os_sector
  gap_application :
    law_atoms.interface.bundle.evaluate_minkowski_gap
      law_atoms.interface.chosen_gap_functional
      law_atoms.interface.chosen_os_sector

def YangMillsVacuumGapOperatorApplicationCertificatesData
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
  YMVacuumGapOperatorApplicationCertificates R := by
  let P := YangMillsVacuumGapOperatorPrimitivesData R hww
  let A := YangMillsVacuumGapChosenSiteLawAtomsData R hww tm obs rsec corr gapf hgap
  exact
    { primitives_present := Nonempty.intro P
      law_atoms := A
      transport_application := by
        exact A.transport_relation
      realization_application := by
        exact A.reconstruction_relation
      gap_application := by
        exact A.realized_gap_relation }

theorem YangMillsVacuumGapOperatorApplicationCertificatesExportStatement
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
  let C := YangMillsVacuumGapOperatorApplicationCertificatesData R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro C) <|
      And.intro C.transport_application <|
        And.intro C.realization_application C.gap_application

end MaleyLean
