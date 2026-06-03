import MaleyLean.Papers.YangMills.Extension.EndpointTaggedManuscriptCorollaries
import MaleyLean.Papers.YangMills.Extension.EndpointConcreteProofHomeProjection
import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteRoute1EndpointProjection

namespace MaleyLean

/--
Compatibility package linking a concrete upstream Yang--Mills witness bundle to
the preferred tagged endpoint route.

This is the next strengthening step beyond merely carrying the concrete witness
package and the tagged Clay-endpoint package side-by-side: it records an
explicit theorem-level feed from the concrete upstream side conditions into the
endpoint admissibility conclusion used by the manuscript-facing corollaries.
Post-freeze, this package should be read as support infrastructure around the
canonical Section 8 theorem surface rather than as a rival endpoint layer.
-/
structure YMConcretePreferredRouteCompatibility
    (W : YMConcreteEndpointSideConditions)
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) where
  concreteFeedsEndpoint :
    YMConcreteEndpointSideConditions.statement W ->
    P.admissibilitySideConditionsSatisfied

namespace YMConcretePreferredRouteCompatibility

def mkOfConcreteFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMConcreteEndpointSideConditions.statement W ->
      P.admissibilitySideConditionsSatisfied) :
    YMConcretePreferredRouteCompatibility W I S D C P where
  concreteFeedsEndpoint := hFeed

def mkOfEndpointFact
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hEndpoint : P.admissibilitySideConditionsSatisfied) :
    YMConcretePreferredRouteCompatibility W I S D C P where
  concreteFeedsEndpoint := by
    intro _hConcrete
    exact hEndpoint

theorem endpoint_of_concreteStatement
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (K : YMConcretePreferredRouteCompatibility W I S D C P) :
    YMConcreteEndpointSideConditions.statement W ->
      P.admissibilitySideConditionsSatisfied :=
  K.concreteFeedsEndpoint

theorem endpoint_of_knownFact
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hEndpoint : P.admissibilitySideConditionsSatisfied) :
    YMConcretePreferredRouteCompatibility W I S D C P := by
  exact mkOfEndpointFact hEndpoint

end YMConcretePreferredRouteCompatibility

/--
Concrete preferred Section 8 route with explicit compatibility: the upstream
Yang--Mills witness bundle feeds the tagged endpoint admissibility conclusion.

This is one of the main support-route interfaces retained for provenance and
exactness tracking. It is not meant to displace the canonical Section 8 theorem
surface chosen later in this file.
-/
theorem YMSection8_PreferredClayEndpointFromConcreteCompatibility
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (K : YMConcretePreferredRouteCompatibility W I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    K.concreteFeedsEndpoint
      (YangMillsConcreteEndpointSideConditionsStatement W)

/--
Combined preferred Section 7 plus Section 8 route with explicit compatibility.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (K : YMConcretePreferredRouteCompatibility W I S D C P)
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
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact YMSection8_PreferredClayEndpointFromConcreteCompatibility K

/--
Direct preferred Section 8 route from a known endpoint admissibility fact.

This is the manuscript-facing convenience theorem built from
`YMConcretePreferredRouteCompatibility.endpoint_of_knownFact`: if the preferred
tagged endpoint package already carries the admissibility conclusion, then the
same conclusion may be read through the concrete upstream witness bundle without
building a compatibility object by hand.
-/
theorem YMSection8_PreferredClayEndpointFromKnownFact
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hEndpoint : P.admissibilitySideConditionsSatisfied) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.endpoint_of_knownFact
        (W := W) hEndpoint)

/--
Direct combined preferred Section 7 plus Section 8 route from a known endpoint
admissibility fact.

This packages the preferred tagged Section 7 distinction theorem with a plain
endpoint fact, again avoiding any need to explicitly construct the intermediate
compatibility structure.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromKnownFact
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      YMExtendedSupportObject.globalFormDatum xi ≠
        YMExtendedSupportObject.globalFormDatum eta)
    (hEndpoint : P.admissibilitySideConditionsSatisfied) :
    YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi ≠
      YMTheoremScopeSectorBridge.sectorAssignment
        (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.endpoint_of_knownFact
        (W := W) hEndpoint)
      hShadow hGF

/--
Direct preferred Section 8 route from a theorem-level feed out of the concrete
upstream witness statement.

This removes the final structural wrapper for users who already have the feed as
a plain theorem of the form
`YMConcreteEndpointSideConditions.statement W -> P.admissibilitySideConditionsSatisfied`.
-/
theorem YMSection8_PreferredClayEndpointFromConcreteFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMConcreteEndpointSideConditions.statement W ->
      P.admissibilitySideConditionsSatisfied) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfConcreteFeed hFeed)

/--
Direct combined preferred Section 7 plus Section 8 route from a theorem-level
feed out of the concrete upstream witness statement.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromConcreteFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMConcreteEndpointSideConditions.statement W ->
      P.admissibilitySideConditionsSatisfied) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfConcreteFeed hFeed)
      hShadow hGF

/--
Compatibility package built from a theorem-level feed out of the concrete exact
local-endpoint witness alone.

This is a genuine strengthening over the raw statement-feed interface when the
endpoint argument only depends on the exact local-endpoint witness already
packaged by `YMConcreteEndpointSideConditions`.
-/
def YMConcretePreferredRouteCompatibility.mkOfExactEndpointFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      W.RE.endpoint_object.exact_local_net_endpoint ->
      P.admissibilitySideConditionsSatisfied) :
    YMConcretePreferredRouteCompatibility W I S D C P where
  concreteFeedsEndpoint := by
    intro _hConcrete
    exact hFeed (YMConcreteEndpointSideConditions.exactEndpointWitnessHolds W)

/--
Direct preferred Section 8 route from a theorem-level feed out of the concrete
exact local-endpoint witness.
-/
theorem YMSection8_PreferredClayEndpointFromExactEndpointFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      W.RE.endpoint_object.exact_local_net_endpoint ->
      P.admissibilitySideConditionsSatisfied) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfExactEndpointFeed hFeed)

/--
Direct combined preferred Section 7 plus Section 8 route from a theorem-level
feed out of the concrete exact local-endpoint witness.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromExactEndpointFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      W.RE.endpoint_object.exact_local_net_endpoint ->
      P.admissibilitySideConditionsSatisfied) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfExactEndpointFeed hFeed)
      hShadow hGF

/--
Compatibility package built from a theorem-level feed out of the smaller
concrete endpoint-boundary statement.

This sits between the full concrete statement and the bare exact-endpoint
witness: it packages exactly the boundary data that most closely match the
manuscript's Section 5 / Section 8 interface.
-/
def YMConcretePreferredRouteCompatibility.mkOfEndpointBoundaryFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMConcreteEndpointSideConditions.endpointBoundaryStatement W ->
      P.admissibilitySideConditionsSatisfied) :
    YMConcretePreferredRouteCompatibility W I S D C P where
  concreteFeedsEndpoint := by
    intro _hConcrete
    exact hFeed (YangMillsConcreteEndpointBoundaryStatement W)

/--
Direct preferred Section 8 route from a theorem-level feed out of the smaller
concrete endpoint-boundary statement.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointBoundaryFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMConcreteEndpointSideConditions.endpointBoundaryStatement W ->
      P.admissibilitySideConditionsSatisfied) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfEndpointBoundaryFeed hFeed)

/--
Direct combined preferred Section 7 plus Section 8 route from a theorem-level
feed out of the smaller concrete endpoint-boundary statement.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointBoundaryFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMConcreteEndpointSideConditions.endpointBoundaryStatement W ->
      P.admissibilitySideConditionsSatisfied) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfEndpointBoundaryFeed hFeed)
      hShadow hGF

/--
Compatibility package built from a theorem-level feed out of the two concrete
boundary components separately: the exact local-endpoint witness and the
theorem-register ownership fact for the endpoint exclusion theorem.
-/
def YMConcretePreferredRouteCompatibility.mkOfBoundaryComponentsFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      W.RE.endpoint_object.exact_local_net_endpoint ->
      (ym_verbatim_theorem_owner
          .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
        .reconstructionAndUniversality) ->
      P.admissibilitySideConditionsSatisfied) :
    YMConcretePreferredRouteCompatibility W I S D C P where
  concreteFeedsEndpoint := by
    intro _hConcrete
    exact
      hFeed
        (YMConcreteEndpointSideConditions.exactEndpointWitnessHolds W)
        (YMConcreteEndpointSideConditions.exactEndpointExclusionOwnerHolds W)

/--
Direct preferred Section 8 route from a theorem-level feed out of the two
concrete boundary components separately.
-/
theorem YMSection8_PreferredClayEndpointFromBoundaryComponentsFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      W.RE.endpoint_object.exact_local_net_endpoint ->
      (ym_verbatim_theorem_owner
          .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
        .reconstructionAndUniversality) ->
      P.admissibilitySideConditionsSatisfied) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfBoundaryComponentsFeed hFeed)

/--
Direct combined preferred Section 7 plus Section 8 route from a theorem-level
feed out of the two concrete boundary components separately.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromBoundaryComponentsFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      W.RE.endpoint_object.exact_local_net_endpoint ->
      (ym_verbatim_theorem_owner
          .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
        .reconstructionAndUniversality) ->
      P.admissibilitySideConditionsSatisfied) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (W := W)
      (YMConcretePreferredRouteCompatibility.mkOfBoundaryComponentsFeed hFeed)
      hShadow hGF

/--
Direct preferred Section 8 route from a theorem that first targets the full
concrete side-condition statement and then immediately projects to the smaller
endpoint-boundary statement.
-/
theorem YMSection8_PreferredClayEndpointFromStatementToBoundaryFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMConcreteEndpointSideConditions.endpointBoundaryStatement W ->
      P.admissibilitySideConditionsSatisfied) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromEndpointBoundaryFeed
      (W := W) hFeed

/--
Direct combined preferred Section 7 plus Section 8 route from a theorem that
targets the smaller endpoint-boundary statement obtained from the full concrete
side-condition statement by projection.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromStatementToBoundaryFeed
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMConcreteEndpointSideConditions.endpointBoundaryStatement W ->
      P.admissibilitySideConditionsSatisfied) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromEndpointBoundaryFeed
      (W := W) hShadow hGF hFeed

