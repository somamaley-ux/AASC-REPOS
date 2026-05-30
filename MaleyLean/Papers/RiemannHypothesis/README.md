# Riemann Hypothesis AASC/Lean Reduction Handoff

This folder contains the AASC-native zero-interior rigidity development for
the Riemann zeta interface.

## Strongest Formal Framing

The Lean development gives a Lean-verified AASC-native reduction of RH to the
explicit construction of the zeta-specific selector/kernel certificate:

```lean
Nonempty ClassicalRiemannZetaBridgeObligations
```

Equivalently, the remaining proof object is named:

```lean
RemainingClayLevelProofObject
```

From that object, Lean proves:

```lean
mathlib_riemannHypothesis_from_remaining_clay_object
```

Conversely, Lean proves that mathlib's `RiemannHypothesis` constructs the
remaining object:

```lean
remaining_clay_object_from_mathlib_riemannHypothesis
```

So the sharp audit theorem is:

```lean
remaining_clay_object_iff_mathlib_riemannHypothesis
```

This means the remaining certificate is exactly RH-strength.  It has not been
constructed unconditionally in this repository.

## Zeta-Specific Bridge Workbench

The file:

```text
MaleyLean/Papers/RiemannHypothesis/BridgeProgram.lean
```

defines the canonical off-line selector:

```lean
canonicalOffLineHorizontalSelector
```

and the canonical fixed-by-invariant-bundle predicate:

```lean
canonicalCriticalLineFixedByInvariantBundle
```

The exact hard sub-obligation is:

```lean
CanonicalSelectorFixednessSubobligation
```

Lean proves:

```lean
canonical_selector_fixedness_iff_mathlib_riemannHypothesis
```

So the next proof target is not merely more generic AASC support.  It is the
zeta-specific theorem that any standing-bearing off-line selected zero is
already invariant-fixed.  That theorem is exactly RH-strength.

If supplied, it constructs the remaining object:

```lean
remaining_clay_object_from_canonical_selector_fixedness
```

The corpus-style standing-collapse extrapolation is isolated as:

```lean
IllicitStandingCollapseExtrapolation
```

It has two substantive fields:

```lean
off_line_selector_is_illicit
illicit_selector_collapses_standing
```

From those fields Lean proves:

```lean
canonical_selector_fixedness_from_illicit_standing_collapse
remaining_clay_object_from_illicit_standing_collapse
mathlib_riemannHypothesis_from_illicit_standing_collapse
```

This is the formal logical extrapolation from the corpus pattern: illicit
coordinate/selector moves collapse standing.  The still-live proof burden is
to justify the two fields for classical zeta without assuming RH.

The matrix also supports the sharper illicit-or-scope-change fork:

```lean
IllicitOrScopeChangeExtrapolation
```

Its substantive fields are:

```lean
off_line_selector_is_illicit_or_scope_change
illicit_selector_collapses_standing
scope_change_cannot_preserve_same_domain_standing
```

From those fields Lean proves:

```lean
canonical_selector_fixedness_from_illicit_or_scope_change
remaining_clay_object_from_illicit_or_scope_change
mathlib_riemannHypothesis_from_illicit_or_scope_change
```

This records the corpus pattern that an off-line selector must either remain a
same-domain move, in which case illicit standing collapse applies, or else be a
scope change, in which case it cannot refute the same-domain zeta/RH endpoint.

The structural AASC endpoint proved from an explicit certificate is:

```lean
aasc_standing_zero_interior_rigidity
```

In a non-degenerate standing-bearing zeta regime, a standing-bearing
nontrivial zero-support cannot remain off the critical line.

The hostile-referee bridge point is discharged by:

```lean
classicalZetaZerohoodStanding
classical_zeta_standing_zerohood_equivalence
aasc_zerohood_endpoint_iff_mathlib_riemannHypothesis
```

`classicalZetaZerohoodStanding` is exactly nontrivial analytic zeta zerohood:

```lean
fun s => ((Not (exists n : Nat, s = -2 * (n + 1))) /\ s ≠ 1) /\
  riemannZeta s = 0
```

The bridge theorem is definitional:

```lean
{ standing_iff_nontrivial_zerohood := fun s => Iff.rfl }
```

Therefore the AASC endpoint for canonical standing-as-zerohood is formally
equivalent to mathlib's `RiemannHypothesis`.  This is an equivalence/reduction
statement, not an unconditional construction of the zeta-specific certificate.

## Remaining Proof Object

The repository does not yet construct:

```lean
Nonempty ClassicalRiemannZetaBridgeObligations
```

That is the remaining Clay-level proof object.  The discharged
standing/zerohood bridge proves there is no critical-line smuggling in the
comparison with classical zerohood; it does not by itself provide the
zeta-specific selector/kernel certificate.  Lean proves this remaining object
is equivalent to mathlib's `RiemannHypothesis`.

## Referee Print Packet

Run:

```text
lake env lean Checks\Axiom\RiemannHypothesisBridgePrint.lean
```

Captured output:

```text
Checks/Axiom/RiemannHypothesisBridgePrint.out.txt
```

The output prints:

```lean
#print classicalZetaZerohoodStanding
#print classical_zeta_standing_zerohood_equivalence
#print axioms classical_zeta_standing_zerohood_equivalence
#print aasc_zerohood_endpoint_iff_mathlib_riemannHypothesis
#print axioms aasc_zerohood_endpoint_iff_mathlib_riemannHypothesis
```

The axiom traces list only Lean's standard classical background axioms:
`propext`, `Classical.choice`, and `Quot.sound`.  They do not introduce an
RH-specific axiom, a critical-line axiom, or an axiom asserting
`RiemannHypothesis`.

## Manuscript Draft

The LaTeX handoff draft is:

```text
MaleyLean/Papers/RiemannHypothesis/RH_AASC_ZeroInterior_Solution_Draft.tex
```

It records the AASC kernel instantiation, global uniqueness import, selector
exclusion, canonical standing/zerohood bridge, and verification commands.

## Verification

```text
lake build MaleyLean.Papers.RiemannHypothesis
lake build MaleyLean
lake env lean Checks\Axiom\RiemannHypothesisAxiomCheck.lean
lake env lean Checks\Axiom\RiemannHypothesisBridgePrint.lean
```
