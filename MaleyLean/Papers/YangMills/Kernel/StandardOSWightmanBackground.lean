import MaleyLean.Papers.YangMills.Kernel.OSWightmanReconstructionPayload

namespace MaleyLean

/--
Standard imported OS/Wightman background used by the endpoint packet.

This is not manuscript-specific Yang--Mills mathematics. It isolates the
background reconstruction/analytic-continuation/uniqueness machinery that the
paper cites as imported standard input.
-/
structure YMStandardOSWightmanBackground
    (dossier_ready : Prop)
    (vacuum_vector_present : Prop)
    (wightman_fields_present : Prop)
    (smearing_defined : Prop)
    (vacuum_correlations_defined : Prop) where
  reconstruction_ready : Prop
  dossier_implies_reconstruction :
    dossier_ready -> reconstruction_ready
  reconstruction_exhibits_vacuum :
    reconstruction_ready -> vacuum_vector_present
  reconstruction_exhibits_fields :
    reconstruction_ready -> wightman_fields_present
  reconstruction_exhibits_smearing :
    reconstruction_ready -> smearing_defined
  reconstruction_exhibits_vacuum_correlations :
    reconstruction_ready -> vacuum_correlations_defined

/--
Bridge from an explicit OS/Wightman reconstruction payload to the existing
standard-background theorem object.
-/
structure YMOSWightmanReconstructionPayloadBridge
    (dossier_ready : Prop)
    (vacuum_vector_present : Prop)
    (wightman_fields_present : Prop)
    (smearing_defined : Prop)
    (vacuum_correlations_defined : Prop) where
  payload : Papers.YangMills.YMOSWightmanReconstructionPayload
  background :
    YMStandardOSWightmanBackground
      dossier_ready
      vacuum_vector_present
      wightman_fields_present
      smearing_defined
      vacuum_correlations_defined
  reconstruction_from_payload :
    payload.os_reconstruction.reconstruction_ready ->
      background.reconstruction_ready
  vacuum_from_payload :
    payload.wightman_fields.vacuum_vector_present ->
      vacuum_vector_present
  fields_from_payload :
    payload.wightman_fields.wightman_fields_present ->
      wightman_fields_present
  smearing_from_payload :
    payload.wightman_fields.smearing_defined ->
      smearing_defined
  correlations_from_payload :
    payload.wightman_fields.vacuum_correlations_defined ->
      vacuum_correlations_defined

theorem YMOSWightmanReconstructionPayloadBridge.reconstruction_ready
    {dossier_ready : Prop}
    {vacuum_vector_present : Prop}
    {wightman_fields_present : Prop}
    {smearing_defined : Prop}
    {vacuum_correlations_defined : Prop}
    (B :
      YMOSWightmanReconstructionPayloadBridge
        dossier_ready
        vacuum_vector_present
        wightman_fields_present
        smearing_defined
        vacuum_correlations_defined) :
    B.background.reconstruction_ready := by
  exact B.reconstruction_from_payload B.payload.reconstruction_ready

theorem YMOSWightmanReconstructionPayloadBridge.outputs
    {dossier_ready : Prop}
    {vacuum_vector_present : Prop}
    {wightman_fields_present : Prop}
    {smearing_defined : Prop}
    {vacuum_correlations_defined : Prop}
    (B :
      YMOSWightmanReconstructionPayloadBridge
        dossier_ready
        vacuum_vector_present
        wightman_fields_present
        smearing_defined
        vacuum_correlations_defined) :
    vacuum_vector_present /\
      wightman_fields_present /\
      smearing_defined /\
      vacuum_correlations_defined := by
  exact
    And.intro
      (B.vacuum_from_payload B.payload.vacuum_vector_present)
      (And.intro
        (B.fields_from_payload B.payload.wightman_fields_present)
        (And.intro
          (B.smearing_from_payload B.payload.smearing_defined)
          (B.correlations_from_payload
            B.payload.vacuum_correlations_defined)))

/--
Single manuscript/import package for the OS/Wightman reconstruction row.