/--
Paper-facing name for the remaining Section 8 bridge shape: a theorem stating
that the smaller concrete endpoint-boundary package is sufficient to force the
endpoint admissibility conclusion for the preferred tagged route.
-/
abbrev YMSection8BoundaryToEndpointFeed
    (W : YMConcreteEndpointSideConditions)
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  YMConcreteEndpointSideConditions.endpointBoundaryStatement W ->
    P.admissibilitySideConditionsSatisfied

/--
Paper-facing name for the still stronger componentwise Section 8 bridge shape.
-/
abbrev YMSection8BoundaryComponentsToEndpointFeed
    (W : YMConcreteEndpointSideConditions)
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  W.RE.endpoint_object.exact_local_net_endpoint ->
    (ym_verbatim_theorem_owner
        .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
      .reconstructionAndUniversality) ->
    P.admissibilitySideConditionsSatisfied

/--
Manuscript-facing alias for the preferred Section 8 route from the Section 8
boundary-to-endpoint bridge shape.
-/
theorem YMSection8_PreferredClayEndpointFromPaperBridge
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge : YMSection8BoundaryToEndpointFeed W I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact YMSection8_PreferredClayEndpointFromEndpointBoundaryFeed hBridge

/--
Manuscript-facing alias for the combined Section 7 plus Section 8 route from
the componentwise paper bridge shape.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromPaperBridge
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge : YMSection8BoundaryComponentsToEndpointFeed W I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromBoundaryComponentsFeed
      (W := W) hShadow hGF hBridge

/--
Constructor turning the paper-facing Section 8 boundary bridge directly into the
preferred concrete compatibility package.
-/
def YMConcretePreferredRouteCompatibility.mkOfPaperBridge
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge : YMSection8BoundaryToEndpointFeed W I S D C P) :
    YMConcretePreferredRouteCompatibility W I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfEndpointBoundaryFeed hBridge

/--
Constructor turning the componentwise paper-facing Section 8 bridge directly
into the preferred concrete compatibility package.
-/
def YMConcretePreferredRouteCompatibility.mkOfPaperBridgeComponents
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge : YMSection8BoundaryComponentsToEndpointFeed W I S D C P) :
    YMConcretePreferredRouteCompatibility W I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfBoundaryComponentsFeed hBridge

/--
Recover the preferred Section 8 route by first packaging a paper-facing bridge
as a concrete compatibility object.
-/
theorem YMSection8_PreferredClayEndpointViaPaperCompatibility
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge : YMSection8BoundaryToEndpointFeed W I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.mkOfPaperBridge hBridge)

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the componentwise paper bridge as a concrete compatibility object.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaPaperCompatibility
    {W : YMConcreteEndpointSideConditions}
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge : YMSection8BoundaryComponentsToEndpointFeed W I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.mkOfPaperBridgeComponents hBridge)
      hShadow hGF

/--
Section 8 preferred endpoint route specialized to the canonical concrete
side-condition package extracted from the closed manuscript object `I`.

This removes the extra explicit witness-bundle parameter from the public API:
the only remaining input is the paper-facing boundary-to-endpoint bridge itself.
-/
theorem YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8BoundaryToEndpointFeed
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromPaperBridge
      (W := YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      hBridge

/--
Combined preferred Section 7 plus Section 8 route specialized to the canonical
concrete side-condition package extracted from the closed manuscript object
`I`.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8BoundaryComponentsToEndpointFeed
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromPaperBridge
      (W := YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      hShadow hGF hBridge

/--
Compatibility package specialized to the canonical concrete side-condition
bundle carried by the closed manuscript object `I`.
-/
def YMConcretePreferredRouteCompatibility.ofClosedManuscriptPaperBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8BoundaryToEndpointFeed
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
        I S D C P) :
    YMConcretePreferredRouteCompatibility
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfPaperBridge hBridge

/--
Compatibility package specialized to the canonical concrete side-condition
bundle carried by the closed manuscript object `I`, using the componentwise
paper-facing bridge.
-/
def YMConcretePreferredRouteCompatibility.ofClosedManuscriptPaperBridgeComponents
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8BoundaryComponentsToEndpointFeed
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
        I S D C P) :
    YMConcretePreferredRouteCompatibility
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfPaperBridgeComponents hBridge

/--
Paper-shaped Section 8 bridge specialized to the canonical concrete
side-condition package extracted from the closed manuscript object `I`.

This is the Lean-facing shape of the manuscript theorem
"Yang--Mills endpoint package satisfies the imported admissibility side
conditions", with the fixed-object boundary data supplied canonically by `I`
and only the remaining endpoint feed left abstract.
-/
abbrev YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  YMSection8BoundaryToEndpointFeed
    (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
    I S D C P

/--
Componentwise paper-shaped Section 8 bridge specialized to the canonical
concrete side-condition package extracted from the closed manuscript object
`I`.
-/
abbrev YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditionsComponents
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  YMSection8BoundaryComponentsToEndpointFeed
    (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
    I S D C P

/--
Preferred Section 8 endpoint route from the paper-shaped closed-manuscript
admissibility-side-conditions theorem.
-/
theorem YMSection8_PreferredClayEndpointFromClosedManuscriptPaperTheorem
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hPaper :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridge hPaper

/--
Combined preferred Section 7 plus Section 8 route from the componentwise
paper-shaped closed-manuscript admissibility-side-conditions theorem.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptPaperTheorem
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hPaper :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditionsComponents
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptBoundaryBridge
      hShadow hGF hPaper

/--
Paper-shaped Section 8 bridge driven by the concrete Route 1 endpoint second
seam statement: reduced transport/gap payload together with the concrete
endpoint-boundary statement extracted from the closed manuscript object `I`.

This is a sharper manuscript-facing seam than the bare boundary package alone,
because it records the endpoint bridge in the same object that already carries
the second QE3 kill-switch data.
-/
abbrev YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  ym_concrete_route1_endpoint_second_seam_statement I ->
    P.admissibilitySideConditionsSatisfied

/--
Sharper paper-shaped Section 8 bridge driven by the Route 1 endpoint second
seam together with the explicit manuscript `O.5` theorem statement.
-/
abbrev YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  ym_concrete_route1_endpoint_paper_second_seam_statement I ->
    P.admissibilitySideConditionsSatisfied

/--
Preferred Section 8 endpoint route from a theorem that consumes the concrete
Route 1 endpoint second seam directly.
-/
theorem YMSection8_PreferredClayEndpointFromClosedManuscriptRoute1EndpointSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact hFeed (YangMillsConcreteRoute1EndpointSecondSeamStatement I)

/--
Source-specific Section 8 feed consuming the endpoint-proof-home realization of
the smaller Route 1 endpoint second seam.
-/
abbrev YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  ym_concrete_route1_endpoint_second_seam_from_endpoint_native_proof_homes_statement I ->
    P.admissibilitySideConditionsSatisfied

/--
At the current theorem surface, a Section 8 feed on the endpoint-proof-home
realization of the smaller second seam is exactly the same as a feed on the
existing smallest closed-manuscript second seam.
-/
theorem YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed I S D C P := by
  constructor
  · intro hProofHome
    intro hSecond
    exact
      hProofHome
        ((YangMillsConcreteRoute1EndpointSecondSeamFromEndpointNativeProofHomesIffRoute1Package I).1
          hSecond)
  · intro hSecond
    intro hProofHome
    exact
      hSecond
        ((YangMillsConcreteRoute1EndpointSecondSeamFromEndpointNativeProofHomesIffRoute1Package I).2
          hProofHome)

/--
Preferred Section 8 endpoint route from a theorem that consumes the endpoint
proof-home realization of the smaller second seam directly.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesSecondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    hFeed
      (YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes I)

/--
Combined preferred Section 7 plus Section 8 route from a theorem that consumes
the endpoint proof-home realization of the smaller second seam directly.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesSecondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact
      YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesSecondSeamFeed
        hFeed

/--
Source-specific Section 8 feed consuming the endpoint-proof-home realization of
the sharper paper-shaped Route 1 endpoint second seam.
-/
abbrev YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  ym_concrete_route1_endpoint_paper_second_seam_from_endpoint_native_proof_homes_statement I ->
    P.admissibilitySideConditionsSatisfied

/--
At the current theorem surface, a Section 8 feed on the endpoint-proof-home
realization of the paper-shaped second seam is exactly the same as a feed on
the existing closed-manuscript paper-shaped second seam.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_paperSecondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed I S D C P := by
  constructor
  · intro hProofHome
    intro hPaper
    exact
      hProofHome
        ((YangMillsConcreteRoute1EndpointPaperSecondSeamFromEndpointNativeProofHomesIffRoute1Package I).1
          hPaper)
  · intro hPaper
    intro hProofHome
    exact
      hPaper
        ((YangMillsConcreteRoute1EndpointPaperSecondSeamFromEndpointNativeProofHomesIffRoute1Package I).2
          hProofHome)

/--
Preferred Section 8 endpoint route from a theorem that consumes the endpoint
proof-home realization of the paper-shaped second seam directly.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    hFeed
      (YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes I)

/--
Combined preferred Section 7 plus Section 8 route from a theorem that consumes
the endpoint proof-home realization of the paper-shaped second seam directly.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPaperSecondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact
      YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeamFeed
        hFeed

/--
Combined preferred Section 7 plus Section 8 route from a theorem that consumes
the concrete Route 1 endpoint second seam directly.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptRoute1EndpointSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact
      YMSection8_PreferredClayEndpointFromClosedManuscriptRoute1EndpointSecondSeam
        hFeed

/--
The endpoint native proof-home layer together with the already exported QE3
transport/gap payload directly supplies the smaller Route 1 endpoint
second-seam statement, so any feed on that smaller seam already yields the
preferred Section 8 endpoint conclusion.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomes
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    hFeed
      (YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes I)

/--
The same endpoint proof-home source route also yields the combined preferred
Section 7 plus Section 8 corollary once the Section 7 global-form distinction
hypothesis is supplied.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomes
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact YMSection8_PreferredClayEndpointFromEndpointNativeProofHomes hFeed

/--
The existing closed-manuscript Section 8 boundary bridge automatically induces
the sharper Route 1 endpoint second-seam feed by projecting to the boundary
component of the bundled second seam statement.
-/
theorem YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed_of_boundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
      I S D C P := by
  intro hSecondSeam
  exact hBridge hSecondSeam.2

/--
The older closed-manuscript Section 8 boundary bridge also induces the sharper
paper-shaped Route 1 endpoint second-seam feed by forgetting the extra `O.5`
theorem-content component and projecting to the concrete boundary statement.
-/
theorem YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
      I S D C P := by
  intro hSecondSeam
  exact hBridge hSecondSeam.2.1

/--
Any endpoint feed that already consumes the sharper Route 1 endpoint second
seam automatically consumes the paper-shaped second seam as well, simply by
forgetting the extra `O.5` component.

This records explicitly that the current Section 8 endpoint bridge does not yet
use the extra paper-facing theorem content in a stronger way than the reduced
transport/gap payload together with the concrete endpoint-boundary statement.
-/
theorem YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
      I S D C P := by
  intro hPaperSecondSeam
  exact hFeed ⟨hPaperSecondSeam.1, hPaperSecondSeam.2.1⟩

/--
On the closed manuscript, the smaller and paper-shaped Route 1 endpoint
second-seam feeds are logically equivalent, because the extra `O.5` component
of the paper-shaped seam is canonical once the Route 1 endpoint package is
fixed.
-/
theorem YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  constructor
  · intro hPaper
    intro hSecond
    exact
      hPaper ⟨hSecond.1, hSecond.2,
        YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage I⟩
  · exact
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P)

theorem YMSection8_PreferredClayEndpointFromClosedManuscriptRoute1EndpointPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)
      (fun hSecondSeam =>
        hFeed
          ⟨hSecondSeam.1, hSecondSeam.2,
            YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage I⟩))
      (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I)

