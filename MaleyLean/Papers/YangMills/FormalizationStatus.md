# Yang-Mills Formalization Status

Last updated: 2026-06-03

## Purpose

This note gives a human-readable snapshot of the current state of the Yang-Mills
formalization in this checkout.

It is intentionally written for readers who want to understand:

- what the repo claims to cover,
- what has actually been encoded,
- how far the current formalization appears to go,
- and what would count as meaningful next work.

## Executive Summary

Relative to the Yang-Mills paper inventory encoded in this repository, the
manuscript-facing A+ audit endpoint is now closed at the theorem-routing and
load-bearing seam levels.

The strongest verified human-facing statement is:

- the Yang-Mills package builds through `MaleyLean.Papers.YangMills`;
- the fourteen Yang-Mills A+ audit files under `Checks/Axiom` pass;
- the audited surface contains no live `axiom`, `sorry`, `admit`, or `unsafe`
  declarations in `MaleyLean/Papers/YangMills` or `Checks/Axiom`;
- the A+ progress endpoint reports `ymAPlusCurrentProgressSnapshot.percent =
  100`;
- the A+ subobligation ledger reports `44` closed and `0` open;
- some theorem dependency reports still display standard Lean classical
  foundations such as `propext`, `Classical.choice`, and `Quot.sound`, which
  are foundational/imported Lean dependencies rather than project-specific
  Yang-Mills axioms.

The current audit command is:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-yang-mills-a-plus-audit.ps1
```

The verified environment for the latest pass is:

- Lean toolchain: `leanprover/lean4:v4.28.0`
- mathlib revision: `8f9d9cff6bd728b17a24e163c9402775d9e6a365`

The main mathematical win is the stronger analytical mechanization of the four
critical seams that would attract the sharpest expert scrutiny:

- the QE3 density / graph-core handoff
- the dyadic / OS continuous-time upgrade
- the continuum transport / sharp-gap bridge
- the Section 8 endpoint / admissibility bridge

In the current development, those seams are no longer represented only as broad
route-level consequences. They are pushed into explicit extension files,
reduced-payload interfaces, proof-home projections, source-route recoveries,
and theorem-level reconstruction paths.

In particular:

- the live manuscript claim families are all represented in the encoded claim ledger,
- the verbatim theorem register is present,
- the theorem-facing kernel and surface layers are present,
- the native constructive / vacuum-gap / endpoint bridge layers are present,
- the deeper cross-heart image / factorization / coherence layers are present,
- and the A+ workflow-level verification currently passes.

More importantly for mathematical credibility, the highest-risk analytic seams
are no longer represented only as broad theorem exports. The current extension
stack now makes them explicit as reduced payloads, source-route recoveries,
proof-home projections, and theorem-level reconstructions:

- the QE3 density / graph-core handoff is isolated and rebuilt from its own
  reduced source ingredients,
- the dyadic / OS continuous-time seam is isolated down to its single extra
  ingredient and collapses, on the public theorem surface and on the two main
  source routes, to plain OS transport readiness,
- the continuum transport seam is reconstruction-explicit from its lower
  transport / gap ingredients on both main upstream routes,
- and the Section 8 endpoint / admissibility seam is reconstructed from the
  endpoint proof-home and Route 1 endpoint-package ingredients all the way up
  through the preferred theorem layer.

For the extension paper specifically, this means the current repo no longer
looks like a generic sector-language placeholder. The manuscript's central
human-facing burdens are now visibly encoded in Lean:

- Section 4's extended-support class is formalized as a fixed theorem-scope
  support-and-label class with explicit support and deformation equivalence
- Section 7's global-form recovery surface is formalized as the distinction
  problem between same-local-shadow / different-global-form objects
- Section 8's endpoint theorem is formalized as a scope-faithful completion and
  admissibility bridge over the unchanged local vacuum theory

The formerly separate presentation and classification targets have been routed
through the current A+ endpoint: the theorem-scope extended-support class,
Section 7 global-form recovery surface, and Section 8 endpoint/admissibility
bridge are now covered by the A+ obligation/subobligation route and the
stem-to-stern promotion target. Future manuscript prose should still record the
standard-import and predecessor-theorem-object boundary explicitly.

For a shorter extension-paper-focused reading order, see
`MaleyLean/Papers/YangMills/Extension/README.md`. For the current audit boundary
note, see `.codex-work/YM_APlus_Audit_Boundary.md`.

The most recent verification sweep also strengthened the deepest kernel so that:

- the constructive side points explicitly to the sharp-local assembly path,
- the endpoint side points explicitly to the smear / correlate route,
- and the main cross-heart route laws are exposed as named kernel theorems rather
  than hidden definitional equalities.

The current manuscript-facing Yang-Mills surface has no live project-level
`axiom`, `sorry`, `admit`, or `unsafe` declaration under the repo A+ audit
workflow. This is stronger and more precise than the older shorthand
"axiom-free": `#print axioms` may still display standard Lean classical
foundations such as `propext`, `Classical.choice`, and `Quot.sound`.

