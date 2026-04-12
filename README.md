# bivalence-non-degenerate-reasoning

Standalone Lean repo for the paper:

`The Bivalence Theorem for Non-Degenerate Reasoning`

## Contents

- `MaleyLean/Papers/BivalenceNonDegenerateReasoning/`
  The paper-facing Lean development.
- `Checks/Axiom/BivalenceNonDegenerateReasoningAxiomCheck.lean`
  Axiom audit for the paper.
- `paper/main.tex`
  The phase-14 LaTeX source snapshot.
- `paper/main.pdf`
  The corresponding PDF snapshot.
- `paper/source_overleaf_phase14.zip`
  The supplied Overleaf-ready source bundle.

## Current Status

This standalone repo preserves the same route split as the source monorepo:

- `Legacy...`
  Compatibility-only classical bridge theorems.
- `Constructive...`
  Current axiom-free constructive derived bridge.
- `Paper...FromApexClosure...`
  Current axiom-free apex-derived bridge.

The preferred summary export is:

- `MaleyLean.Papers.BivalenceNonDegenerateReasoning.Surface.ApexSummaryStatement`

## Build

```powershell
lake build
```

## Axiom Audit

```powershell
lake env lean Checks\Axiom\BivalenceNonDegenerateReasoningAxiomCheck.lean
```

The audit is intentionally grouped into:

- legacy classical bridge
- current constructive bridge
- current axiom-free apex bridge

## GitHub

This folder is ready to become its own Git repository and push to a GitHub repo
named `bivalence-non-degenerate-reasoning`.
