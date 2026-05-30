# RH AASC Zerohood Reduction v1.0.1

Release target for Zenodo archival of the corrected Riemann Hypothesis
AASC/Lean reduction handoff package.

## Formal Result Framing

This release contains a Lean-verified AASC-native reduction of RH to the
explicit construction of:

```lean
Nonempty ClassicalRiemannZetaBridgeObligations
```

Equivalently, the remaining proof object is named:

```lean
RemainingClayLevelProofObject
```

The standing/zerohood bridge is discharged definitionally:

```lean
classical_zeta_standing_zerohood_equivalence
```

The canonical endpoint equivalence is:

```lean
aasc_zerohood_endpoint_iff_mathlib_riemannHypothesis
```

The reduction from the remaining proof object to mathlib RH is:

```lean
mathlib_riemannHypothesis_from_remaining_clay_object
```

The converse construction from mathlib RH to the remaining proof object is:

```lean
remaining_clay_object_from_mathlib_riemannHypothesis
```

Therefore Lean proves the audit theorem:

```lean
remaining_clay_object_iff_mathlib_riemannHypothesis
```

## Zeta-Specific Bridge Workbench

The release now includes:

```text
MaleyLean/Papers/RiemannHypothesis/BridgeProgram.lean
```

It defines:

```lean
canonicalOffLineHorizontalSelector
canonicalCriticalLineFixedByInvariantBundle
CanonicalSelectorFixednessSubobligation
```

and proves:

```lean
canonical_selector_fixedness_iff_mathlib_riemannHypothesis
remaining_clay_object_from_canonical_selector_fixedness
```

This localizes the new-territory proof target: construct
`CanonicalSelectorFixednessSubobligation` without assuming RH.

## Illicit Standing-Collapse Extrapolation

The release also records the corpus-style extrapolation from illicit
selector/notation collapse:

```lean
IllicitStandingCollapseExtrapolation
```

Its two substantive fields are:

```lean
off_line_selector_is_illicit
illicit_selector_collapses_standing
```

Lean proves that this certificate implies the hard selector-fixedness
sub-obligation, the remaining Clay-level object, and mathlib RH:

```lean
canonical_selector_fixedness_from_illicit_standing_collapse
remaining_clay_object_from_illicit_standing_collapse
mathlib_riemannHypothesis_from_illicit_standing_collapse
```

This is still conditional: the zeta-specific task is to instantiate those two
fields without assuming RH.

## Important Scope Statement

This release does not claim an unconditional completed proof of RH.  It proves:

- standing-as-zerohood is clean;
- the AASC endpoint iff mathlib RH bridge is clean;
- RH follows from the explicit bridge-obligation object;
- the zeta-specific object `Nonempty ClassicalRiemannZetaBridgeObligations`
  remains to be constructed;
- that remaining object is exactly RH-strength.

Thus the release should be cited as a Lean-verified AASC-native reduction, not
as a finished Clay-level RH proof.

## Referee Print Packet

Run:

```text
lake env lean Checks\Axiom\RiemannHypothesisBridgePrint.lean
```

Captured transcript:

```text
Checks/Axiom/RiemannHypothesisBridgePrint.out.txt
```

The bridge print shows:

```lean
theorem MaleyLean.Papers.RiemannHypothesis.classical_zeta_standing_zerohood_equivalence :
  ClassicalZetaStandingZerohoodEquivalence classicalZetaZerohoodStanding :=
{ standing_iff_nontrivial_zerohood := fun s => Iff.rfl }
```

The printed axiom traces list only Lean's standard classical background axioms:

```text
propext
Classical.choice
Quot.sound
```

No RH-specific axiom, critical-line axiom, or axiom asserting
`RiemannHypothesis` is introduced by the bridge print packet.

## Validation

Validated locally before release:

```text
lake build MaleyLean.Papers.RiemannHypothesis
lake env lean Checks\Axiom\RiemannHypothesisAxiomCheck.lean
lake env lean Checks\Axiom\RiemannHypothesisBridgePrint.lean
lake build MaleyLean
```

`lake build MaleyLean` passes with one pre-existing Neutrino linter warning in:

```text
MaleyLean/Papers/Neutrino/SourceTheorems/MathlibSpectralOperator.lean
```
