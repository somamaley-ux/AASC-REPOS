import MaleyLean.Papers.YangMills.Extension.EndpointAdmissibilityFormalization
import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticBundle
import MaleyLean.Papers.YangMills.Kernel.CanonicalCoreOutputAssembly
import MaleyLean.Papers.YangMills.Kernel.ClosedInstantiatedManuscript

namespace MaleyLean

/--
Concrete upstream side-condition package extracted from the existing Yang--Mills
proof home.

This isolates a genuinely concrete fragment of the endpoint assumptions used by
the extension manuscript: a vacuum-gap route with its weak-window witness, an
endpoint core with its dossier and endpoint-packet witnesses, the resulting
semantic bundles, and the exact-endpoint witness already exposed upstream.
-/
structure YMConcreteEndpointSideConditions where
  RD : YMVacuumGapRoute
  RE : YMEndpointCore
  hww : RD.weak_window_certificate_ready
  hE : RE.euclidean_dossier_ready
  hP : RE.endpoint_packet_ready

namespace YMConcreteEndpointSideConditions

/-- Concrete predecessor reconstruction-side semantic bundle. -/
def reconstructionBundle (W : YMConcreteEndpointSideConditions) :
    YMVacuumGapSemanticBundle W.RD :=
  YangMillsVacuumGapSemanticBundleData W.RD W.hww

/-- Concrete predecessor endpoint-side semantic bundle. -/
def endpointBundle (W : YMConcreteEndpointSideConditions) :
    YMEndpointSemanticBundle W.RE :=
  YangMillsEndpointSemanticBundleData W.RE W.hE W.hP

/-- Concrete exact-endpoint witness already available from the endpoint bundle. -/
def exactEndpointWitness (W : YMConcreteEndpointSideConditions) :
    W.RE.endpoint_object.exact_local_net_endpoint :=
  (endpointBundle W).exact_endpoint

/--
Concrete conjunction of the upstream side conditions surfaced by this package.
-/
def statement (W : YMConcreteEndpointSideConditions) : Prop :=
  Nonempty (YMVacuumGapSemanticBundle W.RD) /\
  Nonempty (YMEndpointSemanticBundle W.RE) /\
  W.RE.endpoint_object.exact_local_net_endpoint /\
  ym_verbatim_theorem_owner
      .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
    .reconstructionAndUniversality

theorem predecessorReconstructionPackageHolds
    (W : YMConcreteEndpointSideConditions) :
    Nonempty (YMVacuumGapSemanticBundle W.RD) := by
  exact YangMillsVacuumGapSemanticBundleExistsStatement W.RD W.hww

theorem predecessorEndpointPackageHolds
    (W : YMConcreteEndpointSideConditions) :
    Nonempty (YMEndpointSemanticBundle W.RE) := by
  exact YangMillsEndpointSemanticBundleExistsStatement W.RE W.hE W.hP

theorem exactEndpointWitnessHolds
    (W : YMConcreteEndpointSideConditions) :
    W.RE.endpoint_object.exact_local_net_endpoint := by
  exact exactEndpointWitness W

theorem exactEndpointExclusionOwnerHolds
    (_W : YMConcreteEndpointSideConditions) :
    ym_verbatim_theorem_owner
        .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
      .reconstructionAndUniversality := by
  exact YangMillsExactLocalEndpointAndExtendedSupportExclusionRegisterStatement

theorem concreteStatementHolds
    (W : YMConcreteEndpointSideConditions) :
    statement W := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact predecessorReconstructionPackageHolds W
  · exact predecessorEndpointPackageHolds W
  · exact exactEndpointWitnessHolds W
  · exact exactEndpointExclusionOwnerHolds W

end YMConcreteEndpointSideConditions

/--
Export theorem for the concrete side-condition package.
-/
theorem YangMillsConcreteEndpointSideConditionsStatement
    (W : YMConcreteEndpointSideConditions) :
    YMConcreteEndpointSideConditions.statement W := by
  exact YMConcreteEndpointSideConditions.concreteStatementHolds W

