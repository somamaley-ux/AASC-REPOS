import MaleyLean.Papers.YangMills.Extension.EndpointConcreteTheoremScopeBridge

namespace MaleyLean

namespace YMExtendedSupportObject

variable {S : YMManuscriptTheoremScope}

/--
The manuscript's theorem-scope global-form datum: the label carried by a
theorem-scope extended-support object, remembering whether it came from line or
surface sector data.
-/
def globalFormDatum : YMExtendedSupportObject S -> Sum S.LineLabel S.SurfaceLabel
  | .lineObj _ a => Sum.inl a
  | .surfaceObj _ a => Sum.inr a

/-- Predicate used by the Section 7 theorem surface. -/
def sameLocalShadowDifferentGlobalForm
    (xi eta : YMExtendedSupportObject S) : Prop :=
  localShadow xi = localShadow eta /\ globalFormDatum xi ≠ globalFormDatum eta

theorem supportEq_implies_sameLocalShadow
    {xi eta : YMExtendedSupportObject S}
    (h : SupportEq xi eta) :
    localShadow xi = localShadow eta := by
  cases xi <;> cases eta <;> simp [SupportEq, localShadow] at h ⊢
  case lineObj.lineObj =>
    rcases h with ⟨rfl, rfl⟩
    rfl
  case surfaceObj.surfaceObj =>
    rcases h with ⟨rfl, rfl⟩
    rfl

end YMExtendedSupportObject

/--
Abstract Section 7 recovery package.

This isolates the theorem surface needed for global-form recovery: once a bridge
has been built and one has the theorem-scope distinction principle saying that
same-shadow / different-global-form objects determine different sector classes,
all downstream recovery corollaries follow uniformly.
-/
structure YMGlobalFormRecoveryPackage
    {S : YMManuscriptTheoremScope}
    (B : YMTheoremScopeSectorBridge (YMExtendedSupportObject S)) where
  sector_distinguishes :
    forall {xi eta : YMExtendedSupportObject S},
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta ->
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta ->
      YMTheoremScopeSectorBridge.sectorAssignment B xi ≠
        YMTheoremScopeSectorBridge.sectorAssignment B eta

namespace YMGlobalFormRecoveryPackage

variable {S : YMManuscriptTheoremScope}
variable {B : YMTheoremScopeSectorBridge (YMExtendedSupportObject S)}

theorem sectorAssignment_ne_of_sameShadow_differentGlobalForm
    (P : YMGlobalFormRecoveryPackage B)
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta) :
    YMTheoremScopeSectorBridge.sectorAssignment B xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment B eta := by
  simpa using
    (YMGlobalFormRecoveryPackage.sector_distinguishes (B := B) P hShadow hGF)

theorem sectorAssignment_ne_of_splitHypothesis
    (P : YMGlobalFormRecoveryPackage B)
    {xi eta : YMExtendedSupportObject S}
    (h :
      YMExtendedSupportObject.sameLocalShadowDifferentGlobalForm xi eta) :
    YMTheoremScopeSectorBridge.sectorAssignment B xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment B eta := by
  simpa using
    (YMGlobalFormRecoveryPackage.sector_distinguishes (B := B) P h.1 h.2)

end YMGlobalFormRecoveryPackage

namespace YMManuscriptDeformationData

variable {S : YMManuscriptTheoremScope}
variable (D : YMManuscriptDeformationData S)

theorem not_objectDeformationEq_of_sameShadow_differentGlobalForm
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta) :
    ¬ D.objectDeformationEq xi eta := by
  cases xi with
  | lineObj l1 a1 =>
      cases eta with
      | lineObj l2 a2 =>
          cases hShadow
          intro hDef
          rcases hDef with ⟨_, hLabel⟩
          apply hGF
          simp [YMExtendedSupportObject.globalFormDatum, hLabel]
      | surfaceObj s2 b2 =>
          cases hShadow
  | surfaceObj s1 b1 =>
      cases eta with
      | lineObj l2 a2 =>
          cases hShadow
      | surfaceObj s2 b2 =>
          cases hShadow
          intro hDef
          rcases hDef with ⟨_, hLabel⟩
          apply hGF
          simp [YMExtendedSupportObject.globalFormDatum, hLabel]

end YMManuscriptDeformationData

/--
Concrete Companion III-facing distinction theorem: same strictly local shadow
but different theorem-scope global-form datum forces distinct sector classes in
the current quotient-level sector assignment.
-/
theorem YMCompanionIIISectorAssignmentNeOfSameShadowDifferentGlobalForm
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) eta := by
  intro hEq
  have hDef :
      D.objectDeformationEq xi eta := Quotient.exact hEq
  exact
    (YMManuscriptDeformationData.not_objectDeformationEq_of_sameShadow_differentGlobalForm
      D hShadow hGF) hDef

/--
Companion III-facing recovery theorem surface.

This packages the exact remaining manuscript seam after the concrete bridge has
been built: to obtain full Section 7 recovery, one still needs the distinction
principle separating same-shadow / different-global-form objects at sector
level. In the current post-freeze reading, this package should be treated as
the fixed Section 7 recovery surface attached to the chosen theorem-scope
bridge.
-/
abbrev YMCompanionIIIGlobalFormRecoveryPackage
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :=
  YMGlobalFormRecoveryPackage (YMCompanionIIITheoremScopeBridge I S D)

/--
Companion III-facing recovery surface over the packaged preferred theorem-scope
object.
-/
abbrev YMCompanionIIIGlobalFormRecoveryPackageOfPackage
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage) :=
  YMCompanionIIIGlobalFormRecoveryPackage I P.scope P.deformation

/--
Companion III-facing recovery package instantiated from the concrete theorem
that same-shadow / different-global-form objects determine distinct sector
classes.

This is the default realized Section 7 package for the current extension stack,
not merely one optional reconstruction of the recovery surface.
-/
def YMCompanionIIIGlobalFormRecoveryPackageFromDistinction
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :
    YMCompanionIIIGlobalFormRecoveryPackage I S D where
  sector_distinguishes := by
    intro xi eta hShadow hGF
    exact
      YMCompanionIIISectorAssignmentNeOfSameShadowDifferentGlobalForm
        I S D hShadow hGF

/--
Companion III-facing recovery package over the packaged preferred theorem-scope
object.
-/
def YMCompanionIIIGlobalFormRecoveryPackageFromDistinctionOfPackage
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage) :
    YMCompanionIIIGlobalFormRecoveryPackageOfPackage I P :=
  YMCompanionIIIGlobalFormRecoveryPackageFromDistinction I P.scope P.deformation

end MaleyLean
