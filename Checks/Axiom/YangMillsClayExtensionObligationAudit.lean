import MaleyLean.Papers.YangMills.StandardClayExtensionBackground

namespace MaleyLean
namespace Papers
namespace YangMills

open MinimalConditionsForAdmissibleConstruction

/-- The current GNS bridge root is exactly the bridge field applied to proofs. -/
theorem YangMillsGNSSpectralBridgeCurrentRoot
    {L : LocalNetSolution}
    {C : TheoremScopeCompletion L}
    (B : GNSSpectralBridge L C)
    (hLocal : LocalNetProof L)
    (hCompletion : CompletionProof C) :
    B.subgapSectorIsVacuumRay /\ B.completeTheoryMassGap := by
  exact B.bridge hLocal hCompletion

/--
The current completion admissibility statement unfolds to the five theorem
scope conditions.
-/
theorem YangMillsCompletionAdmissibleUnfolds
    {L : LocalNetSolution}
    (C : TheoremScopeCompletion L) :
    C.admissible <->
      C.scopeFaithful /\
      C.kernelFaithful /\
      C.sameDomain /\
      C.noNewSubgapLocalState /\
      C.noNewSubgapVacuumMultiplicity := by
  rfl

/--
The current sector extension package unfolds to the four sector-layer
conditions.
-/
theorem YangMillsSectorExtensionProofPackageUnfolds
    {L : LocalNetSolution}
    (S : SectorExtension L) :
    S.proofPackage <->
      S.supportClassFixed /\
      S.sectorLayerOverFixedLocalNet /\
      S.localNetUnchanged /\
      S.globalFormRecoveredAtSectorLevel := by
  rfl

#print axioms YangMillsGNSSpectralBridgeCurrentRoot
#print axioms YangMillsCompletionAdmissibleUnfolds
#print axioms YangMillsSectorExtensionProofPackageUnfolds
#print axioms YMClayExtensionAdmissibilityPayload.no_faithful_same_domain_extension
#print axioms YMClayExtensionAdmissibilityPayload.subgap_sector_is_vacuum_ray
#print axioms ClayExtensionAdmissibilityPayloadBridge.closed
#print axioms ClayExtensionHypothesisMap.completeTransferHypotheses
#print axioms ClayExtensionHypothesisMap.fromProofs
#print axioms RouteClayExtensionImport.discharge
#print axioms RouteClayExtensionImport.fromHypothesisMap
#print axioms StandardClayExtensionImport.payload_nonempty
#print axioms StandardClayExtensionImport.payload_bridge_nonempty
#print axioms StandardClayExtensionImport.standard_transfer_nonempty
#print axioms ymClayExtensionAdmissibilityPayload_nonempty_of_standard_import
#print axioms ymClayExtensionAdmissibilityPayloadBridge_nonempty_of_standard_import
#print axioms ymStandardClayExtensionTransfer_nonempty_of_standard_import
#print axioms stemToSternClayEndpoint
#print axioms stemToSternClayEndpointFromRecoveredNativePackage

end YangMills
end Papers
end MaleyLean
