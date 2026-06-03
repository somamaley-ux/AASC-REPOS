import MaleyLean.Papers.YangMills.Kernel.VacuumGapMassGapChain

namespace MaleyLean

/--
Compatibility package for the native vacuum-gap mass-gap chain at one chosen
transport/reconstruction site.

This keeps together:

- the `F.216` / `F.5` / `M.5` label package,
- the chosen-site relational interface,
- the transport-realize law package,
- and the explicit realized-gap statement at that chosen site.
-/
structure YMVacuumGapMassGapCompatibility (R : YMVacuumGapRoute) where
  chain : YMVacuumGapMassGapChain R
  interface : YMVacuumGapRelationalInterface R
  law_package : YMVacuumGapTransportRealizeLawPackage R
  chosen_site_transport :
    interface.bundle.transport_observable
      interface.chosen_transport_map
      interface.chosen_observable =
    interface.chosen_transport_state
  chosen_site_reconstruction :
    interface.bundle.realize_os_sector
      interface.chosen_reconstructed_sector
      interface.chosen_correlation_family =
    interface.chosen_os_sector
  chosen_site_gap :
    interface.bundle.evaluate_minkowski_gap
      interface.chosen_gap_functional
      interface.chosen_os_sector
  gap_realization_supports_minkowski_gap :
    interface.bundle.evaluate_minkowski_gap
      interface.chosen_gap_functional
      interface.chosen_os_sector ->
    R.reconstruction_package.minkowski_gap_ready

def YangMillsVacuumGapMassGapCompatibilityData
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
  YMVacuumGapMassGapCompatibility R := by
  let C := YangMillsVacuumGapMassGapChainData R hww tm obs rsec corr gapf hgap
  let I := YangMillsVacuumGapRelationalInterfaceData R hww tm obs rsec corr gapf hgap
  let P := YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap
  exact
    { chain := C
      interface := I
      law_package := P
      chosen_site_transport := I.transport_relation
      chosen_site_reconstruction := I.reconstruction_relation
      chosen_site_gap := I.gap_relation
      gap_realization_supports_minkowski_gap := P.minkowski_gap_from_realization }

theorem YangMillsVacuumGapMassGapCompatibilityExportStatement
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
  Nonempty (YMVacuumGapMassGapCompatibility R) /\
  ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
  ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  R.transport_package.positive_gap_exhibited /\
  R.reconstruction_package.minkowski_gap_ready /\
  R.reconstruction_package.obtained_from_transport /\
  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) /\
  ((YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) ->
    R.reconstruction_package.minkowski_gap_ready) := by
  let K := YangMillsVacuumGapMassGapCompatibilityData R hww tm obs rsec corr gapf hgap
  exact
    And.intro ⟨K⟩ <|
      And.intro K.chain.transport_label <|
        And.intro K.chain.sharp_local_gap_label <|
          And.intro K.chain.transport_origin_label <|
            And.intro K.chain.native_objects.transport_object.positive_gap <|
              And.intro K.chain.native_objects.sharp_local_gap_object.minkowski_gap_ready <|
                And.intro
                  K.chain.native_objects.sharp_local_gap_object.obtained_from_transport <|
                  And.intro
                    K.chosen_site_gap
                    K.gap_realization_supports_minkowski_gap

end MaleyLean
