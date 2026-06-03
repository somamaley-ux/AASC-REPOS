import MaleyLean.Papers.YangMills.Kernel.APlusClosureProtocol
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register

namespace MaleyLean
namespace Papers
namespace YangMills

/-- Most recent local-net source documents used as the upstream proof stack. -/
structure YMAPlusLocalNetSourceDocument where
  key : String
  title : String
  fileName : String
  role : String
  deriving DecidableEq

def ymAPlusLocalNetSourceDocuments :
    List YMAPlusLocalNetSourceDocument :=
  [ { key := "vacuum-sector-local-net"
      title :=
        "Vacuum-sector mass gap for the local gauge-invariant sharp-local Yang-Mills net"
      fileName :=
        "Vacuum_sector_mass_gap_for_the_local_gauge_invariant_sharp_local_Yang_Mills_net.pdf"
      role := "main local-net mass-gap paper" }
  , { key := "companion-i-route1"
      title := "Companion I: Ultraviolet Gate and Route 1 Mass Gap Chain"
      fileName :=
        "Companion_I__Ultraviolet_Gate_and_Route_1_Mass_Gap_Chain.pdf"
      role := "ultraviolet gate, Route 1, and fixed-lattice gap source" }
  , { key := "companion-ii-lane-a"
      title := "Companion II: Lane A Sharp-Local Construction"
      fileName :=
        "Companion_II__Lane_A_Sharp_Local_Construction.pdf"
      role := "sharp-local finite-cap and inductive-union construction source" }
  , { key := "companion-iii-reconstruction"
      title :=
        "Companion III: Reconstruction, Non-Triviality, and Faithful Wilson Universality"
      fileName :=
        "Companion_III__Reconstruction__Non_Triviality__and_Faithful_Wilson_Universality.pdf"
      role := "OS/Wightman reconstruction and endpoint universality source" }
  ]

def ymAPlusLocalNetSourceDocumentKeys : List String :=
  ymAPlusLocalNetSourceDocuments.map
    (fun D => D.key)

def ymAPlusLocalNetSourceDocumentFileNames : List String :=
  ymAPlusLocalNetSourceDocuments.map
    (fun D => D.fileName)

def ymAPlusLocalNetSourceDocumentsPopulatedBool : Bool :=
  ymAPlusLocalNetSourceDocuments.all
    (fun D =>
      !D.key.isEmpty &&
      !D.title.isEmpty &&
      !D.fileName.isEmpty &&
      !D.role.isEmpty)

theorem ymAPlusLocalNetSourceDocuments_count_eq :
    ymAPlusLocalNetSourceDocuments.length = 4 := by
  rfl

theorem ymAPlusLocalNetSourceDocumentFileNames_eq :
    ymAPlusLocalNetSourceDocumentFileNames =
      [ "Vacuum_sector_mass_gap_for_the_local_gauge_invariant_sharp_local_Yang_Mills_net.pdf"
      , "Companion_I__Ultraviolet_Gate_and_Route_1_Mass_Gap_Chain.pdf"
      , "Companion_II__Lane_A_Sharp_Local_Construction.pdf"
      , "Companion_III__Reconstruction__Non_Triviality__and_Faithful_Wilson_Universality.pdf"
      ] := by
  rfl

theorem ymAPlusLocalNetSourceDocumentsPopulatedBool_eq_true :
    ymAPlusLocalNetSourceDocumentsPopulatedBool = true := by
  rfl

/--
Workspace-local TeX source anchor used by the A+ audit.

This does not assert that the mathematics is formalized.  It records the
extracted source bundle, the TeX file where the cited theorem packet is
anchored, and the source labels that must later be translated into Lean
payload witnesses.
-/
structure YMAPlusExtractedSourceAnchor where
  documentKey : String
  extractedDirectory : String
  anchorFile : String
  sourceLabels : List String
  theoremRole : String
  texSourceAvailable : Bool
  deriving DecidableEq

def ymAPlusExtractedSourceAnchors :
    List YMAPlusExtractedSourceAnchor :=
  [ { documentKey := "companion-i-route1"
      extractedDirectory := ".codex-work/ym-source-tex/companion1_native_revtex_phase3_overleaf"
      anchorFile := "main.tex"
      sourceLabels := [ "N.20", "N.21", "F.3", "F.4" ]
      theoremRole :=
        "front-end Route 1 anchors for A1, public group scope, one-shot entrance, and tuned fixed-lattice OS gap"
      texSourceAvailable := true }
  , { documentKey := "vacuum-sector-local-net"
      extractedDirectory :=
        ".codex-work/ym-source-tex/Vacuum_sector_mass_gap_for_the_local_gauge_invariant_sharp_local_Yang_Mills_netA_PREEMPTIVE_PATCHED"
      anchorFile := "core/appendices/appendixC_phase1_freeze.tex"
      sourceLabels := [ "N.20", "N.21", "F.3", "F.317", "F.318", "F.4", "F.308" ]
      theoremRole :=
        "phase-freeze routing for the local-net proof chain and proof-local hardening labels"
      texSourceAvailable := true }
  , { documentKey := "companion-ii-lane-a"
      extractedDirectory := ".codex-work/ym-source-tex/companion2_native_revtex_phase3_overleaf"
      anchorFile := "main.tex"
      sourceLabels := [ "F.330A", "F.331", "5.74A", "5.74", "5.75", "5.76" ]
      theoremRole :=
        "sharp-local finite-cap, state-bridge, and inductive-union construction anchors"
      texSourceAvailable := true }
  , { documentKey := "companion-iii-reconstruction"
      extractedDirectory :=
        ".codex-work/ym-source-tex/Companion_III__Reconstruction__Non_Triviality__and_Faithful_Wilson_Universality"
      anchorFile := "main.tex"
      sourceLabels := [ "M.1", "M.2", "M.3", "M.5", "M.6" ]
      theoremRole :=
        "OS/Wightman reconstruction, non-triviality, and Minkowski mass-gap transfer anchors"
      texSourceAvailable := true }
  , { documentKey := "clay-extension"
      extractedDirectory :=
        ".codex-work/ym-source-tex/Admissibility_and_the_Well_Definedness_of_Yang_Mills_Endpoint_Constructions"
      anchorFile := "sector/sections/08_compatibility_and_spectral_boundary.tex"
      sourceLabels := [ "thm:standard-spectral-bridge", "cor:clay_endpoint_identification" ]
      theoremRole :=
        "theorem-scope admissible completion spectral bridge and Clay endpoint identification"
      texSourceAvailable := true }
  ]

def ymAPlusExtractedSourceAnchorDocumentKeys : List String :=
  ymAPlusExtractedSourceAnchors.map
    (fun A => A.documentKey)

def ymAPlusExtractedSourceAnchorFiles : List String :=
  ymAPlusExtractedSourceAnchors.map
    (fun A => A.anchorFile)

def ymAPlusExtractedSourceAnchorLabelLists : List (List String) :=
  ymAPlusExtractedSourceAnchors.map
    (fun A => A.sourceLabels)

def ymAPlusExtractedSourceAnchorAvailabilityFlags : List Bool :=
  ymAPlusExtractedSourceAnchors.map
    (fun A => A.texSourceAvailable)

def ymAPlusExtractedSourceAnchorsPopulatedBool : Bool :=
  ymAPlusExtractedSourceAnchors.length == 5 &&
    ymAPlusExtractedSourceAnchorAvailabilityFlags ==
      [true, true, true, true, true]

theorem ymAPlusExtractedSourceAnchors_count_eq :
    ymAPlusExtractedSourceAnchors.length = 5 := by
  rfl

theorem ymAPlusExtractedSourceAnchorDocumentKeys_eq :
    ymAPlusExtractedSourceAnchorDocumentKeys =
      [ "companion-i-route1"
      , "vacuum-sector-local-net"
      , "companion-ii-lane-a"
      , "companion-iii-reconstruction"
      , "clay-extension"
      ] := by
  rfl

theorem ymAPlusExtractedSourceAnchorFiles_eq :
    ymAPlusExtractedSourceAnchorFiles =
      [ "main.tex"
      , "core/appendices/appendixC_phase1_freeze.tex"
      , "main.tex"
      , "main.tex"
      , "sector/sections/08_compatibility_and_spectral_boundary.tex"
      ] := by
  rfl

theorem ymAPlusExtractedSourceAnchorLabelLists_eq :
    ymAPlusExtractedSourceAnchorLabelLists =
      [ [ "N.20", "N.21", "F.3", "F.4" ]
      , [ "N.20", "N.21", "F.3", "F.317", "F.318", "F.4", "F.308" ]
      , [ "F.330A", "F.331", "5.74A", "5.74", "5.75", "5.76" ]
      , [ "M.1", "M.2", "M.3", "M.5", "M.6" ]
      , [ "thm:standard-spectral-bridge", "cor:clay_endpoint_identification" ]
      ] := by
  rfl

theorem ymAPlusExtractedSourceAnchorAvailabilityFlags_eq :
    ymAPlusExtractedSourceAnchorAvailabilityFlags =
      [true, true, true, true, true] := by
  rfl

theorem ymAPlusExtractedSourceAnchorsPopulatedBool_eq_true :
    ymAPlusExtractedSourceAnchorsPopulatedBool = true := by
  rfl

def ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels : List String :=
  ym_source_labels .compactSimpleA1UltravioletGate ++
  ym_source_labels .publicGroupScopeExport ++
  ym_source_labels .oneShotEntranceAtBoundedPhysicalScale ++
  ym_source_labels .tunedFullFixedLatticeOSGap

def ymAPlusFixedLatticeHamiltonianDefinitionSourceTheorems :
    List YMVerbatimTheoremEntry :=
  [ .compactSimpleA1UltravioletGate
  , .publicGroupScopeExport
  , .oneShotEntranceAtBoundedPhysicalScale
  , .tunedFullFixedLatticeOSGap
  ]

def ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionSourceTheorems.map
    ym_verbatim_theorem_title

def ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremLabels :
    List (List String) :=
  ymAPlusFixedLatticeHamiltonianDefinitionSourceTheorems.map
    ym_source_labels

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceTheorems_count_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceTheorems.length = 4 := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles =
      [ "Compact-simple A1 ultraviolet gate"
      , "Public group-scope export"
      , "One-shot entrance at bounded physical scale"
      , "Tuned full fixed-lattice OS gap"
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremLabels_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremLabels =
      [ [ "N.20" ]
      , [ "N.21" ]
      , [ "F.3", "F.317", "F.318" ]
      , [ "F.4", "F.308" ]
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels =
      [ "N.20"
      , "N.21"
      , "F.3"
      , "F.317"
      , "F.318"
      , "F.4"
      , "F.308"
      ] := by
  rfl

def ymAPlusFixedLatticeHamiltonianDefinitionSourceDocumentKey :
    String :=
  "companion-i-route1"

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceDocumentKey_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceDocumentKey =
      "companion-i-route1" := by
  rfl

/--
Source support row for one proof obligation inside the first fixed-lattice
Hamiltonian-definition blocker.

The label list is intentionally conservative: until the Companion I text is
page-sliced in Lean, each proof field points to the full upstream Route 1
label bundle that the existing source register assigns to the ultraviolet
entrance and tuned fixed-lattice gap.
-/
structure YMAPlusFirstBlockerSourceSupportEntry where
  proofObligation : String
  sourceDocumentKey : String
  sourceTheorems : List YMVerbatimTheoremEntry
  sourceLabels : List String
  deriving DecidableEq

def ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport :
    List YMAPlusFirstBlockerSourceSupportEntry :=
  ymFiniteLatticeHamiltonianDefinitionProofObligations.map
    (fun proofObligation =>
      { proofObligation := proofObligation
        sourceDocumentKey :=
          ymAPlusFixedLatticeHamiltonianDefinitionSourceDocumentKey
        sourceTheorems :=
          ymAPlusFixedLatticeHamiltonianDefinitionSourceTheorems
        sourceLabels :=
          ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels })

def ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportObligations :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport.map
    (fun E => E.proofObligation)

def ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportDocumentKeys :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport.map
    (fun E => E.sourceDocumentKey)

def ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportLabelLists :
    List (List String) :=
  ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport.map
    (fun E => E.sourceLabels)

def ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportTheoremTitleLists :
    List (List String) :=
  ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport.map
    (fun E => E.sourceTheorems.map ym_verbatim_theorem_title)

def ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportPopulatedBool :
    Bool :=
  ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport.all
    (fun E =>
      !E.proofObligation.isEmpty &&
      !E.sourceDocumentKey.isEmpty &&
      0 < E.sourceTheorems.length &&
      E.sourceLabels.all (fun label => !label.isEmpty))

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport_length_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport.length = 5 := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport_obligations_match :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportObligations =
      ymFiniteLatticeHamiltonianDefinitionProofObligations := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport_documentKeys_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportDocumentKeys =
      [ "companion-i-route1"
      , "companion-i-route1"
      , "companion-i-route1"
      , "companion-i-route1"
      , "companion-i-route1"
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport_labelLists_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportLabelLists =
      [ [ "N.20", "N.21", "F.3", "F.317", "F.318", "F.4", "F.308" ]
      , [ "N.20", "N.21", "F.3", "F.317", "F.318", "F.4", "F.308" ]
      , [ "N.20", "N.21", "F.3", "F.317", "F.318", "F.4", "F.308" ]
      , [ "N.20", "N.21", "F.3", "F.317", "F.318", "F.4", "F.308" ]
      , [ "N.20", "N.21", "F.3", "F.317", "F.318", "F.4", "F.308" ]
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceSupport_theoremTitleLists_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportTheoremTitleLists =
      [ [ "Compact-simple A1 ultraviolet gate"
        , "Public group-scope export"
        , "One-shot entrance at bounded physical scale"
        , "Tuned full fixed-lattice OS gap" ]
      , [ "Compact-simple A1 ultraviolet gate"
        , "Public group-scope export"
        , "One-shot entrance at bounded physical scale"
        , "Tuned full fixed-lattice OS gap" ]
      , [ "Compact-simple A1 ultraviolet gate"
        , "Public group-scope export"
        , "One-shot entrance at bounded physical scale"
        , "Tuned full fixed-lattice OS gap" ]
      , [ "Compact-simple A1 ultraviolet gate"
        , "Public group-scope export"
        , "One-shot entrance at bounded physical scale"
        , "Tuned full fixed-lattice OS gap" ]
      , [ "Compact-simple A1 ultraviolet gate"
        , "Public group-scope export"
        , "One-shot entrance at bounded physical scale"
        , "Tuned full fixed-lattice OS gap" ]
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportPopulatedBool_eq_true :
    ymAPlusFixedLatticeHamiltonianDefinitionSourceSupportPopulatedBool =
      true := by
  rfl

structure YMAPlusFirstBlockerCertificateFieldSourceEntry where
  proofObligation : String
  certificateField : String
  closureProjection : String
  sourceDocumentKey : String
  sourceTheoremTitles : List String
  sourceLabels : List String
  suppliedInLean : Bool
  deriving DecidableEq

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource :
    List YMAPlusFirstBlockerCertificateFieldSourceEntry :=
  ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets.map
    (fun T =>
      { proofObligation := T.proofObligation
        certificateField := T.certificateField
        closureProjection := T.closureProjection
        sourceDocumentKey :=
          ymAPlusFixedLatticeHamiltonianDefinitionSourceDocumentKey
        sourceTheoremTitles :=
          ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles
        sourceLabels :=
          ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels
        suppliedInLean := T.suppliedInLean })

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceObligations :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.map
    (fun E => E.proofObligation)

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceFields :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.map
    (fun E => E.certificateField)

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceProjections :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.map
    (fun E => E.closureProjection)

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceDocumentKeys :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.map
    (fun E => E.sourceDocumentKey)

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceTheoremTitleLists :
    List (List String) :=
  ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.map
    (fun E => E.sourceTheoremTitles)

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceLabelLists :
    List (List String) :=
  ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.map
    (fun E => E.sourceLabels)

def ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceSuppliedFlags :
    List Bool :=
  ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.map
    (fun E => E.suppliedInLean)

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_length_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource.length =
      5 := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_obligations_match :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceObligations =
      ymFiniteLatticeHamiltonianDefinitionCertificateTargetObligations := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_fields_match :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceFields =
      ymFiniteLatticeHamiltonianDefinitionCertificateTargetFields := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_projections_match :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceProjections =
      ymFiniteLatticeHamiltonianDefinitionCertificateTargetProjections := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_documentKeys_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceDocumentKeys =
      [ "companion-i-route1"
      , "companion-i-route1"
      , "companion-i-route1"
      , "companion-i-route1"
      , "companion-i-route1"
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_theoremTitleLists_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceTheoremTitleLists =
      [ ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceTheoremTitles
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_labelLists_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceLabelLists =
      [ ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels
      , ymAPlusFixedLatticeHamiltonianDefinitionSourceLabels
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSource_suppliedFlags_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionCertificateFieldSourceSuppliedFlags =
      [false, false, false, false, false] := by
  rfl

/--
Sharper source-to-hypothesis translation row for the first A+ blocker.

These rows identify the paper-side theorem labels and TeX anchors that must be
translated into a Lean proof term for each certificate field.  The
`suppliedInLean` flag remains false: this is a source-localization map, not a
mathematical closure witness.
-/
structure YMAPlusFirstBlockerHypothesisTranslationEntry where
  certificateField : String
  mathematicalPayload : String
  extractedAnchorDocumentKey : String
  extractedAnchorFile : String
  sourceLabels : List String
  leanTargetStatement : String
  suppliedInLean : Bool
  deriving DecidableEq

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation :
    List YMAPlusFirstBlockerHypothesisTranslationEntry :=
  [ { certificateField := "localDegreesOfFreedomDefined"
      mathematicalPayload :=
        "finite periodic lattice, link variables, gauge-field configurations, and gauge-invariant local algebra"
      extractedAnchorDocumentKey := "vacuum-sector-local-net"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels :=
        [ "prop:loop_generators"
        , "prop:pullback_invariant_algebra"
        , "prop:lattice_OS_cyclicity_local_algebra" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeLocalDegreesOfFreedomWitness.to_proof"
      suppliedInLean := false }
  , { certificateField := "gaugeCovariantKineticTermDefined"
      mathematicalPayload :=
        "gauge-covariant blocking/flow dynamics and OS positive-time semigroup used to define the lattice dynamics"
      extractedAnchorDocumentKey := "vacuum-sector-local-net"
      extractedAnchorFile :=
        "source/clean_build/patching_reflection_depatch_v111_body.tex"
      sourceLabels :=
        [ "thm:RP_Wilson"
        , "thm:wilson_one_step_factorization"
        , "thm:wilson_exact_recursion"
        , "thm:Wilson_patch_transport" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeGaugeCovariantKineticTermWitness.to_proof"
      suppliedInLean := false }
  , { certificateField := "plaquettePotentialTermDefined"
      mathematicalPayload :=
        "Wilson plaquette weight/action, positive-type plaquette factors, and reflection-positive lattice gauge measure"
      extractedAnchorDocumentKey := "vacuum-sector-local-net"
      extractedAnchorFile :=
        "source/clean_build/appendix_reflection_chessboard_v112_body.tex"
      sourceLabels :=
        [ "eq:Wilson_weight_def_appA"
        , "lem:char_exp_G"
        , "lem:crossing_square"
        , "thm:RP_Wilson_full" ]
      leanTargetStatement :=
        "construct YMFiniteLatticePlaquettePotentialTermWitness.to_proof"
      suppliedInLean := false }
  , { certificateField := "finiteHamiltonianSelfAdjoint"
      mathematicalPayload :=
        "OS Hilbert space, time-translation semigroup, and self-adjoint nonnegative Hamiltonian generator"
      extractedAnchorDocumentKey := "vacuum-sector-local-net"
      extractedAnchorFile :=
        "source/clean_build/laneB_B1_gap_intake_wrapper_v104_body.tex"
      sourceLabels :=
        [ "prop:R1_E2_to_R1_HS"
        , "OS Hilbert space and Hamiltonian paragraph" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeHamiltonianSelfAdjointWitness.to_proof"
      suppliedInLean := false }
  , { certificateField := "matchesYangMillsLatticeAction"
      mathematicalPayload :=
        "identification of the full fixed-lattice OS Hamiltonian/gap with the Wilson Yang-Mills lattice action route"
      extractedAnchorDocumentKey := "vacuum-sector-local-net"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels :=
        [ "prop:route1_QE2"
        , "cor:route1_QE2_full_lattice_gap"
        , "thm:F_decay_implies_gap"
        , "thm:physical_gap_from_gluing" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeMatchesYangMillsActionWitness.to_proof"
      suppliedInLean := false }
  ]

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationFields :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation.map
    (fun E => E.certificateField)

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationPayloads :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation.map
    (fun E => E.mathematicalPayload)

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationAnchorFiles :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation.map
    (fun E => E.extractedAnchorFile)

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationLabelLists :
    List (List String) :=
  ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation.map
    (fun E => E.sourceLabels)

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationLeanTargets :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation.map
    (fun E => E.leanTargetStatement)

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationSuppliedFlags :
    List Bool :=
  ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation.map
    (fun E => E.suppliedInLean)

def ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationAllSuppliedBool :
    Bool :=
  ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationSuppliedFlags ==
    [true, true, true, true, true]

theorem ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation_length_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation.length =
      5 := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation_fields_match :
    ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationFields =
      ymFiniteLatticeHamiltonianDefinitionCertificateTargetFields := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation_anchorFiles_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationAnchorFiles =
      [ "source/clean_build/appendix_mass_gap_module_body.tex"
      , "source/clean_build/patching_reflection_depatch_v111_body.tex"
      , "source/clean_build/appendix_reflection_chessboard_v112_body.tex"
      , "source/clean_build/laneB_B1_gap_intake_wrapper_v104_body.tex"
      , "source/clean_build/appendix_mass_gap_module_body.tex"
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslation_labelLists_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationLabelLists =
      [ [ "prop:loop_generators"
        , "prop:pullback_invariant_algebra"
        , "prop:lattice_OS_cyclicity_local_algebra" ]
      , [ "thm:RP_Wilson"
        , "thm:wilson_one_step_factorization"
        , "thm:wilson_exact_recursion"
        , "thm:Wilson_patch_transport" ]
      , [ "eq:Wilson_weight_def_appA"
        , "lem:char_exp_G"
        , "lem:crossing_square"
        , "thm:RP_Wilson_full" ]
      , [ "prop:R1_E2_to_R1_HS"
        , "OS Hilbert space and Hamiltonian paragraph" ]
      , [ "prop:route1_QE2"
        , "cor:route1_QE2_full_lattice_gap"
        , "thm:F_decay_implies_gap"
        , "thm:physical_gap_from_gluing" ]
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationLeanTargets_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationLeanTargets =
      [ "construct YMFiniteLatticeLocalDegreesOfFreedomWitness.to_proof"
      , "construct YMFiniteLatticeGaugeCovariantKineticTermWitness.to_proof"
      , "construct YMFiniteLatticePlaquettePotentialTermWitness.to_proof"
      , "construct YMFiniteLatticeHamiltonianSelfAdjointWitness.to_proof"
      , "construct YMFiniteLatticeMatchesYangMillsActionWitness.to_proof"
      ] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationSuppliedFlags_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationSuppliedFlags =
      [false, false, false, false, false] := by
  rfl

theorem ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationAllSuppliedBool_eq_false :
    ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationAllSuppliedBool =
      false := by
  rfl

/--
Source alignment for the five typed witness-package components.

This joins the witness-package component inventory to the extracted theorem
packets that must eventually supply each component.  It is deliberately still
marked unsupplied: the row gives provenance and target shape, not a completed
formal proof.
-/
structure YMAPlusFirstBlockerWitnessComponentSourceEntry where
  packageField : String
  witnessType : String
  certificateField : String
  extractedAnchorFile : String
  sourceLabels : List String
  leanTargetStatement : String
  suppliedInLean : Bool
  deriving DecidableEq

def ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource :
    List YMAPlusFirstBlockerWitnessComponentSourceEntry :=
  [ { packageField := "local_degrees"
      witnessType := "YMFiniteLatticeLocalDegreesOfFreedomWitness"
      certificateField := "localDegreesOfFreedomDefined"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels :=
        [ "prop:loop_generators"
        , "prop:pullback_invariant_algebra"
        , "prop:lattice_OS_cyclicity_local_algebra" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeLocalDegreesOfFreedomWitness.to_proof"
      suppliedInLean := false }
  , { packageField := "kinetic_term"
      witnessType := "YMFiniteLatticeGaugeCovariantKineticTermWitness"
      certificateField := "gaugeCovariantKineticTermDefined"
      extractedAnchorFile :=
        "source/clean_build/patching_reflection_depatch_v111_body.tex"
      sourceLabels :=
        [ "thm:RP_Wilson"
        , "thm:wilson_one_step_factorization"
        , "thm:wilson_exact_recursion"
        , "thm:Wilson_patch_transport" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeGaugeCovariantKineticTermWitness.to_proof"
      suppliedInLean := false }
  , { packageField := "plaquette_potential"
      witnessType := "YMFiniteLatticePlaquettePotentialTermWitness"
      certificateField := "plaquettePotentialTermDefined"
      extractedAnchorFile :=
        "source/clean_build/appendix_reflection_chessboard_v112_body.tex"
      sourceLabels :=
        [ "eq:Wilson_weight_def_appA"
        , "lem:char_exp_G"
        , "lem:crossing_square"
        , "thm:RP_Wilson_full" ]
      leanTargetStatement :=
        "construct YMFiniteLatticePlaquettePotentialTermWitness.to_proof"
      suppliedInLean := false }
  , { packageField := "self_adjointness"
      witnessType := "YMFiniteLatticeHamiltonianSelfAdjointWitness"
      certificateField := "finiteHamiltonianSelfAdjoint"
      extractedAnchorFile :=
        "source/clean_build/laneB_B1_gap_intake_wrapper_v104_body.tex"
      sourceLabels :=
        [ "prop:R1_E2_to_R1_HS"
        , "OS Hilbert space and Hamiltonian paragraph" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeHamiltonianSelfAdjointWitness.to_proof"
      suppliedInLean := false }
  , { packageField := "action_matching"
      witnessType := "YMFiniteLatticeMatchesYangMillsActionWitness"
      certificateField := "matchesYangMillsLatticeAction"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels :=
        [ "prop:route1_QE2"
        , "cor:route1_QE2_full_lattice_gap"
        , "thm:F_decay_implies_gap"
        , "thm:physical_gap_from_gluing" ]
      leanTargetStatement :=
        "construct YMFiniteLatticeMatchesYangMillsActionWitness.to_proof"
      suppliedInLean := false }
  ]

def ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceFields :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.map
    (fun E => E.packageField)

def ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceTypes :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.map
    (fun E => E.witnessType)

def
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceCertificateFields :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.map
    (fun E => E.certificateField)

def
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceAnchorFiles :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.map
    (fun E => E.extractedAnchorFile)

def
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceLabelLists :
    List (List String) :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.map
    (fun E => E.sourceLabels)

def
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceLeanTargets :
    List String :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.map
    (fun E => E.leanTargetStatement)

def
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceSuppliedFlags :
    List Bool :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.map
    (fun E => E.suppliedInLean)

def ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceAllSuppliedBool :
    Bool :=
  ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.all
    (fun E => E.suppliedInLean)

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource_length_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource.length =
      5 := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource_fields_match :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceFields =
      ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentFields := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource_types_match :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceTypes =
      ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentTypes := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource_certificateFields_match :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceCertificateFields =
      ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentCertificateFields := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource_anchorFiles_match :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceAnchorFiles =
      ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationAnchorFiles := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSource_labelLists_match :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceLabelLists =
      ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationLabelLists := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceLeanTargets_match :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceLeanTargets =
      ymAPlusFixedLatticeHamiltonianDefinitionHypothesisTranslationLeanTargets := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceSuppliedFlags_eq :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceSuppliedFlags =
      [false, false, false, false, false] := by
  rfl

theorem
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceAllSuppliedBool_eq_false :
    ymAPlusFixedLatticeHamiltonianDefinitionWitnessComponentSourceAllSuppliedBool =
      false := by
  rfl

/--
Source support for the six internal inputs of the local-degrees witness.

The final row points to the full local-degrees theorem packet.  The structural
rows use the same extracted file with the closest source labels available from
the local-net text.  This is still provenance only; no witness term is supplied.
-/
structure YMAPlusLocalDegreesWitnessInputSourceEntry where
  inputField : String
  inputRole : String
  targetShape : String
  extractedAnchorFile : String
  sourceLabels : List String
  sourceSupportRole : String
  suppliedInLean : Bool
  deriving DecidableEq

def ymAPlusLocalDegreesWitnessInputSource :
    List YMAPlusLocalDegreesWitnessInputSourceEntry :=
  [ { inputField := "volume_nonempty"
      inputRole := "finite-lattice volume carrier exists"
      targetShape := "Nonempty C.LatticeVolume"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels := [ "prop:loop_generators" ]
      sourceSupportRole := "finite periodic lattice and loop-generator data"
      suppliedInLean := false }
  , { inputField := "gauge_configuration_nonempty"
      inputRole := "gauge-field configuration carrier exists"
      targetShape := "Nonempty C.GaugeFieldConfiguration"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels := [ "prop:pullback_invariant_algebra" ]
      sourceSupportRole := "gauge-field pullback/invariant-algebra data"
      suppliedInLean := false }
  , { inputField := "hilbert_space_nonempty"
      inputRole := "finite-lattice Hilbert-space carrier exists"
      targetShape := "Nonempty C.HilbertSpace"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels := [ "prop:lattice_OS_cyclicity_local_algebra" ]
      sourceSupportRole := "OS cyclicity/local-algebra Hilbert data"
      suppliedInLean := false }
  , { inputField := "local_degree_carrier"
      inputRole := "local degree-of-freedom carrier over each lattice volume"
      targetShape := "C.LatticeVolume -> Type"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels := [ "prop:loop_generators", "prop:pullback_invariant_algebra" ]
      sourceSupportRole := "local loop and invariant-algebra carrier data"
      suppliedInLean := false }
  , { inputField := "local_degree_carrier_nonempty"
      inputRole := "each local degree-of-freedom carrier is inhabited"
      targetShape :=
        "forall V : C.LatticeVolume, Nonempty (local_degree_carrier V)"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels := [ "prop:loop_generators", "prop:pullback_invariant_algebra" ]
      sourceSupportRole := "inhabited local loop/invariant-algebra carrier data"
      suppliedInLean := false }
  , { inputField := "proves_localDegreesOfFreedomDefined"
      inputRole := "paper-level local degrees proposition"
      targetShape := "C.localDegreesOfFreedomDefined"
      extractedAnchorFile :=
        "source/clean_build/appendix_mass_gap_module_body.tex"
      sourceLabels :=
        [ "prop:loop_generators"
        , "prop:pullback_invariant_algebra"
        , "prop:lattice_OS_cyclicity_local_algebra" ]
      sourceSupportRole := "full local-degrees witness proposition packet"
      suppliedInLean := false }
  ]

def ymAPlusLocalDegreesWitnessInputSourceFields :
    List String :=
  ymAPlusLocalDegreesWitnessInputSource.map
    (fun E => E.inputField)

def ymAPlusLocalDegreesWitnessInputSourceRoles :
    List String :=
  ymAPlusLocalDegreesWitnessInputSource.map
    (fun E => E.inputRole)

def ymAPlusLocalDegreesWitnessInputSourceTargetShapes :
    List String :=
  ymAPlusLocalDegreesWitnessInputSource.map
    (fun E => E.targetShape)

def ymAPlusLocalDegreesWitnessInputSourceAnchorFiles :
    List String :=
  ymAPlusLocalDegreesWitnessInputSource.map
    (fun E => E.extractedAnchorFile)

def ymAPlusLocalDegreesWitnessInputSourceLabelLists :
    List (List String) :=
  ymAPlusLocalDegreesWitnessInputSource.map
    (fun E => E.sourceLabels)

def ymAPlusLocalDegreesWitnessInputSourceSupportRoles :
    List String :=
  ymAPlusLocalDegreesWitnessInputSource.map
    (fun E => E.sourceSupportRole)

def ymAPlusLocalDegreesWitnessInputSourceSuppliedFlags :
    List Bool :=
  ymAPlusLocalDegreesWitnessInputSource.map
    (fun E => E.suppliedInLean)

def ymAPlusLocalDegreesWitnessInputSourceAllSuppliedBool :
    Bool :=
  ymAPlusLocalDegreesWitnessInputSource.all
    (fun E => E.suppliedInLean)

theorem ymAPlusLocalDegreesWitnessInputSource_length_eq :
    ymAPlusLocalDegreesWitnessInputSource.length = 6 := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceFields_match :
    ymAPlusLocalDegreesWitnessInputSourceFields =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceRoles_match :
    ymAPlusLocalDegreesWitnessInputSourceRoles =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessInputRoles := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceTargetShapes_match :
    ymAPlusLocalDegreesWitnessInputSourceTargetShapes =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessInputTargetShapes := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceAnchorFiles_eq :
    ymAPlusLocalDegreesWitnessInputSourceAnchorFiles =
      [ "source/clean_build/appendix_mass_gap_module_body.tex"
      , "source/clean_build/appendix_mass_gap_module_body.tex"
      , "source/clean_build/appendix_mass_gap_module_body.tex"
      , "source/clean_build/appendix_mass_gap_module_body.tex"
      , "source/clean_build/appendix_mass_gap_module_body.tex"
      , "source/clean_build/appendix_mass_gap_module_body.tex"
      ] := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceLabelLists_eq :
    ymAPlusLocalDegreesWitnessInputSourceLabelLists =
      [ [ "prop:loop_generators" ]
      , [ "prop:pullback_invariant_algebra" ]
      , [ "prop:lattice_OS_cyclicity_local_algebra" ]
      , [ "prop:loop_generators", "prop:pullback_invariant_algebra" ]
      , [ "prop:loop_generators", "prop:pullback_invariant_algebra" ]
      , [ "prop:loop_generators"
        , "prop:pullback_invariant_algebra"
        , "prop:lattice_OS_cyclicity_local_algebra" ]
      ] := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceFinalLabels_match :
    ymAPlusLocalDegreesWitnessInputSourceLabelLists.drop 5 =
      [[ "prop:loop_generators"
       , "prop:pullback_invariant_algebra"
       , "prop:lattice_OS_cyclicity_local_algebra" ]] := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceSupportRoles_eq :
    ymAPlusLocalDegreesWitnessInputSourceSupportRoles =
      [ "finite periodic lattice and loop-generator data"
      , "gauge-field pullback/invariant-algebra data"
      , "OS cyclicity/local-algebra Hilbert data"
      , "local loop and invariant-algebra carrier data"
      , "inhabited local loop/invariant-algebra carrier data"
      , "full local-degrees witness proposition packet"
      ] := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceSuppliedFlags_eq :
    ymAPlusLocalDegreesWitnessInputSourceSuppliedFlags =
      [false, false, false, false, false, false] := by
  rfl

theorem ymAPlusLocalDegreesWitnessInputSourceAllSuppliedBool_eq_false :
    ymAPlusLocalDegreesWitnessInputSourceAllSuppliedBool =
      false := by
  rfl

/--
Field-level dependency map for constructing the local-degrees witness.

This refines the source alignment by pairing each witness input with the Lean
projection it must support.  The `dependencyClass` column separates carrier
data from the final proof-bearing proposition, which is the first genuinely
mathematical proof atom that must be supplied before this witness can close.
-/
structure YMAPlusLocalDegreesWitnessFieldDependency where
  inputField : String
  projectionName : String
  dependencyClass : String
  sourceLabels : List String
  blocksConstructor : Bool
  suppliedInLean : Bool
  deriving DecidableEq

def ymAPlusLocalDegreesWitnessFieldDependencies :
    List YMAPlusLocalDegreesWitnessFieldDependency :=
  [ { inputField := "volume_nonempty"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_volume_nonempty"
      dependencyClass := "carrier-nonempty"
      sourceLabels := [ "prop:loop_generators" ]
      blocksConstructor := true
      suppliedInLean := false }
  , { inputField := "gauge_configuration_nonempty"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_configuration_nonempty"
      dependencyClass := "carrier-nonempty"
      sourceLabels := [ "prop:pullback_invariant_algebra" ]
      blocksConstructor := true
      suppliedInLean := false }
  , { inputField := "hilbert_space_nonempty"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_hilbert_nonempty"
      dependencyClass := "carrier-nonempty"
      sourceLabels := [ "prop:lattice_OS_cyclicity_local_algebra" ]
      blocksConstructor := true
      suppliedInLean := false }
  , { inputField := "local_degree_carrier"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.local_degree_carrier"
      dependencyClass := "carrier-family"
      sourceLabels := [ "prop:loop_generators", "prop:pullback_invariant_algebra" ]
      blocksConstructor := true
      suppliedInLean := false }
  , { inputField := "local_degree_carrier_nonempty"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_local_carrier_nonempty"
      dependencyClass := "carrier-family-nonempty"
      sourceLabels := [ "prop:loop_generators", "prop:pullback_invariant_algebra" ]
      blocksConstructor := true
      suppliedInLean := false }
  , { inputField := "proves_localDegreesOfFreedomDefined"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.to_localDegrees_proof"
      dependencyClass := "proof-proposition"
      sourceLabels :=
        [ "prop:loop_generators"
        , "prop:pullback_invariant_algebra"
        , "prop:lattice_OS_cyclicity_local_algebra" ]
      blocksConstructor := true
      suppliedInLean := false }
  ]

def ymAPlusLocalDegreesWitnessFieldDependencyFields :
    List String :=
  ymAPlusLocalDegreesWitnessFieldDependencies.map
    (fun D => D.inputField)

def ymAPlusLocalDegreesWitnessFieldDependencyProjections :
    List String :=
  ymAPlusLocalDegreesWitnessFieldDependencies.map
    (fun D => D.projectionName)

def ymAPlusLocalDegreesWitnessFieldDependencyClasses :
    List String :=
  ymAPlusLocalDegreesWitnessFieldDependencies.map
    (fun D => D.dependencyClass)

def ymAPlusLocalDegreesWitnessFieldDependencyLabelLists :
    List (List String) :=
  ymAPlusLocalDegreesWitnessFieldDependencies.map
    (fun D => D.sourceLabels)

def ymAPlusLocalDegreesWitnessFieldDependencyBlockingFlags :
    List Bool :=
  ymAPlusLocalDegreesWitnessFieldDependencies.map
    (fun D => D.blocksConstructor)

def ymAPlusLocalDegreesWitnessFieldDependencySuppliedFlags :
    List Bool :=
  ymAPlusLocalDegreesWitnessFieldDependencies.map
    (fun D => D.suppliedInLean)

def ymAPlusLocalDegreesWitnessFieldDependenciesAllBlockingBool :
    Bool :=
  ymAPlusLocalDegreesWitnessFieldDependencies.all
    (fun D => D.blocksConstructor)

def ymAPlusLocalDegreesWitnessFieldDependenciesAllSuppliedBool :
    Bool :=
  ymAPlusLocalDegreesWitnessFieldDependencies.all
    (fun D => D.suppliedInLean)

theorem ymAPlusLocalDegreesWitnessFieldDependencies_length_eq :
    ymAPlusLocalDegreesWitnessFieldDependencies.length = 6 := by
  rfl

theorem ymAPlusLocalDegreesWitnessFieldDependencyFields_match :
    ymAPlusLocalDegreesWitnessFieldDependencyFields =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields := by
  rfl

theorem ymAPlusLocalDegreesWitnessFieldDependencyProjections_match :
    ymAPlusLocalDegreesWitnessFieldDependencyProjections =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessInputProjections := by
  rfl

theorem ymAPlusLocalDegreesWitnessFieldDependencyLabelLists_match :
    ymAPlusLocalDegreesWitnessFieldDependencyLabelLists =
      ymAPlusLocalDegreesWitnessInputSourceLabelLists := by
  rfl

theorem ymAPlusLocalDegreesWitnessFieldDependencyClasses_eq :
    ymAPlusLocalDegreesWitnessFieldDependencyClasses =
      [ "carrier-nonempty"
      , "carrier-nonempty"
      , "carrier-nonempty"
      , "carrier-family"
      , "carrier-family-nonempty"
      , "proof-proposition"
      ] := by
  rfl

theorem ymAPlusLocalDegreesWitnessFieldDependencyBlockingFlags_eq :
    ymAPlusLocalDegreesWitnessFieldDependencyBlockingFlags =
      [true, true, true, true, true, true] := by
  rfl

theorem ymAPlusLocalDegreesWitnessFieldDependencySuppliedFlags_eq :
    ymAPlusLocalDegreesWitnessFieldDependencySuppliedFlags =
      [false, false, false, false, false, false] := by
  rfl

theorem
    ymAPlusLocalDegreesWitnessFieldDependenciesAllBlockingBool_eq_true :
    ymAPlusLocalDegreesWitnessFieldDependenciesAllBlockingBool =
      true := by
  rfl

theorem
    ymAPlusLocalDegreesWitnessFieldDependenciesAllSuppliedBool_eq_false :
    ymAPlusLocalDegreesWitnessFieldDependenciesAllSuppliedBool =
      false := by
  rfl

/--
Readiness snapshot for the local-degrees witness constructor.

This is the immediate gate before attempting to build a term of
`YMFiniteLatticeLocalDegreesOfFreedomWitness C`: all fields have been mapped
to source labels and Lean projections, but none of the required field terms has
yet been supplied.
-/
structure YMAPlusLocalDegreesWitnessConstructorReadiness where
  targetConstructor : String
  dependencyCount : Nat
  requiredDependencyCount : Nat
  allFieldsMapped : Bool
  allDependenciesBlocking : Bool
  allDependenciesSupplied : Bool
  proofPropositionField : String
  readyForConstructor : Bool
  deriving DecidableEq

def ymAPlusLocalDegreesWitnessConstructorReadiness :
    YMAPlusLocalDegreesWitnessConstructorReadiness where
  targetConstructor :=
    ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorName
  dependencyCount :=
    ymAPlusLocalDegreesWitnessFieldDependencies.length
  requiredDependencyCount :=
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields.length
  allFieldsMapped :=
    ymAPlusLocalDegreesWitnessFieldDependencyFields ==
      ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields
  allDependenciesBlocking :=
    ymAPlusLocalDegreesWitnessFieldDependenciesAllBlockingBool
  allDependenciesSupplied :=
    ymAPlusLocalDegreesWitnessFieldDependenciesAllSuppliedBool
  proofPropositionField := "proves_localDegreesOfFreedomDefined"
  readyForConstructor :=
    (ymAPlusLocalDegreesWitnessFieldDependencyFields ==
      ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields) &&
    ymAPlusLocalDegreesWitnessFieldDependenciesAllBlockingBool &&
    ymAPlusLocalDegreesWitnessFieldDependenciesAllSuppliedBool

def ymAPlusLocalDegreesWitnessConstructorReadinessFlags :
    List Bool :=
  [ ymAPlusLocalDegreesWitnessConstructorReadiness.allFieldsMapped
  , ymAPlusLocalDegreesWitnessConstructorReadiness.allDependenciesBlocking
  , ymAPlusLocalDegreesWitnessConstructorReadiness.allDependenciesSupplied
  , ymAPlusLocalDegreesWitnessConstructorReadiness.readyForConstructor
  ]

theorem ymAPlusLocalDegreesWitnessConstructorReadiness_target_eq :
    ymAPlusLocalDegreesWitnessConstructorReadiness.targetConstructor =
      "YMFiniteLatticeLocalDegreesOfFreedomWitness.of_fields" := by
  rfl

theorem
    ymAPlusLocalDegreesWitnessConstructorReadiness_target_matches_constructorName :
    ymAPlusLocalDegreesWitnessConstructorReadiness.targetConstructor =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorName := by
  rfl

theorem ymAPlusLocalDegreesWitnessConstructorReadiness_dependencyCount_eq :
    ymAPlusLocalDegreesWitnessConstructorReadiness.dependencyCount = 6 := by
  rfl

theorem
    ymAPlusLocalDegreesWitnessConstructorReadiness_requiredDependencyCount_eq :
    ymAPlusLocalDegreesWitnessConstructorReadiness.requiredDependencyCount =
      6 := by
  rfl

theorem ymAPlusLocalDegreesWitnessConstructorReadiness_allFieldsMapped_eq_true :
    ymAPlusLocalDegreesWitnessConstructorReadiness.allFieldsMapped =
      true := by
  rfl

theorem
    ymAPlusLocalDegreesWitnessConstructorReadiness_allDependenciesBlocking_eq_true :
    ymAPlusLocalDegreesWitnessConstructorReadiness.allDependenciesBlocking =
      true := by
  rfl

theorem
    ymAPlusLocalDegreesWitnessConstructorReadiness_allDependenciesSupplied_eq_false :
    ymAPlusLocalDegreesWitnessConstructorReadiness.allDependenciesSupplied =
      false := by
  rfl

theorem ymAPlusLocalDegreesWitnessConstructorReadiness_proofField_eq :
    ymAPlusLocalDegreesWitnessConstructorReadiness.proofPropositionField =
      "proves_localDegreesOfFreedomDefined" := by
  rfl

theorem
    ymAPlusLocalDegreesWitnessConstructorReadiness_readyForConstructor_eq_false :
    ymAPlusLocalDegreesWitnessConstructorReadiness.readyForConstructor =
      false := by
  rfl

theorem ymAPlusLocalDegreesWitnessConstructorReadinessFlags_eq :
    ymAPlusLocalDegreesWitnessConstructorReadinessFlags =
      [true, true, false, false] := by
  rfl

/-- Lean-facing source/audit crosswalk for one A+ obligation. -/
structure YMAPlusSourceCrosswalkEntry where
  obligation : YMAPlusObligation
  title : String
  currentSocket : String
  requiredClosure : String
  auditFile : String
  standardImportFile : String
  subobligationLedger : String
  subobligationCount : Nat
  certificateType : String
  closureGate : String
  exactTheoremProjection : String
  payloadProjection : String
  payloadBridgeProjection : String
  standardSocketProjection : String
  finalTargetProjection : String
  deriving DecidableEq

def YMAPlusSourceCrosswalkEntry.matchesObligation
    (E : YMAPlusSourceCrosswalkEntry) :
    Prop :=
  E.title = E.obligation.title /\
  E.currentSocket = E.obligation.currentSocket /\
  E.requiredClosure = E.obligation.requiredClosure

def YMAPlusSourceCrosswalkEntry.matchesObligationBool
    (E : YMAPlusSourceCrosswalkEntry) :
    Bool :=
  E.title == E.obligation.title &&
  E.currentSocket == E.obligation.currentSocket &&
  E.requiredClosure == E.obligation.requiredClosure

def YMAPlusSourceCrosswalkEntry.hasAuditSurfaceBool
    (E : YMAPlusSourceCrosswalkEntry) :
    Bool :=
  !E.auditFile.isEmpty &&
  !E.standardImportFile.isEmpty &&
  !E.subobligationLedger.isEmpty &&
  0 < E.subobligationCount &&
  !E.certificateType.isEmpty &&
  !E.closureGate.isEmpty &&
  !E.exactTheoremProjection.isEmpty &&
  !E.payloadProjection.isEmpty &&
  !E.payloadBridgeProjection.isEmpty &&
  !E.standardSocketProjection.isEmpty &&
  !E.finalTargetProjection.isEmpty

def ymFixedLatticeGapCrosswalk : YMAPlusSourceCrosswalkEntry where
  obligation := .fixedLatticeGap
  title := YMAPlusObligation.fixedLatticeGap.title
  currentSocket := YMAPlusObligation.fixedLatticeGap.currentSocket
  requiredClosure := YMAPlusObligation.fixedLatticeGap.requiredClosure
  auditFile := "Checks/Axiom/YangMillsLatticeGapObligationAudit.lean"
  standardImportFile :=
    "MaleyLean/Papers/YangMills/Kernel/StandardLatticeGapBackground.lean"
  subobligationLedger := "ymFixedLatticeGapSubobligations"
  subobligationCount := YMAPlusObligation.fixedLatticeGap.subobligationCount
  certificateType := "YMFixedLatticeGapAPlusCertificate"
  closureGate := "ymFixedLatticeGapSubobligationsClosed"
  exactTheoremProjection :=
    "ymAPlusFixedLatticeCertificate_requires_exact_theorem"
  payloadProjection :=
    "ymAPlusFixedLatticeCertificate_requires_real_spectral_gap_payload"
  payloadBridgeProjection :=
    "ymAPlusFixedLatticeCertificate_requires_payload_bridge"
  standardSocketProjection :=
    "YMAuditedFixedLatticeGapCertificate.standardTransferAvailable"
  finalTargetProjection :=
    "APlusStemToSternClayEndpoint.requires_fixed_lattice_gap"

def ymSharpLocalCrosswalk : YMAPlusSourceCrosswalkEntry where
  obligation := .sharpLocalConstruction
  title := YMAPlusObligation.sharpLocalConstruction.title
  currentSocket := YMAPlusObligation.sharpLocalConstruction.currentSocket
  requiredClosure := YMAPlusObligation.sharpLocalConstruction.requiredClosure
  auditFile := "Checks/Axiom/YangMillsSharpLocalObligationAudit.lean"
  standardImportFile :=
    "MaleyLean/Papers/YangMills/Kernel/StandardSharpLocalBackground.lean"
  subobligationLedger := "ymSharpLocalSubobligations"
  subobligationCount :=
    YMAPlusObligation.sharpLocalConstruction.subobligationCount
  certificateType := "YMSharpLocalAPlusCertificate"
  closureGate := "ymSharpLocalSubobligationsClosed"
  exactTheoremProjection :=
    "ymAPlusSharpLocalCertificate_requires_exact_theorem"
  payloadProjection := "ymAPlusSharpLocalCertificate_requires_payload"
  payloadBridgeProjection := "ymAPlusSharpLocalCertificate_requires_payload_bridge"
  standardSocketProjection :=
    "YMAuditedSharpLocalCertificate.standardTransferAvailable"
  finalTargetProjection :=
    "APlusStemToSternClayEndpoint.requires_sharp_local_construction"

def ymContinuumTransportCrosswalk : YMAPlusSourceCrosswalkEntry where
  obligation := .continuumTransport
  title := YMAPlusObligation.continuumTransport.title
  currentSocket := YMAPlusObligation.continuumTransport.currentSocket
  requiredClosure := YMAPlusObligation.continuumTransport.requiredClosure
  auditFile := "Checks/Axiom/YangMillsContinuumTransportObligationAudit.lean"
  standardImportFile :=
    "MaleyLean/Papers/YangMills/Kernel/StandardContinuumTransportBackground.lean"
  subobligationLedger := "ymContinuumTransportSubobligations"
  subobligationCount :=
    YMAPlusObligation.continuumTransport.subobligationCount
  certificateType := "YMContinuumTransportAPlusCertificate"
  closureGate := "ymContinuumTransportSubobligationsClosed"
  exactTheoremProjection :=
    "ymAPlusContinuumTransportCertificate_requires_exact_theorem"
  payloadProjection := "ymAPlusContinuumTransportCertificate_requires_payload"
  payloadBridgeProjection :=
    "ymAPlusContinuumTransportCertificate_requires_payload_bridge"
  standardSocketProjection :=
    "YMAuditedContinuumTransportCertificate.standardTransferAvailable"
  finalTargetProjection :=
    "APlusStemToSternClayEndpoint.requires_continuum_transport"

def ymOSWightmanCrosswalk : YMAPlusSourceCrosswalkEntry where
  obligation := .osWightmanReconstruction
  title := YMAPlusObligation.osWightmanReconstruction.title
  currentSocket := YMAPlusObligation.osWightmanReconstruction.currentSocket
  requiredClosure := YMAPlusObligation.osWightmanReconstruction.requiredClosure
  auditFile := "Checks/Axiom/YangMillsOSWightmanObligationAudit.lean"
  standardImportFile :=
    "MaleyLean/Papers/YangMills/Kernel/StandardOSWightmanBackground.lean"
  subobligationLedger := "ymOSWightmanSubobligations"
  subobligationCount :=
    YMAPlusObligation.osWightmanReconstruction.subobligationCount
  certificateType := "YMOSWightmanAPlusCertificate"
  closureGate := "ymOSWightmanSubobligationsClosed"
  exactTheoremProjection :=
    "ymAPlusOSWightmanCertificate_requires_exact_theorem"
  payloadProjection := "ymAPlusOSWightmanCertificate_requires_payload"
  payloadBridgeProjection :=
    "YMOSWightmanAPlusCertificate.requires_payload_bridge"
  standardSocketProjection :=
    "YMAuditedOSWightmanCertificate.standardBackgroundAvailable"
  finalTargetProjection :=
    "APlusStemToSternClayEndpoint.requires_os_wightman_reconstruction"

def ymMinkowskiGapCrosswalk : YMAPlusSourceCrosswalkEntry where
  obligation := .minkowskiHamiltonianGap
  title := YMAPlusObligation.minkowskiHamiltonianGap.title
  currentSocket := YMAPlusObligation.minkowskiHamiltonianGap.currentSocket
  requiredClosure := YMAPlusObligation.minkowskiHamiltonianGap.requiredClosure
  auditFile := "Checks/Axiom/YangMillsMinkowskiGapObligationAudit.lean"
  standardImportFile :=
    "MaleyLean/Papers/YangMills/Kernel/StandardMinkowskiGapBackground.lean"
  subobligationLedger := "ymMinkowskiHamiltonianGapSubobligations"
  subobligationCount :=
    YMAPlusObligation.minkowskiHamiltonianGap.subobligationCount
  certificateType := "YMMinkowskiHamiltonianGapAPlusCertificate"
  closureGate := "ymMinkowskiHamiltonianGapSubobligationsClosed"
  exactTheoremProjection :=
    "ymAPlusMinkowskiCertificate_requires_exact_theorem"
  payloadProjection := "ymAPlusMinkowskiCertificate_requires_hamiltonian_payload"
  payloadBridgeProjection := "ymAPlusMinkowskiCertificate_requires_payload_bridge"
  standardSocketProjection :=
    "YMAuditedMinkowskiHamiltonianGapCertificate.standardTransferAvailable"
  finalTargetProjection :=
    "APlusStemToSternClayEndpoint.requires_minkowski_hamiltonian_gap"

def ymEndpointExactnessCrosswalk : YMAPlusSourceCrosswalkEntry where
  obligation := .endpointExactnessExclusion
  title := YMAPlusObligation.endpointExactnessExclusion.title
  currentSocket := YMAPlusObligation.endpointExactnessExclusion.currentSocket
  requiredClosure := YMAPlusObligation.endpointExactnessExclusion.requiredClosure
  auditFile := "Checks/Axiom/YangMillsEndpointExactnessObligationAudit.lean"
  standardImportFile :=
    "MaleyLean/Papers/YangMills/Kernel/StandardEndpointExactnessBackground.lean"
  subobligationLedger := "ymEndpointExactnessSubobligations"
  subobligationCount :=
    YMAPlusObligation.endpointExactnessExclusion.subobligationCount
  certificateType := "YMEndpointExactnessAPlusCertificate"
  closureGate := "ymEndpointExactnessSubobligationsClosed"
  exactTheoremProjection :=
    "ymAPlusEndpointCertificate_requires_exact_theorem"
  payloadProjection := "ymAPlusEndpointCertificate_requires_payload"
  payloadBridgeProjection := "ymAPlusEndpointCertificate_requires_payload_bridge"
  standardSocketProjection :=
    "YMAuditedEndpointExactnessCertificate.standardTransferAvailable"
  finalTargetProjection :=
    "APlusStemToSternClayEndpoint.requires_endpoint_exactness_exclusion"

def ymClayExtensionCrosswalk : YMAPlusSourceCrosswalkEntry where
  obligation := .clayExtensionAdmissibility
  title := YMAPlusObligation.clayExtensionAdmissibility.title
  currentSocket := YMAPlusObligation.clayExtensionAdmissibility.currentSocket
  requiredClosure := YMAPlusObligation.clayExtensionAdmissibility.requiredClosure
  auditFile := "Checks/Axiom/YangMillsClayExtensionObligationAudit.lean"
  standardImportFile :=
    "MaleyLean/Papers/YangMills/StandardClayExtensionBackground.lean"
  subobligationLedger := "ymClayExtensionSubobligations"
  subobligationCount :=
    YMAPlusObligation.clayExtensionAdmissibility.subobligationCount
  certificateType := "YMClayExtensionAPlusCertificate"
  closureGate := "ymClayExtensionSubobligationsClosed"
  exactTheoremProjection :=
    "ymAPlusClayExtensionCertificate_requires_exact_theorem"
  payloadProjection := "ymAPlusClayExtensionCertificate_requires_payload"
  payloadBridgeProjection :=
    "ymAPlusClayExtensionCertificate_requires_payload_bridge"
  standardSocketProjection :=
    "YMAuditedClayExtensionCertificate.standardTransferAvailable"
  finalTargetProjection :=
    "APlusStemToSternClayEndpoint.requires_clay_extension_admissibility"

def ymAPlusSourceCrosswalk : List YMAPlusSourceCrosswalkEntry :=
  [ ymFixedLatticeGapCrosswalk
  , ymSharpLocalCrosswalk
  , ymContinuumTransportCrosswalk
  , ymOSWightmanCrosswalk
  , ymMinkowskiGapCrosswalk
  , ymEndpointExactnessCrosswalk
  , ymClayExtensionCrosswalk
  ]

theorem ymAPlusSourceCrosswalk_length :
    ymAPlusSourceCrosswalk.length = ymAPlusObligations.length := by
  rfl

def ymAPlusSourceCrosswalk_obligations : List YMAPlusObligation :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.obligation)

theorem ymAPlusSourceCrosswalk_obligations_match_ledger :
    ymAPlusSourceCrosswalk_obligations = ymAPlusObligations := by
  rfl

def ymAPlusSourceCrosswalk_titles : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.title)

def ymAPlusObligationTitles : List String :=
  ymAPlusObligations.map
    YMAPlusObligation.title

theorem ymAPlusSourceCrosswalk_titles_match_ledger :
    ymAPlusSourceCrosswalk_titles = ymAPlusObligationTitles := by
  rfl

def ymAPlusSourceCrosswalk_currentSockets : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.currentSocket)

def ymAPlusObligationCurrentSockets : List String :=
  ymAPlusObligations.map
    YMAPlusObligation.currentSocket

theorem ymAPlusSourceCrosswalk_currentSockets_match_ledger :
    ymAPlusSourceCrosswalk_currentSockets =
      ymAPlusObligationCurrentSockets := by
  rfl

def ymAPlusSourceCrosswalk_requiredClosures : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.requiredClosure)

def ymAPlusObligationRequiredClosures : List String :=
  ymAPlusObligations.map
    YMAPlusObligation.requiredClosure

theorem ymAPlusSourceCrosswalk_requiredClosures_match_ledger :
    ymAPlusSourceCrosswalk_requiredClosures =
      ymAPlusObligationRequiredClosures := by
  rfl

def ymAPlusSourceCrosswalk_auditFiles : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.auditFile)

def ymAPlusFocusedObligationAuditFiles : List String :=
  [ "Checks/Axiom/YangMillsLatticeGapObligationAudit.lean"
  , "Checks/Axiom/YangMillsSharpLocalObligationAudit.lean"
  , "Checks/Axiom/YangMillsContinuumTransportObligationAudit.lean"
  , "Checks/Axiom/YangMillsOSWightmanObligationAudit.lean"
  , "Checks/Axiom/YangMillsMinkowskiGapObligationAudit.lean"
  , "Checks/Axiom/YangMillsEndpointExactnessObligationAudit.lean"
  , "Checks/Axiom/YangMillsClayExtensionObligationAudit.lean"
  ]

theorem ymAPlusSourceCrosswalk_auditFiles_match_focused_obligation_audits :
    ymAPlusSourceCrosswalk_auditFiles =
      ymAPlusFocusedObligationAuditFiles := by
  rfl

def ymAPlusSourceCrosswalk_standardImportFiles : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.standardImportFile)

def ymAPlusCanonicalStandardImportFiles : List String :=
  [ "MaleyLean/Papers/YangMills/Kernel/StandardLatticeGapBackground.lean"
  , "MaleyLean/Papers/YangMills/Kernel/StandardSharpLocalBackground.lean"
  , "MaleyLean/Papers/YangMills/Kernel/StandardContinuumTransportBackground.lean"
  , "MaleyLean/Papers/YangMills/Kernel/StandardOSWightmanBackground.lean"
  , "MaleyLean/Papers/YangMills/Kernel/StandardMinkowskiGapBackground.lean"
  , "MaleyLean/Papers/YangMills/Kernel/StandardEndpointExactnessBackground.lean"
  , "MaleyLean/Papers/YangMills/StandardClayExtensionBackground.lean"
  ]

theorem ymAPlusSourceCrosswalk_standardImportFiles_match_canonical :
    ymAPlusSourceCrosswalk_standardImportFiles =
      ymAPlusCanonicalStandardImportFiles := by
  rfl

def ymAPlusSourceCrosswalk_subobligationLedgers : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.subobligationLedger)

def ymAPlusCanonicalSubobligationLedgers : List String :=
  [ "ymFixedLatticeGapSubobligations"
  , "ymSharpLocalSubobligations"
  , "ymContinuumTransportSubobligations"
  , "ymOSWightmanSubobligations"
  , "ymMinkowskiHamiltonianGapSubobligations"
  , "ymEndpointExactnessSubobligations"
  , "ymClayExtensionSubobligations"
  ]

theorem ymAPlusSourceCrosswalk_subobligationLedgers_match_canonical :
    ymAPlusSourceCrosswalk_subobligationLedgers =
      ymAPlusCanonicalSubobligationLedgers := by
  rfl

def ymAPlusSourceCrosswalk_certificateTypes : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.certificateType)

def ymAPlusCanonicalCertificateTypes : List String :=
  [ "YMFixedLatticeGapAPlusCertificate"
  , "YMSharpLocalAPlusCertificate"
  , "YMContinuumTransportAPlusCertificate"
  , "YMOSWightmanAPlusCertificate"
  , "YMMinkowskiHamiltonianGapAPlusCertificate"
  , "YMEndpointExactnessAPlusCertificate"
  , "YMClayExtensionAPlusCertificate"
  ]

theorem ymAPlusSourceCrosswalk_certificateTypes_match_canonical :
    ymAPlusSourceCrosswalk_certificateTypes =
      ymAPlusCanonicalCertificateTypes := by
  rfl

def ymAPlusSourceCrosswalk_closureGates : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.closureGate)

def ymAPlusCanonicalClosureGates : List String :=
  [ "ymFixedLatticeGapSubobligationsClosed"
  , "ymSharpLocalSubobligationsClosed"
  , "ymContinuumTransportSubobligationsClosed"
  , "ymOSWightmanSubobligationsClosed"
  , "ymMinkowskiHamiltonianGapSubobligationsClosed"
  , "ymEndpointExactnessSubobligationsClosed"
  , "ymClayExtensionSubobligationsClosed"
  ]

theorem ymAPlusSourceCrosswalk_closureGates_match_canonical :
    ymAPlusSourceCrosswalk_closureGates =
      ymAPlusCanonicalClosureGates := by
  rfl

structure YMAPlusAuditedBundleProjectionCrosswalkEntry where
  title : String
  certificateType : String
  certificateProjection : String
  closureGate : String
  closureProjection : String

def ymAPlusAuditedBundleProjectionCrosswalk :
    List YMAPlusAuditedBundleProjectionCrosswalkEntry :=
  [ { title := "Fixed-lattice spectral gap"
      certificateType := "YMFixedLatticeGapAPlusCertificate"
      certificateProjection :=
        "YMAuditedAPlusCertificateBundle.fixedLatticeGapCertificate"
      closureGate := "ymFixedLatticeGapSubobligationsClosed"
      closureProjection :=
        "YMAuditedAPlusCertificateBundle.fixedLatticeGapSubobligationsClosed" }
  , { title := "Sharp-local finite-cap and inductive-union construction"
      certificateType := "YMSharpLocalAPlusCertificate"
      certificateProjection :=
        "YMAuditedAPlusCertificateBundle.sharpLocalCertificate"
      closureGate := "ymSharpLocalSubobligationsClosed"
      closureProjection :=
        "YMAuditedAPlusCertificateBundle.sharpLocalSubobligationsClosed" }
  , { title := "Weak-window / QE3 continuum transport"
      certificateType := "YMContinuumTransportAPlusCertificate"
      certificateProjection :=
        "YMAuditedAPlusCertificateBundle.continuumTransportCertificate"
      closureGate := "ymContinuumTransportSubobligationsClosed"
      closureProjection :=
        "YMAuditedAPlusCertificateBundle.continuumTransportSubobligationsClosed" }
  , { title := "OS/Wightman reconstruction background"
      certificateType := "YMOSWightmanAPlusCertificate"
      certificateProjection :=
        "YMAuditedAPlusCertificateBundle.osWightmanCertificate"
      closureGate := "ymOSWightmanSubobligationsClosed"
      closureProjection :=
        "YMAuditedAPlusCertificateBundle.osWightmanSubobligationsClosed" }
  , { title := "Minkowski Hamiltonian mass-gap transfer"
      certificateType := "YMMinkowskiHamiltonianGapAPlusCertificate"
      certificateProjection :=
        "YMAuditedAPlusCertificateBundle.minkowskiHamiltonianGapCertificate"
      closureGate := "ymMinkowskiHamiltonianGapSubobligationsClosed"
      closureProjection :=
        "YMAuditedAPlusCertificateBundle.minkowskiHamiltonianGapSubobligationsClosed" }
  , { title := "Endpoint exactness and extended-support exclusion"
      certificateType := "YMEndpointExactnessAPlusCertificate"
      certificateProjection :=
        "YMAuditedAPlusCertificateBundle.endpointExactnessCertificate"
      closureGate := "ymEndpointExactnessSubobligationsClosed"
      closureProjection :=
        "YMAuditedAPlusCertificateBundle.endpointExactnessSubobligationsClosed" }
  , { title := "Clay extension admissibility and GNS spectral bridge"
      certificateType := "YMClayExtensionAPlusCertificate"
      certificateProjection :=
        "YMAuditedAPlusCertificateBundle.clayExtensionCertificate"
      closureGate := "ymClayExtensionSubobligationsClosed"
      closureProjection :=
        "YMAuditedAPlusCertificateBundle.clayExtensionSubobligationsClosed" }
  ]

def ymAPlusAuditedBundleProjectionCrosswalk_titles : List String :=
  ymAPlusAuditedBundleProjectionCrosswalk.map
    (fun E => E.title)

def ymAPlusAuditedBundleProjectionCrosswalk_certificateTypes : List String :=
  ymAPlusAuditedBundleProjectionCrosswalk.map
    (fun E => E.certificateType)

def ymAPlusAuditedBundleProjectionCrosswalk_certificateProjections :
    List String :=
  ymAPlusAuditedBundleProjectionCrosswalk.map
    (fun E => E.certificateProjection)

def ymAPlusAuditedBundleProjectionCrosswalk_closureGates : List String :=
  ymAPlusAuditedBundleProjectionCrosswalk.map
    (fun E => E.closureGate)

def ymAPlusAuditedBundleProjectionCrosswalk_closureProjections :
    List String :=
  ymAPlusAuditedBundleProjectionCrosswalk.map
    (fun E => E.closureProjection)

theorem ymAPlusAuditedBundleProjectionCrosswalk_length_eq :
    ymAPlusAuditedBundleProjectionCrosswalk.length = 7 := by
  rfl

theorem ymAPlusAuditedBundleProjectionCrosswalk_titles_match :
    ymAPlusAuditedBundleProjectionCrosswalk_titles =
      ymAPlusObligationTitles := by
  rfl

theorem ymAPlusAuditedBundleProjectionCrosswalk_certificateTypes_match :
    ymAPlusAuditedBundleProjectionCrosswalk_certificateTypes =
      ymAPlusCanonicalCertificateTypes := by
  rfl

theorem ymAPlusAuditedBundleProjectionCrosswalk_certificateProjections_match :
    ymAPlusAuditedBundleProjectionCrosswalk_certificateProjections =
      ymAPlusAuditedBundleCertificateProjectionNames := by
  rfl

theorem ymAPlusAuditedBundleProjectionCrosswalk_closureGates_match :
    ymAPlusAuditedBundleProjectionCrosswalk_closureGates =
      ymAPlusCanonicalClosureGates := by
  rfl

theorem ymAPlusAuditedBundleProjectionCrosswalk_closureProjections_match :
    ymAPlusAuditedBundleProjectionCrosswalk_closureProjections =
      ymAPlusAuditedBundleSubobligationProjectionNames := by
  rfl

def ymAPlusAuditedBundleProjectionCrosswalk_populatedBool : Bool :=
  ymAPlusAuditedBundleProjectionCrosswalk.all
    (fun E =>
      !E.title.isEmpty &&
      !E.certificateType.isEmpty &&
      !E.certificateProjection.isEmpty &&
      !E.closureGate.isEmpty &&
      !E.closureProjection.isEmpty)

theorem ymAPlusAuditedBundleProjectionCrosswalk_populatedBool_eq_true :
    ymAPlusAuditedBundleProjectionCrosswalk_populatedBool = true := by
  rfl

def ymAPlusGlobalAuditFiles : List String :=
  [ "Checks/Axiom/YangMillsAPlusFullAudit.lean"
  , "Checks/Axiom/YangMillsAPlusObligationLedgerAudit.lean"
  , "Checks/Axiom/YangMillsAPlusSubobligationLedgerAudit.lean"
  , "Checks/Axiom/YangMillsAPlusClosureProtocolAudit.lean"
  , "Checks/Axiom/YangMillsAPlusStemToSternTargetAudit.lean"
  , "Checks/Axiom/YangMillsAPlusSourceCrosswalkAudit.lean"
  , "Checks/Axiom/YangMillsAPlusProgressLedgerAudit.lean"
  ]

def ymAPlusAuditRunnerLeanFiles : List String :=
  ymAPlusFocusedObligationAuditFiles ++
    ymAPlusGlobalAuditFiles

def ymAPlusCanonicalAuditRunnerLeanFiles : List String :=
  [ "Checks/Axiom/YangMillsLatticeGapObligationAudit.lean"
  , "Checks/Axiom/YangMillsSharpLocalObligationAudit.lean"
  , "Checks/Axiom/YangMillsContinuumTransportObligationAudit.lean"
  , "Checks/Axiom/YangMillsOSWightmanObligationAudit.lean"
  , "Checks/Axiom/YangMillsMinkowskiGapObligationAudit.lean"
  , "Checks/Axiom/YangMillsEndpointExactnessObligationAudit.lean"
  , "Checks/Axiom/YangMillsClayExtensionObligationAudit.lean"
  , "Checks/Axiom/YangMillsAPlusFullAudit.lean"
  , "Checks/Axiom/YangMillsAPlusObligationLedgerAudit.lean"
  , "Checks/Axiom/YangMillsAPlusSubobligationLedgerAudit.lean"
  , "Checks/Axiom/YangMillsAPlusClosureProtocolAudit.lean"
  , "Checks/Axiom/YangMillsAPlusStemToSternTargetAudit.lean"
  , "Checks/Axiom/YangMillsAPlusSourceCrosswalkAudit.lean"
  , "Checks/Axiom/YangMillsAPlusProgressLedgerAudit.lean"
  ]

theorem ymAPlusFocusedObligationAuditFiles_count_eq :
    ymAPlusFocusedObligationAuditFiles.length = 7 := by
  rfl

theorem ymAPlusGlobalAuditFiles_count_eq :
    ymAPlusGlobalAuditFiles.length = 7 := by
  rfl

theorem ymAPlusAuditRunnerLeanFiles_count_eq :
    ymAPlusAuditRunnerLeanFiles.length = 14 := by
  rfl

theorem ymAPlusAuditRunnerLeanFiles_decomposes :
    ymAPlusAuditRunnerLeanFiles =
      ymAPlusFocusedObligationAuditFiles ++
        ymAPlusGlobalAuditFiles := by
  rfl

theorem ymAPlusAuditRunnerLeanFiles_match_canonical :
    ymAPlusAuditRunnerLeanFiles =
      ymAPlusCanonicalAuditRunnerLeanFiles := by
  rfl

def ymAPlusFocusedObligationAuditFilesDuplicateFreeBool : Bool :=
  ymAPlusFocusedObligationAuditFiles.length ==
    ymAPlusFocusedObligationAuditFiles.eraseDups.length

theorem ymAPlusFocusedObligationAuditFilesDuplicateFreeBool_eq_true :
    ymAPlusFocusedObligationAuditFilesDuplicateFreeBool = true := by
  rfl

def ymAPlusGlobalAuditFilesDuplicateFreeBool : Bool :=
  ymAPlusGlobalAuditFiles.length ==
    ymAPlusGlobalAuditFiles.eraseDups.length

theorem ymAPlusGlobalAuditFilesDuplicateFreeBool_eq_true :
    ymAPlusGlobalAuditFilesDuplicateFreeBool = true := by
  rfl

def ymAPlusCanonicalAuditRunnerLeanFilesDuplicateFreeBool : Bool :=
  ymAPlusCanonicalAuditRunnerLeanFiles.length ==
    ymAPlusCanonicalAuditRunnerLeanFiles.eraseDups.length

theorem ymAPlusCanonicalAuditRunnerLeanFilesDuplicateFreeBool_eq_true :
    ymAPlusCanonicalAuditRunnerLeanFilesDuplicateFreeBool = true := by
  rfl

def ymAPlusAuditRunnerLeanFilesDuplicateFreeBool : Bool :=
  ymAPlusAuditRunnerLeanFiles.length ==
    ymAPlusAuditRunnerLeanFiles.eraseDups.length

theorem ymAPlusAuditRunnerLeanFilesDuplicateFreeBool_eq_true :
    ymAPlusAuditRunnerLeanFilesDuplicateFreeBool = true := by
  rfl

def ymAPlusFocusedGlobalAuditFilesDisjointBool : Bool :=
  ymAPlusFocusedObligationAuditFiles.all
    (fun file => !(ymAPlusGlobalAuditFiles.contains file))

theorem ymAPlusFocusedGlobalAuditFilesDisjointBool_eq_true :
    ymAPlusFocusedGlobalAuditFilesDisjointBool = true := by
  rfl

def ymAPlusAuditRunnerLeanFilesPopulatedBool : Bool :=
  ymAPlusAuditRunnerLeanFiles.all
    (fun file => !file.isEmpty)

theorem ymAPlusAuditRunnerLeanFilesPopulatedBool_eq_true :
    ymAPlusAuditRunnerLeanFilesPopulatedBool = true := by
  rfl

def ymAPlusSourceCrosswalk_exactTheoremProjections : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.exactTheoremProjection)

theorem ymAPlusSourceCrosswalk_exactTheoremProjectionCount_eq :
    ymAPlusSourceCrosswalk_exactTheoremProjections.length =
      ymAPlusExactTheoremWitnessCount := by
  rfl

def ymAPlusRequiredVerifiedHypothesisMapNames : List String :=
  [ "ymAPlusFixedLatticeExactTheoremHypothesisMapVerified"
  , "ymAPlusSharpLocalExactTheoremHypothesisMapVerified"
  , "ymAPlusContinuumTransportExactTheoremHypothesisMapVerified"
  , "ymAPlusOSWightmanExactTheoremHypothesisMapVerified"
  , "ymAPlusMinkowskiExactTheoremHypothesisMapVerified"
  , "ymAPlusEndpointExactnessExactTheoremHypothesisMapVerified"
  , "ymAPlusClayExtensionExactTheoremHypothesisMapVerified"
  ]

def ymAPlusVerifiedHypothesisMapNames : List String := []

theorem ymAPlusRequiredVerifiedHypothesisMapNames_count_eq :
    ymAPlusRequiredVerifiedHypothesisMapNames.length =
      ymAPlusObligations.length := by
  rfl

theorem ymAPlusVerifiedHypothesisMapNames_count_eq :
    ymAPlusVerifiedHypothesisMapNames.length = 0 := by
  rfl

def ymAPlusRequiredVerifiedHypothesisMapNamesPopulatedBool : Bool :=
  ymAPlusRequiredVerifiedHypothesisMapNames.all
    (fun name => !name.isEmpty)

theorem ymAPlusRequiredVerifiedHypothesisMapNamesPopulatedBool_eq_true :
    ymAPlusRequiredVerifiedHypothesisMapNamesPopulatedBool = true := by
  rfl

def ymAPlusRequiredVerifiedHypothesisMapNamesDuplicateFreeBool : Bool :=
  ymAPlusRequiredVerifiedHypothesisMapNames.length ==
    ymAPlusRequiredVerifiedHypothesisMapNames.eraseDups.length

theorem ymAPlusRequiredVerifiedHypothesisMapNamesDuplicateFreeBool_eq_true :
    ymAPlusRequiredVerifiedHypothesisMapNamesDuplicateFreeBool = true := by
  rfl

structure YMAPlusHypothesisMapGapEntry where
  title : String
  currentSocket : String
  standardImportFile : String
  firstOpenSubobligation : String
  exactTheoremProjection : String
  routeHypothesisMap : String
  completionProjection : String
  requiredVerifiedHypothesisMap : String
  verified : Bool

def ymAPlusHypothesisMapGapCrosswalk :
    List YMAPlusHypothesisMapGapEntry :=
  [ { title := "Fixed-lattice spectral gap"
      currentSocket := "YMStandardFixedLatticeGapTransfer"
      standardImportFile :=
        "MaleyLean/Papers/YangMills/Kernel/StandardLatticeGapBackground.lean"
      firstOpenSubobligation :=
        "Define the finite-lattice Yang-Mills Hamiltonian"
      exactTheoremProjection :=
        "ymAPlusFixedLatticeCertificate_requires_exact_theorem"
      routeHypothesisMap := "YMLatticeGapHypothesisMap"
      completionProjection :=
        "YMLatticeGapHypothesisMap.completeTransferHypotheses"
      requiredVerifiedHypothesisMap :=
        "ymAPlusFixedLatticeExactTheoremHypothesisMapVerified"
      verified := false }
  , { title := "Sharp-local finite-cap and inductive-union construction"
      currentSocket := "YMStandardSharpLocalConstructionTransfer"
      standardImportFile :=
        "MaleyLean/Papers/YangMills/Kernel/StandardSharpLocalBackground.lean"
      firstOpenSubobligation :=
        "Define finite-cap windows and their local algebra data"
      exactTheoremProjection :=
        "ymAPlusSharpLocalCertificate_requires_exact_theorem"
      routeHypothesisMap := "YMSharpLocalHypothesisMap"
      completionProjection :=
        "YMSharpLocalHypothesisMap.completeTransferHypotheses"
      requiredVerifiedHypothesisMap :=
        "ymAPlusSharpLocalExactTheoremHypothesisMapVerified"
      verified := false }
  , { title := "Weak-window / QE3 continuum transport"
      currentSocket := "YMStandardContinuumTransportTransfer"
      standardImportFile :=
        "MaleyLean/Papers/YangMills/Kernel/StandardContinuumTransportBackground.lean"
      firstOpenSubobligation := "Define the weak-window certificate"
      exactTheoremProjection :=
        "ymAPlusContinuumTransportCertificate_requires_exact_theorem"
      routeHypothesisMap := "YMContinuumTransportHypothesisMap"
      completionProjection :=
        "YMContinuumTransportHypothesisMap.completeTransferHypotheses"
      requiredVerifiedHypothesisMap :=
        "ymAPlusContinuumTransportExactTheoremHypothesisMapVerified"
      verified := false }
  , { title := "OS/Wightman reconstruction background"
      currentSocket := "YMStandardOSWightmanBackground"
      standardImportFile :=
        "MaleyLean/Papers/YangMills/Kernel/StandardOSWightmanBackground.lean"
      firstOpenSubobligation := "State and verify the OS axioms"
      exactTheoremProjection :=
        "ymAPlusOSWightmanCertificate_requires_exact_theorem"
      routeHypothesisMap := "YMOSWightmanReconstructionPayloadBridge"
      completionProjection :=
        "YMOSWightmanReconstructionPayloadBridge.outputs"
      requiredVerifiedHypothesisMap :=
        "ymAPlusOSWightmanExactTheoremHypothesisMapVerified"
      verified := false }
  , { title := "Minkowski Hamiltonian mass-gap transfer"
      currentSocket :=
        "YMStandardMinkowskiGapTransfer and YMStandardHamiltonianDynamicsBackground"
      standardImportFile :=
        "MaleyLean/Papers/YangMills/Kernel/StandardMinkowskiGapBackground.lean"
      firstOpenSubobligation := "Construct the time-translation group"
      exactTheoremProjection :=
        "ymAPlusMinkowskiCertificate_requires_exact_theorem"
      routeHypothesisMap := "YMRouteMinkowskiGapHypothesisMap"
      completionProjection :=
        "YMRouteMinkowskiGapHypothesisMap.completeTransferHypotheses"
      requiredVerifiedHypothesisMap :=
        "ymAPlusMinkowskiExactTheoremHypothesisMapVerified"
      verified := false }
  , { title := "Endpoint exactness and extended-support exclusion"
      currentSocket := "YMStandardEndpointExactnessTransfer"
      standardImportFile :=
        "MaleyLean/Papers/YangMills/Kernel/StandardEndpointExactnessBackground.lean"
      firstOpenSubobligation := "Define exact local-net endpoint"
      exactTheoremProjection :=
        "ymAPlusEndpointCertificate_requires_exact_theorem"
      routeHypothesisMap := "YMEndpointExactnessHypothesisMap"
      completionProjection :=
        "YMEndpointExactnessHypothesisMap.completeTransferHypotheses"
      requiredVerifiedHypothesisMap :=
        "ymAPlusEndpointExactnessExactTheoremHypothesisMapVerified"
      verified := false }
  , { title := "Clay extension admissibility and GNS spectral bridge"
      currentSocket := "StandardClayExtensionTransfer"
      standardImportFile :=
        "MaleyLean/Papers/YangMills/StandardClayExtensionBackground.lean"
      firstOpenSubobligation := "Prove the support class is fixed"
      exactTheoremProjection :=
        "ymAPlusClayExtensionCertificate_requires_exact_theorem"
      routeHypothesisMap := "ClayExtensionHypothesisMap"
      completionProjection :=
        "ClayExtensionHypothesisMap.completeTransferHypotheses"
      requiredVerifiedHypothesisMap :=
        "ymAPlusClayExtensionExactTheoremHypothesisMapVerified"
      verified := false }
  ]

def ymAPlusHypothesisMapGapCrosswalk_titles : List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.title)

def ymAPlusHypothesisMapGapCrosswalk_currentSockets : List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.currentSocket)

def ymAPlusHypothesisMapGapCrosswalk_standardImportFiles :
    List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.standardImportFile)

def ymAPlusHypothesisMapGapCrosswalk_firstOpenSubobligations :
    List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.firstOpenSubobligation)

def ymAPlusHypothesisMapGapCrosswalk_exactTheoremProjections :
    List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.exactTheoremProjection)

def ymAPlusHypothesisMapGapCrosswalk_routeHypothesisMaps :
    List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.routeHypothesisMap)

def ymAPlusHypothesisMapGapCrosswalk_completionProjections :
    List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.completionProjection)