/--
Preferred Section 8 endpoint route recovered from the older closed-manuscript
boundary bridge, but now routed through the sharper Route 1 endpoint second
seam interface.
-/
theorem YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridgeViaRoute1EndpointSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromClosedManuscriptRoute1EndpointSecondSeam
      (YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed_of_boundaryBridge
        hBridge)

/--
Combined preferred Section 7 plus Section 8 route recovered from the older
closed-manuscript boundary bridge, but routed through the sharper Route 1
endpoint second seam interface.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptBoundaryBridgeViaRoute1EndpointSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptRoute1EndpointSecondSeam
      hShadow hGF
      (YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed_of_boundaryBridge
        hBridge)

/--
Compatibility package specialized to the sharper Route 1 endpoint second-seam
feed extracted from the closed manuscript object `I`.
-/
def YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    YMConcretePreferredRouteCompatibility
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfConcreteFeed
    (fun _hConcrete =>
      hFeed (YangMillsConcreteRoute1EndpointSecondSeamStatement I))

/--
Compatibility package specialized to the endpoint proof-home source route into
the smaller Route 1 endpoint second seam.
-/
def YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    YMConcretePreferredRouteCompatibility
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfConcreteFeed
    (fun _hConcrete =>
      hFeed
        (YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes I))

/--
At the current theorem surface, the endpoint-proof-home compatibility package
for the smaller second seam is exactly the same compatibility object as the
closed-manuscript second-seam package itself.
-/
theorem YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomes_eq_ofClosedManuscriptRoute1EndpointSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes hFeed =
      YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeam
        hFeed := by
  unfold YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
    YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeam
    YMConcretePreferredRouteCompatibility.mkOfConcreteFeed
  have hfun :
      (fun _hConcrete :
        YMConcreteEndpointSideConditions.statement
          (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) =>
        hFeed
          (YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes
            I)) =
      (fun _hConcrete :
        YMConcreteEndpointSideConditions.statement
          (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) =>
        hFeed (YangMillsConcreteRoute1EndpointSecondSeamStatement I)) := by
    funext (_hConcrete :
      YMConcreteEndpointSideConditions.statement
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I))
    have hSeam :
        YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes I =
          YangMillsConcreteRoute1EndpointSecondSeamStatement I := by
      exact Subsingleton.elim _ _
    simpa [hSeam]
  cases hfun
  rfl

/--
The older closed-manuscript boundary bridge also induces the corresponding
smallest second-seam compatibility package.
-/
def YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeamOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMConcretePreferredRouteCompatibility
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      I S D C P :=
  YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeam
    (YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed_of_boundaryBridge
      hBridge)

/--
Recover the preferred Section 8 route by first packaging the sharper Route 1
endpoint second-seam feed as a concrete compatibility object.
-/
theorem YMSection8_PreferredClayEndpointViaClosedManuscriptRoute1EndpointSecondSeamCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeam
        hFeed)

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the sharper Route 1 endpoint second-seam feed as a concrete
compatibility object.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaClosedManuscriptRoute1EndpointSecondSeamCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeam
        hFeed)
      hShadow hGF

/--
Recover the preferred Section 8 route by first packaging the endpoint
proof-home source route as a concrete compatibility object.
-/
theorem YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        hFeed)

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the endpoint proof-home source route as a concrete compatibility
object.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        hFeed)
      hShadow hGF

/--
The endpoint native proof-home layer also feeds the sharper paper-shaped Route
1 endpoint second seam directly, so any feed on that sharper seam already
yields the preferred Section 8 endpoint conclusion.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    hFeed
      (YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes I)

/--
The same proof-home source route also yields the combined preferred Section 7
plus Section 8 corollary at the sharper paper-shaped second-seam level.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact
      YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeam
        hFeed

/--
Recover the preferred Section 8 route by first packaging the older boundary
bridge as the smallest Route 1 endpoint second-seam compatibility object.
-/
theorem YMSection8_PreferredClayEndpointViaClosedManuscriptRoute1EndpointSecondSeamCompatibilityOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeamOfBoundaryBridge
        hBridge)

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the older boundary bridge as the smallest Route 1 endpoint second-
seam compatibility object.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaClosedManuscriptRoute1EndpointSecondSeamCompatibilityOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeamOfBoundaryBridge
        hBridge)
      hShadow hGF

/--
Compatibility package specialized to the sharper paper-shaped Route 1 endpoint
second-seam feed extracted from the closed manuscript object `I`.
-/
def YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    YMConcretePreferredRouteCompatibility
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfConcreteFeed
    (fun _hConcrete =>
      hFeed (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I))

/--
Compatibility package specialized to the endpoint proof-home source route into
the sharper paper-shaped Route 1 endpoint second seam.
-/
def YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    YMConcretePreferredRouteCompatibility
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
      I S D C P :=
  YMConcretePreferredRouteCompatibility.mkOfConcreteFeed
    (fun _hConcrete =>
      hFeed
        (YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes I))

/--
At the current theorem surface, the endpoint-proof-home compatibility package
for the paper-shaped second seam is exactly the same compatibility object as
the closed-manuscript paper-shaped second-seam package itself.
-/
theorem YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesPaperSecondSeam_eq_ofClosedManuscriptRoute1EndpointPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam hFeed =
      YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointPaperSecondSeam
        hFeed := by
  unfold YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
    YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointPaperSecondSeam
    YMConcretePreferredRouteCompatibility.mkOfConcreteFeed
  have hfun :
      (fun _hConcrete :
        YMConcreteEndpointSideConditions.statement
          (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) =>
        hFeed
          (YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes
            I)) =
      (fun _hConcrete :
        YMConcreteEndpointSideConditions.statement
          (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) =>
        hFeed (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I)) := by
    funext (_hConcrete :
      YMConcreteEndpointSideConditions.statement
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I))
    have hSeam :
        YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes I =
          YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I := by
      exact Subsingleton.elim _ _
    simpa [hSeam]
  cases hfun
  rfl

/--
Recover the preferred Section 8 route by first packaging the sharper
paper-shaped Route 1 endpoint second-seam feed as a concrete compatibility
object.
-/
theorem YMSection8_PreferredClayEndpointViaClosedManuscriptRoute1EndpointPaperSecondSeamCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointPaperSecondSeam
        hFeed)

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the sharper paper-shaped Route 1 endpoint second-seam feed as a
concrete compatibility object.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaClosedManuscriptRoute1EndpointPaperSecondSeamCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointPaperSecondSeam
        hFeed)
      hShadow hGF

/--
Recover the preferred Section 8 route by first packaging the endpoint
proof-home source route as a concrete compatibility object at the sharper
paper-shaped second-seam level.
-/
theorem YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesPaperSecondSeamCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
        hFeed)

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the endpoint proof-home source route as a concrete compatibility
object at the sharper paper-shaped second-seam level.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesPaperSecondSeamCompatibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hFeed :
      YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
        hFeed)
      hShadow hGF

/--
Preferred Section 8 endpoint route recovered from the older closed-manuscript
boundary bridge, but now routed through the sharper paper-shaped Route 1
endpoint second seam carrying the explicit `O.5` theorem content.
-/
theorem YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridgeViaRoute1EndpointPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromClosedManuscriptRoute1EndpointPaperSecondSeam
      (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
        hBridge)

/--
Combined preferred Section 7 plus Section 8 route recovered from the older
closed-manuscript boundary bridge, but routed through the sharper paper-shaped
Route 1 endpoint second seam carrying the explicit `O.5` theorem content.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptBoundaryBridgeViaRoute1EndpointPaperSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptRoute1EndpointSecondSeam
      hShadow hGF
      (YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed_of_boundaryBridge
        hBridge)

/--
Lean-facing alias for the patched manuscript theorem
"Route 1 endpoint second seam forces the admissibility side conditions".

This names the remaining Section 8 target exactly as it now appears in the
patched manuscript, while preserving the existing sharper feed shape.
-/
abbrev YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed
    I S D C P

/--
The single genuinely non-automatic Section 8 ingredient beyond the completion
bridge: the Route 1 paper-second seam forces the endpoint admissibility
conclusion.

This isolates the exact extra ingredient still needed on the endpoint side, in
the same spirit that the OS seam now explicitly isolates its dependence on the
chosen-site / proof-home lattice-gap input.
-/
abbrev YMSection8_Route1PaperSecondSeamExtraIngredient
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
    I S D C P

/--
The endpoint-side extra ingredient is exactly the patched Section 8 theorem
statement.
-/
theorem YMSection8_Route1PaperSecondSeamExtraIngredient_iff_patchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P ↔
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P := by
  rfl

