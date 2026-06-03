import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptCarrierBase
import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptCarrierBase
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptCarrierBase

namespace MaleyLean

noncomputable section

structure YMEndpointCarrierDecls where
  EndpointEuclideanInput : Type
  EndpointReconstructedHilbert : Type
  EndpointFieldFamily : Type
  EndpointTestFunctionSpace : Type
  EndpointSmearedFieldOperator : Type
  EndpointVacuumCorrelationFamily : Type
  EndpointLocalNet : Type
  EndpointVacuumSector : Type
  endpoint_smear_field :
    EndpointTestFunctionSpace ->
    EndpointFieldFamily ->
    EndpointSmearedFieldOperator
  endpoint_evaluate_vacuum_correlation :
    EndpointReconstructedHilbert ->
    EndpointSmearedFieldOperator ->
    EndpointVacuumCorrelationFamily
  Omega_loc : EndpointReconstructedHilbert
  phi_star : EndpointTestFunctionSpace
  E_ren : EndpointFieldFamily

structure YMConstructiveCarrierDecls where
  ConstructiveFlowedStateData : Type
  ConstructiveFiniteCapWindow : Type
  ConstructiveFiniteCapExtensionData : Type
  ConstructivePositiveBridgeMap : Type
  ConstructiveBoundedBaseCarrier : Type
  ConstructiveBoundedStateData : Type
  ConstructiveInductiveUnionData : Type
  constructive_extend_finite_cap :
    ConstructiveFiniteCapWindow ->
    ConstructivePositiveBridgeMap ->
    ConstructiveFiniteCapExtensionData
  constructive_assemble_sharp_local_state :
    ConstructiveBoundedBaseCarrier ->
    ConstructiveBoundedStateData ->
    ConstructiveInductiveUnionData ->
    YMSharpLocalState
  constructive_omega_flow : ConstructiveFlowedStateData
  DeltaMax : ConstructiveFiniteCapWindow
  constructive_finite_cap_bridge : ConstructivePositiveBridgeMap
  constructive_bounded_base_one : ConstructiveBoundedBaseCarrier
  constructive_omega_bd : ConstructiveBoundedStateData
  constructive_omega_sharp : ConstructiveInductiveUnionData

structure YMVacuumCarrierDecls where
  VacuumTransportState : Type
  VacuumLatticeObservableFamily : Type
  VacuumTransportMap : Type
  VacuumReconstructedSector : Type
  VacuumOSSector : Type
  VacuumMinkowskiGapFunctional : Type
  VacuumOSCorrelationFamily : Type
  vacuum_transport_observable :
    VacuumTransportMap ->
    VacuumLatticeObservableFamily ->
    VacuumTransportState
  vacuum_realize_os_sector :
    VacuumReconstructedSector ->
    VacuumOSCorrelationFamily ->
    VacuumOSSector
  vacuum_evaluate_minkowski_gap :
    VacuumMinkowskiGapFunctional ->
    VacuumOSSector ->
    Prop
  vacuum_transport : VacuumTransportMap
  vacuum_H : VacuumLatticeObservableFamily
  vacuum_Hloc : VacuumReconstructedSector
  vacuum_corr : VacuumOSCorrelationFamily
  vacuum_gapf : VacuumMinkowskiGapFunctional
  vacuum_hgap :
    vacuum_evaluate_minkowski_gap
      vacuum_gapf
      (vacuum_realize_os_sector vacuum_Hloc vacuum_corr)

structure YMManuscriptCarrierDecls where
  endpoint : YMEndpointCarrierDecls
  constructive : YMConstructiveCarrierDecls
  vacuum : YMVacuumCarrierDecls

def YMEndpointCarrierDecls.toBase
    (D : YMEndpointCarrierDecls) : YMEndpointManuscriptCarrierBase :=
  { EndpointEuclideanInput := D.EndpointEuclideanInput
    EndpointReconstructedHilbert := D.EndpointReconstructedHilbert
    EndpointFieldFamily := D.EndpointFieldFamily
    EndpointTestFunctionSpace := D.EndpointTestFunctionSpace
    EndpointSmearedFieldOperator := D.EndpointSmearedFieldOperator
    EndpointVacuumCorrelationFamily := D.EndpointVacuumCorrelationFamily
    EndpointLocalNet := D.EndpointLocalNet
    EndpointVacuumSector := D.EndpointVacuumSector
    smear_field := D.endpoint_smear_field
    evaluate_vacuum_correlation := D.endpoint_evaluate_vacuum_correlation
    Omega_loc := D.Omega_loc
    phi_star := D.phi_star
    E_ren := D.E_ren }

def YMConstructiveCarrierDecls.toBase
    (D : YMConstructiveCarrierDecls) : YMConstructiveManuscriptCarrierBase :=
  { FlowedStateData := D.ConstructiveFlowedStateData
    FiniteCapWindow := D.ConstructiveFiniteCapWindow
    FiniteCapExtensionData := D.ConstructiveFiniteCapExtensionData
    PositiveBridgeMap := D.ConstructivePositiveBridgeMap
    BoundedBaseCarrier := D.ConstructiveBoundedBaseCarrier
    BoundedStateData := D.ConstructiveBoundedStateData
    InductiveUnionData := D.ConstructiveInductiveUnionData
    extend_finite_cap := D.constructive_extend_finite_cap
    assemble_sharp_local_state := D.constructive_assemble_sharp_local_state
    omega_flow := D.constructive_omega_flow
    DeltaMax := D.DeltaMax
    finite_cap_bridge := D.constructive_finite_cap_bridge
    bounded_base_one := D.constructive_bounded_base_one
    omega_bd := D.constructive_omega_bd
    omega_sharp := D.constructive_omega_sharp }

def YMVacuumCarrierDecls.toBase
    (D : YMVacuumCarrierDecls) : YMVacuumGapManuscriptCarrierBase :=
  { TransportState := D.VacuumTransportState
    LatticeObservableFamily := D.VacuumLatticeObservableFamily
    TransportMap := D.VacuumTransportMap
    ReconstructedSector := D.VacuumReconstructedSector
    OSSector := D.VacuumOSSector
    MinkowskiGapFunctional := D.VacuumMinkowskiGapFunctional
    OSCorrelationFamily := D.VacuumOSCorrelationFamily
    transport_observable := D.vacuum_transport_observable
    realize_os_sector := D.vacuum_realize_os_sector
    evaluate_minkowski_gap := D.vacuum_evaluate_minkowski_gap
    transport := D.vacuum_transport
    H := D.vacuum_H
    Hloc := D.vacuum_Hloc
    corr := D.vacuum_corr
    gapf := D.vacuum_gapf
    hgap := D.vacuum_hgap }

end

end MaleyLean
