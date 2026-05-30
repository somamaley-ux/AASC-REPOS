# Riemann Hypothesis AASC/Lean Handoff

This folder contains the AASC-native zero-interior rigidity development for
the Riemann zeta interface.

## Strongest Formal Framing

The Lean development proves the AASC structural endpoint:

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
equivalent to mathlib's `RiemannHypothesis`.

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