/--
On the closed manuscript, the patched Section 8 theorem statement is also
exactly equivalent to the smaller Route 1 endpoint second-seam feed.
-/
theorem YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  exact
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)

/--
On the closed manuscript, the isolated endpoint-side extra ingredient is
already exactly the smaller Route 1 endpoint second-seam feed, because the
paper-shaped second-seam feed collapses to the smaller one once the explicit
`O.5` theorem content is canonical from the Route 1 endpoint package.
-/
theorem YMSection8_Route1PaperSecondSeamExtraIngredient_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  simpa [YMSection8_Route1PaperSecondSeamExtraIngredient,
    YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement] using
    (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P))

/--
On the closed manuscript, the endpoint-proof-home realization of the
paper-shaped Section 8 feed is also exactly equivalent to the smaller Route 1
endpoint second-seam feed.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_paperSecondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P))

/--
So, at the proof-home source layer itself, the sharper paper-shaped Section 8
feed is already exactly equivalent to the smaller proof-home second-seam feed.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_EndpointNativeProofHomesSecondSeamToEndpointFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
Consequently, the endpoint-proof-home realization of the paper-shaped feed is
also exactly equivalent to the patched Section 8 theorem statement.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_patchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
Likewise, the endpoint-proof-home realization of the smaller Section 8 feed is
already exactly equivalent to the patched Section 8 theorem statement.
-/
theorem YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_patchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm


/--
Direct Section 8 endpoint conclusion from the isolated endpoint-side extra
ingredient.
-/
theorem YMSection8_PreferredClayEndpointFromRoute1PaperSecondSeamExtraIngredient
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hExtra :
      YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    hExtra (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I)

/--
Combined preferred Section 7 plus Section 8 route from the isolated
endpoint-side extra ingredient.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromRoute1PaperSecondSeamExtraIngredient
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hExtra :
      YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact
      YMSection8_PreferredClayEndpointFromRoute1PaperSecondSeamExtraIngredient
        hExtra

/--
The older closed-manuscript boundary bridge still supplies the isolated
endpoint-side extra ingredient.
-/
theorem YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P := by
  exact
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
      hBridge

/--
The older closed-manuscript boundary bridge also supplies the isolated
endpoint-side extra ingredient directly at the smaller second-seam feed level.
-/
theorem YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridgeViaSecondSeam
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P := by
  exact
    (YMSection8_Route1PaperSecondSeamExtraIngredient_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)).2
      (YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed_of_boundaryBridge
        hBridge)

/--
Canonical paper-flow version of the same endpoint-side extra ingredient
induced by the older closed-manuscript boundary bridge.
-/
theorem YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P := by
  exact
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
      hBridge

/--
Conversely, on the closed manuscript the isolated endpoint-side extra
ingredient already reconstructs the older boundary bridge, because the reduced
transport/gap payload and the explicit `O.5` theorem content are canonically
available from the Route 1 endpoint package.
-/
theorem YMSection8_ClosedManuscriptBoundaryBridge_of_Route1PaperSecondSeamExtraIngredient
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hExtra :
      YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P) :
    YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
      I S D C P := by
  intro hBoundary
  exact
    hExtra
      ⟨YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I,
        hBoundary,
        YangMillsConcreteExactEndpointExclusionStatementFromRoute1EndpointPackage I⟩

/--
So, on the closed manuscript, the older boundary bridge and the isolated
endpoint-side extra ingredient are logically equivalent.
-/
theorem YMSection8_ClosedManuscriptBoundaryBridge_iff_extraIngredient
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P ↔
      YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P := by
  constructor
  · exact YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridge
  · exact YMSection8_ClosedManuscriptBoundaryBridge_of_Route1PaperSecondSeamExtraIngredient

/--
Direct Section 8 endpoint conclusion from the isolated endpoint-side extra
ingredient induced by the older closed-manuscript boundary bridge.
-/
theorem YMSection8_PreferredClayEndpointFromRoute1PaperSecondSeamExtraIngredientOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromRoute1PaperSecondSeamExtraIngredient
      (YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridge hBridge)

/--
Canonical paper-flow version of the same endpoint conclusion induced by the
older closed-manuscript boundary bridge, now read directly at the isolated
extra-ingredient level.
-/
theorem YMSection8_PreferredClayEndpointFromRoute1PaperSecondSeamExtraIngredientOfBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromRoute1PaperSecondSeamExtraIngredient
      (YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridgeViaCanonicalPaperFlow
        hBridge)

/--
Combined preferred Section 7 plus Section 8 route from the isolated
endpoint-side extra ingredient induced by the older closed-manuscript boundary
bridge.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromRoute1PaperSecondSeamExtraIngredientOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromRoute1PaperSecondSeamExtraIngredient
      hShadow hGF
      (YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridge hBridge)

/--
Canonical paper-flow version of the same combined preferred Section 7 plus
Section 8 route, now read directly from the isolated extra-ingredient layer.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromRoute1PaperSecondSeamExtraIngredientOfBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromRoute1PaperSecondSeamExtraIngredient
      hShadow hGF
      (YMSection8_Route1PaperSecondSeamExtraIngredient_ofBoundaryBridgeViaCanonicalPaperFlow
        hBridge)

/--
Structured extension-side proof object for the patched manuscript theorem
"Route 1 endpoint second seam forces the admissibility side conditions".

This does not pretend to derive the theorem from upstream kernel data alone.
Instead, it packages the exact manuscript-facing ingredients currently exposed
in Lean:
- the Route 1 paper-second seam,
- the Section 8 completion bridge already built over the theorem-scope sector
  layer,
- and the resulting admissibility conclusion.
-/
structure YMSection8Route1SecondSeamForcesAdmissibilityBridge
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) where
  route1PaperSecondSeam :
    ym_concrete_route1_endpoint_paper_second_seam_statement I
  route1SecondSeamForcesAdmissibility :
    YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
      I S D C P

/--
Manuscript-shaped assumption bundle for the patched Section 8 theorem.

This mirrors the paper's presentation:
- Route 1 / endpoint second-seam data are present;
- theorem-scope realizations yield scope-faithful extensions;
- theorem-scope realizations yield admissible completions;
- and from that setup the endpoint admissibility conclusion follows.

In the current Lean surface, the middle two clauses are already automatic from
the completion bridge `C`. So the only genuinely new mathematical field here is
`route1SecondSeamForcesAdmissibility`; the rest are included to expose the
paper's proof posture directly. Post-freeze, this bundle is best read as a
paper-shaped support object around the canonical Section 8 theorem surface, not
as a distinct endpoint claim.
-/
structure YMSection8PatchedAssumptionBundle
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) where
  route1PaperSecondSeam :
    ym_concrete_route1_endpoint_paper_second_seam_statement I
  realizedSector_yields_scopeFaithfulExtension :
    ∀ xi : YMExtendedSupportObject S,
      ∀ r :
        (YMCompanionIIITaggedTheoremScopeBridge I S D).Rep xi,
        C.ScopeFaithful (C.completionOf xi r)
  realizedSector_yields_admissibleCompletion :
    ∀ xi : YMExtendedSupportObject S,
      ∀ r :
        (YMCompanionIIITaggedTheoremScopeBridge I S D).Rep xi,
        C.AdmissibleCompletion (C.completionOf xi r)
  route1SecondSeamForcesAdmissibility :
    YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
      I S D C P

/--
The structured patched-theorem bridge immediately yields the Section 8
admissibility conclusion.
-/
theorem YMSection8Route1SecondSeamForcesAdmissibilityBridge.endpointConclusion
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (B :
      YMSection8Route1SecondSeamForcesAdmissibilityBridge
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact B.route1SecondSeamForcesAdmissibility B.route1PaperSecondSeam

/--
The patched manuscript theorem statement automatically induces the full
manuscript-shaped assumption bundle, because the scope-faithful and admissible-
completion clauses are already theorems of the completion bridge `C`.
-/
def YMSection8PatchedAssumptionBundle.ofPatchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hRoute1SecondSeam :
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P) :
    YMSection8PatchedAssumptionBundle I S D C P where
  route1PaperSecondSeam := YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I
  realizedSector_yields_scopeFaithfulExtension := by
    intro xi r
    exact
      YMTheoremScopeCompletionBridge.sectorRealization_yields_scopeFaithfulExtension
        C xi r
  realizedSector_yields_admissibleCompletion := by
    intro xi r
    exact
      YMTheoremScopeCompletionBridge.sectorRealization_yields_admissibleCompletion
        C xi r
  route1SecondSeamForcesAdmissibility := hRoute1SecondSeam

/--
The manuscript-shaped assumption bundle immediately recovers the patched
Section 8 theorem statement.
-/
theorem YMSection8PatchedAssumptionBundle.toPatchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (B : YMSection8PatchedAssumptionBundle I S D C P) :
    YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
      I S D C P :=
  B.route1SecondSeamForcesAdmissibility

/--
The manuscript-shaped assumption bundle also recovers the structured bridge
object for the patched Section 8 theorem.

This keeps the manuscript-facing bridge data available as a first-class object,
but it should be read as support packaging around the canonical endpoint
surface rather than as a separate endpoint layer.
-/
def YMSection8PatchedAssumptionBundle.toStructuredBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (B : YMSection8PatchedAssumptionBundle I S D C P) :
    YMSection8Route1SecondSeamForcesAdmissibilityBridge I S D C P where
  route1PaperSecondSeam := B.route1PaperSecondSeam
  route1SecondSeamForcesAdmissibility := B.route1SecondSeamForcesAdmissibility