The package keeps the source-facing dossier proof, reconstruction payload,
payload-to-background bridge, and standard background in one coherent object.
It is intentionally only an interface: inhabiting it is the remaining
source-import task for Companion III.
-/
structure YMStandardOSWightmanReconstructionImport where
  dossier_ready : Prop
  dossier_ready_holds : dossier_ready
  vacuum_vector_present : Prop
  wightman_fields_present : Prop
  smearing_defined : Prop
  vacuum_correlations_defined : Prop
  payload : Papers.YangMills.YMOSWightmanReconstructionPayload
  payload_bridge :
    YMOSWightmanReconstructionPayloadBridge
      dossier_ready
      vacuum_vector_present
      wightman_fields_present
      smearing_defined
      vacuum_correlations_defined
  standard_background :
    YMStandardOSWightmanBackground
      dossier_ready
      vacuum_vector_present
      wightman_fields_present
      smearing_defined
      vacuum_correlations_defined
  payload_bridge_matches_payload : payload_bridge.payload = payload
  payload_bridge_matches_background :
    payload_bridge.background = standard_background
  source_document_key : String
  source_labels : List String
  source_matches_manuscript : Prop
  source_matches_manuscript_verified : source_matches_manuscript

theorem YMStandardOSWightmanReconstructionImport.payload_nonempty
    (I : YMStandardOSWightmanReconstructionImport) :
    Nonempty Papers.YangMills.YMOSWightmanReconstructionPayload := by
  exact ⟨I.payload⟩

theorem YMStandardOSWightmanReconstructionImport.payload_bridge_nonempty
    (I : YMStandardOSWightmanReconstructionImport) :
    Nonempty
      (YMOSWightmanReconstructionPayloadBridge
        I.dossier_ready
        I.vacuum_vector_present
        I.wightman_fields_present
        I.smearing_defined
        I.vacuum_correlations_defined) := by
  exact ⟨I.payload_bridge⟩

theorem YMStandardOSWightmanReconstructionImport.standard_background_nonempty
    (I : YMStandardOSWightmanReconstructionImport) :
    Nonempty
      (YMStandardOSWightmanBackground
        I.dossier_ready
        I.vacuum_vector_present
        I.wightman_fields_present
        I.smearing_defined
        I.vacuum_correlations_defined) := by
  exact ⟨I.standard_background⟩

theorem ymOSWightmanReconstructionPayload_nonempty_of_standard_import
    (hImport : Nonempty YMStandardOSWightmanReconstructionImport) :
    Nonempty Papers.YangMills.YMOSWightmanReconstructionPayload := by
  rcases hImport with ⟨I⟩
  exact I.payload_nonempty

theorem ymOSWightmanReconstructionPayloadBridge_nonempty_of_standard_import
    (hImport : Nonempty YMStandardOSWightmanReconstructionImport) :
    ∃ dossier_ready vacuum_vector_present wightman_fields_present
        smearing_defined vacuum_correlations_defined : Prop,
      dossier_ready /\
        Nonempty
          (YMOSWightmanReconstructionPayloadBridge
            dossier_ready
            vacuum_vector_present
            wightman_fields_present
            smearing_defined
            vacuum_correlations_defined) := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ I.dossier_ready
    , I.vacuum_vector_present
    , I.wightman_fields_present
    , I.smearing_defined
    , I.vacuum_correlations_defined
    , I.dossier_ready_holds
    , I.payload_bridge_nonempty ⟩

theorem ymOSWightmanStandardBackground_nonempty_of_standard_import
    (hImport : Nonempty YMStandardOSWightmanReconstructionImport) :
    ∃ dossier_ready vacuum_vector_present wightman_fields_present
        smearing_defined vacuum_correlations_defined : Prop,
      dossier_ready /\
        Nonempty
          (YMStandardOSWightmanBackground
            dossier_ready
            vacuum_vector_present
            wightman_fields_present
            smearing_defined
            vacuum_correlations_defined) := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ I.dossier_ready
    , I.vacuum_vector_present
    , I.wightman_fields_present
    , I.smearing_defined
    , I.vacuum_correlations_defined
    , I.dossier_ready_holds
    , I.standard_background_nonempty ⟩

end MaleyLean
