import MaleyLean.Papers.YangMills.Kernel.VacuumGapSemanticBundle

namespace MaleyLean

/--
Named builder for a manuscript transport package.
-/
def YangMillsTransportPackageData
  (transport_state : Type)
  (lattice_observable_family : Type)
  (transport_map : Type)
  (transport_observable :
    transport_map -> lattice_observable_family -> transport_state)
  (lattice_gap_input : Prop)
  (os_transport_ready : Prop)
  (positive_gap_exhibited : Prop) :
  YMTransportPackage :=
  { transport_state := transport_state
    lattice_observable_family := lattice_observable_family
    transport_map := transport_map
    transport_observable := transport_observable
    lattice_gap_input := lattice_gap_input
    os_transport_ready := os_transport_ready
    positive_gap_exhibited := positive_gap_exhibited }

/--
Named builder for a manuscript vacuum reconstruction package.
-/
def YangMillsVacuumReconstructionPackageData
  (reconstructed_sector : Type)
  (os_sector : Type)
  (minkowski_gap_functional : Type)
  (os_correlation_family : Type)
  (realize_os_sector :
    reconstructed_sector -> os_correlation_family -> os_sector)
  (evaluate_minkowski_gap :
    minkowski_gap_functional -> os_sector -> Prop)
  (os_sector_ready : Prop)
  (minkowski_gap_ready : Prop)
  (obtained_from_transport : Prop) :
  YMVacuumReconstructionPackage :=
  { reconstructed_sector := reconstructed_sector
    os_sector := os_sector
    minkowski_gap_functional := minkowski_gap_functional
    os_correlation_family := os_correlation_family
    realize_os_sector := realize_os_sector
    evaluate_minkowski_gap := evaluate_minkowski_gap
    os_sector_ready := os_sector_ready
    minkowski_gap_ready := minkowski_gap_ready
    obtained_from_transport := obtained_from_transport }

/--
Named builder for a manuscript vacuum-gap route object.

This makes the remaining object-level work explicit: a closed vacuum-gap
constant can now be authored by supplying the transport package,
reconstruction package, and the readiness/projection fields directly.
-/
def YangMillsVacuumGapRouteData
  (ultraviolet_scope_ready : Prop)
  (entrance_ready : Prop)
  (fixed_lattice_gap_ready : Prop)
  (weak_window_certificate_ready : Prop)
  (continuum_gap_transport_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_ready : Prop)
  (vacuum_gap_part : Prop)
  (transport_package : YMTransportPackage)
  (reconstruction_package : YMVacuumReconstructionPackage)
  (build_vacuum_gap_part :
    ultraviolet_scope_ready ->
    entrance_ready ->
    fixed_lattice_gap_ready ->
    weak_window_certificate_ready ->
    continuum_gap_transport_ready ->
    reconstruction_ready ->
    endpoint_ready ->
    vacuum_gap_part)
  (weak_window_yields_transport :
    weak_window_certificate_ready -> continuum_gap_transport_ready)
  (transport_exhibits_os_transport :
    continuum_gap_transport_ready -> transport_package.os_transport_ready)
  (transport_exhibits_positive_gap :
    continuum_gap_transport_ready -> transport_package.positive_gap_exhibited)
  (transport_comes_from_lattice_gap :
    continuum_gap_transport_ready -> transport_package.lattice_gap_input)
  (transport_feeds_reconstruction :
    continuum_gap_transport_ready -> reconstruction_ready)
  (reconstruction_exhibits_os_sector :
    reconstruction_ready -> reconstruction_package.os_sector_ready)
  (reconstruction_exhibits_minkowski_gap :
    reconstruction_ready -> reconstruction_package.minkowski_gap_ready)
  (reconstruction_records_transport_origin :
    reconstruction_ready -> reconstruction_package.obtained_from_transport) :
  YMVacuumGapRoute :=
  { ultraviolet_scope_ready := ultraviolet_scope_ready
    entrance_ready := entrance_ready
    fixed_lattice_gap_ready := fixed_lattice_gap_ready
    weak_window_certificate_ready := weak_window_certificate_ready
    continuum_gap_transport_ready := continuum_gap_transport_ready
    reconstruction_ready := reconstruction_ready
    endpoint_ready := endpoint_ready
    vacuum_gap_part := vacuum_gap_part
    transport_package := transport_package
    reconstruction_package := reconstruction_package
    build_vacuum_gap_part := build_vacuum_gap_part
    weak_window_yields_transport := weak_window_yields_transport
    transport_exhibits_os_transport := transport_exhibits_os_transport
    transport_exhibits_positive_gap := transport_exhibits_positive_gap
    transport_comes_from_lattice_gap := transport_comes_from_lattice_gap
    transport_feeds_reconstruction := transport_feeds_reconstruction
    reconstruction_exhibits_os_sector := reconstruction_exhibits_os_sector
    reconstruction_exhibits_minkowski_gap := reconstruction_exhibits_minkowski_gap
    reconstruction_records_transport_origin := reconstruction_records_transport_origin }

