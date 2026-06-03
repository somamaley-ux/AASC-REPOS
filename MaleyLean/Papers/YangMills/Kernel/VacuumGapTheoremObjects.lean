import MaleyLean.Papers.YangMills.Kernel.VacuumGapTransportRealizeLawPackage

namespace MaleyLean

/--
Explicit theorem-facing payload for the QE3 transport theorem cluster
(`F.216` together with its immediate transport-side consequences).
-/
structure YMVacuumGapTransportTheoremObject (R : YMVacuumGapRoute) where
  bundle : YMVacuumGapSemanticBundle R
  continuum_gap_transport : R.continuum_gap_transport_ready
  os_transport : R.transport_package.os_transport_ready
  positive_gap : R.transport_package.positive_gap_exhibited
  lattice_gap_input : R.transport_package.lattice_gap_input

/--
Explicit theorem-facing payload for the continuum sharp-local gap export
(`F.5` as it is currently reflected in the vacuum-gap kernel).
-/
structure YMVacuumGapSharpLocalGapTheoremObject (R : YMVacuumGapRoute) where
  bundle : YMVacuumGapSemanticBundle R
  positive_gap : R.transport_package.positive_gap_exhibited
  minkowski_gap_ready : R.reconstruction_package.minkowski_gap_ready
  obtained_from_transport : R.reconstruction_package.obtained_from_transport

/--
Explicit theorem-facing payload for the reconstruction-side gap transfer
(`M.5` in the current manuscript-facing kernel).
-/
structure YMVacuumGapReconstructionTransferTheoremObject
    (R : YMVacuumGapRoute) where
  law_package : YMVacuumGapTransportRealizeLawPackage R
  realized_gap_statement :
    law_package.interface.bundle.evaluate_minkowski_gap
      law_package.interface.chosen_gap_functional
      law_package.interface.chosen_os_sector
  minkowski_gap_ready : R.reconstruction_package.minkowski_gap_ready
  obtained_from_transport : R.reconstruction_package.obtained_from_transport

/--
Bundled native theorem-facing payloads for the current vacuum-gap heart.

This does not replace the underlying analytic proof burden, but it makes the
current `F.216` / `F.5` / `M.5` exports explicit typed objects rather than only
route-level readiness facts.
-/
structure YMVacuumGapNativeTheoremObjects (R : YMVacuumGapRoute) where
  transport_object : YMVacuumGapTransportTheoremObject R
  sharp_local_gap_object : YMVacuumGapSharpLocalGapTheoremObject R
  reconstruction_transfer_object : YMVacuumGapReconstructionTransferTheoremObject R

def YangMillsVacuumGapTransportTheoremObjectData
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  YMVacuumGapTransportTheoremObject R := by
  let B := YangMillsVacuumGapSemanticBundleData R hww
  exact
    { bundle := B
      continuum_gap_transport := B.continuum_gap_transport_ready
      os_transport := B.os_transport_ready
      positive_gap := B.positive_gap_exhibited
      lattice_gap_input := B.lattice_gap_input }

def YangMillsVacuumGapSharpLocalGapTheoremObjectData
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  YMVacuumGapSharpLocalGapTheoremObject R := by
  let B := YangMillsVacuumGapSemanticBundleData R hww
  exact
    { bundle := B
      positive_gap := B.positive_gap_exhibited
      minkowski_gap_ready := B.minkowski_gap_ready
      obtained_from_transport := B.obtained_from_transport }

def YangMillsVacuumGapReconstructionTransferTheoremObjectData
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
  YMVacuumGapReconstructionTransferTheoremObject R := by
  let P :=
    YangMillsVacuumGapTransportRealizeLawPackageData R hww tm obs rsec corr gapf hgap
  exact
    { law_package := P
      realized_gap_statement := by
        simpa using P.interface.gap_relation
      minkowski_gap_ready := P.minkowski_gap_witness
      obtained_from_transport := P.interface.bundle.obtained_from_transport }

def YangMillsVacuumGapNativeTheoremObjectsData
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
  YMVacuumGapNativeTheoremObjects R := by
  exact
    { transport_object :=
        YangMillsVacuumGapTransportTheoremObjectData R hww
      sharp_local_gap_object :=
        YangMillsVacuumGapSharpLocalGapTheoremObjectData R hww
      reconstruction_transfer_object :=
        YangMillsVacuumGapReconstructionTransferTheoremObjectData
          R hww tm obs rsec corr gapf hgap }

theorem YangMillsVacuumGapNativeTheoremObjectsExportStatement
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
  Nonempty (YMVacuumGapNativeTheoremObjects R) /\
  R.continuum_gap_transport_ready /\
  R.transport_package.os_transport_ready /\
  R.transport_package.positive_gap_exhibited /\
  R.transport_package.lattice_gap_input /\
  R.reconstruction_package.minkowski_gap_ready /\
  R.reconstruction_package.obtained_from_transport /\
  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) := by
  let T :=
    YangMillsVacuumGapNativeTheoremObjectsData
      R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro T) <|
      And.intro T.transport_object.continuum_gap_transport <|
        And.intro T.transport_object.os_transport <|
          And.intro T.transport_object.positive_gap <|
            And.intro T.transport_object.lattice_gap_input <|
                And.intro T.sharp_local_gap_object.minkowski_gap_ready <|
                And.intro
                  T.sharp_local_gap_object.obtained_from_transport
                  T.reconstruction_transfer_object.realized_gap_statement

end MaleyLean
