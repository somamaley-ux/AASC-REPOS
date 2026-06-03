import MaleyLean.Papers.YangMills.Extension.EndpointGlobalFormRecoveryFormalization

namespace MaleyLean

/--
Concrete tagged realized datum over the existing Companion III reconstructed
sector carrier.

This refines the earlier constant-carrier realization by retaining the
theorem-scope global-form datum inside the realized object itself.
-/
structure YMCompanionIIITaggedRealizedDatum
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope) where
  baseSector : YMCompanionIIIReconstructedSector I
  globalForm : Sum S.LineLabel S.SurfaceLabel

/--
Sharper Companion III-facing realization package: each theorem-scope object is
realized in the reconstructed-sector carrier together with its theorem-scope
global-form datum.
-/
def YMCompanionIIITaggedTheoremScopeRealization
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :
    YMManuscriptSectorRealization S D where
  Rep := fun xi =>
    { d : YMCompanionIIITaggedRealizedDatum I S //
        d.globalForm = YMExtendedSupportObject.globalFormDatum xi }
  realized := by
    intro xi
    cases xi with
    | lineObj l a =>
        refine ⟨{
          baseSector := ym_Hloc I
          globalForm := Sum.inl a
        }, ?_⟩
        rfl
    | surfaceObj s a =>
        refine ⟨{
          baseSector := ym_Hloc I
          globalForm := Sum.inr a
        }, ?_⟩
        rfl
  transport := by
    intro xi eta hDef
    cases xi with
    | lineObj l1 a1 =>
        cases eta with
        | lineObj l2 a2 =>
            simp [YMManuscriptDeformationData.objectDeformationEq] at hDef
            rcases hDef with ⟨_, hLabel⟩
            refine ⟨fun r => ?_⟩
            refine ⟨r.1, ?_⟩
            simpa [YMExtendedSupportObject.globalFormDatum, hLabel] using r.2
        | surfaceObj s2 b2 =>
            cases hDef
    | surfaceObj s1 b1 =>
        cases eta with
        | lineObj l2 a2 =>
            cases hDef
        | surfaceObj s2 b2 =>
            simp [YMManuscriptDeformationData.objectDeformationEq] at hDef
            rcases hDef with ⟨_, hLabel⟩
            refine ⟨fun r => ?_⟩
            refine ⟨r.1, ?_⟩
            simpa [YMExtendedSupportObject.globalFormDatum, hLabel] using r.2

/-- Tagged theorem-scope bridge over a closed instantiated Yang--Mills manuscript. -/
def YMCompanionIIITaggedTheoremScopeBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :
    YMTheoremScopeSectorBridge (YMExtendedSupportObject S) :=
  YMManuscriptSectorBridge S D (YMCompanionIIITaggedTheoremScopeRealization I S D)

/--
Preferred paper-facing realization package for the theorem-scope class.

This is the canonical current manuscript-facing realization layer: theorem-scope
objects are carried together with their global-form data inside the realized
datum, rather than only through the older constant-carrier infrastructure
bridge. Post-freeze, this is the realization layer that should be treated as
the fixed Section 4 route unless a stricter manuscript-faithfulness pass
deliberately refines it.
-/
abbrev YMCompanionIIIPaperFacingTheoremScopeRealization
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMPaperTheoremScopeDeformationData S) :=
  YMCompanionIIITaggedTheoremScopeRealization I S D

/--
Preferred paper-facing theorem-scope bridge over a closed instantiated
Yang--Mills manuscript.

This is the canonical current theorem-scope bridge for the extension paper. It
is the bridge readers should now treat as the default Section 4 realization
surface, not merely as one candidate among several infrastructure bridges.
-/
abbrev YMCompanionIIIPaperFacingTheoremScopeBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMPaperTheoremScopeDeformationData S) :
    YMTheoremScopeSectorBridge (YMPaperTheoremScopeClass S) :=
  YMCompanionIIITaggedTheoremScopeBridge I S D

/--
Preferred paper-facing theorem-scope bridge over the packaged theorem-scope
object.
-/
abbrev YMCompanionIIIPaperFacingTheoremScopePackageBridge
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage) :
    YMTheoremScopeSectorBridge (YMPaperTheoremScopePackage.Object P) :=
  YMCompanionIIIPaperFacingTheoremScopeBridge I P.scope P.deformation

/--
Canonical Section 4 theorem-scope bridge for the extension paper.

This is the preferred manuscript-facing bridge from the fixed theorem-scope
package into the tagged Companion III realization. In the current post-freeze
reading, this is the fixed Section 4 bridge surface carried forward by the
extension stack.
-/
abbrev YMSection4CanonicalTheoremScopeBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMPaperTheoremScopeDeformationData S) :
    YMTheoremScopeSectorBridge (YMPaperTheoremScopeClass S) :=
  YMCompanionIIIPaperFacingTheoremScopeBridge I S D

/--
Canonical Section 4 theorem-scope bridge over the packaged theorem-scope
object.
-/
abbrev YMSection4CanonicalTheoremScopePackageBridge
    (I : YMClosedInstantiatedManuscript)
    (P : YMSection4CanonicalTheoremScopePackage) :
    YMTheoremScopeSectorBridge (YMSection4CanonicalTheoremScopePackage.Object P) :=
  YMCompanionIIIPaperFacingTheoremScopePackageBridge I P

theorem YMCompanionIIITaggedRep_has_globalForm
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    {xi : YMExtendedSupportObject S}
    (r : (YMCompanionIIITaggedTheoremScopeBridge I S D).Rep xi) :
    r.1.globalForm = YMExtendedSupportObject.globalFormDatum xi :=
  r.2

theorem YMCompanionIIITaggedUnderlyingNe_of_differentGlobalForm
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    {xi eta : YMExtendedSupportObject S}
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta)
    (rx : (YMCompanionIIITaggedTheoremScopeBridge I S D).Rep xi)
    (ry : (YMCompanionIIITaggedTheoremScopeBridge I S D).Rep eta) :
    rx.1 ≠ ry.1 := by
  intro hEq
  apply hGF
  calc
    YMExtendedSupportObject.globalFormDatum xi = rx.1.globalForm := by
      exact rx.2.symm
    _ = ry.1.globalForm := by simp [hEq]
    _ = YMExtendedSupportObject.globalFormDatum eta := by
      exact ry.2

theorem YMCompanionIIITaggedSectorAssignmentNeOfSameShadowDifferentGlobalForm
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
        (YMCompanionIIITaggedTheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITaggedTheoremScopeBridge I S D) eta := by
  intro hEq
  have hDef :
      D.objectDeformationEq xi eta := Quotient.exact hEq
  exact
    (YMManuscriptDeformationData.not_objectDeformationEq_of_sameShadow_differentGlobalForm
      D hShadow hGF) hDef

def YMCompanionIIITaggedGlobalFormRecoveryPackage
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :
    YMGlobalFormRecoveryPackage (YMCompanionIIITaggedTheoremScopeBridge I S D) where
  sector_distinguishes := by
    intro xi eta hShadow hGF
    exact
      YMCompanionIIITaggedSectorAssignmentNeOfSameShadowDifferentGlobalForm
        I S D hShadow hGF

end MaleyLean
