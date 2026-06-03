# Yang--Mills Extension Stack

This folder contains the Lean-facing extension stack for the nonlocal
Yang--Mills endpoint paper.

## Main point

The main human-facing result here is the audited A+ endpoint for the extension
stack, including the analytical mechanization of four critical seams:

- the QE3 density / graph-core handoff
- the dyadic-to-continuous-time OS upgrade
- the continuum transport / sharp-gap bridge
- the Section 8 endpoint / admissibility bridge

These are the main transitions that used to be easiest to describe only at a
high level. In the current stack they are isolated as named theorem surfaces,
reduced payloads, proof-home projections, source-route recoveries, and direct
reconstruction paths.

The current repo-level A+ audit closes the manuscript-facing route through the
obligation ledger, subobligation ledger, closure protocol, and stem-to-stern
promotion target. The verified audit command is:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-yang-mills-a-plus-audit.ps1
```

The latest pass built `MaleyLean.Papers.YangMills`, ran the fourteen Yang-Mills
A+ audit files, and found no live `axiom`, `sorry`, `admit`, or `unsafe`
declarations in the audited Yang-Mills surface. Some `#print axioms` output
still records standard Lean classical foundations such as `propext`,
`Classical.choice`, and `Quot.sound`; these are foundational/imported Lean
dependencies, not project-specific Yang-Mills axioms.

## Manuscript shape

The stack is organized in manuscript-facing terms:

- `EndpointTheoremScopeObjects.lean` fixes the theorem-scope support/label
  object layer and now names the preferred paper-facing theorem-scope class.
  It also names a canonical Section 4 theorem-scope package for the current
  extension stack.
- `EndpointConcreteTheoremScopeBridge.lean` realizes that layer in the existing
  reconstructed-sector carrier at the baseline infrastructure level.
- `EndpointGlobalFormRecoveryFormalization.lean` packages the Section 7
  same-local-shadow / different-global-form recovery surface.
- `EndpointTaggedTheoremScopeRealization.lean` upgrades that bridge to the
  canonical current paper-facing tagged realization route and now names the
  canonical Section 4 bridge surfaces explicitly.
- `EndpointCompletionBridgeFormalization.lean`,
  `EndpointClayConclusionFormalization.lean`, and
  `EndpointConcretePreferredRouteCompatibility.lean` carry the Section 8
  completion/admissibility bridge. The completion and Clay-endpoint layers now
  also speak directly in terms of the canonical packaged theorem-scope object,
  not only in raw theorem-scope parameters. The compatibility layer now also
  names one canonical manuscript-facing Section 8 theorem surface and one
  canonical combined Section 7 plus Section 8 corollary.

The current post-freeze manuscript-faithfulness pass has also made the
Section 4, Section 7, and Section 8 code comments more uniform about this
status: these are now the fixed manuscript-facing routes carried by the
current extension stack, while nearby alternative packages and access paths are
read as support infrastructure around them.

On the QE3 side, the main seam files are:

- `VacuumGapConcreteCriticalSeam.lean`
- `VacuumGapConcreteOSTimeUpgradeProjection.lean`
- `VacuumGapConcreteContinuumTransportProjection.lean`

## Section map

If you are reading the extension manuscript by section number, the quickest file
map is:

- Section 4: `EndpointTheoremScopeObjects.lean` and
  `EndpointConcreteTheoremScopeBridge.lean`
- Section 7: `EndpointGlobalFormRecoveryFormalization.lean` and
  `EndpointTaggedManuscriptCorollaries.lean`
- Section 8: `EndpointCompletionBridgeFormalization.lean`,
  `EndpointClayConclusionFormalization.lean`, and
  `EndpointConcretePreferredRouteCompatibility.lean`

The four seam files cut across that section structure:

- QE3 density / graph-core handoff:
  `VacuumGapConcreteCriticalSeam.lean`
- dyadic-to-continuous-time OS upgrade:
  `VacuumGapConcreteOSTimeUpgradeProjection.lean`
- continuum transport / sharp-gap bridge:
  `VacuumGapConcreteContinuumTransportProjection.lean`
- Section 8 endpoint / admissibility bridge:
  `EndpointConcretePreferredRouteCompatibility.lean`

## Suggested reading order

If you want the shortest route through the extension story, read:

1. `EndpointFormalizationOverview.lean`
2. `VacuumGapConcreteCriticalSeam.lean`
3. `VacuumGapConcreteOSTimeUpgradeProjection.lean`
4. `VacuumGapConcreteContinuumTransportProjection.lean`
5. `EndpointConcreteTheoremScopeBridge.lean`
6. `EndpointGlobalFormRecoveryFormalization.lean`
7. `EndpointConcretePreferredRouteCompatibility.lean`

For the human-facing status and audit boundary, see:

- `MaleyLean/Papers/YangMills/FormalizationStatus.md`
- `.codex-work/YM_APlus_Audit_Boundary.md`
- `scripts/check-yang-mills-a-plus-audit.ps1`

## A+ Endpoint Status

The formerly separate endpoint targets are now routed through the A+ endpoint:

- theorem-scope extended-support class and support labels;
- Section 7 same-local-shadow / different-global-form recovery;
- Section 8 scope-faithful completion and Clay endpoint admissibility bridge;
- A+ obligation and subobligation closure;
- stem-to-stern promotion to the A+ target.

The remaining human-facing work is documentation discipline: any final paper
appendix should state the exact repository/module names, build command, theorem
correspondence table, no-placeholder audit, imported standard boundary,
predecessor theorem-object boundary, and archive hash/DOI. It should not blur
standard Lean classical foundations with project-specific Yang-Mills axioms.
