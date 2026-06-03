import MaleyLean.Papers.YangMills.Kernel.EndpointReconstructionCarrierConstructionStage

namespace MaleyLean

/-- Primitive operation-side reconstruction stage for the endpoint heart. -/
structure YMEndpointReconstructionOperationsConstructionStage (R : YMEndpointCore) where
  carrier_stage : YMEndpointReconstructionCarrierConstructionStage R
  constructed_test_function_space := carrier_stage.bundle.test_function_space
  constructed_smeared_field_operator := carrier_stage.bundle.smeared_field_operator
  constructed_vacuum_correlation_family := carrier_stage.bundle.vacuum_correlation_family
  test_function_construction :
    constructed_test_function_space = R.reconstruction_package.test_function_space
  smeared_operator_construction :
    constructed_smeared_field_operator = R.reconstruction_package.smeared_field_operator
  correlation_family_construction :
    constructed_vacuum_correlation_family = R.reconstruction_package.vacuum_correlation_family
  smearing_defined_certificate :
    R.reconstruction_package.smearing_defined
  vacuum_correlations_defined_certificate :
    R.reconstruction_package.vacuum_correlations_defined

def YangMillsEndpointReconstructionOperationsConstructionStageData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointReconstructionOperationsConstructionStage R := by
  let C := YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP
  exact
    { carrier_stage := C
      test_function_construction := rfl
      smeared_operator_construction := rfl
      correlation_family_construction := rfl
      smearing_defined_certificate := C.bundle.smearing_defined
      vacuum_correlations_defined_certificate := C.bundle.vacuum_correlations_defined }

theorem YangMillsEndpointReconstructionOperationsConstructionStageExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  Nonempty (YMEndpointReconstructionOperationsConstructionStage R) /\
  ((YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP).constructed_test_function_space =
    R.reconstruction_package.test_function_space) /\
  ((YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP).constructed_smeared_field_operator =
    R.reconstruction_package.smeared_field_operator) /\
  ((YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP).constructed_vacuum_correlation_family =
    R.reconstruction_package.vacuum_correlation_family) /\
  R.reconstruction_package.smearing_defined /\
  R.reconstruction_package.vacuum_correlations_defined := by
  let T := YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP
  exact
    And.intro (Nonempty.intro T) <|
      And.intro T.test_function_construction <|
        And.intro T.smeared_operator_construction <|
          And.intro T.correlation_family_construction <|
            And.intro T.smearing_defined_certificate T.vacuum_correlations_defined_certificate

end MaleyLean
