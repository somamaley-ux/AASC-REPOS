import MaleyLean.Papers.YangMills.Kernel.EndpointCore
import MaleyLean.Papers.YangMills.Kernel.StandardOSWightmanBackground

namespace MaleyLean

/--
The current endpoint reconstruction root is a projection through the endpoint
core field `dossier_yields_reconstruction`.
-/
theorem YangMillsOSWightmanReconstructionCurrentRoot
    (RE : YMEndpointCore)
    (hE : RE.euclidean_dossier_ready) :
    RE.reconstruction_ready := by
  exact RE.dossier_yields_reconstruction hE

/--
The current Wightman field outputs are projections from reconstruction
readiness through the endpoint core.
-/
theorem YangMillsOSWightmanFieldOutputsCurrentRoot
    (RE : YMEndpointCore)
    (hR : RE.reconstruction_ready) :
    RE.reconstruction_package.wightman_fields_present /\
    RE.reconstruction_package.vacuum_vector_present /\
    RE.reconstruction_package.smearing_defined /\
    RE.reconstruction_package.vacuum_correlations_defined := by
  exact YangMillsEndpointReconstructionPackageStatement RE hR

/--
The standard OS/Wightman background object itself is axiom-free packaging:
applying its reconstruction implication exposes the reconstruction proposition
for the configured dossier.
-/
theorem YangMillsStandardOSWightmanBackgroundDischargesReconstruction
    {dossier_ready : Prop}
    {vacuum_vector_present : Prop}
    {wightman_fields_present : Prop}
    {smearing_defined : Prop}
    {vacuum_correlations_defined : Prop}
    (B :
      YMStandardOSWightmanBackground
        dossier_ready
        vacuum_vector_present
        wightman_fields_present
        smearing_defined
        vacuum_correlations_defined)
    (hD : dossier_ready) :
    B.reconstruction_ready := by
  exact B.dossier_implies_reconstruction hD

#print axioms YangMillsOSWightmanReconstructionCurrentRoot
#print axioms YangMillsOSWightmanFieldOutputsCurrentRoot
#print axioms YangMillsStandardOSWightmanBackgroundDischargesReconstruction
#print axioms Papers.YangMills.YMOSWightmanReconstructionPayload.closed
#print axioms YMOSWightmanReconstructionPayloadBridge.reconstruction_ready
#print axioms YMOSWightmanReconstructionPayloadBridge.outputs
#print axioms YMStandardOSWightmanReconstructionImport.payload_nonempty
#print axioms YMStandardOSWightmanReconstructionImport.payload_bridge_nonempty
#print axioms YMStandardOSWightmanReconstructionImport.standard_background_nonempty
#print axioms ymOSWightmanReconstructionPayload_nonempty_of_standard_import
#print axioms ymOSWightmanReconstructionPayloadBridge_nonempty_of_standard_import
#print axioms ymOSWightmanStandardBackground_nonempty_of_standard_import

end MaleyLean
