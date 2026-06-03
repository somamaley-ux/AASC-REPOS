import MaleyLean.Papers.YangMills.Kernel.VacuumGapCoreBuilder

namespace MaleyLean

theorem YangMillsVacuumGapCoreBuilderSummaryStatement
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
  exact
    YangMillsVacuumGapCoreBuilderStatement
      ultraviolet_scope_ready entrance_ready fixed_lattice_gap_ready
      weak_window_certificate_ready continuum_gap_transport_ready
      reconstruction_ready endpoint_ready vacuum_gap_part
      transport_package reconstruction_package
      build_vacuum_gap_part weak_window_yields_transport
      transport_exhibits_os_transport transport_exhibits_positive_gap
      transport_comes_from_lattice_gap transport_feeds_reconstruction
      reconstruction_exhibits_os_sector reconstruction_exhibits_minkowski_gap
      reconstruction_records_transport_origin hww

end MaleyLean
