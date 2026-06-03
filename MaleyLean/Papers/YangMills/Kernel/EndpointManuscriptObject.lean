import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptChoices
import MaleyLean.Papers.YangMills.Kernel.EndpointCoreBuilder

namespace MaleyLean

structure YMEndpointManuscriptObject where
  euclidean_dossier_ready : Prop
  reconstruction_ready : Prop
  endpoint_packet_ready : Prop
  hE : euclidean_dossier_ready
  hP : endpoint_packet_ready
  endpoint_part : Prop
  dossier : YMEndpointDossier
  reconstruction_package : YMEndpointReconstructionPackage
  endpoint_object : YMEndpointObject
  build_endpoint_part :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_part
  dossier_yields_reconstruction :
    euclidean_dossier_ready -> reconstruction_ready
  reconstruction_exhibits_fields :
    reconstruction_ready -> reconstruction_package.wightman_fields_present
  reconstruction_exhibits_vacuum :
    reconstruction_ready -> reconstruction_package.vacuum_vector_present
  reconstruction_exhibits_smearing :
    reconstruction_ready -> reconstruction_package.smearing_defined
  reconstruction_exhibits_vacuum_correlations :
    reconstruction_ready -> reconstruction_package.vacuum_correlations_defined
  endpoint_packet_exhibits_exact_endpoint :
    endpoint_packet_ready -> endpoint_object.exact_local_net_endpoint
  Omega_loc : reconstruction_package.vacuum_vector
  phi_star : reconstruction_package.test_function_space
  E_ren : reconstruction_package.field_family

def YMEndpointManuscriptObject.toEndpointCore
  (P : YMEndpointManuscriptObject) :
  YMEndpointCore :=
  YangMillsEndpointCoreData
    P.euclidean_dossier_ready
    P.reconstruction_ready
    P.endpoint_packet_ready
    P.endpoint_part
    P.dossier
    P.reconstruction_package
    P.endpoint_object
    P.build_endpoint_part
    P.dossier_yields_reconstruction
    P.reconstruction_exhibits_fields
    P.reconstruction_exhibits_vacuum
    P.reconstruction_exhibits_smearing
    P.reconstruction_exhibits_vacuum_correlations
    P.endpoint_packet_exhibits_exact_endpoint

def YMEndpointManuscriptObject.toChoices
  (P : YMEndpointManuscriptObject) :
  YMEndpointManuscriptChoices
    P.toEndpointCore
    P.hE
    P.hP :=
  YangMillsEndpointManuscriptChoicesData
    (RE := P.toEndpointCore)
    (hE := P.hE)
    (hP := P.hP)
    P.Omega_loc
    P.phi_star
    P.E_ren

theorem YangMillsEndpointManuscriptObjectStatement
  (P : YMEndpointManuscriptObject) :
  let RE := P.toEndpointCore
  let C := P.toChoices
  RE.dossier = P.dossier /\
  RE.reconstruction_package = P.reconstruction_package /\
  RE.endpoint_object = P.endpoint_object /\
  ym_endpoint_Omega_loc_of C = P.Omega_loc /\
  ym_endpoint_phi_star_of C = P.phi_star /\
  ym_endpoint_E_ren_of C = P.E_ren := by
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl rfl

end MaleyLean
