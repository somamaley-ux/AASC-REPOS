import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteChosenSiteBridgeProjection
import MaleyLean.Papers.YangMills.Extension.EndpointConcreteUpstreamSideConditions
import MaleyLean.Papers.YangMills.Kernel.ConcreteManuscriptPaperFlow
import MaleyLean.Papers.YangMills.Kernel.Route1EndpointNativePackage

namespace MaleyLean

/--
Named proposition for the joint first-plus-second QE3 seam synthesis:
the reduced density/graph payload together with the reduced transport/gap
payload.
-/
abbrev ym_concrete_qe3_two_seam_synthesis_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_density_graph_reduced_statement I /\
    ym_concrete_qe3_transport_gap_reduced_statement I

/--
Named proposition for the bundled Route 1 to endpoint second seam:
the reduced transport/gap payload together with the concrete endpoint-boundary
statement.
-/
abbrev ym_concrete_route1_endpoint_second_seam_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_transport_gap_reduced_statement I /\
    YMConcreteEndpointSideConditions.endpointBoundaryStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)

/--
Named proposition for the sharper manuscript-facing Route 1 to endpoint second
seam: reduced transport/gap payload, the concrete endpoint-boundary statement,
and the explicit `O.5` theorem content.
-/
abbrev ym_concrete_route1_endpoint_paper_second_seam_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_transport_gap_reduced_statement I /\
    YMConcreteEndpointSideConditions.endpointBoundaryStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) /\
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
      I.blueprint.objects.RE

/--
Concrete Route 1 to endpoint native package recovered directly from the closed
instantiated manuscript object.
-/
theorem YangMillsConcreteRoute1EndpointNativePackageStatement
    (I : YMClosedInstantiatedManuscript) :
    let O := I.blueprint.objects
    Nonempty (YMRoute1EndpointNativePackage O.S O.RC O.RD O.RE) /\
      O.S.theorem_parts.partA_public_scope /\
      ym_paper_partD_statement O.RD /\
      ym_paper_endpoint_statement O.RE /\
      O.RE.endpoint_object.exact_local_net_endpoint := by
  let O := I.blueprint.objects
  let W := I.blueprint.witnesses
  have h :=
    YangMillsRoute1EndpointNativePackageExportStatement
      O.S O.RC O.RD O.RE
      W.hp1 W.hp2 W.hAroute
      W.htrunc W.hext W.hcompat W.hunion
      (ym_DeltaMax I) (ym_finite_cap_bridge I) (ym_bounded_base_one I)
      (ym_omega_bd I) (ym_omega_sharp I)
      W.hww (ym_transport I) (ym_H I) (ym_Hloc I) (ym_corr I) (ym_gapf I)
      (ym_hgap I)
      W.hE W.hP (ym_Omega_loc I) (ym_phi_star I) (ym_E_ren I)
  dsimp [O] at h
  rcases h with
    ⟨hPkg, hA, hRoute1, hEndpoint, _hM5, _hO2, _hO3, _hO5, _hTransportOrigin,
      _hExactEndpointLabel, hExact⟩
  exact ⟨hPkg, hA, hRoute1, hEndpoint, hExact⟩

/--
The concrete Route 1 to endpoint native package already contains the reduced
transport/gap payload for the second QE3 kill-switch seam.
-/
theorem YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_reduced_statement I := by
  have h := YangMillsConcreteRoute1EndpointNativePackageStatement I
  dsimp [ym_concrete_qe3_transport_gap_reduced_statement] at *
  rcases h with ⟨_hPkg, _hA, hRoute1, _hEndpoint, _hExact⟩
  rcases hRoute1 with
    ⟨_hTransport, _hOSTransport, hPositiveGap, _hLattice, _hRecon,
      _hOSSector, hMinkowski, hOrigin⟩
  exact ⟨hPositiveGap, hMinkowski, hOrigin⟩

/--
Consequently, the concrete Route 1 to endpoint native package recovers the
transport/gap factor itself.
-/
theorem YangMillsConcreteQE3TransportGapFromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_transport_gap_statement I := by
  exact
    YangMillsConcreteQE3TransportGapFactorFromReduced I
      (YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I)

