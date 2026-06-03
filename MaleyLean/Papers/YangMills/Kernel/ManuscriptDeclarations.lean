import MaleyLean.Papers.YangMills.Kernel.ManuscriptCarrierBundles
import MaleyLean.Papers.YangMills.Kernel.ManuscriptTheoremBundles

namespace MaleyLean

def ym_default_bounded_base : YMBoundedBase :=
  { carrier := PUnit
    state_on_carrier := fun _ => True }

def ym_default_sharp_local_state : YMSharpLocalState :=
  { algebra := PUnit
    state_on_algebra := fun _ => True
    bounded_base := ym_default_bounded_base
    extends_bounded_base := True }

structure YMManuscriptDeclarations where
  carriers : YMManuscriptCarrierDecls
  endpoint_background :
    YMStandardOSWightmanBackground
      (YMEndpointReflectionPositive carriers.endpoint.toBase /\
        YMEndpointOSDataComplete carriers.endpoint.toBase)
      (YMEndpointVacuumVectorPresent carriers.endpoint.toBase)
      (YMEndpointWightmanFieldsPresent carriers.endpoint.toBase)
      (YMEndpointSmearingDefined carriers.endpoint.toBase)
      (YMEndpointVacuumCorrelationsDefined carriers.endpoint.toBase)
  constructive_h576 :
    YMConstructive576ExtensionPayload carriers.constructive.toBase

noncomputable section

def ym_manuscript_carrier_decls_data : YMManuscriptCarrierDecls :=
  { endpoint :=
      { EndpointEuclideanInput := PUnit
        EndpointReconstructedHilbert := PUnit
        EndpointFieldFamily := PUnit
        EndpointTestFunctionSpace := PUnit
        EndpointSmearedFieldOperator := PUnit
        EndpointVacuumCorrelationFamily := PUnit
        EndpointLocalNet := PUnit
        EndpointVacuumSector := PUnit
        endpoint_smear_field := fun _ _ => PUnit.unit
        endpoint_evaluate_vacuum_correlation := fun _ _ => PUnit.unit
        Omega_loc := PUnit.unit
        phi_star := PUnit.unit
        E_ren := PUnit.unit }
    constructive :=
      { ConstructiveFlowedStateData := PUnit
        ConstructiveFiniteCapWindow := PUnit
        ConstructiveFiniteCapExtensionData := PUnit
        ConstructivePositiveBridgeMap := PUnit
        ConstructiveBoundedBaseCarrier := PUnit
        ConstructiveBoundedStateData := PUnit
        ConstructiveInductiveUnionData := PUnit
        constructive_extend_finite_cap := fun _ _ => PUnit.unit
        constructive_assemble_sharp_local_state := fun _ _ _ => ym_default_sharp_local_state
        constructive_omega_flow := PUnit.unit
        DeltaMax := PUnit.unit
        constructive_finite_cap_bridge := PUnit.unit
        constructive_bounded_base_one := PUnit.unit
        constructive_omega_bd := PUnit.unit
        constructive_omega_sharp := PUnit.unit }
    vacuum :=
      { VacuumTransportState := PUnit
        VacuumLatticeObservableFamily := PUnit
        VacuumTransportMap := PUnit
        VacuumReconstructedSector := PUnit
        VacuumOSSector := PUnit
        VacuumMinkowskiGapFunctional := PUnit
        VacuumOSCorrelationFamily := PUnit
        vacuum_transport_observable := fun _ _ => PUnit.unit
        vacuum_realize_os_sector := fun _ _ => PUnit.unit
        vacuum_evaluate_minkowski_gap := fun _ _ => True
        vacuum_transport := PUnit.unit
        vacuum_H := PUnit.unit
        vacuum_Hloc := PUnit.unit
        vacuum_corr := PUnit.unit
        vacuum_gapf := PUnit.unit
        vacuum_hgap := trivial } }

