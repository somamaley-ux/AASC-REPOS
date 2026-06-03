import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore

namespace MaleyLean

/--
Structured vacuum-gap-side semantic bundle keeping QE3 transport data,
reconstruction data, and transport origin together in one typed object.
-/
structure YMVacuumGapSemanticBundle (R : YMVacuumGapRoute) where
  transport_package_shape : YMTransportPackage
  transport_state : Type
  lattice_observable_family : Type
  transport_map : Type
  transport_observable :
    transport_map -> lattice_observable_family -> transport_state
  reconstructed_sector : Type
  os_sector : Type
  minkowski_gap_functional : Type
  os_correlation_family : Type
  realize_os_sector :
    reconstructed_sector -> os_correlation_family -> os_sector
  evaluate_minkowski_gap :
    minkowski_gap_functional -> os_sector -> Prop
  reconstruction_package_shape : YMVacuumReconstructionPackage
  continuum_gap_transport_ready : R.continuum_gap_transport_ready
  os_transport_ready : R.transport_package.os_transport_ready
  positive_gap_exhibited : R.transport_package.positive_gap_exhibited
  lattice_gap_input : R.transport_package.lattice_gap_input
  reconstruction_ready : R.reconstruction_ready
  os_sector_ready : R.reconstruction_package.os_sector_ready
  minkowski_gap_ready : R.reconstruction_package.minkowski_gap_ready
  obtained_from_transport : R.reconstruction_package.obtained_from_transport

theorem YangMillsVacuumGapPackageMetadataStatement
  (R : YMVacuumGapRoute) :
  R.transport_package = R.transport_package /\
  R.transport_package.transport_state =
      R.transport_package.transport_state /\
  R.transport_package.lattice_observable_family =
      R.transport_package.lattice_observable_family /\
  R.transport_package.transport_map =
      R.transport_package.transport_map /\
  R.transport_package.transport_observable =
      R.transport_package.transport_observable /\
  R.reconstruction_package.reconstructed_sector =
      R.reconstruction_package.reconstructed_sector /\
  R.reconstruction_package.os_sector =
      R.reconstruction_package.os_sector /\
  R.reconstruction_package.minkowski_gap_functional =
      R.reconstruction_package.minkowski_gap_functional /\
  R.reconstruction_package.os_correlation_family =
      R.reconstruction_package.os_correlation_family /\
  R.reconstruction_package.realize_os_sector =
      R.reconstruction_package.realize_os_sector /\
  R.reconstruction_package.evaluate_minkowski_gap =
      R.reconstruction_package.evaluate_minkowski_gap /\
  R.reconstruction_package = R.reconstruction_package := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl <|
                    And.intro rfl <|
                      And.intro rfl rfl

def YangMillsVacuumGapSemanticBundleData
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  YMVacuumGapSemanticBundle R := by
  have h := YangMillsVacuumGapCoreExhibitsNamedOutputsStatement R hww
  refine
    { transport_package_shape := R.transport_package
      transport_state := R.transport_package.transport_state
      lattice_observable_family := R.transport_package.lattice_observable_family
      transport_map := R.transport_package.transport_map
      transport_observable := R.transport_package.transport_observable
      reconstructed_sector := R.reconstruction_package.reconstructed_sector
      os_sector := R.reconstruction_package.os_sector
      minkowski_gap_functional := R.reconstruction_package.minkowski_gap_functional
      os_correlation_family := R.reconstruction_package.os_correlation_family
      realize_os_sector := R.reconstruction_package.realize_os_sector
      evaluate_minkowski_gap := R.reconstruction_package.evaluate_minkowski_gap
      reconstruction_package_shape := R.reconstruction_package
      continuum_gap_transport_ready := h.1
      os_transport_ready := h.2.1
      positive_gap_exhibited := h.2.2.1
      lattice_gap_input := h.2.2.2.1
      reconstruction_ready := h.2.2.2.2.1
      os_sector_ready := h.2.2.2.2.2.1
      minkowski_gap_ready := h.2.2.2.2.2.2.1
      obtained_from_transport := h.2.2.2.2.2.2.2 }

theorem YangMillsVacuumGapSemanticBundleExistsStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  Nonempty (YMVacuumGapSemanticBundle R) := by
  exact ⟨YangMillsVacuumGapSemanticBundleData R hww⟩

theorem YangMillsSpineFeedsVacuumGapSemanticBundleStatement
  (S : YMLoadBearingSpine)
  (R : YMVacuumGapRoute)
  (huv : S.packet1_uv_gate)
  (hent : S.packet2_entrance)
  (hlat : S.packet3_fixed_lattice_gap)
  (hww : S.auxiliary_weak_window_certificate)
  (hend : S.packet10_endpoint)
  (huvR : R.ultraviolet_scope_ready)
  (hentR : R.entrance_ready)
  (hlatR : R.fixed_lattice_gap_ready)
  (hwwR : R.weak_window_certificate_ready)
  (hgapR : R.continuum_gap_transport_ready)
  (hrecR : R.reconstruction_ready)
  (hendR : R.endpoint_ready)
  (hbuild : ym_route1_vacuum_gap_core R) :
  S.packet1_uv_gate /\
  S.packet2_entrance /\
  S.packet3_fixed_lattice_gap /\
  S.auxiliary_weak_window_certificate /\
  Nonempty (YMVacuumGapSemanticBundle R) := by
  have hspine :=
    YangMillsLoadBearingSpineFeedsVacuumGapCoreStatement
      S R huv hent hlat hww hend
      huvR hentR hlatR hwwR hgapR hrecR hendR hbuild
  have hbundle := YangMillsVacuumGapSemanticBundleExistsStatement R hwwR
  exact And.intro hspine.1 <|
    And.intro hspine.2.1 <|
      And.intro hspine.2.2.1 <|
        And.intro hspine.2.2.2.1 hbundle

end MaleyLean
