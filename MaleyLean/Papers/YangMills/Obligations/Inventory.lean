import MaleyLean.Papers.YangMills.Surface.DependencySkeleton

namespace MaleyLean

/--
Concrete manuscript-architecture inventory for the hardened Yang--Mills suite.

This inventory does not attempt to formalize the QFT/PDE arguments themselves.
Instead it records the structural burden split visible in the archive: live
theorem-routing burden, audit-kernel extraction, closure packaging, and
reserve/support material.
-/
inductive YMManuscriptObligation
  | ultravioletRouteClosure
  | route1GapClosure
  | laneAConstructiveClosure
  | qe3TransportClosure
  | endpointPacketClosure
  | proofKernelExtraction
  | closureGatePackaging
  | reserveSupportExclusion
  deriving DecidableEq, Repr

def ym_inventory_is_live_theorem_burden
  (o : YMManuscriptObligation) : Prop :=
  o = .ultravioletRouteClosure \/
  o = .route1GapClosure \/
  o = .laneAConstructiveClosure \/
  o = .qe3TransportClosure \/
  o = .endpointPacketClosure

def ym_inventory_is_audit_extraction
  (o : YMManuscriptObligation) : Prop :=
  o = .proofKernelExtraction

def ym_inventory_is_organizational_only
  (o : YMManuscriptObligation) : Prop :=
  o = .closureGatePackaging

def ym_inventory_is_reserve_only
  (o : YMManuscriptObligation) : Prop :=
  o = .reserveSupportExclusion

def ym_inventory_complete : Prop :=
  forall o : YMManuscriptObligation,
    ym_inventory_is_live_theorem_burden o \/
    ym_inventory_is_audit_extraction o \/
    ym_inventory_is_organizational_only o \/
    ym_inventory_is_reserve_only o

theorem YangMillsInventoryCompleteStatement :
  ym_inventory_complete := by
  intro o
  cases o
  · exact Or.inl (Or.inl rfl)
  · exact Or.inl (Or.inr (Or.inl rfl))
  · exact Or.inl (Or.inr (Or.inr (Or.inl rfl)))
  · exact Or.inl (Or.inr (Or.inr (Or.inr (Or.inl rfl))))
  · exact Or.inl (Or.inr (Or.inr (Or.inr (Or.inr rfl))))
  · exact Or.inr (Or.inl rfl)
  · exact Or.inr (Or.inr (Or.inl rfl))
  · exact Or.inr (Or.inr (Or.inr rfl))

theorem YangMillsLiveBurdenInventoryStatement :
  ym_inventory_is_live_theorem_burden .ultravioletRouteClosure /\
  ym_inventory_is_live_theorem_burden .route1GapClosure /\
  ym_inventory_is_live_theorem_burden .laneAConstructiveClosure /\
  ym_inventory_is_live_theorem_burden .qe3TransportClosure /\
  ym_inventory_is_live_theorem_burden .endpointPacketClosure := by
  exact And.intro (Or.inl rfl) <|
    And.intro (Or.inr (Or.inl rfl)) <|
    And.intro (Or.inr (Or.inr (Or.inl rfl))) <|
    And.intro (Or.inr (Or.inr (Or.inr (Or.inl rfl))))
      (Or.inr (Or.inr (Or.inr (Or.inr rfl))))

theorem YangMillsAuditExtractionInventoryStatement :
  ym_inventory_is_audit_extraction .proofKernelExtraction := by
  rfl

theorem YangMillsClosurePackagingInventoryStatement :
  ym_inventory_is_organizational_only .closureGatePackaging := by
  rfl

theorem YangMillsReserveInventoryStatement :
  ym_inventory_is_reserve_only .reserveSupportExclusion := by
  rfl

end MaleyLean
