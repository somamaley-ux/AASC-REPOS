import MaleyLean.Papers.YangMills.Extension.EndpointGlobalFormRecoveryFormalization
import MaleyLean.Papers.YangMills.Extension.EndpointTaggedTheoremScopeRealization

namespace MaleyLean

universe u v w

/--
Abstract Section 8 completion bridge.

This is the Lean-facing version of the manuscript claim that realized
theorem-scope sector data do not float freely: each such realization determines
a scope-faithful extension of the fixed local vacuum theory, and those
extensions are exactly the sectoral branch of theorem-scope admissible
completions.
-/
structure YMTheoremScopeCompletionBridge
    {Xi : Type u}
    (B : YMTheoremScopeSectorBridge Xi) where
  Completion : Type w
  ScopeFaithful : Completion -> Prop
  AdmissibleCompletion : Completion -> Prop
  completionOf : forall xi : Xi, B.Rep xi -> Completion
  scopeFaithful_of_completionOf :
    forall (xi : Xi) (r : B.Rep xi), ScopeFaithful (completionOf xi r)
  admissible_of_completionOf :
    forall (xi : Xi) (r : B.Rep xi), AdmissibleCompletion (completionOf xi r)

namespace YMTheoremScopeCompletionBridge

variable {Xi : Type u}
variable {B : YMTheoremScopeSectorBridge Xi}

theorem sectorRealization_yields_scopeFaithfulExtension
    (C : YMTheoremScopeCompletionBridge B)
    (xi : Xi) (r : B.Rep xi) :
    C.ScopeFaithful (C.completionOf xi r) :=
  C.scopeFaithful_of_completionOf xi r

theorem sectorRealization_yields_admissibleCompletion
    (C : YMTheoremScopeCompletionBridge B)
    (xi : Xi) (r : B.Rep xi) :
    C.AdmissibleCompletion (C.completionOf xi r) :=
  C.admissible_of_completionOf xi r

end YMTheoremScopeCompletionBridge

/--
Companion III-facing abbreviation of the Section 8 bridge surface.
-/
abbrev YMCompanionIIICompletionBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :=
  YMTheoremScopeCompletionBridge (YMCompanionIIITheoremScopeBridge I S D)

/--
Packaged Companion III-facing abbreviation of the Section 8 bridge surface.
-/
abbrev YMCompanionIIICompletionBridgeOfPackage
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage) :=
  YMCompanionIIICompletionBridge I P.scope P.deformation

/--
Tagged Companion III-facing abbreviation of the Section 8 bridge surface.
-/
abbrev YMCompanionIIITaggedCompletionBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :=
  YMTheoremScopeCompletionBridge (YMCompanionIIITaggedTheoremScopeBridge I S D)

/--
Packaged tagged Companion III-facing abbreviation of the Section 8 bridge
surface.
-/
abbrev YMCompanionIIITaggedCompletionBridgeOfPackage
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage) :=
  YMCompanionIIITaggedCompletionBridge I P.scope P.deformation

end MaleyLean