For the local-net paper specifically, this means the main structural risk is no
longer concentrated in vague bridge claims. The decisive seam transitions are
now encoded as named theorem surfaces with matching source-level provenance and
reconstruction equalities.

## What "Complete" Means Here

The word "complete" in this note is relative to the paper-facing inventory that
already exists inside this checkout.

That means:

- every locally encoded live claim family appears to have a corresponding formal path,
- no obvious unfinished proof markers were found in `MaleyLean/Papers/YangMills`,
- and the end-to-end Yang-Mills workflow check currently succeeds.

It does not automatically mean:

- that an external newer draft of the paper contains nothing beyond this checkout,
- or that the repository's own encoded inventory is impossible to extend.

It also does not mean that every cited analytic proof home has been replaced by
first-principles Lean PDE/QFT derivations. The present completeness claim is:

- strong manuscript-facing mechanization of the load-bearing theorem surfaces,
- strong source/provenance control behind the decisive seams,
- and no live project-level `axiom`, `sorry`, `admit`, or `unsafe` escape on
  the current audited Yang-Mills surface.

So the present status is best read as:

- complete relative to the current encoded Yang-Mills inventory,
- not necessarily complete relative to any future or external manuscript revision.

## Live Claim Families

The repository classifies these as the live mathematical proof burden:

- ultraviolet public scope,
- Route 1 lattice gap,
- Lane A sharp-local construction,
- QE3 continuum gap transport,
- endpoint local net.

These are recorded in:

- `MaleyLean/Papers/YangMills/Obligations/ClaimLedger.lean`
- `MaleyLean/Papers/YangMills/Obligations/PaperLedger.lean`
- `MaleyLean/Papers/YangMills/Obligations/Inventory.lean`

## Main Paper-Facing Registers

The theorem and source-facing registries currently include:

- `MaleyLean/Papers/YangMills/Verbatim/TheoremRegister.lean`
- `MaleyLean/Papers/YangMills/Verbatim/DependencySpineSimple.lean`
- `MaleyLean/Papers/YangMills/SourceCrosswalk/Register.lean`
- `MaleyLean/Papers/YangMills/SourceCrosswalk/WitnessRegister.lean`
- `MaleyLean/Papers/YangMills/SourceCrosswalk/ConstructiveWitnessRegister.lean`
- `MaleyLean/Papers/YangMills/SourceCrosswalk/VacuumGapWitnessRegister.lean`
- `MaleyLean/Papers/YangMills/SourceCrosswalk/EndpointWitnessRegister.lean`

These files serve as the clearest local evidence that the manuscript-facing
claim inventory has been translated into repo-visible formal objects.

## Canonical Verified Boundary

In addition to the older manuscript-facing theorem assembly, the repo now has a
stricter canonical boundary that avoids arbitrary theorem-part landing maps.

The key files are:

- `MaleyLean/Papers/YangMills/Kernel/CanonicalCoreOutputAssembly.lean`
- `MaleyLean/Papers/YangMills/Kernel/CanonicalRouteClosure.lean`
- `MaleyLean/Papers/YangMills/Kernel/CanonicalTheoremAssemblyWitness.lean`
- `MaleyLean/Papers/YangMills/Kernel/CanonicalVerifiedPayload.lean`
- `MaleyLean/Papers/YangMills/Surface/CanonicalVerifiedPayloadSummary.lean`
- `MaleyLean/Papers/YangMills/Kernel/ExplicitHeartStatementAssembly.lean`
- `MaleyLean/Papers/YangMills/Surface/ExplicitHeartStatementAssemblySummary.lean`

