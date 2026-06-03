import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptCarrierBase
import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticDefinitions
import MaleyLean.Papers.YangMills.Kernel.StandardOSWightmanBackground
import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptCarrierBase
import MaleyLean.Papers.YangMills.Kernel.ConstructiveSemanticDefinitions
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptCarrierBase
import MaleyLean.Papers.YangMills.Kernel.VacuumSemanticDefinitions

namespace MaleyLean

abbrev YMConstructive576ExtensionPayload
    (B : YMConstructiveManuscriptCarrierBase) : Prop :=
  (B.assemble_sharp_local_state
    B.bounded_base_one
    B.omega_bd
    B.omega_sharp).extends_bounded_base

structure YMEndpointDeclBundle
    (B : YMEndpointManuscriptCarrierBase) where
  imported_os_background :
    YMStandardOSWightmanBackground
      (YMEndpointReflectionPositive B /\ YMEndpointOSDataComplete B)
      (YMEndpointVacuumVectorPresent B)
      (YMEndpointWightmanFieldsPresent B)
      (YMEndpointSmearingDefined B)
      (YMEndpointVacuumCorrelationsDefined B)
  hM1 : YMEndpointReflectionPositive B /\ YMEndpointOSDataComplete B
  hO3 : YMEndpointFaithfulWilsonUniversality B
  hO5 : YMEndpointExactLocalNetEndpoint B

structure YMConstructiveDeclBundle
    (B : YMConstructiveManuscriptCarrierBase) where
  h492 : YMConstructiveFlowedStateReady B
  h569 : YMConstructiveTruncationWindowReady B
  h574 :
    YMConstructivePositiveBridgeReady B /\
    YMConstructiveFiniteCapExtensionPackageReady B
  h576 : YMConstructive576ExtensionPayload B

structure YMVacuumDeclBundle
    (B : YMVacuumGapManuscriptCarrierBase) where
  hIII1 : YMVacuumUltravioletScopeReady B
  hIII3 : YMVacuumEntranceReady B
  hIV4 : YMVacuumWeakWindowCertificateReady B
  hF216 : YMVacuumOSTransportReady B /\ YMVacuumPositiveGapExhibited B
  hIV1 : YMVacuumLatticeGapInputReady B

structure YMManuscriptTheoremDecls
    (BE : YMEndpointManuscriptCarrierBase)
    (BC : YMConstructiveManuscriptCarrierBase)
    (BV : YMVacuumGapManuscriptCarrierBase) where
  endpoint : YMEndpointDeclBundle BE
  constructive : YMConstructiveDeclBundle BC
  vacuum : YMVacuumDeclBundle BV

def ym_endpoint_decl_bundle_of
    (B : YMEndpointManuscriptCarrierBase)
    (background :
      YMStandardOSWightmanBackground
        (YMEndpointReflectionPositive B /\ YMEndpointOSDataComplete B)
        (YMEndpointVacuumVectorPresent B)
        (YMEndpointWightmanFieldsPresent B)
        (YMEndpointSmearingDefined B)
        (YMEndpointVacuumCorrelationsDefined B)) :
    YMEndpointDeclBundle B :=
  { imported_os_background := background
    hM1 := And.intro (ym_endpoint_reflection_positive_holds B) (ym_endpoint_os_data_complete_holds B)
    hO3 := ym_endpoint_faithful_wilson_universality_holds B
    hO5 := ym_endpoint_exact_local_net_endpoint_holds B }

def ym_constructive_decl_bundle_of
    (B : YMConstructiveManuscriptCarrierBase)
    (h576 : YMConstructive576ExtensionPayload B) :
    YMConstructiveDeclBundle B :=
  { h492 := ym_constructive_flowed_state_ready_holds B
    h569 := ym_constructive_truncation_window_ready_holds B
    h574 := And.intro
      (ym_constructive_positive_bridge_ready_holds B)
      (ym_constructive_finite_cap_extension_package_ready_holds B)
    h576 := h576 }

def ym_vacuum_decl_bundle_of
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumDeclBundle B :=
  { hIII1 := ym_vacuum_ultraviolet_scope_ready_holds B
    hIII3 := ym_vacuum_entrance_ready_holds B
    hIV4 := ym_vacuum_weak_window_certificate_ready_holds B
    hF216 := And.intro
      (ym_vacuum_os_transport_ready_holds B)
      (ym_vacuum_positive_gap_exhibited_holds B)
    hIV1 := ym_vacuum_lattice_gap_input_ready_holds B }

def ym_manuscript_theorem_decls_of
    (BE : YMEndpointManuscriptCarrierBase)
    (BC : YMConstructiveManuscriptCarrierBase)
    (BV : YMVacuumGapManuscriptCarrierBase)
    (background :
      YMStandardOSWightmanBackground
        (YMEndpointReflectionPositive BE /\ YMEndpointOSDataComplete BE)
        (YMEndpointVacuumVectorPresent BE)
        (YMEndpointWightmanFieldsPresent BE)
        (YMEndpointSmearingDefined BE)
        (YMEndpointVacuumCorrelationsDefined BE))
    (h576 : YMConstructive576ExtensionPayload BC) :
    YMManuscriptTheoremDecls BE BC BV :=
  { endpoint := ym_endpoint_decl_bundle_of BE background
    constructive := ym_constructive_decl_bundle_of BC h576
    vacuum := ym_vacuum_decl_bundle_of BV }

end MaleyLean
