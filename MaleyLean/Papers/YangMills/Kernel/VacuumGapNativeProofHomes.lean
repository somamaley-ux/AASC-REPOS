import MaleyLean.Papers.YangMills.Kernel.VacuumGapMassGapCompatibility

namespace MaleyLean

/--
First explicit proof-home layer underneath the current vacuum-gap route
interface.

This package does not yet reconstruct the full analysis from foundational
definitions, but it stops short of treating the `F.216 -> F.5 -> M.5` chain as
only a bare collection of route-level readiness props. Instead it records the
chosen-site transport, realization, and gap-transfer certificates that witness
how those props are supported.
-/
structure YMVacuumGapTransportProofHome (R : YMVacuumGapRoute) where
  interface : YMVacuumGapRelationalInterface R
  transport_certificate :
    interface.bundle.transport_observable
      interface.chosen_transport_map
      interface.chosen_observable =
    interface.chosen_transport_state
  lattice_gap_input_certificate : R.transport_package.lattice_gap_input
  os_transport_certificate : R.transport_package.os_transport_ready
  positive_gap_certificate : R.transport_package.positive_gap_exhibited
  continuum_gap_transport_certificate : R.continuum_gap_transport_ready

/--
Explicit proof-home package for the reconstruction/gap-transfer side at one
chosen site.
-/
structure YMVacuumGapReconstructionProofHome (R : YMVacuumGapRoute) where
  interface : YMVacuumGapRelationalInterface R
  reconstruction_certificate :
    interface.bundle.realize_os_sector
      interface.chosen_reconstructed_sector
      interface.chosen_correlation_family =
    interface.chosen_os_sector
  chosen_gap_certificate :
    interface.bundle.evaluate_minkowski_gap
      interface.chosen_gap_functional
      interface.chosen_os_sector
  reconstruction_ready_certificate : R.reconstruction_ready
  os_sector_ready_certificate : R.reconstruction_package.os_sector_ready
  minkowski_gap_certificate : R.reconstruction_package.minkowski_gap_ready
  transport_origin_certificate : R.reconstruction_package.obtained_from_transport

/--
Combined native proof-home package for the current vacuum-gap mass-gap chain.
-/
structure YMVacuumGapNativeProofHomes (R : YMVacuumGapRoute) where
  compatibility : YMVacuumGapMassGapCompatibility R
  transport_home : YMVacuumGapTransportProofHome R
  reconstruction_home : YMVacuumGapReconstructionProofHome R

def YangMillsVacuumGapTransportProofHomeData
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
  YMVacuumGapTransportProofHome R := by
  let K := YangMillsVacuumGapMassGapCompatibilityData R hww tm obs rsec corr gapf hgap
  exact
    { interface := K.interface
      transport_certificate := K.chosen_site_transport
      lattice_gap_input_certificate :=
        K.chain.native_objects.transport_object.lattice_gap_input
      os_transport_certificate :=
        K.chain.native_objects.transport_object.os_transport
      positive_gap_certificate :=
        K.chain.native_objects.transport_object.positive_gap
      continuum_gap_transport_certificate :=
        K.chain.native_objects.transport_object.continuum_gap_transport }

def YangMillsVacuumGapReconstructionProofHomeData
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
  YMVacuumGapReconstructionProofHome R := by
  let K := YangMillsVacuumGapMassGapCompatibilityData R hww tm obs rsec corr gapf hgap
  let T := K.chain.native_objects.reconstruction_transfer_object
  let L := T.law_package
  exact
    { interface := K.interface
      reconstruction_certificate := K.chosen_site_reconstruction
      chosen_gap_certificate := K.chosen_site_gap
      reconstruction_ready_certificate := L.interface.bundle.reconstruction_ready
      os_sector_ready_certificate := L.interface.bundle.os_sector_ready
      minkowski_gap_certificate := T.minkowski_gap_ready
      transport_origin_certificate := T.obtained_from_transport }

def YangMillsVacuumGapNativeProofHomesData
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
  YMVacuumGapNativeProofHomes R := by
  let K := YangMillsVacuumGapMassGapCompatibilityData R hww tm obs rsec corr gapf hgap
  exact
    { compatibility := K
      transport_home :=
        YangMillsVacuumGapTransportProofHomeData
          R hww tm obs rsec corr gapf hgap
      reconstruction_home :=
        YangMillsVacuumGapReconstructionProofHomeData
          R hww tm obs rsec corr gapf hgap }

theorem YangMillsVacuumGapNativeProofHomesExportStatement
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
  Nonempty (YMVacuumGapNativeProofHomes R) /\
  ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
  ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  R.continuum_gap_transport_ready /\
  R.transport_package.os_transport_ready /\
  R.transport_package.positive_gap_exhibited /\
  R.transport_package.lattice_gap_input /\
  R.reconstruction_ready /\
  R.reconstruction_package.os_sector_ready /\
  R.reconstruction_package.minkowski_gap_ready /\
  R.reconstruction_package.obtained_from_transport /\
  ((YangMillsVacuumGapMassGapCompatibilityData
      R hww tm obs rsec corr gapf hgap).interface.bundle.transport_observable
      (YangMillsVacuumGapMassGapCompatibilityData
        R hww tm obs rsec corr gapf hgap).interface.chosen_transport_map
      (YangMillsVacuumGapMassGapCompatibilityData
        R hww tm obs rsec corr gapf hgap).interface.chosen_observable =
    (YangMillsVacuumGapMassGapCompatibilityData
      R hww tm obs rsec corr gapf hgap).interface.chosen_transport_state) /\
  ((YangMillsVacuumGapMassGapCompatibilityData
      R hww tm obs rsec corr gapf hgap).interface.bundle.realize_os_sector
      (YangMillsVacuumGapMassGapCompatibilityData
        R hww tm obs rsec corr gapf hgap).interface.chosen_reconstructed_sector
      (YangMillsVacuumGapMassGapCompatibilityData
        R hww tm obs rsec corr gapf hgap).interface.chosen_correlation_family =
    (YangMillsVacuumGapMassGapCompatibilityData
      R hww tm obs rsec corr gapf hgap).interface.chosen_os_sector) /\
  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) := by
  let P := YangMillsVacuumGapNativeProofHomesData R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro P) <|
      And.intro P.compatibility.chain.transport_label <|
        And.intro P.compatibility.chain.sharp_local_gap_label <|
          And.intro P.compatibility.chain.transport_origin_label <|
            And.intro P.transport_home.continuum_gap_transport_certificate <|
              And.intro P.transport_home.os_transport_certificate <|
                And.intro P.transport_home.positive_gap_certificate <|
                  And.intro P.transport_home.lattice_gap_input_certificate <|
                    And.intro P.reconstruction_home.reconstruction_ready_certificate <|
                      And.intro P.reconstruction_home.os_sector_ready_certificate <|
                        And.intro P.reconstruction_home.minkowski_gap_certificate <|
                          And.intro P.reconstruction_home.transport_origin_certificate <|
                            And.intro P.transport_home.transport_certificate <|
                              And.intro P.reconstruction_home.reconstruction_certificate
                                P.reconstruction_home.chosen_gap_certificate

end MaleyLean
