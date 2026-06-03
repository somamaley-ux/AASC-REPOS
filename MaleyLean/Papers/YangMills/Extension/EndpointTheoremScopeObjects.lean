import MaleyLean.Papers.YangMills.Extension.EndpointAdmissibilityFormalization

namespace MaleyLean

universe uLine uSurface uLineLabel uSurfaceLabel uRep

/--
Abstract manuscript-side theorem-scope data for the nonlocal endpoint paper.

This mirrors the paper's support-first setup: closed line supports, closed
surface supports, and their theorem-scope label sets are fixed first, before
any realization into sector data is attached.
-/
structure YMManuscriptTheoremScope where
  LineSupport : Type uLine
  SurfaceSupport : Type uSurface
  LineLabel : Type uLineLabel
  SurfaceLabel : Type uSurfaceLabel

/--
The manuscript's theorem-scope extended-support objects: either a labeled line
support or a labeled surface support.
-/
inductive YMExtendedSupportObject (S : YMManuscriptTheoremScope)
  | lineObj : S.LineSupport -> S.LineLabel -> YMExtendedSupportObject S
  | surfaceObj : S.SurfaceSupport -> S.SurfaceLabel -> YMExtendedSupportObject S

/--
Preferred paper-facing theorem-scope class for the extension manuscript.

This is the concrete class carried through the current Lean formalization:
theorem-scope extended-support objects are exactly labeled line supports or
labeled surface supports over a fixed manuscript scope.
-/
abbrev YMPaperTheoremScopeClass
    (S : YMManuscriptTheoremScope) : Type _ :=
  YMExtendedSupportObject S

namespace YMExtendedSupportObject

variable {S : YMManuscriptTheoremScope}

/-- The paper's strictly local shadow: support type with labels forgotten. -/
inductive LocalShadow (S : YMManuscriptTheoremScope)
  | line : S.LineSupport -> LocalShadow S
  | surface : S.SurfaceSupport -> LocalShadow S

/--
Preferred paper-facing local-shadow class obtained from the theorem-scope
extended-support class by forgetting labels.
-/
abbrev PaperLocalShadow
    (S : YMManuscriptTheoremScope) : Type _ :=
  LocalShadow S

/-- The manuscript's local-shadow map. -/
def localShadow : YMExtendedSupportObject S -> LocalShadow S
  | .lineObj l _ => .line l
  | .surfaceObj s _ => .surface s

/--
The theorem-scope support-equivalence relation: same support, same label, same
support kind.
-/
def SupportEq : YMExtendedSupportObject S -> YMExtendedSupportObject S -> Prop
  | .lineObj l1 a1, .lineObj l2 a2 => l1 = l2 /\ a1 = a2
  | .surfaceObj s1 a1, .surfaceObj s2 a2 => s1 = s2 /\ a1 = a2
  | _, _ => False

theorem supportEq_refl (x : YMExtendedSupportObject S) : SupportEq x x := by
  cases x <;> simp [SupportEq]

end YMExtendedSupportObject

/--
Abstract deformation data for the manuscript theorem scope.

This isolates the support-transport seam cleanly: line and surface supports may
each carry their own deformation-equivalence relation, and the induced relation
on extended-support objects preserves labels and support kind automatically.
-/
structure YMManuscriptDeformationData (S : YMManuscriptTheoremScope) where
  lineDeformationEq : S.LineSupport -> S.LineSupport -> Prop
  surfaceDeformationEq : S.SurfaceSupport -> S.SurfaceSupport -> Prop
  line_refl : forall x : S.LineSupport, lineDeformationEq x x
  line_symm :
    forall {x y : S.LineSupport}, lineDeformationEq x y -> lineDeformationEq y x
  line_trans :
    forall {x y z : S.LineSupport},
      lineDeformationEq x y -> lineDeformationEq y z -> lineDeformationEq x z
  surface_refl : forall x : S.SurfaceSupport, surfaceDeformationEq x x
  surface_symm :
    forall {x y : S.SurfaceSupport},
      surfaceDeformationEq x y -> surfaceDeformationEq y x
  surface_trans :
    forall {x y z : S.SurfaceSupport},
      surfaceDeformationEq x y ->
      surfaceDeformationEq y z ->
      surfaceDeformationEq x z