def ymAPlusHypothesisMapGapCrosswalk_requiredMaps : List String :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.requiredVerifiedHypothesisMap)

def ymAPlusHypothesisMapGapCrosswalk_verifiedFlags : List Bool :=
  ymAPlusHypothesisMapGapCrosswalk.map
    (fun E => E.verified)

theorem ymAPlusHypothesisMapGapCrosswalk_length_eq :
    ymAPlusHypothesisMapGapCrosswalk.length = 7 := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_titles_match :
    ymAPlusHypothesisMapGapCrosswalk_titles =
      ymAPlusObligationTitles := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_currentSockets_match :
    ymAPlusHypothesisMapGapCrosswalk_currentSockets =
      ymAPlusSourceCrosswalk_currentSockets := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_standardImportFiles_match :
    ymAPlusHypothesisMapGapCrosswalk_standardImportFiles =
      ymAPlusSourceCrosswalk_standardImportFiles := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_firstOpenSubobligations_match :
    ymAPlusHypothesisMapGapCrosswalk_firstOpenSubobligations =
      ymAPlusFirstSubobligationTitles := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_exactTheoremProjections_match :
    ymAPlusHypothesisMapGapCrosswalk_exactTheoremProjections =
      ymAPlusSourceCrosswalk_exactTheoremProjections := by
  rfl