/--
Endpoint conclusion recovered directly from the manuscript-shaped Section 8
assumption bundle.
-/
theorem YMSection8PatchedAssumptionBundle.endpointConclusion
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (B : YMSection8PatchedAssumptionBundle I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (B.toStructuredBridge).endpointConclusion

/--
The manuscript-shaped Section 8 assumption bundle is logically equivalent to
the patched Section 8 theorem statement: the extra fields in the bundle are the
paper's proof posture, but only the Route 1 second-seam implication carries new
mathematical content beyond what is already automatic from `C`.
-/
theorem YMSection8PatchedAssumptionBundle_iff_patchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8PatchedAssumptionBundle I S D C P ↔
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P := by
  constructor
  · intro B
    exact B.toPatchedStatement
  · intro hStatement
    exact YMSection8PatchedAssumptionBundle.ofPatchedStatement hStatement

/--
The manuscript-shaped patched assumption bundle is equally equivalent to the
isolated endpoint-side extra ingredient.
-/
theorem YMSection8PatchedAssumptionBundle_iff_extraIngredient
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8PatchedAssumptionBundle I S D C P ↔
      YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P := by
  exact YMSection8PatchedAssumptionBundle_iff_patchedStatement

/--
Paper-faithful formulation of the remaining Section 8 target:
build the full manuscript-shaped patched assumption bundle directly from the
Route 1 paper-second seam.

Because the scope-faithful-extension and admissible-completion clauses are
automatic from `C`, this target is equivalent to the patched theorem
statement; it just packages the same content in the exact assumption shape used
by the manuscript proof.
-/
abbrev YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  ym_concrete_route1_endpoint_paper_second_seam_statement I ->
    YMSection8PatchedAssumptionBundle I S D C P

/--
The patched Section 8 theorem statement already builds the full
manuscript-shaped assumption bundle target.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofPatchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hStatement :
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
      I S D C P := by
  intro _hSecondSeam
  exact YMSection8PatchedAssumptionBundle.ofPatchedStatement hStatement

/--
Conversely, building the full manuscript-shaped assumption bundle from the
Route 1 paper-second seam recovers the patched Section 8 theorem statement.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.impliesPatchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hTarget :
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P) :
    YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
      I S D C P := by
  exact
    (hTarget (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I)).toPatchedStatement

/--
The paper-faithful bundle-building target is logically equivalent to the
patched Section 8 theorem statement.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_patchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P ↔
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P := by
  constructor
  · exact
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.impliesPatchedStatement
  · exact
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofPatchedStatement

/--
The most paper-faithful Section 8 target is likewise logically equivalent to
the isolated endpoint-side extra ingredient.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_extraIngredient
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P ↔
      YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P := by
  exact YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_patchedStatement

/--
On the closed manuscript, the paper-faithful bundle-building target is also
exactly equivalent to the smaller Route 1 endpoint second-seam feed.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  exact
    (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_extraIngredient
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamExtraIngredient_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P))

/--
The older closed-manuscript boundary bridge already realizes the paper-faithful
bundle-building target.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
      I S D C P := by
  intro _hSecondSeam
  exact
    YMSection8PatchedAssumptionBundle.ofPatchedStatement
      (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
        hBridge)

/--
Canonical paper-flow version of the same paper-faithful bundle-building target
induced by the older closed-manuscript boundary bridge.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
      I S D C P := by
  intro _hSecondSeam
  exact
    YMSection8PatchedAssumptionBundle.ofPatchedStatement
      (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
        hBridge)

/--
Direct Section 8 endpoint conclusion from the most paper-faithful remaining
target: build the full patched assumption bundle from the Route 1 paper-second
seam, then read off the endpoint admissibility conclusion.
-/
theorem YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hTarget :
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (hTarget (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I)).endpointConclusion

/--
Combined preferred Section 7 plus Section 8 route from the most
paper-faithful remaining target: build the full patched assumption bundle from
the Route 1 paper-second seam, then combine it with the preferred Section 7
global-form distinction.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hTarget :
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTarget hTarget

/--
Direct Section 8 endpoint conclusion from the paper-faithful bundle-building
target induced by the older closed-manuscript boundary bridge.
-/
theorem YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTargetOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTarget
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridge
        hBridge)

/--
Canonical paper-flow version of the same endpoint conclusion induced by the
older closed-manuscript boundary bridge through the paper-faithful
bundle-building target.
-/
theorem YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTargetOfBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTarget
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridgeViaCanonicalPaperFlow
        hBridge)

/--
Combined preferred Section 7 plus Section 8 route from the paper-faithful
bundle-building target induced by the older closed-manuscript boundary bridge.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTargetOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTarget
      hShadow hGF
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridge
        hBridge)

/--
Canonical paper-flow version of the same combined preferred Section 7 plus
Section 8 route induced by the older closed-manuscript boundary bridge
through the paper-faithful bundle-building target.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTargetOfBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTarget
      hShadow hGF
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridgeViaCanonicalPaperFlow
        hBridge)

/--
The older closed-manuscript boundary bridge induces the full manuscript-shaped
Section 8 assumption bundle.
-/
def YMSection8PatchedAssumptionBundle.ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8PatchedAssumptionBundle I S D C P :=
  YMSection8PatchedAssumptionBundle.ofPatchedStatement
    (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
      hBridge)

/--
The older closed-manuscript boundary bridge also induces the manuscript-shaped
Section 8 assumption bundle through the canonical paper-flow seam.
-/
def YMSection8PatchedAssumptionBundle.ofBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8PatchedAssumptionBundle I S D C P :=
  YMSection8PatchedAssumptionBundle.ofPatchedStatement
    (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
      hBridge)

/--
Endpoint conclusion recovered from the manuscript-shaped Section 8 assumption
bundle induced by the older closed-manuscript boundary bridge.
-/
theorem YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (YMSection8PatchedAssumptionBundle.ofBoundaryBridge
      (S := S) (D := D) (C := C) (P := P)
      hBridge).endpointConclusion

/--
Endpoint conclusion recovered from the manuscript-shaped Section 8 assumption
bundle induced by the older boundary bridge and read through canonical
paper-flow.
-/
theorem YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleOfBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (YMSection8PatchedAssumptionBundle.ofBoundaryBridgeViaCanonicalPaperFlow
      (S := S) (D := D) (C := C) (P := P)
      hBridge).endpointConclusion

/--
Combined preferred Section 7 plus Section 8 route from the manuscript-shaped
Section 8 assumption bundle.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundle
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (B : YMSection8PatchedAssumptionBundle I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact B.endpointConclusion

/--
Combined preferred Section 7 plus Section 8 route from the manuscript-shaped
Section 8 assumption bundle induced by the older closed-manuscript boundary
bridge.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundle
      hShadow hGF
      (YMSection8PatchedAssumptionBundle.ofBoundaryBridge
        (S := S) (D := D) (C := C) (P := P)
        hBridge)

/--
Combined preferred Section 7 plus Section 8 route from the manuscript-shaped
Section 8 assumption bundle induced by the older boundary bridge and read
through canonical paper-flow.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleOfBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundle
      hShadow hGF
      (YMSection8PatchedAssumptionBundle.ofBoundaryBridgeViaCanonicalPaperFlow
        (S := S) (D := D) (C := C) (P := P)
        hBridge)

/--
Explicit derivation target for the remaining Section 8 gap:
construct the structured patched-theorem bridge object directly from the
Route 1 paper-second seam itself.

This is a sharper formulation of the unresolved step than a bare endpoint feed,
because it asks for the full manuscript-facing bridge object rather than only
its final conclusion. In the current post-freeze reading, that sharper object
is still support packaging around the canonical Section 8 theorem surface.
-/
abbrev YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  ym_concrete_route1_endpoint_paper_second_seam_statement I ->
    YMSection8Route1SecondSeamForcesAdmissibilityBridge I S D C P

/--
The sharper remaining target genuinely strengthens the patched Section 8
theorem statement: once it builds the structured bridge from the Route 1
paper-second seam, the named theorem statement follows immediately by
extracting the bridge field.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.impliesPatchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hTarget :
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P) :
    YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
      I S D C P := by
  exact
    (hTarget (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I)).route1SecondSeamForcesAdmissibility

/--
Conversely, the patched Section 8 theorem statement already builds the
structured bridge target by pairing any Route 1 paper-second seam witness with
that theorem statement.

So the remaining gap is not extra mathematical content beyond the patched
statement; it is the same content packaged as a first-class bridge object.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofPatchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hStatement :
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
      I S D C P := by
  intro hSecondSeam
  exact
    { route1PaperSecondSeam := hSecondSeam
      route1SecondSeamForcesAdmissibility := hStatement }

/--
The structured-bridge target and the patched Section 8 theorem statement are
logically equivalent. The target is a better packaging of the seam, not a
strictly stronger mathematical claim.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_patchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P ↔
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P := by
  constructor
  · exact
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.impliesPatchedStatement
  · exact
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofPatchedStatement

