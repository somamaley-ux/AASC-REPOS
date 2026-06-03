import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteRoute1EndpointProjection
import MaleyLean.Papers.YangMills.Kernel.EndpointNativeProofHomes

namespace MaleyLean

/--
Source-specific name for the concrete endpoint-boundary statement recovered
from the endpoint native proof-home layer.
-/
abbrev ym_concrete_endpoint_boundary_from_endpoint_native_proof_homes_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  YMConcreteEndpointSideConditions.endpointBoundaryStatement
    (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)

/--
Source-specific name for the smaller Route 1 endpoint second seam recovered
from the endpoint native proof-home layer together with the QE3 transport/gap
payload.
-/
abbrev ym_concrete_route1_endpoint_second_seam_from_endpoint_native_proof_homes_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_route1_endpoint_second_seam_statement I

/--
Source-specific name for the sharper paper-shaped Route 1 endpoint second seam
recovered from the endpoint native proof-home layer together with the QE3
transport/gap payload.
-/
abbrev ym_concrete_route1_endpoint_paper_second_seam_from_endpoint_native_proof_homes_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_route1_endpoint_paper_second_seam_statement I

/--
Concrete endpoint proof-home package recovered directly from the closed
instantiated manuscript object.

This is the endpoint-side analogue of the QE3 proof-home projections: it
exposes the exact endpoint witness and the `O.2 / O.3 / O.5` theorem content
from the native endpoint proof-home layer itself, rather than only through the
larger Route 1 endpoint package.
-/
theorem YangMillsConcreteEndpointNativeProofHomesStatement
    (I : YMClosedInstantiatedManuscript) :
    let O := I.blueprint.objects
    Nonempty (YMEndpointNativeProofHomes O.RE) /\
      O.RE.endpoint_object.exact_local_net_endpoint /\
      ym_faithful_wilson_universality_hypotheses_statement O.RE /\
      ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement O.RE /\
      ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement O.RE := by
  let O := I.blueprint.objects
  let W := I.blueprint.witnesses
  have h :=
    YangMillsEndpointNativeProofHomesExportStatement
      O.RE W.hE W.hP
      (ym_Omega_loc I) (ym_phi_star I) (ym_E_ren I)
  dsimp [O] at h
  rcases h with
    ⟨hPkg, _hM3, _hM4, _hO2lbl, _hO3lbl, _hO5lbl, _hRw, _hWw, _hVw, _hEw,
      _hRecon, _hFields, _hVac, _hSmear, _hCorr, hExact, hO2, hO3, hO5, _hLaw⟩
  exact ⟨hPkg, hExact, hO2, hO3, hO5⟩

/--
The endpoint native proof-home layer already supplies the concrete exact local
endpoint witness.
-/
theorem YangMillsConcreteExactEndpointFromEndpointNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    I.blueprint.objects.RE.endpoint_object.exact_local_net_endpoint := by
  exact (YangMillsConcreteEndpointNativeProofHomesStatement I).2.1

/--
At the live theorem level, the proof-home recovery of the exact endpoint
witness agrees exactly with the corresponding recovery from the larger Route 1
endpoint package.
-/
theorem YangMillsConcreteExactEndpointFromEndpointNativeProofHomes_eq_fromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteExactEndpointFromEndpointNativeProofHomes I =
      YangMillsConcreteExactEndpointFromRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
The endpoint native proof-home layer also supplies the manuscript's `O.5`
endpoint exclusion theorem statement directly.
-/
theorem YangMillsConcreteExactEndpointExclusionStatementFromEndpointNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
      I.blueprint.objects.RE := by
  exact (YangMillsConcreteEndpointNativeProofHomesStatement I).2.2.2.2

/--
At the live theorem level, the proof-home recovery of the manuscript's `O.5`
endpoint-exclusion statement agrees exactly with the corresponding recovery
from the larger Route 1 endpoint package.
-/
theorem YangMillsConcreteExactEndpointExclusionStatementFromEndpointNativeProofHomes_eq_fromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteExactEndpointExclusionStatementFromEndpointNativeProofHomes I =
      YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