/--
Preferred paper-facing deformation package for the theorem-scope class.

This is the concrete deformation/equivalence layer carried by the current
extension formalization.
-/
abbrev YMPaperTheoremScopeDeformationData
    (S : YMManuscriptTheoremScope) : Type _ :=
  YMManuscriptDeformationData S

/--
Preferred paper-facing theorem-scope package for the extension manuscript.

This packages together the chosen theorem-scope class and its deformation data
so the paper-facing layer can treat them as one fixed object rather than as two
loosely parallel parameters.
-/
structure YMPaperTheoremScopePackage where
  scope : YMManuscriptTheoremScope
  deformation : YMPaperTheoremScopeDeformationData scope

/--
Canonical Section 4 theorem-scope package for the current extension stack.

At the current theorem surface this is the fixed manuscript-facing theorem-scope
object carried through the Lean development. In the post-freeze reading of the
extension paper, this should be treated as the canonical Section 4 package
unless a stricter manuscript-faithfulness pass deliberately refines the
presentation.
-/
abbrev YMSection4CanonicalTheoremScopePackage := YMPaperTheoremScopePackage

namespace YMPaperTheoremScopePackage

/-- Preferred paper-facing extended-support class carried by the package. -/
abbrev Object (P : YMPaperTheoremScopePackage) : Type _ :=
  YMPaperTheoremScopeClass P.scope

/-- Preferred paper-facing local-shadow class carried by the package. -/
abbrev Shadow (P : YMPaperTheoremScopePackage) : Type _ :=
  YMExtendedSupportObject.PaperLocalShadow P.scope

end YMPaperTheoremScopePackage

namespace YMSection4CanonicalTheoremScopePackage

/-- Canonical Section 4 theorem-scope class carried by the package. -/
abbrev Object (P : YMSection4CanonicalTheoremScopePackage) : Type _ :=
  YMPaperTheoremScopePackage.Object P

/-- Canonical Section 4 local-shadow class carried by the package. -/
abbrev Shadow (P : YMSection4CanonicalTheoremScopePackage) : Type _ :=
  YMPaperTheoremScopePackage.Shadow P

end YMSection4CanonicalTheoremScopePackage

namespace YMManuscriptDeformationData

variable {S : YMManuscriptTheoremScope} (D : YMManuscriptDeformationData S)

/-- Induced deformation-equivalence on theorem-scope extended-support objects. -/
def objectDeformationEq :
    YMExtendedSupportObject S -> YMExtendedSupportObject S -> Prop
  | .lineObj l1 a1, .lineObj l2 a2 => D.lineDeformationEq l1 l2 /\ a1 = a2
  | .surfaceObj s1 a1, .surfaceObj s2 a2 => D.surfaceDeformationEq s1 s2 /\ a1 = a2
  | _, _ => False

theorem objectDeformationEq_refl
    (x : YMExtendedSupportObject S) :
    D.objectDeformationEq x x := by
  cases x with
  | lineObj l a =>
      exact And.intro (D.line_refl l) rfl
  | surfaceObj s a =>
      exact And.intro (D.surface_refl s) rfl

theorem objectDeformationEq_symm
    {x y : YMExtendedSupportObject S}
    (h : D.objectDeformationEq x y) :
    D.objectDeformationEq y x := by
  cases x <;> cases y <;> simp [objectDeformationEq] at h ⊢
  case lineObj.lineObj =>
    exact And.intro (D.line_symm h.1) h.2.symm
  case surfaceObj.surfaceObj =>
    exact And.intro (D.surface_symm h.1) h.2.symm

