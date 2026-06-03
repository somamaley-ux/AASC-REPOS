import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptCarrierDeclarations
import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticDefinitions
import MaleyLean.Papers.YangMills.Kernel.StandardOSWightmanBackground
import MaleyLean.Papers.YangMills.Kernel.ManuscriptDeclarations
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptWitnessData

namespace MaleyLean

abbrev ym_endpoint_M1_dossier_statement : Prop :=
  YMEndpointReflectionPositive ym_endpoint_manuscript_carrier_base /\
  YMEndpointOSDataComplete ym_endpoint_manuscript_carrier_base

abbrev ym_endpoint_O5_exact_local_net_endpoint_statement : Prop :=
  YMEndpointExactLocalNetEndpoint ym_endpoint_manuscript_carrier_base

abbrev ym_endpoint_decl_euclidean_dossier_ready : Prop :=
  ym_endpoint_M1_dossier_statement
abbrev ym_endpoint_decl_endpoint_packet_ready : Prop :=
  ym_endpoint_O5_exact_local_net_endpoint_statement
abbrev ym_endpoint_decl_reconstruction_ready : Prop :=
  ym_endpoint_decl_bundle.imported_os_background.reconstruction_ready
abbrev ym_endpoint_decl_vacuum_vector_present : Prop :=
  YMEndpointVacuumVectorPresent ym_endpoint_manuscript_carrier_base
abbrev ym_endpoint_decl_wightman_fields_present : Prop :=
  YMEndpointWightmanFieldsPresent ym_endpoint_manuscript_carrier_base
abbrev ym_endpoint_decl_smearing_defined : Prop :=
  YMEndpointSmearingDefined ym_endpoint_manuscript_carrier_base
abbrev ym_endpoint_decl_vacuum_correlations_defined : Prop :=
  YMEndpointVacuumCorrelationsDefined ym_endpoint_manuscript_carrier_base

abbrev ym_endpoint_M3_reconstruction_statement : Prop :=
  ym_endpoint_M1_dossier_statement -> ym_endpoint_decl_reconstruction_ready

abbrev ym_endpoint_M4_field_correspondence_statement : Prop :=
  ym_endpoint_decl_reconstruction_ready ->
  ym_endpoint_decl_wightman_fields_present /\
  ym_endpoint_decl_smearing_defined /\
  ym_endpoint_decl_vacuum_correlations_defined

abbrev ym_endpoint_O3_universality_statement : Prop :=
  YMEndpointFaithfulWilsonUniversality ym_endpoint_manuscript_carrier_base

abbrev ym_endpoint_O7_group_only_restatement_statement : Prop :=
  ym_endpoint_O5_exact_local_net_endpoint_statement

theorem ym_endpoint_decl_hE : ym_endpoint_decl_euclidean_dossier_ready := by
  exact ym_endpoint_decl_bundle.hM1

theorem ym_endpoint_decl_hP : ym_endpoint_decl_endpoint_packet_ready := by
  exact ym_endpoint_decl_bundle.hO5

theorem ym_endpoint_M1 : ym_endpoint_M1_dossier_statement := by
  exact ym_endpoint_decl_bundle.hM1

theorem ym_endpoint_M3 : ym_endpoint_M3_reconstruction_statement := by
  intro hM1
  exact ym_endpoint_decl_bundle.imported_os_background.dossier_implies_reconstruction hM1

theorem ym_endpoint_M4 : ym_endpoint_M4_field_correspondence_statement := by
  intro hR
  exact
    And.intro
      (ym_endpoint_decl_bundle.imported_os_background.reconstruction_exhibits_fields hR)
      (And.intro
        (ym_endpoint_decl_bundle.imported_os_background.reconstruction_exhibits_smearing hR)
        (ym_endpoint_decl_bundle.imported_os_background.reconstruction_exhibits_vacuum_correlations hR))

theorem ym_endpoint_O3 : ym_endpoint_O3_universality_statement := by
  exact ym_endpoint_decl_bundle.hO3

theorem ym_endpoint_O5 : ym_endpoint_O5_exact_local_net_endpoint_statement := by
  exact ym_endpoint_decl_bundle.hO5

theorem ym_endpoint_O7 : ym_endpoint_O7_group_only_restatement_statement := by
  exact ym_endpoint_O5

abbrev ym_endpoint_decl_reflection_positive : Prop :=
  YMEndpointReflectionPositive ym_endpoint_manuscript_carrier_base
abbrev ym_endpoint_decl_os_data_complete : Prop :=
  YMEndpointOSDataComplete ym_endpoint_manuscript_carrier_base
abbrev ym_endpoint_decl_faithful_wilson_universality : Prop :=
  ym_endpoint_O3_universality_statement
abbrev ym_endpoint_decl_exact_local_net_endpoint : Prop :=
  ym_endpoint_O5_exact_local_net_endpoint_statement
abbrev ym_endpoint_decl_part : Prop :=
  ym_endpoint_decl_euclidean_dossier_ready /\
  ym_endpoint_decl_reconstruction_ready /\
  ym_endpoint_decl_endpoint_packet_ready

theorem ym_endpoint_decl_build_endpoint_part :
  ym_endpoint_decl_euclidean_dossier_ready ->
  ym_endpoint_decl_reconstruction_ready ->
  ym_endpoint_decl_endpoint_packet_ready ->
  ym_endpoint_decl_part := by
  intro hE hR hP
  exact And.intro hE (And.intro hR hP)