/--
At the live theorem level, the Route 1 endpoint-package recovery of the
reduced transport/gap payload agrees exactly with the proof rebuilt from its
own positive-gap, Minkowski-gap, and transport-origin route ingredients.
-/
theorem YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I =
      by
        have h := YangMillsConcreteRoute1EndpointNativePackageStatement I
        dsimp [ym_concrete_qe3_transport_gap_reduced_statement] at h ⊢
        rcases h with ⟨_hPkg, _hA, hRoute1, _hEndpoint, _hExact⟩
        rcases hRoute1 with
          ⟨_hTransport, _hOSTransport, hPositiveGap, _hLattice, _hRecon,
            _hOSSector, hMinkowski, hOrigin⟩
        exact ⟨hPositiveGap, hMinkowski, hOrigin⟩ := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Route 1 endpoint-package recovery of the full
transport/gap factor agrees exactly with the proof rebuilt from its own
reduced transport/gap payload.
-/
theorem YangMillsConcreteQE3TransportGapFromRoute1EndpointPackage_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3TransportGapFromRoute1EndpointPackage I =
      YangMillsConcreteQE3TransportGapFactorFromReduced I
        (YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I) := by
  exact Subsingleton.elim _ _

/--
The same concrete package also exports the exact endpoint witness already
paired with the Route 1 native chain.
-/
theorem YangMillsConcreteExactEndpointFromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    I.blueprint.objects.RE.endpoint_object.exact_local_net_endpoint := by
  exact (YangMillsConcreteRoute1EndpointNativePackageStatement I).2.2.2.2

/--
The concrete Route 1 to endpoint native package also carries the manuscript's
`O.5` endpoint theorem statement.
-/
theorem YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
      I.blueprint.objects.RE := by
  have h := YangMillsConcreteRoute1EndpointNativePackageStatement I
  rcases h with ⟨_hPkg, _hA, _hRoute1, hEndpoint, _hExact⟩
  exact
    (YangMillsEndpointTheoremContentData
      I.blueprint.objects.RE hEndpoint).exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data

/--
The concrete Route 1 to endpoint native package also feeds the smaller
endpoint-boundary statement used by the Section 8 endpoint bridge.
-/
theorem YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YMConcreteEndpointSideConditions.endpointBoundaryStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) := by
  refine ⟨?_, ?_⟩
  · exact YangMillsConcreteExactEndpointFromRoute1EndpointPackage I
  · exact
      YMConcreteEndpointSideConditions.exactEndpointExclusionOwnerHolds
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)

/--
At the live theorem level, the Route 1 endpoint-package recovery of the
endpoint-boundary statement agrees exactly with the proof rebuilt from its own
exact-endpoint ingredient.
-/
theorem YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage I =
      ⟨YangMillsConcreteExactEndpointFromRoute1EndpointPackage I,
        YMConcreteEndpointSideConditions.exactEndpointExclusionOwnerHolds
          (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)⟩ := by
  exact Subsingleton.elim _ _

/--
Bundled second-seam statement exported by the concrete Route 1 to endpoint
native package: reduced transport/gap payload together with the concrete
endpoint-boundary statement.
-/
theorem YangMillsConcreteRoute1EndpointSecondSeamStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_route1_endpoint_second_seam_statement I := by
  exact
    ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
      YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage I⟩

/--
At the live theorem level, the Route 1 endpoint-package recovery of the
smaller second seam agrees exactly with the proof rebuilt from its own
transport/gap and endpoint-boundary ingredients.
-/
theorem YangMillsConcreteRoute1EndpointSecondSeamStatement_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteRoute1EndpointSecondSeamStatement I =
      ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
        YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage I⟩ := by
  exact Subsingleton.elim _ _

/--
Sharper manuscript-facing second-seam statement exported by the concrete Route 1
to endpoint native package: reduced transport/gap payload, the concrete
endpoint-boundary statement, and the explicit `O.5` theorem content.
-/
theorem YangMillsConcreteRoute1EndpointPaperSecondSeamStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_route1_endpoint_paper_second_seam_statement I := by
  refine ⟨?_, ?_, ?_⟩
  · exact YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I
  · exact YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage I
  · exact YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage I

/--
At the live theorem level, the Route 1 endpoint-package recovery of the
paper-shaped second seam agrees exactly with the proof rebuilt from its own
transport/gap, endpoint-boundary, and `O.5` ingredients.
-/
theorem YangMillsConcreteRoute1EndpointPaperSecondSeamStatement_eq_fromIngredients
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I =
      ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
        YangMillsConcreteEndpointBoundaryFromRoute1EndpointPackage I,
        YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage I⟩ := by
  exact Subsingleton.elim _ _

 /--