theorem objectDeformationEq_trans
    {x y z : YMExtendedSupportObject S}
    (hxy : D.objectDeformationEq x y)
    (hyz : D.objectDeformationEq y z) :
    D.objectDeformationEq x z := by
  cases x <;> cases y <;> cases z <;> simp [objectDeformationEq] at hxy hyz ⊢
  case lineObj.lineObj.lineObj =>
    exact And.intro (D.line_trans hxy.1 hyz.1) (hxy.2.trans hyz.2)
  case surfaceObj.surfaceObj.surfaceObj =>
    exact And.intro (D.surface_trans hxy.1 hyz.1) (hxy.2.trans hyz.2)

theorem objectDeformation_equivalence :
    Equivalence D.objectDeformationEq := by
  refine ⟨?_, ?_, ?_⟩
  · intro x
    exact objectDeformationEq_refl D x
  · intro x y h
    exact objectDeformationEq_symm D h
  · intro x y z hxy hyz
    exact objectDeformationEq_trans D hxy hyz

theorem supportEq_implies_objectDeformationEq
    {x y : YMExtendedSupportObject S}
    (h : YMExtendedSupportObject.SupportEq x y) :
    D.objectDeformationEq x y := by
  cases x <;> cases y <;> simp [YMExtendedSupportObject.SupportEq, objectDeformationEq] at h ⊢
  case lineObj.lineObj =>
    rcases h with ⟨hl, ha⟩
    subst hl
    subst ha
    exact And.intro (D.line_refl _) rfl
  case surfaceObj.surfaceObj =>
    rcases h with ⟨hs, ha⟩
    subst hs
    subst ha
    exact And.intro (D.surface_refl _) rfl

end YMManuscriptDeformationData

/--
Abstract realization data for the manuscript theorem scope.

This is the Lean-facing seam where a Companion III realization package can be
attached: each theorem-scope object gets a realization type, and deformation
equivalence supplies transports between realization types.
-/
structure YMManuscriptSectorRealization
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) where
  Rep : YMExtendedSupportObject S -> Type uRep
  realized : forall xi : YMExtendedSupportObject S, Nonempty (Rep xi)
  transport :
    forall {xi eta : YMExtendedSupportObject S},
      D.objectDeformationEq xi eta -> Nonempty (Rep xi -> Rep eta)

/--
Canonical construction of the abstract theorem-scope sector bridge from
manuscript-side support/label data, deformation data, and a realization
package.
-/
def YMManuscriptSectorBridge
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (R : YMManuscriptSectorRealization S D) :
    YMTheoremScopeSectorBridge (YMExtendedSupportObject S) where
  SupportEq := YMExtendedSupportObject.SupportEq
  DeformationEq := D.objectDeformationEq
  deformation_equiv := D.objectDeformation_equivalence
  supportEq_implies_deformationEq := D.supportEq_implies_objectDeformationEq
  Rep := R.Rep
  realized := R.realized
  transport := R.transport

/--
Preferred paper-facing abstract bridge built from the chosen theorem-scope
class, its deformation package, and a realization package.

Concrete realization choices refine this abstract bridge further downstream.
-/
abbrev YMPaperTheoremScopeBridge
    (S : YMManuscriptTheoremScope)
    (D : YMPaperTheoremScopeDeformationData S)
    (R : YMManuscriptSectorRealization S D) :
    YMTheoremScopeSectorBridge (YMPaperTheoremScopeClass S) :=
  YMManuscriptSectorBridge S D R

/--
Preferred paper-facing abstract bridge over a packaged theorem-scope object.
-/
abbrev YMPaperTheoremScopePackageBridge
    (P : YMPaperTheoremScopePackage)
    (R : YMManuscriptSectorRealization P.scope P.deformation) :
    YMTheoremScopeSectorBridge (YMPaperTheoremScopePackage.Object P) :=
  YMPaperTheoremScopeBridge P.scope P.deformation R

end MaleyLean