These files expose the exact canonically verified content currently present in
the checkout:

- public-scope closure,
- Part C / Part D / endpoint route outputs,
- intrinsic constructive bounded-base output,
- intrinsic vacuum-gap transport output,
- intrinsic endpoint exactness output,
- and the bridge consequences connecting those intrinsic heart outputs.

This canonical path is the best current answer to:

"What does the repo verify without using arbitrary theorem-part alignment maps?"

There is now also a more specific heart-level repair path showing that the
three main theorem hearts no longer need to be read only through abstract
placeholder props:

- Part C has `ym_laneA_explicit_statement`
- Part D has `ym_route1_explicit_statement`
- the endpoint heart has `ym_endpoint_explicit_statement`

and these are assembled together in
`MaleyLean/Papers/YangMills/Kernel/ExplicitHeartStatementAssembly.lean`.

The preferred submission-facing theorem path now goes one step further:

- `MaleyLean/Papers/YangMills/Kernel/PaperClaimStatements.lean` keys the Part C,
  Part D, and endpoint claims directly to named theorem-register families,
- `MaleyLean/Papers/YangMills/Kernel/FaithfulPaperTheoremAssembly.lean` builds
  the preferred theorem-facing path over those theorem-register-keyed claims,
- and `MaleyLean/Papers/YangMills/Surface/Summary.lean` now includes that
  repaired path in the main manuscript-facing summary.

The older landing-map theorem path remains in the repo for compatibility, but
it is no longer the preferred submission-facing theorem boundary.

The current best submission-facing entry point is now:

- `MaleyLean/Papers/YangMills/Kernel/FlatManuscriptTheoremSurface.lean`
- `MaleyLean/Papers/YangMills/Surface/FlatManuscriptTheoremSurfaceSummary.lean`

This is the first Yang-Mills surface in the repo that is simultaneously:

- direct rather than landing-map based,
- manuscript-granular rather than only three-heart compressed,
- flattened into one direct theorem proposition rather than exported mainly as
  bundle objects.

The slightly older granular-bundle boundary remains useful as an intermediate
construction:

- `MaleyLean/Papers/YangMills/Kernel/ManuscriptGranularTheoremSurface.lean`
- `MaleyLean/Papers/YangMills/Surface/ManuscriptGranularTheoremSurfaceSummary.lean`

## Current Faithfulness Boundary

The former manuscript-instantiation gap has now been closed inside the repo.

In addition to the parameterized theorem surfaces, the repository now exposes a
closed manuscript constant and its realized completion witness:

- `MaleyLean/Papers/YangMills/Kernel/ManuscriptObjectPackageDeclarations.lean`
- `noncomputable def I : YMClosedInstantiatedManuscript`
- `theorem ym_closed_manuscript_completion_realized :
  ym_closed_manuscript_completion`

So the current preferred theorem surfaces may still be useful to read in their
parameterized form, but the repository no longer stops short of a closed
manuscript instance.

That parameterization should not be confused with support axioms: the
audited Yang-Mills surface contains no live project-specific axiom declaration.
The only axiom dependencies visible in selected `#print axioms` output are
standard Lean/classical foundations and accepted imported-background
dependencies, not manuscript-specific support axioms.

## Kernel Coverage Highlights

The constructive family is centered in:

- `MaleyLean/Papers/YangMills/Kernel/ConstructiveCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/ConstructiveSemanticBundle.lean`
- `MaleyLean/Papers/YangMills/Kernel/ConstructiveRelationalInterface.lean`
- `MaleyLean/Papers/YangMills/Kernel/ConstructiveExtendAssembleLawPackage.lean`
- `MaleyLean/Papers/YangMills/Kernel/ConstructiveEndpointLawPackage.lean`

The vacuum-gap family is centered in:

- `MaleyLean/Papers/YangMills/Kernel/VacuumGapCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/VacuumGapSemanticBundle.lean`
- `MaleyLean/Papers/YangMills/Kernel/VacuumGapRelationalInterface.lean`
- `MaleyLean/Papers/YangMills/Kernel/VacuumGapTransportRealizeLawPackage.lean`
- `MaleyLean/Papers/YangMills/Kernel/BoundedBaseTransportLawPackage.lean`

