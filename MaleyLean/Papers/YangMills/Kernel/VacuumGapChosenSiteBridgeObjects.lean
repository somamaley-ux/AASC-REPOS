import MaleyLean.Papers.YangMills.Kernel.VacuumGapMassGapCompatibility

namespace MaleyLean

/--
Native chosen-site bridge object for the Route 1 vacuum-gap chain.

This packages the full explicit Route 1 readiness statement together with the
chosen-site mass-gap compatibility object, so the current QE3/reconstruction
bridge can be carried by one typed theorem-facing object rather than only by
separate conjunction theorems.
-/
structure YMVacuumGapChosenSiteBridgeObject (R : YMVacuumGapRoute) where
  compatibility : YMVacuumGapMassGapCompatibility R
  route1_explicit_witness : ym_route1_explicit_statement R
  os_transport_witness : R.transport_package.os_transport_ready
  lattice_gap_input_witness : R.transport_package.lattice_gap_input
  reconstruction_ready_witness : R.reconstruction_ready
  os_sector_ready_witness : R.reconstruction_package.os_sector_ready
  realized_gap_supports_minkowski_gap :
    compatibility.interface.bundle.evaluate_minkowski_gap
      compatibility.interface.chosen_gap_functional
      compatibility.interface.chosen_os_sector ->
    R.reconstruction_package.minkowski_gap_ready
  realized_gap_supports_transport_origin :
    compatibility.interface.bundle.evaluate_minkowski_gap
      compatibility.interface.chosen_gap_functional
      compatibility.interface.chosen_os_sector ->
    R.reconstruction_package.obtained_from_transport

def YangMillsVacuumGapChosenSiteBridgeObjectData
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
  YMVacuumGapChosenSiteBridgeObject R := by
  let K := YangMillsVacuumGapMassGapCompatibilityData R hww tm obs rsec corr gapf hgap
  let hroute := YangMillsRoute1ExplicitStatementFromWeakWindowStatement R hww
  exact
    { compatibility := K
      route1_explicit_witness := hroute
      os_transport_witness := hroute.2.1
      lattice_gap_input_witness := hroute.2.2.2.1
      reconstruction_ready_witness := hroute.2.2.2.2.1
      os_sector_ready_witness := hroute.2.2.2.2.2.1
      realized_gap_supports_minkowski_gap := K.gap_realization_supports_minkowski_gap
      realized_gap_supports_transport_origin := by
        intro _
        exact hroute.2.2.2.2.2.2.2 }

theorem YangMillsVacuumGapChosenSiteBridgeExportStatement
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
  Nonempty (YMVacuumGapChosenSiteBridgeObject R) /\
  ym_route1_explicit_statement R /\
  ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
  ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  R.transport_package.os_transport_ready /\
  R.transport_package.lattice_gap_input /\
  R.reconstruction_ready /\
  R.reconstruction_package.os_sector_ready /\
  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) /\
  ((YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) ->
    R.reconstruction_package.minkowski_gap_ready) /\
  ((YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) ->
    R.reconstruction_package.obtained_from_transport) := by
  let B := YangMillsVacuumGapChosenSiteBridgeObjectData R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro B) <|
      And.intro B.route1_explicit_witness <|
        And.intro B.compatibility.chain.transport_label <|
          And.intro B.compatibility.chain.sharp_local_gap_label <|
            And.intro B.compatibility.chain.transport_origin_label <|
              And.intro B.os_transport_witness <|
                And.intro B.lattice_gap_input_witness <|
                  And.intro B.reconstruction_ready_witness <|
                    And.intro B.os_sector_ready_witness <|
                      And.intro
                        B.compatibility.chosen_site_gap <|
                        And.intro
                          B.realized_gap_supports_minkowski_gap
                          B.realized_gap_supports_transport_origin

end MaleyLean
