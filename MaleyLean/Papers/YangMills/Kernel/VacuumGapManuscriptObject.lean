import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptChoices
import MaleyLean.Papers.YangMills.Kernel.VacuumGapCoreBuilder

namespace MaleyLean

structure YMVacuumGapManuscriptObject where
  ultraviolet_scope_ready : Prop
  entrance_ready : Prop
  fixed_lattice_gap_ready : Prop
  weak_window_certificate_ready : Prop
  continuum_gap_transport_ready : Prop
  reconstruction_ready : Prop
  endpoint_ready : Prop
  hww : weak_window_certificate_ready
  vacuum_gap_part : Prop
  transport_package : YMTransportPackage
  reconstruction_package : YMVacuumReconstructionPackage
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
    continuum_gap_transport_ready -> transport_package.os_transport_ready
  transport_exhibits_positive_gap :
    continuum_gap_transport_ready -> transport_package.positive_gap_exhibited
  transport_comes_from_lattice_gap :
    continuum_gap_transport_ready -> transport_package.lattice_gap_input
  transport_feeds_reconstruction :
    continuum_gap_transport_ready -> reconstruction_ready
  reconstruction_exhibits_os_sector :
    reconstruction_ready -> reconstruction_package.os_sector_ready
  reconstruction_exhibits_minkowski_gap :
    reconstruction_ready -> reconstruction_package.minkowski_gap_ready
  reconstruction_records_transport_origin :
    reconstruction_ready -> reconstruction_package.obtained_from_transport
  transport : transport_package.transport_map
  H : transport_package.lattice_observable_family
  Hloc : reconstruction_package.reconstructed_sector
  corr : reconstruction_package.os_correlation_family
  gapf : reconstruction_package.minkowski_gap_functional
  hgap :
    reconstruction_package.evaluate_minkowski_gap
      gapf
      (reconstruction_package.realize_os_sector Hloc corr)

def YMVacuumGapManuscriptObject.toVacuumGapRoute
  (P : YMVacuumGapManuscriptObject) :
  YMVacuumGapRoute :=
  YangMillsVacuumGapRouteData
    P.ultraviolet_scope_ready
    P.entrance_ready
    P.fixed_lattice_gap_ready
    P.weak_window_certificate_ready
    P.continuum_gap_transport_ready
    P.reconstruction_ready
    P.endpoint_ready
    P.vacuum_gap_part
    P.transport_package
    P.reconstruction_package
    P.build_vacuum_gap_part
    P.weak_window_yields_transport
    P.transport_exhibits_os_transport
    P.transport_exhibits_positive_gap
    P.transport_comes_from_lattice_gap
    P.transport_feeds_reconstruction
    P.reconstruction_exhibits_os_sector
    P.reconstruction_exhibits_minkowski_gap
    P.reconstruction_records_transport_origin

def YMVacuumGapManuscriptObject.toChoices
  (P : YMVacuumGapManuscriptObject) :
  YMVacuumGapManuscriptChoices
    P.toVacuumGapRoute
    P.hww :=
  YangMillsVacuumGapManuscriptChoicesData
    (RD := P.toVacuumGapRoute)
    (hww := P.hww)
    P.transport
    P.H
    P.Hloc
    P.corr
    P.gapf
    P.hgap

theorem YangMillsVacuumGapManuscriptObjectStatement
  (P : YMVacuumGapManuscriptObject) :
  let RD := P.toVacuumGapRoute
  let C := P.toChoices
  RD.transport_package = P.transport_package /\
  RD.reconstruction_package = P.reconstruction_package /\
  ym_vacuum_transport_of C = P.transport /\
  ym_vacuum_H_of C = P.H /\
  ym_vacuum_Hloc_of C = P.Hloc /\
  ym_vacuum_corr_of C = P.corr /\
  ym_vacuum_gapf_of C = P.gapf /\
  ym_vacuum_hgap_of C = P.hgap := by
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl rfl

end MaleyLean