/--
The structured-bridge target is likewise logically equivalent to the isolated
endpoint-side extra ingredient.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_extraIngredient
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P ↔
      YMSection8_Route1PaperSecondSeamExtraIngredient I S D C P := by
  exact
    (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamExtraIngredient_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
The structured-bridge target is equally logically equivalent to the full
manuscript-shaped patched Section 8 assumption bundle.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_patchedAssumptionBundle
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P ↔
      YMSection8PatchedAssumptionBundle I S D C P := by
  exact
    (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8PatchedAssumptionBundle_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
On the closed manuscript, the manuscript-shaped patched assumption bundle is
also exactly equivalent to the smaller Route 1 endpoint second-seam feed.
-/
theorem YMSection8PatchedAssumptionBundle_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8PatchedAssumptionBundle I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  exact
    (YMSection8PatchedAssumptionBundle_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      ((YMSection8_Route1PaperSecondSeamExtraIngredient_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm.trans
      (YMSection8_Route1PaperSecondSeamExtraIngredient_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P)))

/--
On the closed manuscript, the structured-bridge target is likewise exactly
equivalent to the smaller Route 1 endpoint second-seam feed.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  exact
    (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_extraIngredient
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamExtraIngredient_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P))

/--
The proof-home realization of the smaller Section 8 feed is also exactly
equivalent to the manuscript-shaped patched assumption bundle.
-/
theorem YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_patchedAssumptionBundle
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed I S D C P ↔
      YMSection8PatchedAssumptionBundle I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8PatchedAssumptionBundle_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
The same smaller proof-home feed is equally equivalent to the structured
bridge target.
-/
theorem YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_structuredBridgeTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
The proof-home realization of the paper-shaped Section 8 feed is likewise
exactly equivalent to the manuscript-shaped patched assumption bundle.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_patchedAssumptionBundle
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8PatchedAssumptionBundle I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8PatchedAssumptionBundle_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
And it is equally equivalent to the structured bridge target.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_structuredBridgeTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
The proof-home realization of the smaller Section 8 feed is also exactly
equivalent to the most paper-faithful bundle-building target.
-/
theorem YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_bundleTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
The proof-home realization of the paper-shaped Section 8 feed is likewise
equivalent to that most paper-faithful bundle-building target.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_bundleTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
So, on the closed manuscript, the older boundary bridge is equally equivalent
to the patched Section 8 theorem statement itself.
-/
theorem YMSection8_ClosedManuscriptBoundaryBridge_iff_patchedStatement
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P ↔
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P := by
  exact
    (YMSection8_ClosedManuscriptBoundaryBridge_iff_extraIngredient
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamExtraIngredient_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P))

/--
So, on the closed manuscript, the older boundary bridge is also equivalent to
the manuscript-shaped patched assumption bundle.
-/
theorem YMSection8_ClosedManuscriptBoundaryBridge_iff_patchedAssumptionBundle
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P ↔
      YMSection8PatchedAssumptionBundle I S D C P := by
  exact
    (YMSection8_ClosedManuscriptBoundaryBridge_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8PatchedAssumptionBundle_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
So, on the closed manuscript, the older boundary bridge is also equivalent to
the most paper-faithful bundle-building target.
-/
theorem YMSection8_ClosedManuscriptBoundaryBridge_iff_bundleTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P ↔
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
        I S D C P := by
  exact
    (YMSection8_ClosedManuscriptBoundaryBridge_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
So, on the closed manuscript, the older boundary bridge is also equivalent to
the structured patched-theorem bridge target.
-/
theorem YMSection8_ClosedManuscriptBoundaryBridge_iff_structuredBridgeTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P ↔
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P := by
  exact
    (YMSection8_ClosedManuscriptBoundaryBridge_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_iff_patchedStatement
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
So, on the closed manuscript, the older boundary bridge is also exactly
equivalent to the smaller Route 1 endpoint second-seam feed.
-/
theorem YMSection8_ClosedManuscriptBoundaryBridge_iff_secondSeamFeed
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P ↔
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamToEndpointFeed
        I S D C P := by
  exact
    (YMSection8_ClosedManuscriptBoundaryBridge_iff_extraIngredient
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_Route1PaperSecondSeamExtraIngredient_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P))

/--
Therefore the endpoint-proof-home realization of the smaller Section 8 feed is
also exactly equivalent to the older closed-manuscript boundary bridge.
-/
theorem YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_ClosedManuscriptBoundaryBridge_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
Likewise, the endpoint-proof-home realization of the paper-shaped Section 8
feed is also exactly equivalent to the older closed-manuscript boundary
bridge.
-/
theorem YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C} :
    YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed I S D C P ↔
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P := by
  exact
    (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_secondSeamFeed
      (I := I) (S := S) (D := D) (C := C) (P := P)).trans
      (YMSection8_ClosedManuscriptBoundaryBridge_iff_secondSeamFeed
        (I := I) (S := S) (D := D) (C := C) (P := P)).symm

/--
When the smaller proof-home Section 8 feed is itself obtained from the older
closed-manuscript boundary bridge, the resulting proof-home compatibility
wrapper is exactly the same as the boundary-bridge-induced smallest
second-seam compatibility wrapper.
-/
theorem YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesOfBoundaryBridge_eq
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge) =
      YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeamOfBoundaryBridge
        hBridge := by
  simpa [YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeamOfBoundaryBridge]
    using
      @YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomes_eq_ofClosedManuscriptRoute1EndpointSecondSeam
        I S D C P
        ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge)

/--
When the sharper paper-shaped proof-home Section 8 feed is obtained from the
older boundary bridge, the resulting proof-home compatibility wrapper is
exactly the same as the corresponding closed-manuscript paper-second-seam
compatibility wrapper induced by that same bridge.
-/
theorem YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
        ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge) =
      YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointPaperSecondSeam
        (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
          hBridge) := by
  simpa using
    @YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesPaperSecondSeam_eq_ofClosedManuscriptRoute1EndpointPaperSecondSeam
      I S D C P
      ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge)

/--
At the proof-home source layer itself, once both are induced from the same
older boundary bridge, packaging the sharper paper-shaped proof-home feed
produces exactly the same compatibility wrapper as packaging the smaller
proof-home feed.
-/
theorem YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq_ofEndpointNativeProofHomesOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
        ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge) =
      YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge) := by
  calc
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
        ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge)
        =
      YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointPaperSecondSeam
        (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
          hBridge) := by
            exact
              YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq
                (I := I) (S := S) (D := D) (C := C) (P := P) hBridge
    _ =
      YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeamOfBoundaryBridge
        hBridge := by
          simpa
            [YMConcretePreferredRouteCompatibility.ofClosedManuscriptRoute1EndpointSecondSeamOfBoundaryBridge]
            using
              @YMConcretePreferredRouteCompatibility_ofClosedManuscriptRoute1EndpointPaperSecondSeam_eq_ofClosedManuscriptRoute1EndpointSecondSeam
                I S D C P
                (YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
                  hBridge)
    _ =
      YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge) := by
            exact
              (YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesOfBoundaryBridge_eq
                (I := I) (S := S) (D := D) (C := C) (P := P) hBridge).symm

/--
Recover the preferred Section 8 route by first packaging the endpoint
proof-home source route as a concrete compatibility object, when that
proof-home feed is itself induced from the older closed-manuscript boundary
bridge.
-/
theorem YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesCompatibilityOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the endpoint proof-home source route as a concrete compatibility
object, when that proof-home feed is itself induced from the older
closed-manuscript boundary bridge.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesCompatibilityOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))
      hShadow hGF

/--
Recover the preferred Section 8 route by first packaging the endpoint
proof-home source route as a concrete compatibility object at the sharper
paper-shaped second-seam level, when that proof-home feed is itself induced
from the older closed-manuscript boundary bridge.
-/
theorem YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesPaperSecondSeamCompatibilityOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
        ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))

/--
Recover the combined preferred Section 7 plus Section 8 route by first
packaging the endpoint proof-home source route as a concrete compatibility
object at the sharper paper-shaped second-seam level, when that proof-home
feed is itself induced from the older closed-manuscript boundary bridge.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesPaperSecondSeamCompatibilityOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromConcreteCompatibility
      (YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
        ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
          (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))
      hShadow hGF

/--
At the live preferred Section 8 theorem level, routing the older boundary
bridge through the endpoint proof-home source produces exactly the same proof
as routing it through the closed-manuscript smaller second-seam compatibility
surface.
-/
theorem YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesCompatibilityOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesCompatibilityOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_PreferredClayEndpointViaClosedManuscriptRoute1EndpointSecondSeamCompatibilityOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
The same direct proof equality holds for the combined preferred Section 7 plus
Section 8 corollary at the smaller second-seam level.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesCompatibilityOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesCompatibilityOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge =
      YMSection7And8_PreferredEndpointCorollaryViaClosedManuscriptRoute1EndpointSecondSeamCompatibilityOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge := by
  exact Subsingleton.elim _ _

/--
At the live preferred Section 8 theorem level, routing the older boundary
bridge through the endpoint proof-home paper-shaped source produces exactly
the same proof as routing it through the closed-manuscript paper-shaped
second-seam compatibility surface.
-/
theorem YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesPaperSecondSeamCompatibilityOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointViaEndpointNativeProofHomesPaperSecondSeamCompatibilityOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridgeViaRoute1EndpointPaperSecondSeam
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
The same direct proof equality holds for the combined preferred Section 7 plus
Section 8 corollary at the sharper paper-shaped second-seam level.
-/
theorem YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesPaperSecondSeamCompatibilityOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection7And8_PreferredEndpointCorollaryViaEndpointNativeProofHomesPaperSecondSeamCompatibilityOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge =
      YMSection7And8_PreferredEndpointCorollaryFromClosedManuscriptBoundaryBridgeViaRoute1EndpointPaperSecondSeam
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge := by
  exact Subsingleton.elim _ _

/--
The endpoint proof-home route can also package the older boundary bridge
directly into the manuscript-shaped patched Section 8 assumption bundle, via
the smaller proof-home second-seam feed.
-/
def YMSection8PatchedAssumptionBundle.ofEndpointNativeProofHomesOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8PatchedAssumptionBundle I S D C P :=
  YMSection8PatchedAssumptionBundle.ofPatchedStatement
    ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).1
      ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))

/--
The same proof-home boundary-bridge packaging can be done at the sharper
paper-shaped proof-home feed level.
-/
def YMSection8PatchedAssumptionBundle.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8PatchedAssumptionBundle I S D C P :=
  YMSection8PatchedAssumptionBundle.ofPatchedStatement
    ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).1
      ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))

/--
At the patched-bundle level, the proof-home boundary-bridge construction
agrees exactly with the existing closed-manuscript boundary-bridge bundle.
-/
theorem YMSection8PatchedAssumptionBundle_ofEndpointNativeProofHomesOfBoundaryBridge_eq_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8PatchedAssumptionBundle.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8PatchedAssumptionBundle.ofBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
The sharper proof-home paper-shaped boundary-bridge bundle agrees exactly with
the same closed-manuscript boundary-bridge bundle as well.
-/
theorem YMSection8PatchedAssumptionBundle_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8PatchedAssumptionBundle.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8PatchedAssumptionBundle.ofBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
So the two proof-home boundary-bridge bundle constructions also agree exactly
with one another directly.
-/
theorem YMSection8PatchedAssumptionBundle_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq_ofEndpointNativeProofHomesOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8PatchedAssumptionBundle.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8PatchedAssumptionBundle.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
The endpoint proof-home boundary-bridge route also packages directly into the
most paper-faithful bundle-building target, via the smaller proof-home feed.
-/
def YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
      I S D C P :=
  (YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_bundleTarget
    (I := I) (S := S) (D := D) (C := C) (P := P)).1
    ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
      (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge)

/--
The same proof-home boundary-bridge packaging is available at the sharper
paper-shaped proof-home feed level too.
-/
def YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget
      I S D C P :=
  (YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_bundleTarget
    (I := I) (S := S) (D := D) (C := C) (P := P)).1
    ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
      (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge)

/--
At the paper-faithful bundle-target level, the smaller proof-home
boundary-bridge construction agrees exactly with the existing
closed-manuscript one.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofEndpointNativeProofHomesOfBoundaryBridge_eq_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
The sharper proof-home paper-shaped bundle-target construction agrees exactly
with the same closed-manuscript boundary-bridge target as well.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
So the two proof-home boundary-bridge bundle-target constructions also agree
exactly with one another directly.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq_ofEndpointNativeProofHomesOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
Direct Section 8 endpoint conclusion from the paper-faithful bundle-building
target induced by the proof-home boundary-bridge route via the smaller
proof-home feed.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTarget
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge)