def ymAPlusCanonicalRouteHypothesisMapNames : List String :=
  [ "YMLatticeGapHypothesisMap"
  , "YMSharpLocalHypothesisMap"
  , "YMContinuumTransportHypothesisMap"
  , "YMOSWightmanReconstructionPayloadBridge"
  , "YMRouteMinkowskiGapHypothesisMap"
  , "YMEndpointExactnessHypothesisMap"
  , "ClayExtensionHypothesisMap"
  ]

def ymAPlusCanonicalHypothesisMapCompletionProjections : List String :=
  [ "YMLatticeGapHypothesisMap.completeTransferHypotheses"
  , "YMSharpLocalHypothesisMap.completeTransferHypotheses"
  , "YMContinuumTransportHypothesisMap.completeTransferHypotheses"
  , "YMOSWightmanReconstructionPayloadBridge.outputs"
  , "YMRouteMinkowskiGapHypothesisMap.completeTransferHypotheses"
  , "YMEndpointExactnessHypothesisMap.completeTransferHypotheses"
  , "ClayExtensionHypothesisMap.completeTransferHypotheses"
  ]

theorem ymAPlusHypothesisMapGapCrosswalk_routeHypothesisMaps_match :
    ymAPlusHypothesisMapGapCrosswalk_routeHypothesisMaps =
      ymAPlusCanonicalRouteHypothesisMapNames := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_completionProjections_match :
    ymAPlusHypothesisMapGapCrosswalk_completionProjections =
      ymAPlusCanonicalHypothesisMapCompletionProjections := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_requiredMaps_match :
    ymAPlusHypothesisMapGapCrosswalk_requiredMaps =
      ymAPlusRequiredVerifiedHypothesisMapNames := by
  rfl

