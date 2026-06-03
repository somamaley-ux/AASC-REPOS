import MaleyLean.Papers.YangMills.Obligations.Inventory

namespace MaleyLean

/--
Paper-facing section-family ledger for the hardened Yang--Mills suite.

This aligns the manuscript's major section families with the architectural
inventory of obligations: live theorem burden, audit extraction, closure
packaging, and reserve material.
-/
inductive YMPaperSection
  | uvGateSection
  | route1Section
  | laneASection
  | qe3TransportSection
  | endpointSection
  | proofKernelSection
  | closureGateSection
  | reserveSupportSection
  deriving DecidableEq, Repr

def ym_section_obligation (s : YMPaperSection) : YMManuscriptObligation :=
  match s with
  | .uvGateSection => .ultravioletRouteClosure
  | .route1Section => .route1GapClosure
  | .laneASection => .laneAConstructiveClosure
  | .qe3TransportSection => .qe3TransportClosure
  | .endpointSection => .endpointPacketClosure
  | .proofKernelSection => .proofKernelExtraction
  | .closureGateSection => .closureGatePackaging
  | .reserveSupportSection => .reserveSupportExclusion

abbrev ym_section_is_live_theorem_burden (s : YMPaperSection) : Prop :=
  ym_inventory_is_live_theorem_burden (ym_section_obligation s)

abbrev ym_section_is_audit_extraction (s : YMPaperSection) : Prop :=
  ym_inventory_is_audit_extraction (ym_section_obligation s)

abbrev ym_section_is_organizational_only (s : YMPaperSection) : Prop :=
  ym_inventory_is_organizational_only (ym_section_obligation s)

abbrev ym_section_is_reserve_only (s : YMPaperSection) : Prop :=
  ym_inventory_is_reserve_only (ym_section_obligation s)

theorem YangMillsPaperSectionLedgerCompleteStatement :
  forall s : YMPaperSection,
    ym_section_is_live_theorem_burden s \/
    ym_section_is_audit_extraction s \/
    ym_section_is_organizational_only s \/
    ym_section_is_reserve_only s := by
  intro s
  cases s
  · exact Or.inl (Or.inl rfl)
  · exact Or.inl (Or.inr (Or.inl rfl))
  · exact Or.inl (Or.inr (Or.inr (Or.inl rfl)))
  · exact Or.inl (Or.inr (Or.inr (Or.inr (Or.inl rfl))))
  · exact Or.inl (Or.inr (Or.inr (Or.inr (Or.inr rfl))))
  · exact Or.inr (Or.inl rfl)
  · exact Or.inr (Or.inr (Or.inl rfl))
  · exact Or.inr (Or.inr (Or.inr rfl))

theorem YangMillsLiveSectionsStatement :
  ym_section_is_live_theorem_burden .uvGateSection /\
  ym_section_is_live_theorem_burden .route1Section /\
  ym_section_is_live_theorem_burden .laneASection /\
  ym_section_is_live_theorem_burden .qe3TransportSection /\
  ym_section_is_live_theorem_burden .endpointSection := by
  exact And.intro (Or.inl rfl) <|
    And.intro (Or.inr (Or.inl rfl)) <|
    And.intro (Or.inr (Or.inr (Or.inl rfl))) <|
    And.intro (Or.inr (Or.inr (Or.inr (Or.inl rfl))))
      (Or.inr (Or.inr (Or.inr (Or.inr rfl))))

theorem YangMillsKernelSectionStatement :
  ym_section_is_audit_extraction .proofKernelSection := by
  rfl

theorem YangMillsClosureGateSectionStatement :
  ym_section_is_organizational_only .closureGateSection := by
  rfl

theorem YangMillsReserveSectionStatement :
  ym_section_is_reserve_only .reserveSupportSection := by
  rfl

theorem YangMillsSectionRootAlignmentStatement :
  ym_root_role .core = .liveProofSurface /\
  ym_root_role .proofKernel = .expertAuditKernel /\
  ym_root_role .phase9ClosureGate = .organizationalClosure /\
  ym_root_role .refereeDossier = .reserveMaterial := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

end MaleyLean
