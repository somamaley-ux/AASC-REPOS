import MaleyLean.Papers.YangMills.Kernel.ManuscriptDeclarations
namespace MaleyLean

noncomputable section

abbrev VacuumTransportState : Type :=
  ym_vacuum_carrier_decls.VacuumTransportState

abbrev VacuumLatticeObservableFamily : Type :=
  ym_vacuum_carrier_decls.VacuumLatticeObservableFamily

abbrev VacuumTransportMap : Type :=
  ym_vacuum_carrier_decls.VacuumTransportMap

abbrev VacuumReconstructedSector : Type :=
  ym_vacuum_carrier_decls.VacuumReconstructedSector

abbrev VacuumOSSector : Type :=
  ym_vacuum_carrier_decls.VacuumOSSector

abbrev VacuumMinkowskiGapFunctional : Type :=
  ym_vacuum_carrier_decls.VacuumMinkowskiGapFunctional

abbrev VacuumOSCorrelationFamily : Type :=
  ym_vacuum_carrier_decls.VacuumOSCorrelationFamily

abbrev vacuum_transport_observable :
  VacuumTransportMap ->
  VacuumLatticeObservableFamily ->
  VacuumTransportState :=
  ym_vacuum_carrier_decls.vacuum_transport_observable

abbrev vacuum_realize_os_sector :
  VacuumReconstructedSector ->
  VacuumOSCorrelationFamily ->
  VacuumOSSector :=
  ym_vacuum_carrier_decls.vacuum_realize_os_sector

abbrev vacuum_evaluate_minkowski_gap :
  VacuumMinkowskiGapFunctional ->
  VacuumOSSector ->
  Prop :=
  ym_vacuum_carrier_decls.vacuum_evaluate_minkowski_gap

abbrev vacuum_transport : VacuumTransportMap :=
  ym_vacuum_carrier_decls.vacuum_transport

abbrev vacuum_H : VacuumLatticeObservableFamily :=
  ym_vacuum_carrier_decls.vacuum_H

abbrev vacuum_Hloc : VacuumReconstructedSector :=
  ym_vacuum_carrier_decls.vacuum_Hloc

abbrev vacuum_corr : VacuumOSCorrelationFamily :=
  ym_vacuum_carrier_decls.vacuum_corr

abbrev vacuum_gapf : VacuumMinkowskiGapFunctional :=
  ym_vacuum_carrier_decls.vacuum_gapf

abbrev vacuum_hgap :
  vacuum_evaluate_minkowski_gap
    vacuum_gapf
    (vacuum_realize_os_sector vacuum_Hloc vacuum_corr) :=
  ym_vacuum_carrier_decls.vacuum_hgap

noncomputable def ym_vacuum_gap_manuscript_carrier_base :
  YMVacuumGapManuscriptCarrierBase :=
  { TransportState := VacuumTransportState
    LatticeObservableFamily := VacuumLatticeObservableFamily
    TransportMap := VacuumTransportMap
    ReconstructedSector := VacuumReconstructedSector
    OSSector := VacuumOSSector
    MinkowskiGapFunctional := VacuumMinkowskiGapFunctional
    OSCorrelationFamily := VacuumOSCorrelationFamily
    transport_observable := vacuum_transport_observable
    realize_os_sector := vacuum_realize_os_sector
    evaluate_minkowski_gap := vacuum_evaluate_minkowski_gap
    transport := vacuum_transport
    H := vacuum_H
    Hloc := vacuum_Hloc
    corr := vacuum_corr
    gapf := vacuum_gapf
    hgap := vacuum_hgap }

theorem ym_vacuum_gap_manuscript_carrier_base_named_inhabitants :
  ym_vacuum_gap_manuscript_carrier_base.transport = vacuum_transport /\
  ym_vacuum_gap_manuscript_carrier_base.H = vacuum_H /\
  ym_vacuum_gap_manuscript_carrier_base.Hloc = vacuum_Hloc /\
  ym_vacuum_gap_manuscript_carrier_base.corr = vacuum_corr /\
  ym_vacuum_gap_manuscript_carrier_base.gapf = vacuum_gapf /\
  ym_vacuum_gap_manuscript_carrier_base.hgap = vacuum_hgap := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

end

end MaleyLean
