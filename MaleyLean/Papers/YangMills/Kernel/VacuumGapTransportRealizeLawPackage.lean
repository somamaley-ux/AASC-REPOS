import MaleyLean.Papers.YangMills.Kernel.VacuumGapRelationalInterface

namespace MaleyLean

/--
Structured vacuum-gap-side law package organizing transport and sector
realization around one chosen relational evaluation site.
-/
structure YMVacuumGapTransportRealizeLawPackage (R : YMVacuumGapRoute) where
  interface : YMVacuumGapRelationalInterface R
  realize_sector :
    interface.bundle.reconstructed_sector ->
    interface.bundle.os_correlation_family ->
    interface.bundle.os_sector
  transport_then_realize :
    interface.bundle.transport_map ->
    interface.bundle.lattice_observable_family ->
    interface.bundle.reconstructed_sector ->
    interface.bundle.os_correlation_family ->
    interface.bundle.os_sector
  realization_compatibility :
    forall tm : interface.bundle.transport_map,
      forall obs : interface.bundle.lattice_observable_family,
        forall rsec : interface.bundle.reconstructed_sector,
          forall corr : interface.bundle.os_correlation_family,
            transport_then_realize tm obs rsec corr =
              realize_sector rsec corr
  chosen_site_law :
    transport_then_realize
      interface.chosen_transport_map
      interface.chosen_observable
      interface.chosen_reconstructed_sector
      interface.chosen_correlation_family =
      interface.chosen_os_sector
  minkowski_gap_from_realization :
    interface.bundle.evaluate_minkowski_gap
      interface.chosen_gap_functional
      interface.chosen_os_sector ->
    R.reconstruction_package.minkowski_gap_ready
  minkowski_gap_witness : R.reconstruction_package.minkowski_gap_ready

def YangMillsVacuumGapTransportRealizeLawPackageData
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
  YMVacuumGapTransportRealizeLawPackage R := by
  let I := YangMillsVacuumGapRelationalInterfaceData R hww tm obs rsec corr gapf hgap
  refine
    { interface := I
      realize_sector := fun rsec' corr' =>
        I.bundle.realize_os_sector rsec' corr'
      transport_then_realize := fun _ _ rsec' corr' =>
        I.bundle.realize_os_sector rsec' corr'
      realization_compatibility := by
        intro _ _ rsec' corr'
        rfl
      chosen_site_law := by
        exact I.reconstruction_relation
      minkowski_gap_from_realization := by
        intro _
        exact I.bundle.minkowski_gap_ready
      minkowski_gap_witness := I.bundle.minkowski_gap_ready }

theorem YangMillsVacuumGapTransportRealizeLawPackageExistsStatement
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
  Nonempty (YMVacuumGapTransportRealizeLawPackage R) := by
  exact Nonempty.intro
    (YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap)

theorem YangMillsVacuumGapTransportRealizeLawPackageWitnessStatement
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
  let P := YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap
  Nonempty (YMVacuumGapTransportRealizeLawPackage R) /\
  P.transport_then_realize tm obs rsec corr = P.interface.chosen_os_sector /\
  R.reconstruction_package.minkowski_gap_ready := by
  let P := YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap
  exact And.intro
    (Nonempty.intro P)
    (And.intro P.chosen_site_law P.minkowski_gap_witness)

theorem YangMillsVacuumGapRealizationCompatibilityStatement
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
  let P := YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap
  P.transport_then_realize tm obs rsec corr = P.realize_sector rsec corr := by
  let P := YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap
  exact P.realization_compatibility tm obs rsec corr

end MaleyLean
