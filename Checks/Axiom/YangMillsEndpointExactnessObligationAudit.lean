import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticDefinitions
import MaleyLean.Papers.YangMills.Kernel.StandardEndpointExactnessBackground

namespace MaleyLean

/--
The current route-level endpoint exactness/exclusion theorem is obtained from
endpoint readiness plus projections exposed by `YMEndpointCore`.
-/
theorem YangMillsEndpointExactnessCurrentRoot
    (RE : YMEndpointCore)
    (hE : RE.euclidean_dossier_ready)
    (hP : RE.endpoint_packet_ready) :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
      RE := by
  have hEnd := YangMillsEndpointCoreExhibitsNamedOutputsStatement RE hE hP
  exact And.intro hEnd.2.2.2.2.2 hEnd.2.2.1

/--
The carrier-level exact local-net endpoint shadow currently unfolds only to
faithful-Wilson presence plus OS-data completeness.
-/
theorem YangMillsEndpointExactLocalNetEndpointCarrierShadowUnfolds
    (B : YMEndpointManuscriptCarrierBase) :
    YMEndpointExactLocalNetEndpoint B <->
      (YMEndpointWightmanFieldsPresent B /\
        YMEndpointVacuumVectorPresent B) /\
      (YMEndpointSmearingDefined B /\
        YMEndpointVacuumCorrelationsDefined B) := by
  rfl

/--
The named endpoint exactness/exclusion statement currently unfolds to exact
endpoint plus vacuum-vector presence; extended-support exclusion is not yet a
separate predicate in this surface statement.
-/
theorem YangMillsEndpointExactnessNamedStatementUnfolds
    (RE : YMEndpointCore) :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
      RE <->
      RE.endpoint_object.exact_local_net_endpoint /\
        RE.reconstruction_package.vacuum_vector_present := by
  rfl

#print axioms YangMillsEndpointExactnessCurrentRoot
#print axioms YangMillsEndpointExactLocalNetEndpointCarrierShadowUnfolds
#print axioms YangMillsEndpointExactnessNamedStatementUnfolds
#print axioms Papers.YangMills.YMEndpointExactnessPayload.closed
#print axioms YMEndpointExactnessPayloadBridge.closed
#print axioms YMEndpointExactnessHypothesisMap.completeTransferHypotheses
#print axioms YMRouteEndpointExactnessImport.discharge
#print axioms YMRouteEndpointExactnessImport.fromHypothesisMap
#print axioms YMRouteEndpointExactnessImport.dischargeFromHypothesisMap
#print axioms ym_endpoint_exact_local_net_endpoint_holds

end MaleyLean
