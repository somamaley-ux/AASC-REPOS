import MaleyLean.Papers.YangMills.Kernel.EndpointReconstructionCarrierConstructionStage
import MaleyLean.Papers.YangMills.Kernel.EndpointReconstructionOperationsConstructionStage
import MaleyLean.Papers.YangMills.Kernel.EndpointSmearingConstructionStage
import MaleyLean.Papers.YangMills.Kernel.EndpointCorrelationConstructionStage

namespace MaleyLean

/-- Aggregate primitive-construction package for the endpoint heart. -/
structure YMEndpointPrimitiveConstructions (R : YMEndpointCore) where
  reconstruction_carrier_stage : YMEndpointReconstructionCarrierConstructionStage R
  reconstruction_operations_stage : YMEndpointReconstructionOperationsConstructionStage R
  smearing_stage : YMEndpointSmearingConstructionStage R
  correlation_stage : YMEndpointCorrelationConstructionStage R

def YangMillsEndpointPrimitiveConstructionsData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointPrimitiveConstructions R := by
  exact
    { reconstruction_carrier_stage :=
        YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP
      reconstruction_operations_stage :=
        YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP
      smearing_stage :=
        YangMillsEndpointSmearingConstructionStageData R hE hP vac testFn field
      correlation_stage :=
        YangMillsEndpointCorrelationConstructionStageData R hE hP vac testFn field }

theorem YangMillsEndpointPrimitiveConstructionsExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointPrimitiveConstructions R) /\
  Nonempty (YMEndpointReconstructionCarrierConstructionStage R) /\
  Nonempty (YMEndpointReconstructionOperationsConstructionStage R) /\
  Nonempty (YMEndpointSmearingConstructionStage R) /\
  Nonempty (YMEndpointCorrelationConstructionStage R) := by
  let E := YangMillsEndpointPrimitiveConstructionsData R hE hP vac testFn field
  exact
    And.intro (Nonempty.intro E) <|
      And.intro (Nonempty.intro E.reconstruction_carrier_stage) <|
        And.intro (Nonempty.intro E.reconstruction_operations_stage) <|
          And.intro (Nonempty.intro E.smearing_stage)
            (Nonempty.intro E.correlation_stage)

end MaleyLean