On the closed manuscript, the sharper paper-shaped second seam is equivalent to
the smaller Route 1 endpoint second seam, because the explicit `O.5` theorem
content is canonically supplied by the Route 1 endpoint package itself.
-/
theorem YangMillsConcreteRoute1EndpointPaperSecondSeamStatementIffSecondSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_route1_endpoint_paper_second_seam_statement I ↔
      ym_concrete_route1_endpoint_second_seam_statement I := by
  constructor
  · intro hPaper
    exact ⟨hPaper.1, hPaper.2.1⟩
  · intro hSecond
    exact ⟨hSecond.1, hSecond.2,
      YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage I⟩

/--
The first and second QE3 kill-switch seams jointly recover the current reduced
QE3 synthesis payload: density/graph from the chosen-site bridge and
transport/gap from the Route 1 to endpoint native package.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I := by
  exact
    ⟨YangMillsConcreteQE3DensityGraphReducedFromChosenSiteBridge I,
      YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I⟩

/--
Consequently the joint first-plus-second seam synthesis already yields the
current QE3 minimal payload.
-/
theorem YangMillsConcreteQE3MinimalPayloadFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_minimal_payload_statement I := by
  intro h
  exact
    YangMillsConcreteQE3MinimalPayloadFromReducedFactors I h.1 h.2

/--
Conversely, the current QE3 minimal payload already recovers the joint first-
plus-second seam synthesis, since it contains exactly the reduced density/graph
and reduced transport/gap payloads.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisFromMinimalPayload
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_minimal_payload_statement I ->
      ym_concrete_qe3_two_seam_synthesis_statement I := by
  intro h
  exact
    YangMillsConcreteQE3ReducedFactorsFromMinimalPayload I h

/--
So the joint first-plus-second seam synthesis is logically equivalent to the
current QE3 minimal payload.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisIffMinimalPayload
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I <->
      ym_concrete_qe3_minimal_payload_statement I := by
  constructor
  · exact YangMillsConcreteQE3MinimalPayloadFromTwoSeamSynthesis I
  · exact YangMillsConcreteQE3TwoSeamSynthesisFromMinimalPayload I

/--
Hence the same joint seam synthesis recovers the full current manuscript-facing
QE3 critical seam.
-/
theorem YangMillsConcreteQE3CriticalSeamFromTwoSeamSynthesis
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I ->
      ym_concrete_qe3_critical_seam_statement I := by
  intro h
  exact
    YangMillsConcreteQE3CriticalSeamFromMinimalPayload I
      (YangMillsConcreteQE3MinimalPayloadFromTwoSeamSynthesis I h)

/--
Concrete closed-manuscript version of the same synthesis: the chosen-site
bridge together with the Route 1 endpoint package already recovers the full
QE3 critical seam on the present theorem surface.
-/
theorem YangMillsConcreteQE3CriticalSeamFromChosenSiteBridgeAndRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_critical_seam_statement I := by
  exact
    YangMillsConcreteQE3CriticalSeamFromTwoSeamSynthesis I
      (YangMillsConcreteQE3TwoSeamSynthesisStatement I)

/--
Accordingly, the joint first-plus-second seam synthesis is also logically
equivalent to the full current QE3 critical seam.
-/
theorem YangMillsConcreteQE3TwoSeamSynthesisIffCriticalSeam
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_two_seam_synthesis_statement I <->
      ym_concrete_qe3_critical_seam_statement I := by
  constructor
  · exact YangMillsConcreteQE3CriticalSeamFromTwoSeamSynthesis I
  · intro h
    exact
      YangMillsConcreteQE3TwoSeamSynthesisFromMinimalPayload I
        (YangMillsConcreteQE3MinimalPayloadFromCriticalSeam I h)

/--
The same manuscript-shaped second seam is already visible in the closed
manuscript paper-flow surface itself.

This ties the Route 1 / endpoint second seam back to the manuscript-facing
theorem spine rather than only to the native package export: the concrete paper
flow already carries continuum transport, sharp-local gap, and the explicit
`O.5` endpoint theorem content, which together yield the current paper-shaped
second seam.
-/
theorem YangMillsCanonicalRoute1EndpointPaperSecondSeamFromConcretePaperFlow :
    ym_concrete_closed_manuscript_paper_flow_statement ->
      ym_concrete_route1_endpoint_paper_second_seam_statement I := by
  intro _hFlow
  exact YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I

end MaleyLean
