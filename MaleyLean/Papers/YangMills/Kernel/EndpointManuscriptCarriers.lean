import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptObject
import MaleyLean.Papers.YangMills.Kernel.EndpointCoreBuilder
import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpineBuilder

namespace MaleyLean

/--
Minimal manuscript-facing carrier package for instantiating the endpoint packet.

This is an object-level layer only: it supplies the carriers and chosen
inhabitants on which the endpoint propositions live, without adding any new
theorem-strengthening principles.
-/
structure YMEndpointManuscriptCarrierPackage where
  EndpointEuclideanInput : Type
  EndpointReconstructedHilbert : Type
  EndpointFieldFamily : Type
  EndpointTestFunctionSpace : Type
  EndpointSmearedFieldOperator : Type
  EndpointVacuumCorrelationFamily : Type
  EndpointLocalNet : Type
  EndpointVacuumSector : Type
  reflection_positive : Prop
  os_data_complete : Prop
  smear_field :
    EndpointTestFunctionSpace ->
    EndpointFieldFamily ->
    EndpointSmearedFieldOperator
  evaluate_vacuum_correlation :
    EndpointReconstructedHilbert ->
    EndpointSmearedFieldOperator ->
    EndpointVacuumCorrelationFamily
  vacuum_vector_present : Prop
  wightman_fields_present : Prop
  smearing_defined : Prop
  vacuum_correlations_defined : Prop
  faithful_wilson_universality : Prop
  exact_local_net_endpoint : Prop
  euclidean_dossier_ready : Prop
  reconstruction_ready : Prop
  endpoint_packet_ready : Prop
  hE : euclidean_dossier_ready
  hP : endpoint_packet_ready
  endpoint_part : Prop
  build_endpoint_part :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_part
  dossier_yields_reconstruction :
    euclidean_dossier_ready -> reconstruction_ready
  reconstruction_exhibits_fields :
    reconstruction_ready -> wightman_fields_present
  reconstruction_exhibits_vacuum :
    reconstruction_ready -> vacuum_vector_present
  reconstruction_exhibits_smearing :
    reconstruction_ready -> smearing_defined
  reconstruction_exhibits_vacuum_correlations :
    reconstruction_ready -> vacuum_correlations_defined
  endpoint_packet_exhibits_exact_endpoint :
    endpoint_packet_ready -> exact_local_net_endpoint
  Omega_loc : EndpointReconstructedHilbert
  phi_star : EndpointTestFunctionSpace
  E_ren : EndpointFieldFamily

def YMEndpointManuscriptCarrierPackage.toDossier
  (P : YMEndpointManuscriptCarrierPackage) :
  YMEndpointDossier :=
  YangMillsEndpointDossierData
    P.EndpointEuclideanInput
    P.reflection_positive
    P.os_data_complete

def YMEndpointManuscriptCarrierPackage.toReconstructionPackage
  (P : YMEndpointManuscriptCarrierPackage) :
  YMEndpointReconstructionPackage :=
  YangMillsEndpointReconstructionPackageData
    P.EndpointReconstructedHilbert
    P.EndpointFieldFamily
    P.EndpointReconstructedHilbert
    P.EndpointTestFunctionSpace
    P.EndpointSmearedFieldOperator
    P.EndpointVacuumCorrelationFamily
    P.smear_field
    P.evaluate_vacuum_correlation
    P.vacuum_vector_present
    P.wightman_fields_present
    P.smearing_defined
    P.vacuum_correlations_defined
    P.toDossier

def YMEndpointManuscriptCarrierPackage.toEndpointObject
  (P : YMEndpointManuscriptCarrierPackage) :
  YMEndpointObject :=
  { local_net := P.EndpointLocalNet
    vacuum_sector := P.EndpointVacuumSector
    faithful_wilson_universality := P.faithful_wilson_universality
    exact_local_net_endpoint := P.exact_local_net_endpoint }

def YMEndpointManuscriptCarrierPackage.toEndpointManuscriptObject
  (P : YMEndpointManuscriptCarrierPackage) :
  YMEndpointManuscriptObject :=
  { euclidean_dossier_ready := P.euclidean_dossier_ready
    reconstruction_ready := P.reconstruction_ready
    endpoint_packet_ready := P.endpoint_packet_ready
    hE := P.hE
    hP := P.hP
    endpoint_part := P.endpoint_part
    dossier := P.toDossier
    reconstruction_package := P.toReconstructionPackage
    endpoint_object := P.toEndpointObject
    build_endpoint_part := P.build_endpoint_part
    dossier_yields_reconstruction := P.dossier_yields_reconstruction
    reconstruction_exhibits_fields := P.reconstruction_exhibits_fields
    reconstruction_exhibits_vacuum := P.reconstruction_exhibits_vacuum
    reconstruction_exhibits_smearing := P.reconstruction_exhibits_smearing
    reconstruction_exhibits_vacuum_correlations := P.reconstruction_exhibits_vacuum_correlations
    endpoint_packet_exhibits_exact_endpoint := by
      intro h
      dsimp [YMEndpointManuscriptCarrierPackage.toEndpointObject]
      exact P.endpoint_packet_exhibits_exact_endpoint h
    Omega_loc := P.Omega_loc
    phi_star := P.phi_star
    E_ren := P.E_ren }

theorem YangMillsEndpointManuscriptCarrierPackageStatement
  (P : YMEndpointManuscriptCarrierPackage) :
  P.toDossier.reflection_positive = P.reflection_positive /\
  P.toDossier.os_data_complete = P.os_data_complete /\
  P.toReconstructionPackage.vacuum_vector_present = P.vacuum_vector_present /\
  P.toReconstructionPackage.wightman_fields_present = P.wightman_fields_present /\
  P.toEndpointObject.faithful_wilson_universality = P.faithful_wilson_universality /\
  P.toEndpointObject.exact_local_net_endpoint = P.exact_local_net_endpoint := by
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl rfl

end MaleyLean
