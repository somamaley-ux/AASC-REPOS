import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptCarrierBase

namespace MaleyLean

structure YMVacuumGapManuscriptWitnessData
    (B : YMVacuumGapManuscriptCarrierBase) where
  ultraviolet_scope_ready : Prop
  entrance_ready : Prop
  fixed_lattice_gap_ready : Prop
  weak_window_certificate_ready : Prop
  continuum_gap_transport_ready : Prop
  reconstruction_ready : Prop
  endpoint_ready : Prop
  hww : weak_window_certificate_ready
  vacuum_gap_part : Prop
  lattice_gap_input : Prop
  os_transport_ready : Prop
  positive_gap_exhibited : Prop
  os_sector_ready : Prop
  minkowski_gap_ready : Prop
  obtained_from_transport : Prop
  build_vacuum_gap_part :
    ultraviolet_scope_ready ->
    entrance_ready ->
    fixed_lattice_gap_ready ->
    weak_window_certificate_ready ->
    continuum_gap_transport_ready ->
    reconstruction_ready ->
    endpoint_ready ->
    vacuum_gap_part
  weak_window_yields_transport :
    weak_window_certificate_ready -> continuum_gap_transport_ready
  transport_exhibits_os_transport :
    continuum_gap_transport_ready -> os_transport_ready
  transport_exhibits_positive_gap :
    continuum_gap_transport_ready -> positive_gap_exhibited
  transport_comes_from_lattice_gap :
    continuum_gap_transport_ready -> lattice_gap_input
  transport_feeds_reconstruction :
    continuum_gap_transport_ready -> reconstruction_ready
  reconstruction_exhibits_os_sector :
    reconstruction_ready -> os_sector_ready
  reconstruction_exhibits_minkowski_gap :
    reconstruction_ready -> minkowski_gap_ready
  reconstruction_records_transport_origin :
    reconstruction_ready -> obtained_from_transport

def YMVacuumGapManuscriptWitnessData.toTransportPackage
  {B : YMVacuumGapManuscriptCarrierBase}
  (W : YMVacuumGapManuscriptWitnessData B) :
  YMTransportPackage :=
  YangMillsTransportPackageData
    B.TransportState
    B.LatticeObservableFamily
    B.TransportMap
    B.transport_observable
    W.lattice_gap_input
    W.os_transport_ready
    W.positive_gap_exhibited

def YMVacuumGapManuscriptWitnessData.toReconstructionPackage
  {B : YMVacuumGapManuscriptCarrierBase}
  (W : YMVacuumGapManuscriptWitnessData B) :
  YMVacuumReconstructionPackage :=
  YangMillsVacuumReconstructionPackageData
    B.ReconstructedSector
    B.OSSector
    B.MinkowskiGapFunctional
    B.OSCorrelationFamily
    B.realize_os_sector
    B.evaluate_minkowski_gap
    W.os_sector_ready
    W.minkowski_gap_ready
    W.obtained_from_transport

def YMVacuumGapManuscriptWitnessData.toVacuumGapManuscriptObject
  {B : YMVacuumGapManuscriptCarrierBase}
  (W : YMVacuumGapManuscriptWitnessData B) :
  YMVacuumGapManuscriptObject :=
  { ultraviolet_scope_ready := W.ultraviolet_scope_ready
    entrance_ready := W.entrance_ready
    fixed_lattice_gap_ready := W.fixed_lattice_gap_ready
    weak_window_certificate_ready := W.weak_window_certificate_ready
    continuum_gap_transport_ready := W.continuum_gap_transport_ready
    reconstruction_ready := W.reconstruction_ready
    endpoint_ready := W.endpoint_ready
    hww := W.hww
    vacuum_gap_part := W.vacuum_gap_part
    transport_package := W.toTransportPackage
    reconstruction_package := W.toReconstructionPackage
    build_vacuum_gap_part := W.build_vacuum_gap_part
    weak_window_yields_transport := W.weak_window_yields_transport
    transport_exhibits_os_transport := W.transport_exhibits_os_transport
    transport_exhibits_positive_gap := W.transport_exhibits_positive_gap
    transport_comes_from_lattice_gap := W.transport_comes_from_lattice_gap
    transport_feeds_reconstruction := W.transport_feeds_reconstruction
    reconstruction_exhibits_os_sector := W.reconstruction_exhibits_os_sector
    reconstruction_exhibits_minkowski_gap := W.reconstruction_exhibits_minkowski_gap
    reconstruction_records_transport_origin := W.reconstruction_records_transport_origin
    transport := B.transport
    H := B.H
    Hloc := B.Hloc
    corr := B.corr
    gapf := B.gapf
    hgap := B.hgap }

theorem YangMillsVacuumGapManuscriptWitnessDataStatement
  {B : YMVacuumGapManuscriptCarrierBase}
  (W : YMVacuumGapManuscriptWitnessData B) :
  let O := W.toVacuumGapManuscriptObject
  O.transport = B.transport /\
  O.H = B.H /\
  O.Hloc = B.Hloc /\
  O.corr = B.corr /\
  O.gapf = B.gapf /\
  O.hgap = B.hgap := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

end MaleyLean
