import MaleyLean.Papers.YangMills.Kernel.VacuumGapSemanticBundle

namespace MaleyLean

/--
Vacuum-gap-side relational interface expressing that the bundled transport and
reconstruction operations are organized around one chosen transport site and
one chosen reconstruction/gap-evaluation site.
-/
structure YMVacuumGapRelationalInterface (R : YMVacuumGapRoute) where
  bundle : YMVacuumGapSemanticBundle R
  chosen_transport_map : bundle.transport_map
  chosen_observable : bundle.lattice_observable_family
  chosen_transport_state : bundle.transport_state
  chosen_reconstructed_sector : bundle.reconstructed_sector
  chosen_correlation_family : bundle.os_correlation_family
  chosen_os_sector : bundle.os_sector
  chosen_gap_functional : bundle.minkowski_gap_functional
  transport_relation :
    bundle.transport_observable chosen_transport_map chosen_observable =
      chosen_transport_state
  reconstruction_relation :
    bundle.realize_os_sector chosen_reconstructed_sector chosen_correlation_family =
      chosen_os_sector
  gap_relation :
    bundle.evaluate_minkowski_gap chosen_gap_functional chosen_os_sector

def YangMillsVacuumGapRelationalInterfaceData
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
  YMVacuumGapRelationalInterface R := by
  let B := YangMillsVacuumGapSemanticBundleData R hww
  refine
    { bundle := B
      chosen_transport_map := tm
      chosen_observable := obs
      chosen_transport_state := B.transport_observable tm obs
      chosen_reconstructed_sector := rsec
      chosen_correlation_family := corr
      chosen_os_sector := B.realize_os_sector rsec corr
      chosen_gap_functional := gapf
      transport_relation := rfl
      reconstruction_relation := rfl
      gap_relation := hgap }

theorem YangMillsVacuumGapRelationalInterfaceExistsStatement
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
  Nonempty (YMVacuumGapRelationalInterface R) := by
  exact ⟨YangMillsVacuumGapRelationalInterfaceData R hww tm obs rsec corr gapf hgap⟩

theorem YangMillsVacuumGapRelationalCompatibilityStatement
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
  Nonempty (YMVacuumGapRelationalInterface R) /\
  R.transport_package.os_transport_ready /\
  R.transport_package.positive_gap_exhibited /\
  R.reconstruction_package.minkowski_gap_ready := by
  have hI :=
    YangMillsVacuumGapRelationalInterfaceExistsStatement
      R hww tm obs rsec corr gapf hgap
  have hB := YangMillsVacuumGapCoreExhibitsNamedOutputsStatement R hww
  exact And.intro hI <| And.intro hB.2.1 <| And.intro hB.2.2.1 hB.2.2.2.2.2.2.1

end MaleyLean