def ym_endpoint_background_data :
  YMStandardOSWightmanBackground
    (YMEndpointReflectionPositive ym_manuscript_carrier_decls_data.endpoint.toBase /\
      YMEndpointOSDataComplete ym_manuscript_carrier_decls_data.endpoint.toBase)
    (YMEndpointVacuumVectorPresent ym_manuscript_carrier_decls_data.endpoint.toBase)
    (YMEndpointWightmanFieldsPresent ym_manuscript_carrier_decls_data.endpoint.toBase)
    (YMEndpointSmearingDefined ym_manuscript_carrier_decls_data.endpoint.toBase)
    (YMEndpointVacuumCorrelationsDefined ym_manuscript_carrier_decls_data.endpoint.toBase) :=
  { reconstruction_ready := True
    dossier_implies_reconstruction := fun _ => trivial
    reconstruction_exhibits_vacuum := fun _ =>
      ym_endpoint_vacuum_vector_present_holds ym_manuscript_carrier_decls_data.endpoint.toBase
    reconstruction_exhibits_fields := fun _ =>
      ym_endpoint_wightman_fields_present_holds ym_manuscript_carrier_decls_data.endpoint.toBase
    reconstruction_exhibits_smearing := fun _ =>
      ym_endpoint_smearing_defined_holds ym_manuscript_carrier_decls_data.endpoint.toBase
    reconstruction_exhibits_vacuum_correlations := fun _ =>
      ym_endpoint_vacuum_correlations_defined_holds ym_manuscript_carrier_decls_data.endpoint.toBase }

theorem ym_constructive_h576_data :
  YMConstructive576ExtensionPayload ym_manuscript_carrier_decls_data.constructive.toBase := by
  simp [YMConstructive576ExtensionPayload, ym_manuscript_carrier_decls_data, YMConstructiveCarrierDecls.toBase,
    ym_default_sharp_local_state]

def ym_manuscript_declarations : YMManuscriptDeclarations :=
  { carriers := ym_manuscript_carrier_decls_data
    endpoint_background := ym_endpoint_background_data
    constructive_h576 := ym_constructive_h576_data }

abbrev ym_manuscript_carrier_decls : YMManuscriptCarrierDecls :=
  ym_manuscript_declarations.carriers

abbrev ym_manuscript_theorem_decls :
  YMManuscriptTheoremDecls
    ym_manuscript_carrier_decls.endpoint.toBase
    ym_manuscript_carrier_decls.constructive.toBase
    ym_manuscript_carrier_decls.vacuum.toBase :=
  ym_manuscript_theorem_decls_of
    ym_manuscript_carrier_decls.endpoint.toBase
    ym_manuscript_carrier_decls.constructive.toBase
    ym_manuscript_carrier_decls.vacuum.toBase
    ym_manuscript_declarations.endpoint_background
    ym_manuscript_declarations.constructive_h576

abbrev ym_endpoint_carrier_decls : YMEndpointCarrierDecls :=
  ym_manuscript_carrier_decls.endpoint

abbrev ym_constructive_carrier_decls : YMConstructiveCarrierDecls :=
  ym_manuscript_carrier_decls.constructive

abbrev ym_vacuum_carrier_decls : YMVacuumCarrierDecls :=
  ym_manuscript_carrier_decls.vacuum

abbrev ym_endpoint_decl_bundle :
  YMEndpointDeclBundle ym_manuscript_carrier_decls.endpoint.toBase :=
  ym_manuscript_theorem_decls.endpoint

abbrev ym_constructive_decl_bundle :
  YMConstructiveDeclBundle ym_manuscript_carrier_decls.constructive.toBase :=
  ym_manuscript_theorem_decls.constructive

abbrev ym_vacuum_decl_bundle :
  YMVacuumDeclBundle ym_manuscript_carrier_decls.vacuum.toBase :=
  ym_manuscript_theorem_decls.vacuum

end

end MaleyLean
