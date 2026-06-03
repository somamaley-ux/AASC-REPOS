# Yang-Mills Coverage Matrix

Last updated: 2026-04-09

## Reading Guide

This table summarizes the current local coverage of the Yang-Mills paper as it
is encoded inside this checkout.

The key question is:

"Does this claim family have a clear path from paper-facing registration into
kernel formalization and theorem-facing export?"

## Matrix

| Claim family | Encoded in claim ledger | Verbatim theorem register | Kernel path present | Native / theorem-facing landing | Status |
| --- | --- | --- | --- | --- | --- |
| Ultraviolet public scope | Yes | Yes | Yes | Yes | Covered |
| Route 1 lattice gap | Yes | Yes | Yes | Yes | Covered |
| Lane A sharp-local construction | Yes | Yes | Yes | Yes | Covered |
| QE3 continuum gap transport | Yes | Yes | Yes | Yes | Covered |
| Endpoint local net | Yes | Yes | Yes | Yes | Covered |

## Main Supporting Files

### Claim / manuscript inventory

- `MaleyLean/Papers/YangMills/Obligations/ClaimLedger.lean`
- `MaleyLean/Papers/YangMills/Obligations/PaperLedger.lean`
- `MaleyLean/Papers/YangMills/Obligations/Inventory.lean`

### Verbatim paper register

- `MaleyLean/Papers/YangMills/Verbatim/TheoremRegister.lean`
- `MaleyLean/Papers/YangMills/Verbatim/DependencySpineSimple.lean`

### Constructive kernel

- `MaleyLean/Papers/YangMills/Kernel/ConstructiveCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/ConstructiveSemanticBundle.lean`
- `MaleyLean/Papers/YangMills/Kernel/ConstructiveExtendAssembleLawPackage.lean`

### Vacuum-gap kernel

- `MaleyLean/Papers/YangMills/Kernel/VacuumGapCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/VacuumGapSemanticBundle.lean`
- `MaleyLean/Papers/YangMills/Kernel/VacuumGapTransportRealizeLawPackage.lean`

### Endpoint kernel

- `MaleyLean/Papers/YangMills/Kernel/EndpointCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/EndpointSemanticBundle.lean`
- `MaleyLean/Papers/YangMills/Kernel/EndpointCorrelationLawPackage.lean`

### Cross-heart / theorem-facing kernel

- `MaleyLean/Papers/YangMills/Kernel/CrossHeartLaws.lean`
- `MaleyLean/Papers/YangMills/Kernel/CrossHeartLawObjects.lean`
- `MaleyLean/Papers/YangMills/Kernel/InterHeartCompatibility.lean`
- `MaleyLean/Papers/YangMills/Kernel/TheoremBridgeInterface.lean`
- `MaleyLean/Papers/YangMills/Kernel/TheoremBridgeConsequences.lean`
- `MaleyLean/Papers/YangMills/Kernel/TheoremAssemblyWitness.lean`

### Canonical alignment-free boundary

- `MaleyLean/Papers/YangMills/Kernel/CanonicalCoreOutputAssembly.lean`
- `MaleyLean/Papers/YangMills/Kernel/CanonicalRouteClosure.lean`
- `MaleyLean/Papers/YangMills/Kernel/CanonicalTheoremAssemblyWitness.lean`
- `MaleyLean/Papers/YangMills/Kernel/CanonicalVerifiedPayload.lean`
- `MaleyLean/Papers/YangMills/Surface/CanonicalVerifiedPayloadSummary.lean`

### Explicit heart-level statement path

- `MaleyLean/Papers/YangMills/Kernel/ConstructiveCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/VacuumGapCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/EndpointCore.lean`
- `MaleyLean/Papers/YangMills/Kernel/ExplicitHeartStatementAssembly.lean`
- `MaleyLean/Papers/YangMills/Surface/ExplicitHeartStatementAssemblySummary.lean`

### Preferred submission-facing theorem path

- `MaleyLean/Papers/YangMills/Kernel/PaperClaimStatements.lean`
- `MaleyLean/Papers/YangMills/Kernel/FaithfulPaperTheoremAssembly.lean`
- `MaleyLean/Papers/YangMills/Surface/Summary.lean`

### Preferred granular theorem surface

- `MaleyLean/Papers/YangMills/Kernel/ManuscriptGranularTheoremSurface.lean`
- `MaleyLean/Papers/YangMills/Surface/ManuscriptGranularTheoremSurfaceSummary.lean`
- `MaleyLean/Papers/YangMills/Kernel/NamedCoreTheoremReflection.lean`
- `MaleyLean/Papers/YangMills/Kernel/NamedLaneATheoremContent.lean`
- `MaleyLean/Papers/YangMills/Kernel/NamedRoute1TheoremContent.lean`
- `MaleyLean/Papers/YangMills/Kernel/NamedEndpointTheoremContent.lean`

### Preferred flat submission-facing theorem surface

- `MaleyLean/Papers/YangMills/Kernel/FlatManuscriptTheoremSurface.lean`
- `MaleyLean/Papers/YangMills/Surface/FlatManuscriptTheoremSurfaceSummary.lean`
- `MaleyLean/YangMillsFlatManuscriptTheoremSurfaceSummary.lean`

### Deep native path

- `MaleyLean/Papers/YangMills/Kernel/NativeLawAssembly.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeInterHeartCompatibility.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeConstructiveVacuumGapLaw.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeVacuumGapEndpointLaw.lean`
- `MaleyLean/Papers/YangMills/Kernel/NativeConstructiveEndpointLaw.lean`

## Local Verdict

Relative to the Yang-Mills inventory encoded in this repository, all currently
registered live claim families appear covered.

The repository now also contains a separate canonical alignment-free payload
path that records the exact non-arbitrary verified content currently available,
without relying on theorem-part landing maps.

It also now contains an explicit heart-statement path in which Part C, Part D,
and the endpoint route are stated as direct output conjunctions rather than only
through abstract `*_part` placeholders.

It now also contains a theorem-register-keyed paper-claim path, and the main
surface summary includes that repaired theorem-facing boundary.

It also now contains a flattened manuscript-granular submission-facing theorem
surface built from named-theorem reflection and per-entry theorem-content
statements, without the remaining `Nonempty` or theorem-content bundle layer.

The current human-facing audited surface is also axiom-free, as recorded in:

- `reports/audits/yang_mills_axiom_audit.txt`
- `reports/status/yang_mills_status.md`
- `reports/support_maps/yang_mills_support_map.txt`

The remaining local theorem-shape caveat is narrower now: the preferred theorem
is still parameterized by the manuscript route objects rather than closed over a
single canonical manuscript instance, because no such distinguished concrete
instance is currently exposed in the repo.

No obvious local unfinished markers were found in `MaleyLean/Papers/YangMills`,
and the current workflow-level Yang-Mills verification passes.

## Caveat

This matrix is local-repo-relative.

It answers:

"Is the encoded Yang-Mills paper inventory covered in this checkout?"

It does not answer:

"Does some newer or external paper draft contain additional claims not yet
encoded here?"