/--
Direct Section 8 endpoint conclusion from the paper-faithful bundle-building
target induced by the sharper proof-home paper-shaped boundary-bridge route.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTarget
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge)

/--
The proof-home smaller-feed boundary-bridge theorem-level route through the
paper-faithful bundle target agrees exactly with the existing
closed-manuscript theorem-level route.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
The sharper proof-home paper-shaped theorem-level route through the same
paper-faithful bundle target agrees exactly with the corresponding
closed-manuscript theorem-level route as well.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
So the two proof-home theorem-level Section 8 routes through that same
paper-faithful bundle target also agree exactly with one another directly.
-/
theorem YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge_eq_ofEndpointNativeProofHomes
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_PreferredClayEndpointFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
Combined preferred Section 7 plus Section 8 route from the paper-faithful
bundle-building target induced by the proof-home boundary-bridge route via
the smaller proof-home feed.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTarget
      hShadow hGF
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge)

/--
Combined preferred Section 7 plus Section 8 route from the paper-faithful
bundle-building target induced by the sharper proof-home paper-shaped
boundary-bridge route.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTarget
      hShadow hGF
      (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge)

/--
The proof-home smaller-feed combined theorem-level route through the
paper-faithful bundle target agrees exactly with the corresponding
closed-manuscript theorem-level route.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge =
      YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge := by
  exact Subsingleton.elim _ _

/--
The sharper proof-home paper-shaped combined theorem-level route through the
same paper-faithful bundle target agrees exactly with the corresponding
closed-manuscript theorem-level route as well.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge_eq_closedManuscript
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge =
      YMSection7And8_PreferredEndpointCorollaryFromPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge := by
  exact Subsingleton.elim _ _

/--
So the two proof-home theorem-level combined Section 7 plus Section 8 routes
through that same paper-faithful bundle target also agree exactly with one
another directly.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge_eq_ofEndpointNativeProofHomes
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPaperSecondSeamPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge =
      YMSection7And8_PreferredEndpointCorollaryFromEndpointNativeProofHomesPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hBridge := by
  exact Subsingleton.elim _ _

/--
The endpoint proof-home boundary-bridge route also packages directly into the
structured patched-theorem bridge target, via the smaller proof-home feed.
-/
def YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofEndpointNativeProofHomesOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
      I S D C P :=
  YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofPatchedStatement
    ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).1
      ((YMSection8_EndpointNativeProofHomesSecondSeamToEndpointFeed_iff_boundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))

/--
The same structured-target packaging is available from the sharper paper-shaped
proof-home boundary-bridge route.
-/
def YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
      I S D C P :=
  YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofPatchedStatement
    ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_patchedStatement
      (I := I) (S := S) (D := D) (C := C) (P := P)).1
      ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_boundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P)).2 hBridge))

/--
So the two proof-home boundary-bridge structured-target constructions also
agree exactly with one another directly.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq_ofEndpointNativeProofHomesOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge := by
  exact Subsingleton.elim _ _

/--
At the proof-home source layer itself, packaging the sharper paper-shaped
second-seam feed yields exactly the same concrete compatibility object as
packaging the smaller proof-home second-seam feed obtained from it.
-/
theorem YMConcretePreferredRouteCompatibility_ofEndpointNativeProofHomesPaperSecondSeam_eq_ofEndpointNativeProofHomes
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hFeed :
      YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed
        I S D C P) :
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam hFeed =
      YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
        ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_EndpointNativeProofHomesSecondSeamToEndpointFeed
          (I := I) (S := S) (D := D) (C := C) (P := P)).1 hFeed) := by
  unfold YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomesPaperSecondSeam
    YMConcretePreferredRouteCompatibility.ofEndpointNativeProofHomes
    YMConcretePreferredRouteCompatibility.mkOfConcreteFeed
  have hfun :
      (fun _hConcrete :
        YMConcreteEndpointSideConditions.statement
          (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) =>
        hFeed
          (YangMillsConcreteRoute1EndpointPaperSecondSeamFromTransportGapAndEndpointNativeProofHomes
            I)) =
      (fun _hConcrete :
        YMConcreteEndpointSideConditions.statement
          (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I) =>
        ((YMSection8_EndpointNativeProofHomesPaperSecondSeamToEndpointFeed_iff_EndpointNativeProofHomesSecondSeamToEndpointFeed
            (I := I) (S := S) (D := D) (C := C) (P := P)).1 hFeed)
          (YangMillsConcreteRoute1EndpointSecondSeamFromTransportGapAndEndpointNativeProofHomes I)) := by
    funext (_hConcrete :
      YMConcreteEndpointSideConditions.statement
        (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I))
    exact Subsingleton.elim _ _
  cases hfun
  rfl

/--
Canonical paper-flow construction of the structured patched-theorem bridge from
the named Section 8 theorem statement.
-/
def YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hRoute1SecondSeam :
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P) :
    YMSection8Route1SecondSeamForcesAdmissibilityBridge
      I S D C P where
  route1PaperSecondSeam :=
    YangMillsCanonicalRoute1EndpointPaperSecondSeamFromConcretePaperFlow
      ym_concrete_closed_manuscript_paper_flow
  route1SecondSeamForcesAdmissibility := hRoute1SecondSeam

/--
Construction of the structured patched-theorem bridge from the older
closed-manuscript Section 8 boundary bridge.

This records, at the level of a first-class object, that the current Lean
realization of the patched manuscript theorem is obtained by combining:
- the canonical Route 1 paper-second seam already visible in the paper-flow
  surface, and
- the induced paper-second-seam feed extracted from the older boundary bridge.
-/
def YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8Route1SecondSeamForcesAdmissibilityBridge
      I S D C P where
  route1PaperSecondSeam := YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I
  route1SecondSeamForcesAdmissibility :=
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
      hBridge

/--
Construction of the structured patched-theorem bridge from the older
closed-manuscript Section 8 boundary bridge, but routed through the canonical
paper-flow theorem rather than the native-package second-seam export.
-/
def YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8Route1SecondSeamForcesAdmissibilityBridge
      I S D C P where
  route1PaperSecondSeam :=
    YangMillsCanonicalRoute1EndpointPaperSecondSeamFromConcretePaperFlow
      ym_concrete_closed_manuscript_paper_flow
  route1SecondSeamForcesAdmissibility :=
    YMSection8_ClosedManuscriptRoute1EndpointPaperSecondSeamToEndpointFeed_of_boundaryBridge
      hBridge

/--
Closed-manuscript specialization of the patched manuscript theorem
"Route 1 endpoint second seam forces the admissibility side conditions".
-/
abbrev YMSection8_ClosedManuscriptRoute1EndpointSecondSeamForcesAdmissibilitySideConditions
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
    I S D C P

/--
Preferred Section 8 endpoint route from the patched manuscript theorem
"Route 1 endpoint second seam forces the admissibility side conditions".
-/
theorem YMSection8_PreferredClayEndpointFromRoute1EndpointSecondSeamForcesAdmissibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hRoute1SecondSeam :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamForcesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromClosedManuscriptRoute1EndpointPaperSecondSeam
      hRoute1SecondSeam

/--
Combined preferred Section 7 plus Section 8 route from the patched manuscript
theorem "Route 1 endpoint second seam forces the admissibility side
conditions".
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromRoute1EndpointSecondSeamForcesAdmissibility
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hRoute1SecondSeam :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamForcesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryViaClosedManuscriptRoute1EndpointPaperSecondSeamCompatibility
      hShadow hGF hRoute1SecondSeam

/--
Preferred Section 8 endpoint route from the patched manuscript theorem
"Route 1 endpoint second seam forces the admissibility side conditions",
consumed through the canonical closed-manuscript paper-flow theorem.

This is the closest Lean-facing mirror of the patched manuscript spine:
the canonical paper-flow surface already exposes the manuscript-shaped Route 1
second seam, and the patched Section 8 bridge theorem then yields the endpoint
admissibility conclusion.
-/
theorem YMSection8_PreferredClayEndpointFromCanonicalPaperFlowAndRoute1SecondSeamForcesAdmissibility
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hRoute1SecondSeam :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamForcesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    hRoute1SecondSeam
      (YangMillsCanonicalRoute1EndpointPaperSecondSeamFromConcretePaperFlow
        ym_concrete_closed_manuscript_paper_flow)

/--
Canonical closed-manuscript paper-flow route for the patched Section 8 theorem
"Route 1 endpoint second seam forces the admissibility side conditions".
-/
theorem YMSection8_CanonicalPaperFlowRoute1SecondSeamForcesAdmissibility
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hRoute1SecondSeam :
      YMSection8_Route1EndpointSecondSeamForcesAdmissibilityStatement
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofCanonicalPaperFlow
      (S := S) (D := D) (C := C) (P := P)
      hRoute1SecondSeam).endpointConclusion

/--
Preferred Section 8 endpoint route from a theorem that builds the structured
patched-theorem bridge directly from the Route 1 paper-second seam.

This route is retained because it exposes a manuscript-shaped access path into
the canonical endpoint theorem. It should not be read as competing with the
canonical Section 8 surface fixed later in this file.
-/
theorem YMSection8_PreferredClayEndpointFromStructuredBridgeTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hTarget :
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (hTarget (YangMillsConcreteRoute1EndpointPaperSecondSeamStatement I)).endpointConclusion

/--
Combined preferred Section 7 plus Section 8 route from a theorem that builds
the structured patched-theorem bridge directly from the Route 1 paper-second
seam.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromStructuredBridgeTarget
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hTarget :
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact YMSection8_PreferredClayEndpointFromStructuredBridgeTarget hTarget

/--
The older closed-manuscript Section 8 boundary bridge yields the structured
patched-theorem bridge object.
-/
theorem YMSection8_Route1SecondSeamForcesAdmissibilityBridgeOfBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8Route1SecondSeamForcesAdmissibilityBridge
      I S D C P := by
  exact
    YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofBoundaryBridge
      hBridge