Accordingly, the endpoint native proof-home layer feeds the smaller concrete
endpoint-boundary statement used by the Section 8 bridge.
-/
theorem YangMillsConcreteEndpointBoundaryFromEndpointNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    YMConcreteEndpointSideConditions.endpointBoundaryStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) := by
  refine ⟨?_, ?_⟩
  · exact YangMillsConcreteExactEndpointFromEndpointNativeProofHomes I
  · exact
      YMConcreteEndpointSideConditions.exactEndpointExclusionOwnerHolds
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)

/--
At the live theorem level, the proof-home recovery of the endpoint-boundary
statement agrees exactly with the corresponding recovery from the larger
Route 1 endpoint package.
-/
theorem YangMillsConcreteEndpointBoundaryFromEndpointNativeProofHomes_eq_fromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteEndpointBoundaryFromEndpointNativeProofHomes I =
      YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
Combining the QE3 transport/gap export with the endpoint native proof-home
boundary data already recovers the smaller manuscript-facing Route 1 endpoint
second seam.
-/
theorem YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_route1_endpoint_second_seam_statement I := by
  exact
    ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
      YangMillsConcreteEndpointBoundaryFromEndpointNativeProofHomes I⟩

/--
And pairing the same transport/gap data with the `O.5` theorem content from
the endpoint native proof-home layer recovers the sharper paper-shaped Route 1
endpoint second seam as well.
-/
theorem YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_route1_endpoint_paper_second_seam_statement I := by
  exact
    ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
      YangMillsConcreteEndpointBoundaryFromEndpointNativeProofHomes I,
      YangMillsConcreteExactEndpointExclusionStatementFromEndpointNativeProofHomes I⟩

/--
At the endpoint-boundary level, the larger Route 1 endpoint package and the
endpoint native proof-home layer recover the same concrete boundary statement.
-/
theorem YangMillsConcreteEndpointBoundaryRoute1PackageIffEndpointNativeProofHomes
    (I : YMClosedInstantiatedManuscript) :
    YMConcreteEndpointSideConditions.endpointBoundaryStatement
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) ↔
      ym_concrete_endpoint_boundary_from_endpoint_native_proof_homes_statement I := by
  constructor <;> intro h <;> exact h

/--
Accordingly, the smaller Route 1 endpoint second seam recovered from the
endpoint native proof-home layer is logically equivalent to the one recovered
from the larger Route 1 endpoint package.
-/
theorem YangMillsConcreteRoute1EndpointSecondSeamFromEndpointNativeProofHomesIffRoute1Package
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_route1_endpoint_second_seam_statement I ↔
      ym_concrete_route1_endpoint_second_seam_from_endpoint_native_proof_homes_statement I := by
  constructor <;> intro h <;> exact h

/--
At the live theorem level, the proof-home recovery of the smaller Route 1
endpoint second seam agrees exactly with the proof rebuilt from its own
transport/gap and endpoint-boundary ingredients.
-/
theorem YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes I =
      ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
        YangMillsConcreteEndpointBoundaryFromEndpointNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the proof-home recovery of the smaller Route 1
endpoint second seam agrees exactly with the corresponding recovery from the
larger Route 1 endpoint package.
-/
theorem YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes_eq_fromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes I =
      YangMillsConcreteRoute1EndpointSecondSeamStatement I := by
  exact Subsingleton.elim _ _

/--
The same exactness holds for the sharper paper-shaped Route 1 endpoint second
seam as well.
-/
theorem YangMillsConcreteRoute1EndpointPaperSecondSeamFromEndpointNativeProofHomesIffRoute1Package
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_route1_endpoint_paper_second_seam_statement I ↔
      ym_concrete_route1_endpoint_paper_second_seam_from_endpoint_native_proof_homes_statement I := by
  constructor <;> intro h <;> exact h

/--
At the live theorem level, the proof-home recovery of the sharper paper-shaped
Route 1 endpoint second seam agrees exactly with the proof rebuilt from its
own transport/gap, endpoint-boundary, and `O.5` ingredients.
-/
theorem YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes I =
      ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
        YangMillsConcreteEndpointBoundaryFromEndpointNativeProofHomes I,
        YangMillsConcreteExactEndpointExclusionStatementFromEndpointNativeProofHomes I⟩ := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the proof-home recovery of the sharper paper-shaped
Route 1 endpoint second seam agrees exactly with the corresponding recovery
from the larger Route 1 endpoint package.
-/
theorem YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes_eq_fromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes I =
      YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I := by
  exact Subsingleton.elim _ _

end MaleyLean
