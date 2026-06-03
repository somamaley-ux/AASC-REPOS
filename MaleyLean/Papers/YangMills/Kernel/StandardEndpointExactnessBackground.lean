import MaleyLean.Papers.YangMills.Kernel.EndpointCore
import MaleyLean.Papers.YangMills.Kernel.EndpointSectorExclusion
import MaleyLean.Papers.YangMills.Kernel.NamedEndpointTheoremContent

namespace MaleyLean

/--
The endpoint-side conclusion required by the Clay extension.

The current recovered package exposes `exact_local_net_endpoint` and a vacuum
vector witness.  For A+ audit purposes, the extended-support exclusion is named
as a separate proposition rather than hidden in the theorem title.
-/
structure YMEndpointExactnessConclusion where
  LocalNetEndpoint : Type
  ExtendedSupportSectorData : Type
  VacuumVector : Type
  exact_local_net_endpoint : Prop
  vacuum_vector_present : Prop
  no_extended_support_sector_data : Prop

def YMEndpointExactnessConclusion.closed
    (C : YMEndpointExactnessConclusion) :
    Prop :=
  C.exact_local_net_endpoint /\
  C.vacuum_vector_present /\
  C.no_extended_support_sector_data

/--
Bridge from the explicit endpoint-sector classification payload to the
existing route-facing endpoint exactness conclusion.
-/
structure YMEndpointExactnessPayloadBridge where
  payload : Papers.YangMills.YMEndpointExactnessPayload
  conclusion : YMEndpointExactnessConclusion
  exactness_from_payload :
    payload.sector_exclusion.endpoint_exact ->
      conclusion.exact_local_net_endpoint
  vacuum_from_payload :
    payload.sector_exclusion.vacuum_vector_present ->
      conclusion.vacuum_vector_present
  exclusion_from_payload :
    payload.no_extended_support_sector_data ->
      conclusion.no_extended_support_sector_data

theorem YMEndpointExactnessPayloadBridge.closed
    (B : YMEndpointExactnessPayloadBridge) :
    B.conclusion.closed := by
  exact
    And.intro
      (B.exactness_from_payload B.payload.exact_local_net_endpoint)
      (And.intro
        (B.vacuum_from_payload B.payload.vacuum_vector_present)
        (B.exclusion_from_payload B.payload.no_extended_support))

/--
Endpoint-exactness hypotheses visible before the final O.5/O.7 endpoint
classification step.
-/
structure YMEndpointExactnessHypotheses where
  euclidean_dossier_ready : Prop
  reconstruction_ready : Prop
  endpoint_packet_ready : Prop
  wightman_fields_present : Prop
  vacuum_vector_present : Prop
  smearing_defined : Prop
  vacuum_correlations_defined : Prop
  faithful_wilson_universality : Prop
  endpoint_boundary_admissible : Prop

def YMEndpointExactnessHypotheses.complete
    (H : YMEndpointExactnessHypotheses) :
    Prop :=
  H.euclidean_dossier_ready /\
  H.reconstruction_ready /\
  H.endpoint_packet_ready /\
  H.wightman_fields_present /\
  H.vacuum_vector_present /\
  H.smearing_defined /\
  H.vacuum_correlations_defined /\
  H.faithful_wilson_universality /\
  H.endpoint_boundary_admissible

/--
Standard endpoint-exactness/classification import.  This is where a future A+
formalization must prove, or precisely cite, the endpoint classification and
extended-support exclusion theorem.
-/
structure YMStandardEndpointExactnessTransfer where
  hypotheses : YMEndpointExactnessHypotheses
  conclusion : YMEndpointExactnessConclusion
  transfer :
    hypotheses.complete -> conclusion.closed

/--
Which endpoint-exactness hypotheses are supplied by a recovered endpoint core,
and which are still external classification/admissibility content.
-/
structure YMEndpointExactnessHypothesisMap
    (RE : YMEndpointCore) where
  euclidean_dossier_ready :
    RE.euclidean_dossier_ready
  reconstruction_ready :
    RE.reconstruction_ready
  endpoint_packet_ready :
    RE.endpoint_packet_ready
  wightman_fields_present :
    RE.reconstruction_package.wightman_fields_present
  vacuum_vector_present :
    RE.reconstruction_package.vacuum_vector_present
  smearing_defined :
    RE.reconstruction_package.smearing_defined
  vacuum_correlations_defined :
    RE.reconstruction_package.vacuum_correlations_defined
  faithful_wilson_universality :
    RE.endpoint_object.exact_local_net_endpoint
  endpoint_boundary_admissible_external :
    Prop