/--
The older closed-manuscript Section 8 boundary bridge also yields the
structured patched-theorem bridge object through the canonical paper-flow
theorem surface.
-/
theorem YMSection8_Route1SecondSeamForcesAdmissibilityBridgeOfBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8Route1SecondSeamForcesAdmissibilityBridge
      I S D C P := by
  exact
    YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofBoundaryBridgeViaCanonicalPaperFlow
      hBridge

/--
The older closed-manuscript boundary bridge realizes the sharper remaining
target: it builds the structured patched-theorem bridge from the Route 1
paper-second seam.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
      I S D C P := by
  intro _hSecondSeam
  exact
    YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofBoundaryBridge
      hBridge

/--
At the structured-bridge level, the smaller proof-home boundary-bridge
construction agrees exactly with the existing closed-manuscript one.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofEndpointNativeProofHomesOfBoundaryBridge_eq_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofEndpointNativeProofHomesOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofBoundaryBridge hBridge := by
  exact Subsingleton.elim _ _

/--
The sharper proof-home paper-shaped structured-target construction agrees
exactly with the existing closed-manuscript boundary-bridge one as well.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge_eq_ofBoundaryBridge
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.ofEndpointNativeProofHomesPaperSecondSeamOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofBoundaryBridge hBridge := by
  exact Subsingleton.elim _ _

/--
Canonical paper-flow version of the same sharper remaining target induced by
the older closed-manuscript boundary bridge.
-/
theorem YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofBoundaryBridgeViaCanonicalPaperFlow
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
      I S D C P := by
  intro _hSecondSeam
  exact
    YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofBoundaryBridgeViaCanonicalPaperFlow
      hBridge

/--
Direct Section 8 endpoint conclusion recovered from the older
closed-manuscript boundary bridge, but factored through the canonical
paper-flow version of the structured patched-theorem bridge object.
-/
theorem YMSection8_PreferredClayEndpointFromBoundaryBridgeViaCanonicalPaperFlowBridge
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    (YMSection8Route1SecondSeamForcesAdmissibilityBridge.ofBoundaryBridgeViaCanonicalPaperFlow
      (S := S) (D := D) (C := C) (P := P)
      hBridge).endpointConclusion

/--
Combined preferred Section 7 plus Section 8 route from the patched manuscript
theorem "Route 1 endpoint second seam forces the admissibility side
conditions", consumed through the canonical closed-manuscript paper-flow
theorem.
-/
theorem YMSection7And8_PreferredEndpointCorollaryFromCanonicalPaperFlowAndRoute1SecondSeamForcesAdmissibility
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hRoute1SecondSeam :
      YMSection8_ClosedManuscriptRoute1EndpointSecondSeamForcesAdmissibilitySideConditions
        I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  refine ⟨?_, ?_⟩
  · exact YMSection7_PreferredGlobalFormRecovery I S D hShadow hGF
  · exact
      YMSection8_PreferredClayEndpointFromCanonicalPaperFlowAndRoute1SecondSeamForcesAdmissibility
        hRoute1SecondSeam

/--
Canonical manuscript-facing Section 8 theorem surface.

This fixes the patched Route 1 second-seam theorem as the preferred Section 8
theorem surface for the current extension stack. The nearby paper-flow,
structured-bridge, and bundle-target routes should now be read as exactness or
compatibility routes into this theorem surface.
-/
abbrev YMSection8_CanonicalPreferredEndpointTheorem
    (I : YMClosedInstantiatedManuscript)
    (S : YMManuscriptTheoremScope)
    (D : YMManuscriptDeformationData S)
    (C : YMCompanionIIITaggedCompletionBridge I S D)
    (P : YMCompanionIIITaggedClayEndpointPackage I S D C) : Prop :=
  YMSection8_ClosedManuscriptRoute1EndpointSecondSeamForcesAdmissibilitySideConditions
    I S D C P

/--
Canonical manuscript-facing Section 8 endpoint conclusion.

The canonical endpoint conclusion is taken directly from the preferred patched
Route 1 theorem surface. Nearby paper-flow, structured-bridge, and bundle-
target routes should be read as support for or access to this theorem, not as
competing endpoint forms.
-/
theorem YMSection8_CanonicalPreferredClayEndpoint
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hCanonical :
      YMSection8_CanonicalPreferredEndpointTheorem I S D C P) :
    P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection8_PreferredClayEndpointFromRoute1EndpointSecondSeamForcesAdmissibility
      (I := I) (S := S) (D := D) (C := C) (P := P) hCanonical

/--
Canonical manuscript-facing combined Section 7 plus Section 8 corollary.
-/
theorem YMSection7And8_CanonicalPreferredEndpointCorollary
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    {xi eta : YMExtendedSupportObject S}
    (hShadow :
      YMExtendedSupportObject.localShadow xi =
        YMExtendedSupportObject.localShadow eta)
    (hGF :
      Not
        (YMExtendedSupportObject.globalFormDatum xi =
          YMExtendedSupportObject.globalFormDatum eta))
    (hCanonical :
      YMSection8_CanonicalPreferredEndpointTheorem I S D C P) :
    Not
        (YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) xi =
        YMTheoremScopeSectorBridge.sectorAssignment
          (YMCompanionIIIPreferredTheoremScopeBridge I S D) eta) /\
      P.admissibilitySideConditionsSatisfied := by
  exact
    YMSection7And8_PreferredEndpointCorollaryFromRoute1EndpointSecondSeamForcesAdmissibility
      (I := I) (S := S) (D := D) (C := C) (P := P) hShadow hGF hCanonical

/--
The direct patched-theorem endpoint route agrees with the canonical paper-flow
endpoint theorem surface.

This is the identity check showing that the preferred patched theorem is not a
second competing endpoint, but the theorem content chosen as canonical.
-/
theorem YMSection8_PreferredClayEndpointFromRoute1EndpointSecondSeamForcesAdmissibility_eq_canonical
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hRoute1SecondSeam :
      YMSection8_CanonicalPreferredEndpointTheorem I S D C P) :
    YMSection8_PreferredClayEndpointFromRoute1EndpointSecondSeamForcesAdmissibility
        (I := I) (S := S) (D := D) (C := C) (P := P) hRoute1SecondSeam =
      YMSection8_CanonicalPreferredClayEndpoint
        (I := I) (S := S) (D := D) (C := C) (P := P) hRoute1SecondSeam := by
  exact Subsingleton.elim _ _

/--
The structured-bridge access route likewise agrees with the canonical Section 8
theorem surface once its target is supplied.

So the structured-bridge route should be read as an access path into the
canonical theorem, not as a parallel endpoint conclusion.
-/
theorem YMSection8_PreferredClayEndpointFromStructuredBridgeTarget_eq_canonical
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hTarget :
      YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget
        I S D C P) :
    YMSection8_PreferredClayEndpointFromStructuredBridgeTarget
        (I := I) (S := S) (D := D) (C := C) (P := P) hTarget =
      YMSection8_CanonicalPreferredClayEndpoint
        (I := I) (S := S) (D := D) (C := C) (P := P)
        (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.impliesPatchedStatement
          (I := I) (S := S) (D := D) (C := C) (P := P) hTarget) := by
  exact Subsingleton.elim _ _

/--
The closed-manuscript boundary-bridge route through the smaller Route 1
second-seam interface also agrees with the canonical Section 8 theorem surface.

This makes the older boundary-bridge route explicitly subordinate to the
canonical theorem surface rather than a separate endpoint destination.
-/
theorem YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridgeViaRoute1EndpointSecondSeam_eq_canonical
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridgeViaRoute1EndpointSecondSeam
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_CanonicalPreferredClayEndpoint
        (I := I) (S := S) (D := D) (C := C) (P := P)
        (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.impliesPatchedStatement
          (I := I) (S := S) (D := D) (C := C) (P := P)
        (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofBoundaryBridge
            (I := I) (S := S) (D := D) (C := C) (P := P) hBridge)) := by
  exact Subsingleton.elim _ _

/--
The closed-manuscript boundary-bridge route through the sharper paper-shaped
Route 1 second seam also agrees with the canonical Section 8 theorem surface.

So even the sharper paper-shaped boundary-bridge presentation is an access
route into the same canonical theorem content.
-/
theorem YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridgeViaRoute1EndpointPaperSecondSeam_eq_canonical
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointFromClosedManuscriptBoundaryBridgeViaRoute1EndpointPaperSecondSeam
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_CanonicalPreferredClayEndpoint
        (I := I) (S := S) (D := D) (C := C) (P := P)
        (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget.impliesPatchedStatement
          (I := I) (S := S) (D := D) (C := C) (P := P)
        (YMSection8_Route1PaperSecondSeamBuildsStructuredBridgeTarget_ofBoundaryBridge
            (I := I) (S := S) (D := D) (C := C) (P := P) hBridge)) := by
  exact Subsingleton.elim _ _

/--
The boundary-bridge route through the paper-faithful patched-assumption-bundle
target also agrees with the canonical Section 8 theorem surface.

This closes the loop on the bundle-target presentation as well: it is useful
for manuscript-shaped packaging, but not mathematically independent of the
canonical endpoint theorem.
-/
theorem YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTargetOfBoundaryBridge_eq_canonical
    {I : YMClosedInstantiatedManuscript}
    {S : YMManuscriptTheoremScope}
    {D : YMManuscriptDeformationData S}
    {C : YMCompanionIIITaggedCompletionBridge I S D}
    {P : YMCompanionIIITaggedClayEndpointPackage I S D C}
    (hBridge :
      YMSection8_ClosedManuscriptEndpointSatisfiesAdmissibilitySideConditions
        I S D C P) :
    YMSection8_PreferredClayEndpointFromPatchedAssumptionBundleTargetOfBoundaryBridge
        (I := I) (S := S) (D := D) (C := C) (P := P) hBridge =
      YMSection8_CanonicalPreferredClayEndpoint
        (I := I) (S := S) (D := D) (C := C) (P := P)
        (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget.impliesPatchedStatement
          (I := I) (S := S) (D := D) (C := C) (P := P)
          (YMSection8_Route1PaperSecondSeamBuildsPatchedAssumptionBundleTarget_ofBoundaryBridge
            (I := I) (S := S) (D := D) (C := C) (P := P) hBridge)) := by
  exact Subsingleton.elim _ _

end MaleyLean
