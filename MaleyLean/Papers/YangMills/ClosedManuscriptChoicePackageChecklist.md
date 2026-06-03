# Yang-Mills Manuscript Choice Package Checklist

Last updated: 2026-04-09

## Purpose

This is the final repo-facing checklist for constructing:

- `P : YMManuscriptChoicePackage`

It records, field by field, the current author instruction:

- prefer an existing repo object if one is already present,
- otherwise define a manuscript-specific derived `def` by projection from the
  existing route/core packages,
- never introduce a fresh primitive symbol just to make the package typecheck.

## Objects

### `objects.S`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def` for the load-bearing
  spine using the existing spine builder and packet/route fields

### `objects.RC`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def` from the existing
  constructive route package and builder

### `objects.RD`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def` from the existing
  vacuum-gap route package and builder

### `objects.RE`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def` from the existing
  endpoint dossier / reconstruction / endpoint-object builder path

## Constructive Choices

### `constructive_choices.DeltaMax`

- first choice: reuse an existing repo cap/index object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the fixed engineering cap `Δmax = 4`
- source package to project from:
  `YangMillsConstructiveSemanticBundleData ... .finite_cap_window`

### `constructive_choices.finite_cap_bridge`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the promoted finite-cap bridge from `5.74A`
- source package to project from:
  `YangMillsConstructiveSemanticBundleData ... .positive_bridge_map`

### `constructive_choices.bounded_base_one`

- first choice: reuse an existing repo identity element if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the identity element `1 ∈ A+`
- source package to project from:
  `YangMillsConstructiveSemanticBundleData ... .bounded_base_carrier`

### `constructive_choices.omega_bd`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the tuned bounded positive-time base state
- source package to project from:
  `YangMillsConstructiveSemanticBundleData ... .bounded_state_data`

### `constructive_choices.omega_sharp`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the inductive-union sharp-local state
- source package to project from:
  `YangMillsConstructiveSemanticBundleData ... .inductive_union_data`

## Vacuum-Gap Choices

### `vacuum_gap_choices.transport`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the `F.216` / QE3 transport object
- source package to project from:
  `YangMillsVacuumGapSemanticBundleData ... .transport_map`

### `vacuum_gap_choices.H`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: a bounded cylinder observable in the fixed-scale
  Route 1 class
- fallback manuscript choice: simplest admissible unit / one-block observable
- source package to project from:
  `YangMillsVacuumGapSemanticBundleData ... .lattice_observable_family`

### `vacuum_gap_choices.Hloc`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the reconstructed vacuum Hilbert space / sector
- source package to project from:
  `YangMillsVacuumGapSemanticBundleData ... .reconstructed_sector`

### `vacuum_gap_choices.corr`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the positive-time OS correlation family
- source package to project from:
  `YangMillsVacuumGapSemanticBundleData ... .os_correlation_family`

### `vacuum_gap_choices.gapf`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the reconstructed vacuum-gap functional
- source package to project from:
  `YangMillsVacuumGapSemanticBundleData ... .minkowski_gap_functional`

### `vacuum_gap_choices.hgap`

- first choice: reuse an existing repo theorem term if present
- otherwise: define a manuscript-specific derived proof term
- expected manuscript meaning: the actual vacuum-gap theorem term
- preferred source theorem:
  Corollary `M.5` if the field is reconstruction-level
- fallback source theorem:
  Corollary `F.5`
- source proposition to inhabit:
  `YangMillsVacuumGapSemanticBundleData ... .evaluate_minkowski_gap ...`

## Endpoint Choices

### `endpoint_choices.Omega_loc`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the reconstructed vacuum vector `Ω_loc`
- source package to project from:
  `YangMillsEndpointSemanticBundleData ... .vacuum_vector`

### `endpoint_choices.phi_star`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the canonical witness test function `ϕ*`
- source package to project from:
  `YangMillsEndpointSemanticBundleData ... .test_function_space`

### `endpoint_choices.E_ren`

- first choice: reuse an existing repo object if present
- otherwise: define a manuscript-specific derived `def`
- expected manuscript meaning: the canonical centered CP-even dimension-4
  scalar witness `E_ren`
- source package to project from:
  `YangMillsEndpointSemanticBundleData ... .field_family`

## Honest Build Order

1. Resolve `objects.RE`, then `endpoint_choices`
2. Resolve `objects.RD`, then `vacuum_gap_choices`
3. Resolve `objects.RC`, then `constructive_choices`
4. Resolve `objects.S` last
5. Define:
   - `P : YMManuscriptChoicePackage`
   - `manuscript_input := P.toInput`
   - `I := P.toClosedInstantiatedManuscript`

## Honest Stop Condition

The repository reaches the closed-instance finish line exactly when one real
constant exists:

- `P : YMManuscriptChoicePackage`

because then Lean already provides:

- `P.toInput : YMClosedInstantiatedManuscriptInput`
- `P.toClosedInstantiatedManuscript : YMClosedInstantiatedManuscript`