The endpoint family is centered in:

- `MaleyLean/Papers/YangMills/Kernel/EndpointCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/EndpointSemanticBundle.lean`
- `MaleyLean/Papers/YangMills/Kernel/EndpointRelationalInterface.lean`
- `MaleyLean/Papers/YangMills/Kernel/EndpointCorrelationLawPackage.lean`
- `MaleyLean/Papers/YangMills/Kernel/GapTransportEndpointLawPackage.lean`

The theorem-facing and cross-heart layers are centered in:

- `MaleyLean/Papers/YangMills/Kernel/CrossHeartLaws.lean`
- `MaleyLean/Papers/YangMills/Kernel/CrossHeartLawObjects.lean`
- `MaleyLean/Papers/YangMills/Kernel/InterHeartCompatibility.lean`
- `MaleyLean/Papers/YangMills/Kernel/TheoremBridgeInterface.lean`
- `MaleyLean/Papers/YangMills/Kernel/TheoremBridgeConsequences.lean`
- `MaleyLean/Papers/YangMills/Kernel/TheoremAssemblyWitness.lean`

The deepest native semantic path is centered in:

- `MaleyLean/Papers/YangMills/Kernel/NativeLawAssembly.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeInterHeartCompatibility.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeConstructiveVacuumGapLaw.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeVacuumGapEndpointLaw.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeConstructiveEndpointLaw.lean`

and then extended by the native image / factorization / coherence hierarchy.

## Recent Deep-Kernel Improvements

The most recent meaningful refinements were not extra wrappers. They were
kernel-facing improvements to the mathematical story:

- route equalities were turned into named kernel theorems,
- constructive-to-endpoint was made compositional through vacuum-gap,
- general witness theorems were added for the three main cross-heart law
  directions,
- endpoint exactness was rebased onto the endpoint packet theorem and then tied
  more explicitly to the chosen smear / correlate route,
- constructive bounded-base extraction was rebased onto the sharp-local core
  theorem and then tied more explicitly to the chosen sharp-local assembly path.

The most recent extension-side improvements went further than theorem naming:

- the public QE3 closure ladder is now reconstruction-explicit from the smaller
  public spines it exposes,
- the two main upstream QE3 source routes now agree by direct proof equality at
  the isolated seam, bundled core, and critical-seam levels,
- the isolated OS-side extra ingredient now collapses to plain
  `os_transport_ready` both on public theorem surfaces and on the two main
  upstream source routes,
- and the endpoint proof-home route now matches the closed-manuscript Section 8
  route all the way from exact endpoint / boundary ingredients up through the
  preferred endpoint and combined Section 7+8 theorem surfaces.

In other words: the mechanization no longer stops at "the same propositions are
available." In the decisive places it now shows that the live recovered proofs
agree directly with the reconstructions from the smaller ingredient packages
that are supposed to generate them.

## Current Verification State

The latest A+ workflow-level check succeeded with:

```text
powershell -ExecutionPolicy Bypass -File scripts/check-yang-mills-a-plus-audit.ps1
```

The runner performs all of the following:

- prints the Lean toolchain and mathlib revision;
- scans `MaleyLean/Papers/YangMills` and `Checks/Axiom` for live `axiom`,
  `sorry`, `admit`, or `unsafe` declarations;
- builds `MaleyLean.Papers.YangMills`;
- runs the fourteen Yang-Mills A+ audit files.

The runner reported:

- Lean toolchain `leanprover/lean4:v4.28.0`;
- mathlib revision `8f9d9cff6bd728b17a24e163c9402775d9e6a365`;
- no live `axiom`, `sorry`, `admit`, or `unsafe` declarations on the audited
  Yang-Mills surface;
- successful `MaleyLean.Papers.YangMills` build;
- successful A+ audit files.

## Remaining Meaningful Work

At this point, more meaningful work would not come from adding more summary or
alignment scaffolding.

The next real step would require one of:

- a new mathematical statement from the paper that is not yet represented in the
  current encoded inventory,
- a newer manuscript snapshot,
- or a deliberate decision to enrich the encoded inventory beyond what is
  currently registered in the repo.

Without that, additional "formalization progress" would mostly be structural
repackaging or archive/documentation polish rather than new paper verification.