def YMEndpointExactnessHypothesisMap.toTransferHypotheses
    {RE : YMEndpointCore}
    (M : YMEndpointExactnessHypothesisMap RE) :
    YMEndpointExactnessHypotheses where
  euclidean_dossier_ready := RE.euclidean_dossier_ready
  reconstruction_ready := RE.reconstruction_ready
  endpoint_packet_ready := RE.endpoint_packet_ready
  wightman_fields_present := RE.reconstruction_package.wightman_fields_present
  vacuum_vector_present := RE.reconstruction_package.vacuum_vector_present
  smearing_defined := RE.reconstruction_package.smearing_defined
  vacuum_correlations_defined :=
    RE.reconstruction_package.vacuum_correlations_defined
  faithful_wilson_universality := RE.endpoint_object.exact_local_net_endpoint
  endpoint_boundary_admissible := M.endpoint_boundary_admissible_external

theorem YMEndpointExactnessHypothesisMap.completeTransferHypotheses
    {RE : YMEndpointCore}
    (M : YMEndpointExactnessHypothesisMap RE)
    (hboundary : M.endpoint_boundary_admissible_external) :
    M.toTransferHypotheses.complete := by
  exact
    And.intro M.euclidean_dossier_ready <|
      And.intro M.reconstruction_ready <|
        And.intro M.endpoint_packet_ready <|
          And.intro M.wightman_fields_present <|
            And.intro M.vacuum_vector_present <|
              And.intro M.smearing_defined <|
                And.intro M.vacuum_correlations_defined <|
                  And.intro M.faithful_wilson_universality hboundary

def YMEndpointExactnessHypothesisMap.fromReadiness
    (RE : YMEndpointCore)
    (hE : RE.euclidean_dossier_ready)
    (hP : RE.endpoint_packet_ready)
    (endpoint_boundary_admissible_external : Prop) :
    YMEndpointExactnessHypothesisMap RE := by
  have hEnd := YangMillsEndpointCoreExhibitsNamedOutputsStatement RE hE hP
  exact
    { euclidean_dossier_ready := hE
      reconstruction_ready := hEnd.1
      endpoint_packet_ready := hP
      wightman_fields_present := hEnd.2.1
      vacuum_vector_present := hEnd.2.2.1
      smearing_defined := hEnd.2.2.2.1
      vacuum_correlations_defined := hEnd.2.2.2.2.1
      faithful_wilson_universality := hEnd.2.2.2.2.2
      endpoint_boundary_admissible_external :=
        endpoint_boundary_admissible_external }

structure YMRouteEndpointExactnessImport
    (RE : YMEndpointCore) where
  standard_endpoint_exactness : YMStandardEndpointExactnessTransfer
  hypotheses_verified :
    standard_endpoint_exactness.hypotheses.complete
  route_exactness_from_standard :
    standard_endpoint_exactness.conclusion.closed ->
      ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE

theorem YMRouteEndpointExactnessImport.discharge
    {RE : YMEndpointCore}
    (I : YMRouteEndpointExactnessImport RE) :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE := by
  exact I.route_exactness_from_standard
    (I.standard_endpoint_exactness.transfer I.hypotheses_verified)

def YMRouteEndpointExactnessImport.fromHypothesisMap
    {RE : YMEndpointCore}
    (M : YMEndpointExactnessHypothesisMap RE)
    (standard_endpoint_exactness : YMStandardEndpointExactnessTransfer)
    (hstandard :
      standard_endpoint_exactness.hypotheses = M.toTransferHypotheses)
    (hboundary : M.endpoint_boundary_admissible_external)
    (route_exactness_from_standard :
      standard_endpoint_exactness.conclusion.closed ->
        ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE) :
    YMRouteEndpointExactnessImport RE where
  standard_endpoint_exactness := standard_endpoint_exactness
  hypotheses_verified := by
    rw [hstandard]
    exact M.completeTransferHypotheses hboundary
  route_exactness_from_standard := route_exactness_from_standard

theorem YMRouteEndpointExactnessImport.dischargeFromHypothesisMap
    {RE : YMEndpointCore}
    (M : YMEndpointExactnessHypothesisMap RE)
    (standard_endpoint_exactness : YMStandardEndpointExactnessTransfer)
    (hstandard :
      standard_endpoint_exactness.hypotheses = M.toTransferHypotheses)
    (hboundary : M.endpoint_boundary_admissible_external)
    (route_exactness_from_standard :
      standard_endpoint_exactness.conclusion.closed ->
        ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE) :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE := by
  exact
    (YMRouteEndpointExactnessImport.fromHypothesisMap
      M
      standard_endpoint_exactness
      hstandard
      hboundary
      route_exactness_from_standard).discharge

end MaleyLean
