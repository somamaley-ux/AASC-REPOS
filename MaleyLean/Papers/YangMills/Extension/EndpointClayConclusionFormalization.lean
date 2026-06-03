import MaleyLean.Papers.YangMills.Extension.EndpointCompletionBridgeFormalization

namespace MaleyLean

universe u v w

/--
Abstract Clay-facing endpoint package.

This is the Lean-facing formalization of the manuscript's final Section 8
bridge: once the fixed Yang--Mills theorem object satisfies the imported
admissibility side conditions, every theorem-scope admissible completion
inherits the same spectral endpoint data.
-/
structure YMClayEndpointPackage
    {Xi : Type u}
    {B : YMTheoremScopeSectorBridge Xi}
    (C : YMTheoremScopeCompletionBridge B) where
  FixedTheory : Type w
  preservesFixedTheory : C.Completion -> Prop
  admissibilitySideConditionsSatisfied : Prop
  massGapValue : Type v
  Hamiltonian : C.Completion -> Type v
  vacuumRay : C.Completion -> Type v
  noSubgapSpectrum :
    forall completion : C.Completion,
      C.AdmissibleCompletion completion ->
      preservesFixedTheory completion ->
      admissibilitySideConditionsSatisfied
  vacuumKernelIsExact :
    forall completion : C.Completion,
      C.AdmissibleCompletion completion ->
      preservesFixedTheory completion ->
      admissibilitySideConditionsSatisfied

namespace YMClayEndpointPackage

variable {Xi : Type u}
variable {B : YMTheoremScopeSectorBridge Xi}
variable {C : YMTheoremScopeCompletionBridge B}

theorem admissibleCompletion_has_noSubgapSpectrum
    (P : YMClayEndpointPackage C)
    (completion : C.Completion)
    (hA : C.AdmissibleCompletion completion)
    (hP : P.preservesFixedTheory completion) :
    P.admissibilitySideConditionsSatisfied := by
  exact P.noSubgapSpectrum completion hA hP

theorem admissibleCompletion_has_exactVacuumKernel
    (P : YMClayEndpointPackage C)
    (completion : C.Completion)
    (hA : C.AdmissibleCompletion completion)
    (hP : P.preservesFixedTheory completion) :
    P.admissibilitySideConditionsSatisfied := by
  exact P.vacuumKernelIsExact completion hA hP

theorem sectorRealization_inherits_clayEndpoint
    (P : YMClayEndpointPackage C)
    (xi : Xi)
    (r : B.Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    P.admissibilitySideConditionsSatisfied := by
  have hA :=
    YMTheoremScopeCompletionBridge.sectorRealization_yields_admissibleCompletion
      C xi r
  exact P.noSubgapSpectrum (C.completionOf xi r) hA hPres

theorem sectorDistinction_and_clayEndpoint
    (P : YMClayEndpointPackage C)
    {xi eta : Xi}
    (sameShadow : Xi -> Xi -> Prop)
    (differentGlobalForm : Xi -> Xi -> Prop)
    (hDist :
      sameShadow xi eta ->
      differentGlobalForm xi eta ->
      YMTheoremScopeSectorBridge.sectorAssignment B xi ≠
        YMTheoremScopeSectorBridge.sectorAssignment B eta)
    (hShadow : sameShadow xi eta)
    (hGF : differentGlobalForm xi eta)
    (r : B.Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMTheoremScopeSectorBridge.sectorAssignment B xi ≠
        YMTheoremScopeSectorBridge.sectorAssignment B eta /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact hDist hShadow hGF
  · exact sectorRealization_inherits_clayEndpoint P xi r hPres

end YMClayEndpointPackage

/--
Companion III-facing abbreviation of the final endpoint package surface.
-/
abbrev YMCompanionIIIClayEndpointPackage
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIICompletionBridge I S D) :=
  YMClayEndpointPackage C

/--
Packaged Companion III-facing abbreviation of the final endpoint package
surface.
-/
abbrev YMCompanionIIIClayEndpointPackageOfPackage
    (I : YMClosedInstantiatedManuscript)
    (Pscope : YMPaperTheoremScopePackage)
    (C : YMCompanionIIICompletionBridgeOfPackage I Pscope) :=
  YMClayEndpointPackage C

/--
Tagged Companion III-facing abbreviation of the final endpoint package surface.
-/
abbrev YMCompanionIIITaggedClayEndpointPackage
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D) :=
  YMClayEndpointPackage C

/--
Packaged tagged Companion III-facing abbreviation of the final endpoint
package surface.
-/
abbrev YMCompanionIIITaggedClayEndpointPackageOfPackage
    (I : YMClosedInstantiatedManuscript)
    (Pscope : YMPaperTheoremScopePackage)
    (C : YMCompanionIIITaggedCompletionBridgeOfPackage I Pscope) :=
  YMClayEndpointPackage C

theorem YMCompanionIIIDistinctionAndClayEndpoint
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIICompletionBridge I S D)
    (P : YMCompanionIIIClayEndpointPackage I S D C)
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta)
    (r : (YMCompanionIIITheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITheoremScopeBridge I S D) eta /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact
      YMCompanionIIISectorAssignmentNeOfSameShadowDifferentGlobalForm
        I S D hShadow hGF
  · exact YMClayEndpointPackage.sectorRealization_inherits_clayEndpoint P xi r hPres

theorem YMCompanionIIITaggedDistinctionAndClayEndpoint
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
    (r : (YMCompanionIIITaggedTheoremScopeBridge I S D).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITaggedTheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITaggedTheoremScopeBridge I S D) eta /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact
      YMCompanionIIITaggedSectorAssignmentNeOfSameShadowDifferentGlobalForm
        I S D hShadow hGF
  · exact YMClayEndpointPackage.sectorRealization_inherits_clayEndpoint P xi r hPres

/--
Packaged tagged Companion III-facing endpoint theorem combining Section 7
distinction with the Clay endpoint conclusion.
-/
theorem YMCompanionIIITaggedDistinctionAndClayEndpointOfPackage
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
    (r : (YMCompanionIIITaggedTheoremScopeBridge I Pscope.scope Pscope.deformation).Rep xi)
    (hPres : P.preservesFixedTheory (C.completionOf xi r)) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITaggedTheoremScopeBridge I Pscope.scope Pscope.deformation) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIITaggedTheoremScopeBridge I Pscope.scope Pscope.deformation) eta /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMCompanionIIITaggedDistinctionAndClayEndpoint
      I Pscope.scope Pscope.deformation C P hShadow hGF r hPres

end MaleyLean
