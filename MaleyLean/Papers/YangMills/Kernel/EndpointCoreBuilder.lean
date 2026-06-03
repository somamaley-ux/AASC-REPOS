import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticBundle

namespace MaleyLean

/--
Named builder for a manuscript endpoint dossier.
-/
def YangMillsEndpointDossierData
  (euclidean_input : Type)
  (reflection_positive : Prop)
  (os_data_complete : Prop) :
  YMEndpointDossier :=
  { euclidean_input := euclidean_input
    reflection_positive := reflection_positive
    os_data_complete := os_data_complete }

/--
Named builder for a manuscript endpoint reconstruction package.
-/
def YangMillsEndpointReconstructionPackageData
  (reconstructed_hilbert : Type)
  (field_family : Type)
  (vacuum_vector : Type)
  (test_function_space : Type)
  (smeared_field_operator : Type)
  (vacuum_correlation_family : Type)
  (smear_field : test_function_space -> field_family -> smeared_field_operator)
  (evaluate_vacuum_correlation :
    vacuum_vector -> smeared_field_operator -> vacuum_correlation_family)
  (vacuum_vector_present : Prop)
  (wightman_fields_present : Prop)
  (smearing_defined : Prop)
  (vacuum_correlations_defined : Prop)
  (from_dossier : YMEndpointDossier) :
  YMEndpointReconstructionPackage :=
  { reconstructed_hilbert := reconstructed_hilbert
    field_family := field_family
    vacuum_vector := vacuum_vector
    test_function_space := test_function_space
    smeared_field_operator := smeared_field_operator
    vacuum_correlation_family := vacuum_correlation_family
    smear_field := smear_field
    evaluate_vacuum_correlation := evaluate_vacuum_correlation
    vacuum_vector_present := vacuum_vector_present
    wightman_fields_present := wightman_fields_present
    smearing_defined := smearing_defined
    vacuum_correlations_defined := vacuum_correlations_defined
    from_dossier := from_dossier }

/--
Named builder for a manuscript endpoint core object.

This makes the remaining object-level work explicit: a closed endpoint constant
can now be authored by supplying the dossier, reconstruction package, endpoint
object, and the readiness/projection fields directly.
-/
def YangMillsEndpointCoreData
  (euclidean_dossier_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_packet_ready : Prop)
  (endpoint_part : Prop)
  (dossier : YMEndpointDossier)
  (reconstruction_package : YMEndpointReconstructionPackage)
  (endpoint_object : YMEndpointObject)
  (build_endpoint_part :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_part)
  (dossier_yields_reconstruction :
    euclidean_dossier_ready -> reconstruction_ready)
  (reconstruction_exhibits_fields :
    reconstruction_ready -> reconstruction_package.wightman_fields_present)
  (reconstruction_exhibits_vacuum :
    reconstruction_ready -> reconstruction_package.vacuum_vector_present)
  (reconstruction_exhibits_smearing :
    reconstruction_ready -> reconstruction_package.smearing_defined)
  (reconstruction_exhibits_vacuum_correlations :
    reconstruction_ready -> reconstruction_package.vacuum_correlations_defined)
  (endpoint_packet_exhibits_exact_endpoint :
    endpoint_packet_ready -> endpoint_object.exact_local_net_endpoint) :
  YMEndpointCore :=
  { euclidean_dossier_ready := euclidean_dossier_ready
    reconstruction_ready := reconstruction_ready
    endpoint_packet_ready := endpoint_packet_ready
    endpoint_part := endpoint_part
    dossier := dossier
    reconstruction_package := reconstruction_package
    endpoint_object := endpoint_object
    build_endpoint_part := build_endpoint_part
    dossier_yields_reconstruction := dossier_yields_reconstruction
    reconstruction_exhibits_fields := reconstruction_exhibits_fields
    reconstruction_exhibits_vacuum := reconstruction_exhibits_vacuum
    reconstruction_exhibits_smearing := reconstruction_exhibits_smearing
    reconstruction_exhibits_vacuum_correlations := reconstruction_exhibits_vacuum_correlations
    endpoint_packet_exhibits_exact_endpoint := endpoint_packet_exhibits_exact_endpoint }

theorem YangMillsEndpointCoreBuilderStatement
  (euclidean_dossier_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_packet_ready : Prop)
  (endpoint_part : Prop)
  (dossier : YMEndpointDossier)
  (reconstruction_package : YMEndpointReconstructionPackage)
  (endpoint_object : YMEndpointObject)
  (build_endpoint_part :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_part)
  (dossier_yields_reconstruction :
    euclidean_dossier_ready -> reconstruction_ready)
  (reconstruction_exhibits_fields :
    reconstruction_ready -> reconstruction_package.wightman_fields_present)
  (reconstruction_exhibits_vacuum :
    reconstruction_ready -> reconstruction_package.vacuum_vector_present)
  (reconstruction_exhibits_smearing :
    reconstruction_ready -> reconstruction_package.smearing_defined)
  (reconstruction_exhibits_vacuum_correlations :
    reconstruction_ready -> reconstruction_package.vacuum_correlations_defined)
  (endpoint_packet_exhibits_exact_endpoint :
    endpoint_packet_ready -> endpoint_object.exact_local_net_endpoint)
  (hE : euclidean_dossier_ready)
  (hP : endpoint_packet_ready) :
  let RE :=
    YangMillsEndpointCoreData
      euclidean_dossier_ready reconstruction_ready endpoint_packet_ready endpoint_part
      dossier reconstruction_package endpoint_object
      build_endpoint_part dossier_yields_reconstruction
      reconstruction_exhibits_fields reconstruction_exhibits_vacuum
      reconstruction_exhibits_smearing reconstruction_exhibits_vacuum_correlations
      endpoint_packet_exhibits_exact_endpoint
  RE.reconstruction_ready /\
  RE.reconstruction_package.wightman_fields_present /\
  RE.reconstruction_package.vacuum_vector_present /\
  RE.reconstruction_package.smearing_defined /\
  RE.reconstruction_package.vacuum_correlations_defined /\
  RE.endpoint_object.exact_local_net_endpoint := by
  dsimp [YangMillsEndpointCoreData]
  exact
    And.intro (dossier_yields_reconstruction hE) <|
      And.intro (reconstruction_exhibits_fields (dossier_yields_reconstruction hE)) <|
        And.intro (reconstruction_exhibits_vacuum (dossier_yields_reconstruction hE)) <|
          And.intro (reconstruction_exhibits_smearing (dossier_yields_reconstruction hE)) <|
            And.intro
              (reconstruction_exhibits_vacuum_correlations (dossier_yields_reconstruction hE))
              (endpoint_packet_exhibits_exact_endpoint hP)

end MaleyLean
