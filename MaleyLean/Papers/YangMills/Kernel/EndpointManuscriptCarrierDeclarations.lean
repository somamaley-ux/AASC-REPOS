import MaleyLean.Papers.YangMills.Kernel.ManuscriptDeclarations
namespace MaleyLean

noncomputable section

/--
Concrete manuscript-facing endpoint carrier declarations.

These are object-level declarations only: the carrier types, chosen inhabitants,
and basic operations needed to instantiate the endpoint packet's manuscript
base. They do not add any theorem-strengthening proof data.
-/
abbrev EndpointEuclideanInput : Type :=
  ym_endpoint_carrier_decls.EndpointEuclideanInput

abbrev EndpointReconstructedHilbert : Type :=
  ym_endpoint_carrier_decls.EndpointReconstructedHilbert

abbrev EndpointFieldFamily : Type :=
  ym_endpoint_carrier_decls.EndpointFieldFamily

abbrev EndpointTestFunctionSpace : Type :=
  ym_endpoint_carrier_decls.EndpointTestFunctionSpace

abbrev EndpointSmearedFieldOperator : Type :=
  ym_endpoint_carrier_decls.EndpointSmearedFieldOperator

abbrev EndpointVacuumCorrelationFamily : Type :=
  ym_endpoint_carrier_decls.EndpointVacuumCorrelationFamily

abbrev EndpointLocalNet : Type :=
  ym_endpoint_carrier_decls.EndpointLocalNet

abbrev EndpointVacuumSector : Type :=
  ym_endpoint_carrier_decls.EndpointVacuumSector

abbrev endpoint_smear_field :
  EndpointTestFunctionSpace ->
  EndpointFieldFamily ->
  EndpointSmearedFieldOperator :=
  ym_endpoint_carrier_decls.endpoint_smear_field

abbrev endpoint_evaluate_vacuum_correlation :
  EndpointReconstructedHilbert ->
  EndpointSmearedFieldOperator ->
  EndpointVacuumCorrelationFamily :=
  ym_endpoint_carrier_decls.endpoint_evaluate_vacuum_correlation

/-- Reconstructed vacuum vector from the Appendix M reconstruction package. -/
abbrev Omega_loc : EndpointReconstructedHilbert :=
  ym_endpoint_carrier_decls.Omega_loc

/-- Canonical witness test function from the non-triviality witness theorem. -/
abbrev phi_star : EndpointTestFunctionSpace :=
  ym_endpoint_carrier_decls.phi_star

/-- Canonical centered CP-even dimension-4 scalar witness field. -/
abbrev E_ren : EndpointFieldFamily :=
  ym_endpoint_carrier_decls.E_ren

noncomputable def ym_endpoint_manuscript_carrier_base :
  YMEndpointManuscriptCarrierBase :=
  { EndpointEuclideanInput := EndpointEuclideanInput
    EndpointReconstructedHilbert := EndpointReconstructedHilbert
    EndpointFieldFamily := EndpointFieldFamily
    EndpointTestFunctionSpace := EndpointTestFunctionSpace
    EndpointSmearedFieldOperator := EndpointSmearedFieldOperator
    EndpointVacuumCorrelationFamily := EndpointVacuumCorrelationFamily
    EndpointLocalNet := EndpointLocalNet
    EndpointVacuumSector := EndpointVacuumSector
    smear_field := endpoint_smear_field
    evaluate_vacuum_correlation := endpoint_evaluate_vacuum_correlation
    Omega_loc := Omega_loc
    phi_star := phi_star
    E_ren := E_ren }

theorem ym_endpoint_manuscript_carrier_base_named_outputs :
  ym_endpoint_manuscript_carrier_base.Omega_loc = Omega_loc /\
  ym_endpoint_manuscript_carrier_base.phi_star = phi_star /\
  ym_endpoint_manuscript_carrier_base.E_ren = E_ren := by
  exact ⟨rfl, rfl, rfl⟩

end

end MaleyLean