theorem ymAPlusHypothesisMapGapCrosswalk_verifiedFlags_eq :
    ymAPlusHypothesisMapGapCrosswalk_verifiedFlags =
      [false, false, false, false, false, false, false] := by
  rfl

def ymAPlusHypothesisMapGapCrosswalk_allOpenBool : Bool :=
  ymAPlusHypothesisMapGapCrosswalk.all
    (fun E => E.verified == false)

theorem ymAPlusHypothesisMapGapCrosswalk_allOpenBool_eq_true :
    ymAPlusHypothesisMapGapCrosswalk_allOpenBool = true := by
  rfl

def ymAPlusSourceCrosswalk_payloadProjections : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.payloadProjection)

theorem ymAPlusSourceCrosswalk_payloadProjectionCount_eq :
    ymAPlusSourceCrosswalk_payloadProjections.length =
      ymAPlusObligations.length := by
  rfl

def ymAPlusSourceCrosswalk_payloadBridgeProjections : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.payloadBridgeProjection)

theorem ymAPlusSourceCrosswalk_payloadBridgeProjectionCount_eq :
    ymAPlusSourceCrosswalk_payloadBridgeProjections.length =
      ymAPlusObligations.length := by
  rfl

def ymAPlusSourceCrosswalk_standardSocketProjections : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.standardSocketProjection)