theorem YangMillsVacuumGapCoreBuilderStatement
  (ultraviolet_scope_ready : Prop)
  (entrance_ready : Prop)
  (fixed_lattice_gap_ready : Prop)
  (weak_window_certificate_ready : Prop)
  (continuum_gap_transport_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_ready : Prop)
  (vacuum_gap_part : Prop)
  (transport_package : YMTransportPackage)
  (reconstruction_package : YMVacuumReconstructionPackage)
  (build_vacuum_gap_part :
    ultraviolet_scope_ready ->
    entrance_ready ->
    fixed_lattice_gap_ready ->
    weak_window_certificate_ready ->
    continuum_gap_transport_ready ->
    reconstruction_ready ->
    endpoint_ready ->
    vacuum_gap_part)
  (weak_window_yields_transport :
    weak_window_certificate_ready -> continuum_gap_transport_ready)
  (transport_exhibits_os_transport :
    continuum_gap_transport_ready -> transport_package.os_transport_ready)
  (transport_exhibits_positive_gap :
    continuum_gap_transport_ready -> transport_package.positive_gap_exhibited)
  (transport_comes_from_lattice_gap :
    continuum_gap_transport_ready -> transport_package.lattice_gap_input)
  (transport_feeds_reconstruction :
    continuum_gap_transport_ready -> reconstruction_ready)
  (reconstruction_exhibits_os_sector :
    reconstruction_ready -> reconstruction_package.os_sector_ready)
  (reconstruction_exhibits_minkowski_gap :
    reconstruction_ready -> reconstruction_package.minkowski_gap_ready)
  (reconstruction_records_transport_origin :
    reconstruction_ready -> reconstruction_package.obtained_from_transport)
  (hww : weak_window_certificate_ready) :
  let RD :=
    YangMillsVacuumGapRouteData
      ultraviolet_scope_ready entrance_ready fixed_lattice_gap_ready
      weak_window_certificate_ready continuum_gap_transport_ready
      reconstruction_ready endpoint_ready vacuum_gap_part
      transport_package reconstruction_package
      build_vacuum_gap_part weak_window_yields_transport
      transport_exhibits_os_transport transport_exhibits_positive_gap
      transport_comes_from_lattice_gap transport_feeds_reconstruction
      reconstruction_exhibits_os_sector reconstruction_exhibits_minkowski_gap
      reconstruction_records_transport_origin
  RD.continuum_gap_transport_ready /\
  RD.transport_package.os_transport_ready /\
  RD.transport_package.positive_gap_exhibited /\
  RD.transport_package.lattice_gap_input /\
  RD.reconstruction_ready /\
  RD.reconstruction_package.os_sector_ready /\
  RD.reconstruction_package.minkowski_gap_ready /\
  RD.reconstruction_package.obtained_from_transport := by
  dsimp [YangMillsVacuumGapRouteData]
  have hgap := weak_window_yields_transport hww
  exact
    And.intro hgap <|
      And.intro (transport_exhibits_os_transport hgap) <|
        And.intro (transport_exhibits_positive_gap hgap) <|
          And.intro (transport_comes_from_lattice_gap hgap) <|
            And.intro (transport_feeds_reconstruction hgap) <|
              And.intro
                (reconstruction_exhibits_os_sector (transport_feeds_reconstruction hgap)) <|
                And.intro
                  (reconstruction_exhibits_minkowski_gap (transport_feeds_reconstruction hgap))
                  (reconstruction_records_transport_origin (transport_feeds_reconstruction hgap))

end MaleyLean
