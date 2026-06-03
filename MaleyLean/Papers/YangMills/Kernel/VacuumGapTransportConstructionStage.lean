import MaleyLean.Papers.YangMills.Kernel.VacuumGapPrimitiveConstructions

namespace MaleyLean

/-- Primitive transport-side construction stage for the vacuum-gap heart. -/
structure YMVacuumGapTransportConstructionStage (R : YMVacuumGapRoute) where
  constructions : YMVacuumGapPrimitiveConstructions R
  chosen_transport_map := constructions.trace.chosen_transport_map
  chosen_observable := constructions.trace.chosen_observable
  constructed_transport_state := constructions.constructed_transport_state
  transport_state_construction :
    constructions.trace.certificates.law_atoms.interface.bundle.transport_observable
      chosen_transport_map
      chosen_observable =
    constructed_transport_state

def YangMillsVacuumGapTransportConstructionStageData
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
  YMVacuumGapTransportConstructionStage R := by
  let C := YangMillsVacuumGapPrimitiveConstructionsData R hww tm obs rsec corr gapf hgap
  exact
    { constructions := C
      transport_state_construction := C.transport_state_construction }

theorem YangMillsVacuumGapTransportConstructionStageExportStatement
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
  Nonempty (YMVacuumGapTransportConstructionStage R) /\
  ((YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).constructions.trace.certificates.law_atoms.interface.bundle.transport_observable
      (YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_transport_map
      (YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).chosen_observable =
    (YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap).constructed_transport_state) := by
  let T := YangMillsVacuumGapTransportConstructionStageData R hww tm obs rsec corr gapf hgap
  exact And.intro (Nonempty.intro T) T.transport_state_construction

end MaleyLean