theorem ym_endpoint_decl_dossier_yields_reconstruction :
  ym_endpoint_decl_euclidean_dossier_ready -> ym_endpoint_decl_reconstruction_ready := by
  intro hE
  exact ym_endpoint_decl_bundle.imported_os_background.dossier_implies_reconstruction hE

theorem ym_endpoint_decl_reconstruction_exhibits_fields :
  ym_endpoint_decl_reconstruction_ready -> ym_endpoint_decl_wightman_fields_present := by
  intro hR
  exact ym_endpoint_decl_bundle.imported_os_background.reconstruction_exhibits_fields hR

theorem ym_endpoint_decl_reconstruction_exhibits_vacuum :
  ym_endpoint_decl_reconstruction_ready -> ym_endpoint_decl_vacuum_vector_present := by
  intro hR
  exact ym_endpoint_decl_bundle.imported_os_background.reconstruction_exhibits_vacuum hR

theorem ym_endpoint_decl_reconstruction_exhibits_smearing :
  ym_endpoint_decl_reconstruction_ready -> ym_endpoint_decl_smearing_defined := by
  intro hR
  exact ym_endpoint_decl_bundle.imported_os_background.reconstruction_exhibits_smearing hR

theorem ym_endpoint_decl_reconstruction_exhibits_vacuum_correlations :
  ym_endpoint_decl_reconstruction_ready -> ym_endpoint_decl_vacuum_correlations_defined := by
  intro hR
  exact
    ym_endpoint_decl_bundle.imported_os_background.reconstruction_exhibits_vacuum_correlations hR

theorem ym_endpoint_decl_endpoint_packet_exhibits_exact_endpoint :
  ym_endpoint_decl_endpoint_packet_ready -> ym_endpoint_decl_exact_local_net_endpoint := by
  intro hP
  exact hP

theorem ym_endpoint_decl_M1_exhibits_reflection_positive :
  ym_endpoint_decl_euclidean_dossier_ready -> ym_endpoint_decl_reflection_positive := by
  intro _
  exact ym_endpoint_reflection_positive_holds ym_endpoint_manuscript_carrier_base

theorem ym_endpoint_decl_M1_exhibits_os_data_complete :
  ym_endpoint_decl_euclidean_dossier_ready -> ym_endpoint_decl_os_data_complete := by
  intro _
  exact ym_endpoint_os_data_complete_holds ym_endpoint_manuscript_carrier_base

theorem ym_endpoint_decl_O3_exhibits_universality :
  ym_endpoint_O3_universality_statement -> ym_endpoint_decl_faithful_wilson_universality := by
  intro hO3
  exact hO3

noncomputable def ym_endpoint_manuscript_witness_data :
  YMEndpointManuscriptWitnessData ym_endpoint_manuscript_carrier_base :=
  { reflection_positive := ym_endpoint_decl_reflection_positive
    os_data_complete := ym_endpoint_decl_os_data_complete
    vacuum_vector_present := ym_endpoint_decl_vacuum_vector_present
    wightman_fields_present := ym_endpoint_decl_wightman_fields_present
    smearing_defined := ym_endpoint_decl_smearing_defined
    vacuum_correlations_defined := ym_endpoint_decl_vacuum_correlations_defined
    faithful_wilson_universality := ym_endpoint_decl_faithful_wilson_universality
    exact_local_net_endpoint := ym_endpoint_decl_exact_local_net_endpoint
    euclidean_dossier_ready := ym_endpoint_decl_euclidean_dossier_ready
    reconstruction_ready := ym_endpoint_decl_reconstruction_ready
    endpoint_packet_ready := ym_endpoint_decl_endpoint_packet_ready
    hE := ym_endpoint_decl_hE
    hP := ym_endpoint_decl_hP
    endpoint_part := ym_endpoint_decl_part
    build_endpoint_part := ym_endpoint_decl_build_endpoint_part
    dossier_yields_reconstruction := ym_endpoint_decl_dossier_yields_reconstruction
    reconstruction_exhibits_fields := ym_endpoint_decl_reconstruction_exhibits_fields
    reconstruction_exhibits_vacuum := ym_endpoint_decl_reconstruction_exhibits_vacuum
    reconstruction_exhibits_smearing := ym_endpoint_decl_reconstruction_exhibits_smearing
    reconstruction_exhibits_vacuum_correlations := ym_endpoint_decl_reconstruction_exhibits_vacuum_correlations
    endpoint_packet_exhibits_exact_endpoint := ym_endpoint_decl_endpoint_packet_exhibits_exact_endpoint }

noncomputable def ym_endpoint_manuscript_carrier_package :
  YMEndpointManuscriptCarrierPackage :=
  ym_endpoint_manuscript_witness_data.toCarrierPackage

noncomputable def ym_endpoint_manuscript_object :
  YMEndpointManuscriptObject :=
  ym_endpoint_manuscript_witness_data.toEndpointManuscriptObject

theorem ym_endpoint_manuscript_object_named_inhabitants :
  ym_endpoint_manuscript_object.Omega_loc = Omega_loc /\
  ym_endpoint_manuscript_object.phi_star = phi_star /\
  ym_endpoint_manuscript_object.E_ren = E_ren := by
  have h := YangMillsEndpointManuscriptWitnessDataStatement ym_endpoint_manuscript_witness_data
  exact And.intro h.2.2.2.1 (And.intro h.2.2.2.2.1 h.2.2.2.2.2)

end MaleyLean