theorem ymAPlusSourceCrosswalk_standardSocketProjectionCount_eq :
    ymAPlusSourceCrosswalk_standardSocketProjections.length =
      ymAPlusObligations.length := by
  rfl

def ymAPlusSourceCrosswalk_finalTargetProjections : List String :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.finalTargetProjection)

theorem ymAPlusSourceCrosswalk_finalTargetProjectionCount_eq :
    ymAPlusSourceCrosswalk_finalTargetProjections.length =
      ymAPlusObligations.length := by
  rfl

def ymAPlusSourceCrosswalk_globalAuditSurfaceProjections : List String :=
  [ "YMAuditedAPlusCertificateBundle.nonDependentAuditSurfaceComplete_holds"
  , "APlusStemToSternClayEndpoint.auditSurfaceComplete_holds"
  ]

theorem ymAPlusSourceCrosswalk_globalAuditSurfaceProjectionCount_eq :
    ymAPlusSourceCrosswalk_globalAuditSurfaceProjections.length = 2 := by
  rfl

def ymAPlusSourceCrosswalk_globalAuditSurfacePopulatedBool : Bool :=
  ymAPlusSourceCrosswalk_globalAuditSurfaceProjections.all
    (fun name => !name.isEmpty)

theorem ymAPlusSourceCrosswalk_globalAuditSurfacePopulatedBool_eq_true :
    ymAPlusSourceCrosswalk_globalAuditSurfacePopulatedBool = true := by
  rfl

