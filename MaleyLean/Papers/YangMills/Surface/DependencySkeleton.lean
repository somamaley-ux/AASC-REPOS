namespace MaleyLean

/--
Manuscript roots appearing in the hardened Yang--Mills source suite.

This first scaffold tracks the package architecture only. It does not claim
closure of the underlying QFT or PDE arguments in Lean.
-/
inductive YMManuscriptRoot
  | core
  | companion1
  | companion2
  | companion3
  | proofKernel
  | phase9ClosureGate
  | refereeDossier
  | analyticCertificationDossier
  | refereeConcordanceNote
  | canonicalSourceTree
  deriving DecidableEq, Repr

/-- High-level role assigned to each manuscript root. -/
inductive YMRootRole
  | liveProofSurface
  | expertAuditKernel
  | organizationalClosure
  | reserveMaterial
  deriving DecidableEq, Repr

def ym_root_role (r : YMManuscriptRoot) : YMRootRole :=
  match r with
  | .core => .liveProofSurface
  | .companion1 => .liveProofSurface
  | .companion2 => .liveProofSurface
  | .companion3 => .liveProofSurface
  | .proofKernel => .expertAuditKernel
  | .phase9ClosureGate => .organizationalClosure
  | .refereeDossier => .reserveMaterial
  | .analyticCertificationDossier => .reserveMaterial
  | .refereeConcordanceNote => .reserveMaterial
  | .canonicalSourceTree => .reserveMaterial

/-- Core-paper packet headings extracted from `core.tex`. -/
inductive YMCoreSection
  | mainTheoremScope
  | publicProofSpine
  | uvGate
  | route1LatticeGap
  | laneASharpLocalConstruction
  | qe3Transport
  | endpointPacket
  | assembly
  deriving DecidableEq, Repr

/-- The three live companions attached to the core paper. -/
inductive YMCompanion
  | ultravioletGateAndRoute1
  | laneASharpLocalConstruction
  | reconstructionAndUniversality
  deriving DecidableEq, Repr

/-- First proof-home owner for each core section. -/
def ym_core_section_owner (s : YMCoreSection) : Option YMCompanion :=
  match s with
  | .mainTheoremScope => none
  | .publicProofSpine => none
  | .uvGate => some .ultravioletGateAndRoute1
  | .route1LatticeGap => some .ultravioletGateAndRoute1
  | .laneASharpLocalConstruction => some .laneASharpLocalConstruction
  | .qe3Transport => some .ultravioletGateAndRoute1
  | .endpointPacket => some .reconstructionAndUniversality
  | .assembly => none

/-- The proof kernel is an extraction from the live surface, not a new proof. -/
def ym_kernel_adds_new_mathematics : Prop := False

/-- Reserve material is outside the live proof burden. -/
def ym_root_is_live_burden (r : YMManuscriptRoot) : Prop :=
  ym_root_role r = .liveProofSurface

theorem YangMillsLiveProofSurfaceRootsStatement :
  ym_root_role .core = .liveProofSurface /\
  ym_root_role .companion1 = .liveProofSurface /\
  ym_root_role .companion2 = .liveProofSurface /\
  ym_root_role .companion3 = .liveProofSurface := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

theorem YangMillsKernelRoleStatement :
  ym_root_role .proofKernel = .expertAuditKernel /\
  ym_kernel_adds_new_mathematics = False := by
  exact And.intro rfl rfl

theorem YangMillsClosureGateRoleStatement :
  ym_root_role .phase9ClosureGate = .organizationalClosure := by
  rfl

theorem YangMillsReserveRootsStatement :
  ym_root_role .refereeDossier = .reserveMaterial /\
  ym_root_role .analyticCertificationDossier = .reserveMaterial /\
  ym_root_role .refereeConcordanceNote = .reserveMaterial /\
  ym_root_role .canonicalSourceTree = .reserveMaterial := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

theorem YangMillsCoreSectionOwnershipStatement :
  ym_core_section_owner .mainTheoremScope = none /\
  ym_core_section_owner .publicProofSpine = none /\
  ym_core_section_owner .uvGate = some .ultravioletGateAndRoute1 /\
  ym_core_section_owner .route1LatticeGap = some .ultravioletGateAndRoute1 /\
  ym_core_section_owner .laneASharpLocalConstruction = some .laneASharpLocalConstruction /\
  ym_core_section_owner .qe3Transport = some .ultravioletGateAndRoute1 /\
  ym_core_section_owner .endpointPacket = some .reconstructionAndUniversality /\
  ym_core_section_owner .assembly = none := by
  exact And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl <|
    And.intro rfl rfl

theorem YangMillsCompanionCoverageStatement :
  (ym_core_section_owner .uvGate = some .ultravioletGateAndRoute1 /\
    ym_core_section_owner .route1LatticeGap = some .ultravioletGateAndRoute1 /\
    ym_core_section_owner .qe3Transport = some .ultravioletGateAndRoute1) /\
  (ym_core_section_owner .laneASharpLocalConstruction =
      some .laneASharpLocalConstruction) /\
  (ym_core_section_owner .endpointPacket = some .reconstructionAndUniversality) := by
  exact And.intro
    (And.intro rfl (And.intro rfl rfl))
    (And.intro rfl rfl)

end MaleyLean
