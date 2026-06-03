import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptCarrierBase

namespace MaleyLean

/--
Remaining endpoint theorem/witness data needed to upgrade a concrete carrier
base into a full endpoint manuscript object.

This is the proof-facing counterpart to `YMEndpointManuscriptCarrierBase`.
-/
structure YMEndpointManuscriptWitnessData
    (B : YMEndpointManuscriptCarrierBase) where
  reflection_positive : Prop
  os_data_complete : Prop
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

def YMEndpointManuscriptWitnessData.toCarrierPackage
  {B : YMEndpointManuscriptCarrierBase}
  (W : YMEndpointManuscriptWitnessData B) :
  YMEndpointManuscriptCarrierPackage :=
  YangMillsEndpointManuscriptCarrierPackageOfBase
    B
    W.reflection_positive
    W.os_data_complete
    W.vacuum_vector_present
    W.wightman_fields_present
    W.smearing_defined
    W.vacuum_correlations_defined
    W.faithful_wilson_universality
    W.exact_local_net_endpoint
    W.euclidean_dossier_ready
    W.reconstruction_ready
    W.endpoint_packet_ready
    W.hE
    W.hP
    W.endpoint_part
    W.build_endpoint_part
    W.dossier_yields_reconstruction
    W.reconstruction_exhibits_fields
    W.reconstruction_exhibits_vacuum
    W.reconstruction_exhibits_smearing
    W.reconstruction_exhibits_vacuum_correlations
    W.endpoint_packet_exhibits_exact_endpoint

def YMEndpointManuscriptWitnessData.toEndpointManuscriptObject
  {B : YMEndpointManuscriptCarrierBase}
  (W : YMEndpointManuscriptWitnessData B) :
  YMEndpointManuscriptObject :=
  W.toCarrierPackage.toEndpointManuscriptObject

theorem YangMillsEndpointManuscriptWitnessDataStatement
  {B : YMEndpointManuscriptCarrierBase}
  (W : YMEndpointManuscriptWitnessData B) :
  let P := W.toCarrierPackage
  let O := W.toEndpointManuscriptObject
  P.Omega_loc = B.Omega_loc /\
  P.phi_star = B.phi_star /\
  P.E_ren = B.E_ren /\
  O.Omega_loc = B.Omega_loc /\
  O.phi_star = B.phi_star /\
  O.E_ren = B.E_ren := by
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl rfl

end MaleyLean