def ymAPlusSourceCrosswalk_majorColumnCountsComplete : Prop :=
  ymAPlusSourceCrosswalk.length = ymAPlusObligations.length /\
  ymAPlusSourceCrosswalk_exactTheoremProjections.length =
    ymAPlusExactTheoremWitnessCount /\
  ymAPlusSourceCrosswalk_payloadProjections.length =
    ymAPlusObligations.length /\
  ymAPlusSourceCrosswalk_payloadBridgeProjections.length =
    ymAPlusObligations.length /\
  ymAPlusSourceCrosswalk_standardSocketProjections.length =
    ymAPlusObligations.length /\
  ymAPlusSourceCrosswalk_finalTargetProjections.length =
    ymAPlusObligations.length /\
  ymAPlusSourceCrosswalk_globalAuditSurfaceProjections.length = 2

theorem ymAPlusSourceCrosswalk_majorColumnCountsComplete_holds :
    ymAPlusSourceCrosswalk_majorColumnCountsComplete := by
  exact
    And.intro
      ymAPlusSourceCrosswalk_length
      (And.intro
        ymAPlusSourceCrosswalk_exactTheoremProjectionCount_eq
        (And.intro
          ymAPlusSourceCrosswalk_payloadProjectionCount_eq
          (And.intro
            ymAPlusSourceCrosswalk_payloadBridgeProjectionCount_eq
            (And.intro
              ymAPlusSourceCrosswalk_standardSocketProjectionCount_eq
              (And.intro
                ymAPlusSourceCrosswalk_finalTargetProjectionCount_eq
                ymAPlusSourceCrosswalk_globalAuditSurfaceProjectionCount_eq)))))

