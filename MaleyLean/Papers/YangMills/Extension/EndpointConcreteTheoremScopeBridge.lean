import MaleyLean.Papers.YangMills.Extension.EndpointTheoremScopeObjects
import MaleyLean.Papers.YangMills.Kernel.ClosedInstantiatedManuscriptBuilder

namespace MaleyLean

/--
Concrete reconstructed-sector carrier already present in a closed instantiated
Yang--Mills manuscript.
-/
abbrev YMCompanionIIIReconstructedSector
    (I : YMClosedInstantiatedManuscript) : Type :=
  (YangMillsVacuumGapSemanticBundleData
    I.blueprint.objects.RD
    I.blueprint.witnesses.hww).reconstructed_sector

/--
Companion III-facing realization package for theorem-scope extended-support
objects over a closed instantiated manuscript.

At this stage every theorem-scope object is realized in the existing
reconstructed-sector carrier supplied by the vacuum-gap semantic bundle. This is
an infrastructure-level concrete bridge: the realization seam is no longer
hypothetical, but this constant-carrier route is not the final preferred
paper-facing classification layer. That sharper role is carried downstream by
the tagged realization package.
-/
def YMCompanionIIITheoremScopeRealization
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :
    YMManuscriptSectorRealization S D where
  Rep := fun _ => YMCompanionIIIReconstructedSector I
  realized := by
    intro _
    exact ⟨ym_Hloc I⟩
  transport := by
    intro _ _ _
    exact ⟨fun x => x⟩

/--
Concrete theorem-scope bridge over a closed instantiated Yang--Mills manuscript.

This is the baseline Companion III bridge over the preferred theorem-scope
class. The current paper-facing route later sharpens this to the tagged bridge,
which retains theorem-scope global-form data inside the realized datum.
-/
def YMCompanionIIITheoremScopeBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :
    YMTheoremScopeSectorBridge (YMPaperTheoremScopeClass S) :=
  YMPaperTheoremScopeBridge S D (YMCompanionIIITheoremScopeRealization I S D)

/--
Baseline Companion III bridge over the packaged preferred theorem-scope object.
-/
abbrev YMCompanionIIITheoremScopePackageBridge
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage) :
    YMTheoremScopeSectorBridge (YMPaperTheoremScopePackage.Object P) :=
  YMCompanionIIITheoremScopeBridge I P.scope P.deformation

theorem YangMillsCompanionIIITheoremScopeSectorDatumExists
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (xi : YMExtendedSupportObject S) :
    Nonempty ((YMCompanionIIITheoremScopeBridge I S D).Rep xi) := by
  exact
    YMTheoremScopeSectorBridge.sectorDatumExists
      (YMCompanionIIITheoremScopeBridge I S D) xi

theorem YangMillsCompanionIIITheoremScopeTransportExists
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    {xi eta : YMExtendedSupportObject S}
    (h : (YMCompanionIIITheoremScopeBridge I S D).DeformationEq xi eta) :
    Nonempty
      (((YMCompanionIIITheoremScopeBridge I S D).Rep xi) ->
        ((YMCompanionIIITheoremScopeBridge I S D).Rep eta)) := by
  exact
    YMTheoremScopeSectorBridge.transportExists
      (YMCompanionIIITheoremScopeBridge I S D) h

theorem YangMillsCompanionIIISectorAssignmentEqOfSupportEq
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    {xi eta : YMExtendedSupportObject S}
    (h : YMExtendedSupportObject.SupportEq xi eta) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) xi =
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) eta := by
  exact
    YMTheoremScopeSectorBridge.sectorAssignment_eq_of_supportEq
      (YMCompanionIIITheoremScopeBridge I S D) h

theorem YangMillsCompanionIIISectorAssignmentEqOfDeformationEq
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    {xi eta : YMExtendedSupportObject S}
    (h : D.objectDeformationEq xi eta) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) xi =
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) eta := by
  exact
    YMTheoremScopeSectorBridge.sectorAssignment_eq_of_deformationEq
      (YMCompanionIIITheoremScopeBridge I S D) h

end MaleyLean
