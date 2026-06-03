import MaleyLean.Papers.YangMills.Kernel.VacuumGapTheoremObjects
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register
import MaleyLean.Papers.YangMills.SourceCrosswalk.VacuumGapWitnessRegister

namespace MaleyLean

/--
Single native-facing package for the current mass-gap chain running through the
vacuum-gap heart:

- `F.216` continuum gap transport,
- `F.5` continuum sharp-local gap,
- `M.5` Minkowski-gap transfer.
-/
structure YMVacuumGapMassGapChain (R : YMVacuumGapRoute) where
  native_objects : YMVacuumGapNativeTheoremObjects R
  transport_label : ym_source_labels .continuumVacuumGapTransport = ["F.216"]
  sharp_local_gap_label : ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"]
  transport_origin_label :
    ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"]

def YangMillsVacuumGapMassGapChainData
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
  YMVacuumGapMassGapChain R := by
  exact
    { native_objects :=
        YangMillsVacuumGapNativeTheoremObjectsData
          R hww tm obs rsec corr gapf hgap
      transport_label := rfl
      sharp_local_gap_label := rfl
      transport_origin_label := rfl }

theorem YangMillsVacuumGapMassGapChainExportStatement
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
  Nonempty (YMVacuumGapMassGapChain R) /\
  ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
  ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  R.continuum_gap_transport_ready /\
  R.transport_package.positive_gap_exhibited /\
  R.reconstruction_package.minkowski_gap_ready /\
  R.reconstruction_package.obtained_from_transport /\
  (YangMillsVacuumGapSemanticBundleData R hww).evaluate_minkowski_gap
      gapf
      ((YangMillsVacuumGapSemanticBundleData R hww).realize_os_sector rsec corr) := by
  let C :=
    YangMillsVacuumGapMassGapChainData
      R hww tm obs rsec corr gapf hgap
  exact
    And.intro (Nonempty.intro C) <|
      And.intro C.transport_label <|
        And.intro C.sharp_local_gap_label <|
          And.intro C.transport_origin_label <|
            And.intro
              C.native_objects.transport_object.continuum_gap_transport <|
              And.intro
                C.native_objects.transport_object.positive_gap <|
                And.intro
                  C.native_objects.sharp_local_gap_object.minkowski_gap_ready <|
                  And.intro
                    C.native_objects.sharp_local_gap_object.obtained_from_transport
                    C.native_objects.reconstruction_transfer_object.realized_gap_statement

end MaleyLean