def ymAPlusSourceCrosswalk_subobligationCounts : List Nat :=
  ymAPlusSourceCrosswalk.map
    (fun E => E.subobligationCount)

def ymAPlusSourceCrosswalk_subobligationTotalCount : Nat :=
  ymAPlusSourceCrosswalk_subobligationCounts.foldl Nat.add 0

theorem ymAPlusSourceCrosswalk_subobligationCounts_match_ledger :
    ymAPlusSourceCrosswalk_subobligationCounts =
      ymAPlusSubobligationCounts := by
  rfl

theorem ymAPlusSourceCrosswalk_subobligationTotalCount_eq :
    ymAPlusSourceCrosswalk_subobligationTotalCount = 44 := by
  rfl

def ymAPlusSourceCrosswalk_entries_match_bool : Bool :=
  ymAPlusSourceCrosswalk.all
    YMAPlusSourceCrosswalkEntry.matchesObligationBool

theorem ymAPlusSourceCrosswalk_entries_match_bool_eq_true :
    ymAPlusSourceCrosswalk_entries_match_bool = true := by
  rfl

def ymAPlusSourceCrosswalk_entries_have_audit_surface_bool : Bool :=
  ymAPlusSourceCrosswalk.all
    YMAPlusSourceCrosswalkEntry.hasAuditSurfaceBool

theorem ymAPlusSourceCrosswalk_entries_have_audit_surface_bool_eq_true :
    ymAPlusSourceCrosswalk_entries_have_audit_surface_bool = true := by
  rfl

def ymAPlusSourceCrosswalk_auditComplete : Prop :=
  ymAPlusSourceCrosswalk_obligations = ymAPlusObligations /\
  ymAPlusSourceCrosswalk_titles = ymAPlusObligationTitles /\
  ymAPlusSourceCrosswalk_currentSockets =
    ymAPlusObligationCurrentSockets /\
  ymAPlusSourceCrosswalk_requiredClosures =
    ymAPlusObligationRequiredClosures /\
  ymAPlusSourceCrosswalk_auditFiles =
    ymAPlusFocusedObligationAuditFiles /\
  ymAPlusSourceCrosswalk_standardImportFiles =
    ymAPlusCanonicalStandardImportFiles /\
  ymAPlusSourceCrosswalk_subobligationLedgers =
    ymAPlusCanonicalSubobligationLedgers /\
  ymAPlusSourceCrosswalk_certificateTypes =
    ymAPlusCanonicalCertificateTypes /\
  ymAPlusSourceCrosswalk_closureGates =
    ymAPlusCanonicalClosureGates /\
  ymAPlusFocusedObligationAuditFiles.length = 7 /\
  ymAPlusGlobalAuditFiles.length = 7 /\
  ymAPlusAuditRunnerLeanFiles =
    ymAPlusFocusedObligationAuditFiles ++
      ymAPlusGlobalAuditFiles /\
  ymAPlusAuditRunnerLeanFiles =
    ymAPlusCanonicalAuditRunnerLeanFiles /\
  ymAPlusAuditRunnerLeanFilesDuplicateFreeBool = true /\
  ymAPlusFocusedGlobalAuditFilesDisjointBool = true /\
  ymAPlusAuditRunnerLeanFiles.length = 14 /\
  ymAPlusAuditRunnerLeanFilesPopulatedBool = true /\
  ymAPlusSourceCrosswalk_majorColumnCountsComplete /\
  ymAPlusSourceCrosswalk_subobligationCounts =
    ymAPlusSubobligationCounts /\
  ymAPlusSourceCrosswalk_subobligationTotalCount = 44 /\
  ymAPlusSourceCrosswalk_entries_match_bool = true /\
  ymAPlusSourceCrosswalk_entries_have_audit_surface_bool = true /\
  ymAPlusSourceCrosswalk_globalAuditSurfacePopulatedBool = true

theorem ymAPlusSourceCrosswalk_auditComplete_holds :
    ymAPlusSourceCrosswalk_auditComplete := by
  repeat' constructor

end YangMills
end Papers
end MaleyLean
