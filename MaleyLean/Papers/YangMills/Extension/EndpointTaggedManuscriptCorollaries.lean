import MaleyLean.Papers.YangMills.Extension.EndpointClayConclusionFormalization
import MaleyLean.Papers.YangMills.Extension.EndpointConcreteUpstreamSideConditions

namespace MaleyLean

/--
Preferred concrete theorem-scope bridge for manuscript-facing corollaries.

This points downstream users to the sharper tagged Companion III route rather
than the earlier coarse constant-carrier realization. Post-freeze, this is the
bridge that should be read as the default Section 7 and Section 8 corollary
surface.
-/
abbrev YMCompanionIIIPreferredTheoremScopeBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S) :=
  YMCompanionIIIPaperFacingTheoremScopeBridge I S D

/--
Preferred concrete theorem-scope bridge packaged as one paper-facing object.
-/
abbrev YMCompanionIIIPreferredTheoremScopePackageBridge
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage) :=
  YMCompanionIIIPaperFacingTheoremScopePackageBridge I P

/--
Preferred concrete Section 7 corollary: same local shadow but different
theorem-scope global-form data imply distinct sector assignments through the
tagged Companion III realization.
-/
theorem YMCompanionIIIPreferredSectorDistinction
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
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta := by
  exact
    YMCompanionIIITaggedSectorAssignmentNeOfSameShadowDifferentGlobalForm
      I S D hShadow hGF

/--
Manuscript-facing Section 7 alias for the preferred tagged route.

This is the default Section 7 theorem surface readers should cite inside the
current extension stack.
-/
theorem YMSection7_PreferredGlobalFormRecovery
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
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta := by
  exact YMCompanionIIIPreferredSectorDistinction I S D hShadow hGF

/--
Packaged manuscript-facing Section 7 alias for the preferred tagged route.

This is the packaged Section 7 surface carried forward by the canonical
theorem-scope package.
-/
theorem YMSection7_PreferredGlobalFormRecoveryOfPackage
    (I : YMClosedInstantiatedManuscript)
    (P : YMPaperTheoremScopePackage)
    {xi eta : YMPaperTheoremScopePackage.Object P}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta)) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopePackageBridge I P) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopePackageBridge I P) eta := by
  exact YMSection7_PreferredGlobalFormRecovery I P.scope P.deformation hShadow hGF

/--
Preferred concrete Section 8 corollary: every tagged realized theorem-scope
sector datum inherits the Clay-facing endpoint package along the admissible
completion bridge.
-/
theorem YMCompanionIIIPreferredClayEndpointOfRealization
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C)
    (xi : YMExtendedSupportObject S)
    (r : (YMCompanionIIIPreferredTheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    P.admissibilitySideConditionsSatisfied := by
  exact YMClayEndpointPackage.sectorRealization_inherits_clayEndpoint P xi r hPres

/--
Manuscript-facing Section 8 alias for the preferred tagged route.
-/
theorem YMSection8_PreferredClayEndpoint
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C)
    (xi : YMExtendedSupportObject S)
    (r : (YMCompanionIIIPreferredTheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    P.admissibilitySideConditionsSatisfied := by
  exact YMCompanionIIIPreferredClayEndpointOfRealization I S D C P xi r hPres

/--
Packaged manuscript-facing Section 8 alias for the preferred tagged route.
-/
theorem YMSection8_PreferredClayEndpointOfPackage
    (I : YMClosedInstantiatedManuscript)
    (Pscope : YMPaperTheoremScopePackage)
    (C : YMCompanionIIITaggedCompletionBridgeOfPackage I Pscope)
    (P : YMCompanionIIITaggedClayEndpointPackageOfPackage I Pscope C)
    (xi : YMPaperTheoremScopePackage.Object Pscope)
    (r : (YMCompanionIIIPreferredTheoremScopePackageBridge I Pscope).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpoint
      I Pscope.scope Pscope.deformation C P xi r hPres

/--
Section 8 preferred alias carrying both the concrete upstream Yang--Mills
side-condition package and the tagged Clay-endpoint conclusion.
-/
theorem YMSection8_PreferredClayEndpointWithConcreteUpstreamWitnesses
    (W : YMConcreteEndpointSideConditions)
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C)
    (xi : YMExtendedSupportObject S)
    (r : (YMCompanionIIIPreferredTheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMConcreteEndpointSideConditions.statement W /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YangMillsConcreteEndpointSideConditionsStatement W
  · exact YMSection8_PreferredClayEndpoint I S D C P xi r hPres

/--
Preferred concrete combined corollary: the tagged Companion III route carries
both Section 7 distinction and the Clay-facing endpoint conclusion.
-/
theorem YMCompanionIIIPreferredDistinctionAndClayEndpoint
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C)
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta)
    (r : (YMCompanionIIIPreferredTheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMCompanionIIITaggedDistinctionAndClayEndpoint
      I S D C P hShadow hGF r hPres

/--
Manuscript-facing combined Section 7 plus Section 8 alias for the preferred
tagged route.
-/
theorem YMSection7And8_PreferredEndpointCorollary
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C)
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta)
    (r : (YMCompanionIIIPreferredTheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMCompanionIIIPreferredDistinctionAndClayEndpoint
      I S D C P hShadow hGF r hPres

/--
Packaged manuscript-facing combined Section 7 plus Section 8 alias for the
preferred tagged route.
-/
theorem YMSection7And8_PreferredEndpointCorollaryOfPackage
    (I : YMClosedInstantiatedManuscript)
    (Pscope : YMPaperTheoremScopePackage)
    (C : YMCompanionIIITaggedCompletionBridgeOfPackage I Pscope)
    (P : YMCompanionIIITaggedClayEndpointPackageOfPackage I Pscope C)
    {xi eta : YMPaperTheoremScopePackage.Object Pscope}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta)
    (r : (YMCompanionIIIPreferredTheoremScopePackageBridge I Pscope).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopePackageBridge I Pscope) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopePackageBridge I Pscope) eta /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollary
      I Pscope.scope Pscope.deformation C P hShadow hGF r hPres

/--
Manuscript-facing combined Section 7 plus Section 8 alias carrying both the
preferred tagged route and the concrete upstream Yang--Mills side conditions.
-/
theorem YMSection7And8_PreferredEndpointCorollaryWithConcreteUpstreamWitnesses
    (W : YMConcreteEndpointSideConditions)
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C)
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta)
    (r : (YMCompanionIIIPreferredTheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMConcreteEndpointSideConditions.statement W /\
      (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi ≠
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta /\
        P.admissibilitySideConditionsSatisfied) := by
  refine ⟨?_, ?_⟩
  · exact YangMillsConcreteEndpointSideConditionsStatement W
  · exact
      YMSection7And8_PreferredEndpointCorollary
        I S D C P hShadow hGF r hPres

end MaleyLean
