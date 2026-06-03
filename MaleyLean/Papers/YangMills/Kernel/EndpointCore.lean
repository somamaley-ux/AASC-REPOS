import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpine

namespace MaleyLean

/--
Dedicated abstract core for the endpoint route of the load-bearing spine.

This isolates the final reconstruction-to-endpoint chain:
Euclidean dossier, Wightman reconstruction, and endpoint packet closure.
-/
structure YMEndpointDossier where
  euclidean_input : Type
  reflection_positive : Prop
  os_data_complete : Prop

structure YMEndpointReconstructionPackage where
  reconstructed_hilbert : Type
  field_family : Type
  vacuum_vector : Type
  test_function_space : Type
  smeared_field_operator : Type
  vacuum_correlation_family : Type
  smear_field : test_function_space -> field_family -> smeared_field_operator
  evaluate_vacuum_correlation :
    vacuum_vector -> smeared_field_operator -> vacuum_correlation_family
  vacuum_vector_present : Prop
  wightman_fields_present : Prop
  smearing_defined : Prop
  vacuum_correlations_defined : Prop
  from_dossier : YMEndpointDossier

structure YMEndpointCore where
  euclidean_dossier_ready : Prop
  reconstruction_ready : Prop
  endpoint_packet_ready : Prop
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

/-- Abstract statement that reconstruction closes the endpoint once the dossier is in place. -/
def ym_reconstruction_endpoint_core (R : YMEndpointCore) : Prop :=
  R.euclidean_dossier_ready ->
  R.reconstruction_ready ->
  R.endpoint_packet_ready ->
  R.endpoint_part

/--
Explicit paper-facing endpoint statement carried by the current endpoint core.

Unlike `endpoint_part`, this names the concrete reconstruction and exact-endpoint
outputs that the current endpoint route exposes.
-/
def ym_endpoint_explicit_statement (R : YMEndpointCore) : Prop :=
  R.reconstruction_ready /\
  R.reconstruction_package.wightman_fields_present /\
  R.reconstruction_package.vacuum_vector_present /\
  R.reconstruction_package.smearing_defined /\
  R.reconstruction_package.vacuum_correlations_defined /\
  R.endpoint_object.exact_local_net_endpoint

theorem YangMillsReconstructionEndpointCoreStatement
  (R : YMEndpointCore)
  (h : ym_reconstruction_endpoint_core R)
  (hE : R.euclidean_dossier_ready)
  (hR : R.reconstruction_ready)
  (hP : R.endpoint_packet_ready) :
  R.endpoint_part := by
  exact h hE hR hP

theorem YangMillsEndpointCoreBuildStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hR : R.reconstruction_ready)
  (hP : R.endpoint_packet_ready) :
  R.endpoint_part := by
  exact R.build_endpoint_part hE hR hP

theorem YangMillsEndpointDossierFeedsReconstructionStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready) :
  R.reconstruction_ready := by
  exact R.dossier_yields_reconstruction hE

theorem YangMillsEndpointReconstructionPackageStatement
  (R : YMEndpointCore)
  (hR : R.reconstruction_ready) :
  R.reconstruction_package.wightman_fields_present /\
  R.reconstruction_package.vacuum_vector_present /\
  R.reconstruction_package.smearing_defined /\
  R.reconstruction_package.vacuum_correlations_defined := by
  exact And.intro
    (R.reconstruction_exhibits_fields hR)
    (And.intro
      (R.reconstruction_exhibits_vacuum hR)
      (And.intro
        (R.reconstruction_exhibits_smearing hR)
        (R.reconstruction_exhibits_vacuum_correlations hR)))

theorem YangMillsEndpointPacketExhibitsExactEndpointStatement
  (R : YMEndpointCore)
  (hP : R.endpoint_packet_ready) :
  R.endpoint_object.exact_local_net_endpoint := by
  exact R.endpoint_packet_exhibits_exact_endpoint hP

theorem YangMillsLoadBearingSpineFeedsEndpointCoreStatement
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
  R.endpoint_part := by
  have hpart := YangMillsReconstructionEndpointCoreStatement R hbuild hE hR hP
  exact And.intro h9E <| And.intro h9W <| And.intro h10 hpart

theorem YangMillsEndpointCoreExhibitsNamedOutputsStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  R.reconstruction_ready /\
  R.reconstruction_package.wightman_fields_present /\
  R.reconstruction_package.vacuum_vector_present /\
  R.reconstruction_package.smearing_defined /\
  R.reconstruction_package.vacuum_correlations_defined /\
  R.endpoint_object.exact_local_net_endpoint := by
  have hR := YangMillsEndpointDossierFeedsReconstructionStatement R hE
  have hpack := YangMillsEndpointReconstructionPackageStatement R hR
  have hend := YangMillsEndpointPacketExhibitsExactEndpointStatement R hP
  exact
    And.intro hR <|
      And.intro hpack.1 <|
        And.intro hpack.2.1 <|
          And.intro hpack.2.2.1 <|
            And.intro hpack.2.2.2 hend

theorem YangMillsEndpointExplicitStatementFromReadinessStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  ym_endpoint_explicit_statement R := by
  exact YangMillsEndpointCoreExhibitsNamedOutputsStatement R hE hP

theorem YangMillsLoadBearingSpineFeedsEndpointExplicitStatement
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
  ym_endpoint_explicit_statement R := by
  have hspine :=
    YangMillsLoadBearingSpineFeedsEndpointCoreStatement
      S R h9E h9W h10 hE hR hP hbuild
  have hexplicit :=
    YangMillsEndpointExplicitStatementFromReadinessStatement R hE hP
  exact And.intro hspine.1 <|
    And.intro hspine.2.1 <|
      And.intro hspine.2.2.1 hexplicit

end MaleyLean