/--
Canonical concrete endpoint side-condition package extracted from a closed
instantiated manuscript object already present in the repository.

This removes one layer of duplication between the manuscript-facing endpoint
route and the upstream Yang--Mills witness bundle: the Section 8 concrete
side-condition package can be recovered directly from `I`.
-/
def YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript
    (I : YMClosedInstantiatedManuscript) :
    YMConcreteEndpointSideConditions where
  RD := I.blueprint.objects.RD
  RE := I.blueprint.objects.RE
  hww := I.blueprint.witnesses.hww
  hE := I.blueprint.witnesses.hE
  hP := I.blueprint.witnesses.hP

/--
Concrete side-condition statement recovered directly from the closed
instantiated manuscript object.
-/
theorem YangMillsConcreteEndpointSideConditionsStatementOfClosedInstantiatedManuscript
    (I : YMClosedInstantiatedManuscript) :
    YMConcreteEndpointSideConditions.statement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) := by
  exact
    YangMillsConcreteEndpointSideConditionsStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)

namespace YMConcreteEndpointSideConditions

/--
Smaller boundary-facing statement consisting only of the concrete exact
local-endpoint witness together with the theorem-register ownership fact for the
exact-endpoint / extended-support exclusion theorem.
-/
def endpointBoundaryStatement (W : YMConcreteEndpointSideConditions) : Prop :=
  W.RE.endpoint_object.exact_local_net_endpoint /\
  ym_verbatim_theorem_owner
      .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
    .reconstructionAndUniversality

theorem endpointBoundaryStatementHolds
    (W : YMConcreteEndpointSideConditions) :
    endpointBoundaryStatement W := by
  refine ⟨?_, ?_⟩
  · exact exactEndpointWitnessHolds W
  · exact exactEndpointExclusionOwnerHolds W

end YMConcreteEndpointSideConditions

/--
Export theorem for the smaller concrete endpoint-boundary statement.
-/
theorem YangMillsConcreteEndpointBoundaryStatement
    (W : YMConcreteEndpointSideConditions) :
    YMConcreteEndpointSideConditions.endpointBoundaryStatement W := by
  exact YMConcreteEndpointSideConditions.endpointBoundaryStatementHolds W

/--
Concrete endpoint-boundary statement recovered directly from the closed
instantiated manuscript object.
-/
theorem YangMillsConcreteEndpointBoundaryStatementOfClosedInstantiatedManuscript
    (I : YMClosedInstantiatedManuscript) :
    YMConcreteEndpointSideConditions.endpointBoundaryStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) := by
  exact
    YangMillsConcreteEndpointBoundaryStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)

namespace YMConcreteEndpointSideConditions

/--
Projection from the smaller concrete endpoint-boundary statement to the exact
local-endpoint witness.
-/
theorem exactEndpointWitness_of_endpointBoundaryStatement
    {W : YMConcreteEndpointSideConditions}
    (hB : endpointBoundaryStatement W) :
    W.RE.endpoint_object.exact_local_net_endpoint := by
  exact hB.1

/--
Projection from the smaller concrete endpoint-boundary statement to the theorem
register ownership fact for the exact-endpoint / extended-support exclusion
theorem.
-/
theorem exclusionOwner_of_endpointBoundaryStatement
    {W : YMConcreteEndpointSideConditions}
    (hB : endpointBoundaryStatement W) :
    ym_verbatim_theorem_owner
        .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
      .reconstructionAndUniversality := by
  exact hB.2

/--
Projection from the full concrete side-condition statement to the smaller
endpoint-boundary statement.
-/
theorem endpointBoundaryStatement_of_statement
    {W : YMConcreteEndpointSideConditions}
    (hS : statement W) :
    endpointBoundaryStatement W := by
  exact ⟨hS.2.2.1, hS.2.2.2⟩

end YMConcreteEndpointSideConditions

end MaleyLean
