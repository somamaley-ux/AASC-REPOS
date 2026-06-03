import MaleyLean.Papers.YangMills.Kernel.VacuumGapChosenSiteExecutionTrace

namespace MaleyLean

/--
Primitive vacuum-gap construction object exposing the chosen transport-state,
OS-sector, and gap-evaluation constructions as named native data.
-/
structure YMVacuumGapPrimitiveConstructions (R : YMVacuumGapRoute) where
  trace : YMVacuumGapChosenSiteExecutionTrace R
  constructed_transport_state : trace.certificates.law_atoms.interface.bundle.transport_state
  constructed_os_sector : trace.certificates.law_atoms.interface.bundle.os_sector
  transport_state_construction :
    trace.certificates.law_atoms.interface.bundle.transport_observable
      trace.chosen_transport_map
      trace.chosen_observable =
    constructed_transport_state
  os_sector_construction :
    trace.certificates.law_atoms.interface.bundle.realize_os_sector
      trace.chosen_reconstructed_sector
      trace.chosen_correlation_family =
    constructed_os_sector
  gap_evaluation_construction :
    trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
      trace.chosen_gap_functional
      constructed_os_sector

def YangMillsVacuumGapPrimitiveConstructionsData
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
  YMVacuumGapPrimitiveConstructions R := by
  let T := YangMillsVacuumGapChosenSiteExecutionTraceData R hww tm obs rsec corr gapf hgap
  exact
    { trace := T
      constructed_transport_state := T.chosen_transport_state
      constructed_os_sector := T.chosen_os_sector
      transport_state_construction := T.certificates.transport_application
      os_sector_construction := T.certificates.realization_application
      gap_evaluation_construction := by
        simpa using T.certificates.gap_application }

theorem YangMillsVacuumGapPrimitiveConstructionsExportStatement
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
  let C := YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro C) <|
      And.intro C.transport_state_construction <|
        And.intro C.os_sector_construction C.gap_evaluation_construction

end MaleyLean
