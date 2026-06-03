import MaleyLean.Papers.YangMills.Kernel.EndpointCore

namespace MaleyLean

/--
Structured endpoint-side semantic bundle keeping dossier data, reconstruction
outputs, and endpoint closure together in one typed object.
-/
structure YMEndpointSemanticBundle (R : YMEndpointCore) where
  euclidean_input : Type
  reflection_positive : Prop
  os_data_complete : Prop
  reconstructed_hilbert : Type
  field_family : Type
  vacuum_vector : Type
  test_function_space : Type
  smeared_field_operator : Type
  vacuum_correlation_family : Type
  smear_field : test_function_space -> field_family -> smeared_field_operator
  evaluate_vacuum_correlation :
    vacuum_vector -> smeared_field_operator -> vacuum_correlation_family
  reconstruction_source_dossier : YMEndpointDossier
  reconstruction_ready : R.reconstruction_ready
  wightman_fields_present : R.reconstruction_package.wightman_fields_present
  vacuum_vector_present : R.reconstruction_package.vacuum_vector_present
  smearing_defined : R.reconstruction_package.smearing_defined
  vacuum_correlations_defined : R.reconstruction_package.vacuum_correlations_defined
  exact_endpoint : R.endpoint_object.exact_local_net_endpoint

theorem YangMillsEndpointDossierStatement
  (R : YMEndpointCore) :
  R.dossier.euclidean_input = R.dossier.euclidean_input /\
  R.dossier.reflection_positive = R.dossier.reflection_positive /\
  R.dossier.os_data_complete = R.dossier.os_data_complete := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsEndpointReconstructionMetadataStatement
  (R : YMEndpointCore) :
  R.reconstruction_package.reconstructed_hilbert =
      R.reconstruction_package.reconstructed_hilbert /\
  R.reconstruction_package.field_family =
      R.reconstruction_package.field_family /\
  R.reconstruction_package.vacuum_vector =
      R.reconstruction_package.vacuum_vector /\
  R.reconstruction_package.test_function_space =
      R.reconstruction_package.test_function_space /\
  R.reconstruction_package.smeared_field_operator =
      R.reconstruction_package.smeared_field_operator /\
  R.reconstruction_package.vacuum_correlation_family =
      R.reconstruction_package.vacuum_correlation_family /\
  R.reconstruction_package.smear_field =
      R.reconstruction_package.smear_field /\
  R.reconstruction_package.evaluate_vacuum_correlation =
      R.reconstruction_package.evaluate_vacuum_correlation /\
  R.reconstruction_package.from_dossier =
      R.reconstruction_package.from_dossier := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl rfl

def YangMillsEndpointSemanticBundleData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointSemanticBundle R := by
  have hmeta := YangMillsEndpointReconstructionMetadataStatement R
  have hnamed := YangMillsEndpointCoreExhibitsNamedOutputsStatement R hE hP
  refine
    { euclidean_input := R.dossier.euclidean_input
      reflection_positive := R.dossier.reflection_positive
      os_data_complete := R.dossier.os_data_complete
      reconstructed_hilbert := R.reconstruction_package.reconstructed_hilbert
      field_family := R.reconstruction_package.field_family
      vacuum_vector := R.reconstruction_package.vacuum_vector
      test_function_space := R.reconstruction_package.test_function_space
      smeared_field_operator := R.reconstruction_package.smeared_field_operator
      vacuum_correlation_family := R.reconstruction_package.vacuum_correlation_family
      smear_field := R.reconstruction_package.smear_field
      evaluate_vacuum_correlation := R.reconstruction_package.evaluate_vacuum_correlation
      reconstruction_source_dossier := R.reconstruction_package.from_dossier
      reconstruction_ready := hnamed.1
      wightman_fields_present := hnamed.2.1
      vacuum_vector_present := hnamed.2.2.1
      smearing_defined := hnamed.2.2.2.1
      vacuum_correlations_defined := hnamed.2.2.2.2.1
      exact_endpoint := hnamed.2.2.2.2.2 }

theorem YangMillsEndpointSemanticBundleExistsStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  Nonempty (YMEndpointSemanticBundle R) := by
  exact ⟨YangMillsEndpointSemanticBundleData R hE hP⟩

theorem YangMillsSpineFeedsEndpointSemanticBundleStatement
  (S : YMLoadBearingSpine)
  (R : YMEndpointCore)
  (h9E : S.packet9_reconstruction.euclidean_os_dossier)
  (h9W : S.packet9_reconstruction.wightman_reconstruction)
  (h10 : S.packet10_endpoint)
  (hE : R.euclidean_dossier_ready)
  (hR : R.reconstruction_ready)
  (hP : R.endpoint_packet_ready)
  (hbuild : ym_reconstruction_endpoint_core R) :
  S.packet9_reconstruction.euclidean_os_dossier /\
  S.packet9_reconstruction.wightman_reconstruction /\
  S.packet10_endpoint /\
  Nonempty (YMEndpointSemanticBundle R) := by
  have hspine :=
    YangMillsLoadBearingSpineFeedsEndpointCoreStatement
      S R h9E h9W h10 hE hR hP hbuild
  have hbundle := YangMillsEndpointSemanticBundleExistsStatement R hE hP
  exact And.intro hspine.1 <| And.intro hspine.2.1 <| And.intro hspine.2.2.1 hbundle

end MaleyLean
