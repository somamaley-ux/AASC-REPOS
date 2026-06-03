import MaleyLean.Papers.YangMills.Kernel.EndpointRelationalInterface

namespace MaleyLean

/--
Structured endpoint-side law package organizing the composed
smear-then-correlate operation around one chosen relational evaluation site.
-/
structure YMEndpointCorrelationLawPackage (R : YMEndpointCore) where
  interface : YMEndpointRelationalInterface R
  correlate_operator :
    interface.bundle.vacuum_vector ->
    interface.bundle.smeared_field_operator ->
    interface.bundle.vacuum_correlation_family
  correlate_smeared_field :
    interface.bundle.vacuum_vector ->
    interface.bundle.test_function_space ->
    interface.bundle.field_family ->
    interface.bundle.vacuum_correlation_family
  operator_compatibility :
    forall vac : interface.bundle.vacuum_vector,
      forall testFn : interface.bundle.test_function_space,
        forall field : interface.bundle.field_family,
          correlate_smeared_field vac testFn field =
            correlate_operator vac (interface.bundle.smear_field testFn field)
  chosen_site_law :
    correlate_smeared_field
      interface.chosen_vacuum_vector
      interface.chosen_test_function
      interface.chosen_field =
      interface.chosen_vacuum_correlation
  exact_endpoint_from_correlations :
    R.reconstruction_package.vacuum_correlations_defined ->
    R.endpoint_object.exact_local_net_endpoint
  exact_endpoint_witness : R.endpoint_object.exact_local_net_endpoint

def YangMillsEndpointCorrelationLawPackageData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointCorrelationLawPackage R := by
  let I := YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field
  refine
    { interface := I
      correlate_operator := fun vac' op' =>
        I.bundle.evaluate_vacuum_correlation vac' op'
      correlate_smeared_field := fun vac' testFn' field' =>
        I.bundle.evaluate_vacuum_correlation vac' (I.bundle.smear_field testFn' field')
      operator_compatibility := by
        intro vac' testFn' field'
        rfl
      chosen_site_law := by
        calc
          I.bundle.evaluate_vacuum_correlation
              I.chosen_vacuum_vector
              (I.bundle.smear_field I.chosen_test_function I.chosen_field)
              =
            I.bundle.evaluate_vacuum_correlation
              I.chosen_vacuum_vector
              I.chosen_smeared_operator := by
                rw [I.smearing_relation]
          _ = I.chosen_vacuum_correlation := I.vacuum_correlation_relation
      exact_endpoint_from_correlations := by
        intro _
        exact YangMillsEndpointPacketExhibitsExactEndpointStatement R hP
      exact_endpoint_witness := YangMillsEndpointPacketExhibitsExactEndpointStatement R hP }

theorem YangMillsEndpointCorrelationLawPackageExistsStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointCorrelationLawPackage R) := by
  exact Nonempty.intro (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field)

theorem YangMillsEndpointCorrelationLawPackageWitnessStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  Nonempty (YMEndpointCorrelationLawPackage R) /\
  P.correlate_smeared_field vac testFn field = P.interface.chosen_vacuum_correlation /\
  R.endpoint_object.exact_local_net_endpoint := by
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  exact And.intro
    (Nonempty.intro P)
    (And.intro P.chosen_site_law P.exact_endpoint_witness)

theorem YangMillsEndpointCorrelationOperatorCompatibilityStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  P.correlate_smeared_field vac testFn field =
    P.correlate_operator vac (P.interface.bundle.smear_field testFn field) := by
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  exact P.operator_compatibility vac testFn field

theorem YangMillsEndpointExactnessFromCorrelationsStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  P.exact_endpoint_from_correlations P.interface.bundle.vacuum_correlations_defined =
    P.exact_endpoint_witness := by
  rfl

theorem YangMillsEndpointExactnessFromArbitraryCorrelationsStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family)
  (hcorr : R.reconstruction_package.vacuum_correlations_defined) :
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  P.exact_endpoint_from_correlations hcorr = P.exact_endpoint_witness := by
  rfl

theorem YangMillsEndpointExactnessFactorsThroughEndpointPacketStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family)
  (hcorr : R.reconstruction_package.vacuum_correlations_defined) :
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  P.exact_endpoint_from_correlations hcorr =
    YangMillsEndpointPacketExhibitsExactEndpointStatement R hP := by
  rfl

theorem YangMillsEndpointChosenSmearCorrelationFeedsExactnessStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  R.endpoint_object.exact_local_net_endpoint /\
  (P.correlate_operator
      P.interface.chosen_vacuum_vector
      (P.interface.bundle.smear_field
        P.interface.chosen_test_function
        P.interface.chosen_field) =
    P.interface.chosen_vacuum_correlation) /\
  (P.exact_endpoint_from_correlations P.interface.bundle.vacuum_correlations_defined =
    YangMillsEndpointPacketExhibitsExactEndpointStatement R hP) := by
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  refine And.intro ?_ <| And.intro ?_ ?_
  · exact YangMillsEndpointPacketExhibitsExactEndpointStatement R hP
  · calc
      P.correlate_operator
          P.interface.chosen_vacuum_vector
          (P.interface.bundle.smear_field
            P.interface.chosen_test_function
            P.interface.chosen_field)
          =
        P.correlate_smeared_field
          P.interface.chosen_vacuum_vector
          P.interface.chosen_test_function
          P.interface.chosen_field := by
            exact
              (P.operator_compatibility
                P.interface.chosen_vacuum_vector
                P.interface.chosen_test_function
                P.interface.chosen_field).symm
      _ = P.interface.chosen_vacuum_correlation := by
            exact P.chosen_site_law
  · exact
      YangMillsEndpointExactnessFactorsThroughEndpointPacketStatement
        R hE hP vac testFn field
        P.interface.bundle.vacuum_correlations_defined

end MaleyLean
