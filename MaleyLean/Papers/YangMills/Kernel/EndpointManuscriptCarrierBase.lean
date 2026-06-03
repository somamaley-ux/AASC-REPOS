import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptCarriers

namespace MaleyLean

/--
Pure carrier-and-inhabitant layer for the manuscript endpoint packet.

This is the lowest honest object-level endpoint layer:
- carrier types
- chosen inhabitant terms
- object-level operations

No theorem/proof fields live here.
-/
structure YMEndpointManuscriptCarrierBase where
  EndpointEuclideanInput : Type
  EndpointReconstructedHilbert : Type
  EndpointFieldFamily : Type
  EndpointTestFunctionSpace : Type
  EndpointSmearedFieldOperator : Type
  EndpointVacuumCorrelationFamily : Type
  EndpointLocalNet : Type
  EndpointVacuumSector : Type
  smear_field :
    EndpointTestFunctionSpace ->
    EndpointFieldFamily ->
    EndpointSmearedFieldOperator
  evaluate_vacuum_correlation :
    EndpointReconstructedHilbert ->
    EndpointSmearedFieldOperator ->
    EndpointVacuumCorrelationFamily
  Omega_loc : EndpointReconstructedHilbert
  phi_star : EndpointTestFunctionSpace
  E_ren : EndpointFieldFamily

/--
Upgrade a pure carrier package to the full endpoint manuscript carrier package
once the manuscript propositions and witness terms are supplied.
-/
def YangMillsEndpointManuscriptCarrierPackageOfBase
  (B : YMEndpointManuscriptCarrierBase)
  (reflection_positive : Prop)
  (os_data_complete : Prop)
  (vacuum_vector_present : Prop)
  (wightman_fields_present : Prop)
  (smearing_defined : Prop)
  (vacuum_correlations_defined : Prop)
  (faithful_wilson_universality : Prop)
  (exact_local_net_endpoint : Prop)
  (euclidean_dossier_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_packet_ready : Prop)
  (hE : euclidean_dossier_ready)
  (hP : endpoint_packet_ready)
  (endpoint_part : Prop)
  (build_endpoint_part :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_part)
  (dossier_yields_reconstruction :
    euclidean_dossier_ready -> reconstruction_ready)
  (reconstruction_exhibits_fields :
    reconstruction_ready -> wightman_fields_present)
  (reconstruction_exhibits_vacuum :
    reconstruction_ready -> vacuum_vector_present)
  (reconstruction_exhibits_smearing :
    reconstruction_ready -> smearing_defined)
  (reconstruction_exhibits_vacuum_correlations :
    reconstruction_ready -> vacuum_correlations_defined)
  (endpoint_packet_exhibits_exact_endpoint :
    endpoint_packet_ready -> exact_local_net_endpoint) :
  YMEndpointManuscriptCarrierPackage :=
  { EndpointEuclideanInput := B.EndpointEuclideanInput
    EndpointReconstructedHilbert := B.EndpointReconstructedHilbert
    EndpointFieldFamily := B.EndpointFieldFamily
    EndpointTestFunctionSpace := B.EndpointTestFunctionSpace
    EndpointSmearedFieldOperator := B.EndpointSmearedFieldOperator
    EndpointVacuumCorrelationFamily := B.EndpointVacuumCorrelationFamily
    EndpointLocalNet := B.EndpointLocalNet
    EndpointVacuumSector := B.EndpointVacuumSector
    reflection_positive := reflection_positive
    os_data_complete := os_data_complete
    smear_field := B.smear_field
    evaluate_vacuum_correlation := B.evaluate_vacuum_correlation
    vacuum_vector_present := vacuum_vector_present
    wightman_fields_present := wightman_fields_present
    smearing_defined := smearing_defined
    vacuum_correlations_defined := vacuum_correlations_defined
    faithful_wilson_universality := faithful_wilson_universality
    exact_local_net_endpoint := exact_local_net_endpoint
    euclidean_dossier_ready := euclidean_dossier_ready
    reconstruction_ready := reconstruction_ready
    endpoint_packet_ready := endpoint_packet_ready
    hE := hE
    hP := hP
    endpoint_part := endpoint_part
    build_endpoint_part := build_endpoint_part
    dossier_yields_reconstruction := dossier_yields_reconstruction
    reconstruction_exhibits_fields := reconstruction_exhibits_fields
    reconstruction_exhibits_vacuum := reconstruction_exhibits_vacuum
    reconstruction_exhibits_smearing := reconstruction_exhibits_smearing
    reconstruction_exhibits_vacuum_correlations := reconstruction_exhibits_vacuum_correlations
    endpoint_packet_exhibits_exact_endpoint := endpoint_packet_exhibits_exact_endpoint
    Omega_loc := B.Omega_loc
    phi_star := B.phi_star
    E_ren := B.E_ren }

theorem YangMillsEndpointManuscriptCarrierBaseStatement
  (B : YMEndpointManuscriptCarrierBase) :
  B.Omega_loc = B.Omega_loc /\
  B.phi_star = B.phi_star /\
  B.E_ren = B.E_ren := by
  exact ⟨rfl, rfl, rfl⟩

end MaleyLean
