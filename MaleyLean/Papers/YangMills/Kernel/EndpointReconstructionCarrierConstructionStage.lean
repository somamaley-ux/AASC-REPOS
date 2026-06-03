import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticBundle

namespace MaleyLean

/-- Primitive carrier-side reconstruction stage for the endpoint heart. -/
structure YMEndpointReconstructionCarrierConstructionStage (R : YMEndpointCore) where
  bundle : YMEndpointSemanticBundle R
  source_dossier := bundle.reconstruction_source_dossier
  constructed_reconstructed_hilbert := bundle.reconstructed_hilbert
  constructed_field_family := bundle.field_family
  constructed_vacuum_vector := bundle.vacuum_vector
  dossier_origin :
    source_dossier = R.reconstruction_package.from_dossier
  hilbert_construction :
    constructed_reconstructed_hilbert = R.reconstruction_package.reconstructed_hilbert
  field_construction :
    constructed_field_family = R.reconstruction_package.field_family
  vacuum_construction :
    constructed_vacuum_vector = R.reconstruction_package.vacuum_vector

def YangMillsEndpointReconstructionCarrierConstructionStageData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointReconstructionCarrierConstructionStage R := by
  let B := YangMillsEndpointSemanticBundleData R hE hP
  exact
    { bundle := B
      dossier_origin := rfl
      hilbert_construction := rfl
      field_construction := rfl
      vacuum_construction := rfl }

theorem YangMillsEndpointReconstructionCarrierConstructionStageExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  Nonempty (YMEndpointReconstructionCarrierConstructionStage R) /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).source_dossier =
    R.reconstruction_package.from_dossier) /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).constructed_reconstructed_hilbert =
    R.reconstruction_package.reconstructed_hilbert) /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).constructed_field_family =
    R.reconstruction_package.field_family) /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).constructed_vacuum_vector =
    R.reconstruction_package.vacuum_vector) := by
  let T := YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP
  exact
    And.intro (Nonempty.intro T) <|
      And.intro T.dossier_origin <|
        And.intro T.hilbert_construction <|
          And.intro T.field_construction T.vacuum_construction

end MaleyLean
