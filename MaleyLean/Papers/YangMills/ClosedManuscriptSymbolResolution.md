# Yang-Mills Closed Manuscript Symbol Resolution

Last updated: 2026-04-15

## Purpose

This note records the repo-symbol resolution status for the now-realized closed
manuscript input:

- `manuscript_input : YMClosedInstantiatedManuscriptInput`

It answers one narrow question:

- which manuscript referents already have exact reusable Lean objects in the
  repo, and
- which still exist only as abstract field types / bundle projections?

## Resolution Verdict

The repo already contains:

- the abstract field types for all remaining constructive, vacuum-gap, and
  endpoint chosen-site data,
- the semantic bundles that expose those field types canonically,
- and manuscript-facing alias layers over both
  `YMClosedInstantiatedManuscript` and `YMClosedInstantiatedManuscriptInput`.

The repo does **not** currently contain:

- standalone closed constants for the constructive chosen-site terms,
- standalone closed constants for the vacuum-gap chosen-site terms,
- or standalone closed constants for the corresponding manuscript route
  objects.

Those standalone constants are no longer needed in order to obtain a closed
manuscript instantiation, because the repo now contains:

- `manuscript_input : YMClosedInstantiatedManuscriptInput`
- `I : YMClosedInstantiatedManuscript`
- `ym_closed_manuscript_completion_realized`

in `MaleyLean/Papers/YangMills/Kernel/ManuscriptObjectPackageDeclarations.lean`.

## Constructive Resolution

The relevant field types are already exposed by:

- `YMConstructiveChosenSiteData`
- `YangMillsConstructiveSemanticBundleData`
- `YMConstructiveRoute`

Concrete repo status:

- finite-cap window:
  only exposed abstractly as
  `(YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window`
- promoted finite-cap bridge:
  only exposed abstractly as
  `(YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map`
- bounded-base carrier element:
  only exposed abstractly as
  `(YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier`
- `ω_bd`:
  only exposed abstractly as
  `(YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data`
- `ωsharp`:
  only exposed abstractly as
  `(YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data`

Current manuscript-facing aliases exist only relative to a bundled manuscript
input:

- `ym_input_DeltaMax`
- `ym_input_finite_cap_bridge`
- `ym_input_bounded_base_one`
- `ym_input_omega_bd`
- `ym_input_omega_sharp`

There is no pre-existing closed repo constant with one of those meanings.

## Vacuum-Gap Resolution

The relevant field types are already exposed by:

- `YMVacuumGapChosenSiteData`
- `YangMillsVacuumGapSemanticBundleData`
- `YMVacuumGapRoute`

Concrete repo status:

- QE3 transport map:
  only exposed abstractly as
  `(YangMillsVacuumGapSemanticBundleData RD hww).transport_map`
- bounded cylinder observable `H`:
  only exposed abstractly as
  `(YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family`
- `Hloc`:
  only exposed abstractly as
  `(YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector`
- `corr`:
  only exposed abstractly as
  `(YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family`
- `gapf`:
  only exposed abstractly as
  `(YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional`
- `hgap`:
  only exposed abstractly as the proposition
  obtained by applying
  `(YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap`
  to the chosen functional and realized OS sector

Current manuscript-facing aliases exist only relative to a bundled manuscript
input:

- `ym_input_transport`
- `ym_input_H`
- `ym_input_Hloc`
- `ym_input_corr`
- `ym_input_gapf`
- `ym_input_hgap_statement`
- `ym_input_hgap`

There is no pre-existing closed repo constant with one of those meanings.

## Endpoint Resolution

The endpoint side is now the clearest reuse story:

- dossier, reconstruction package, and endpoint object are all reusable fields
  of `RE`,
- manuscript-facing aliases already exist for the endpoint bundle and dossier,
- and `RE` is recoverable exactly from bundled manuscript input.

But even here, the repo still does not expose a closed manuscript endpoint
constant on its own. The current endpoint manuscript objects are still named by
projection from manuscript input or manuscript instantiation.

## What This Means

The manuscript input inhabitant is now present at repo level, so the old
symbol-resolution question has been answered constructively by the existing
manuscript object package declarations.

## Honest Boundary

At the current repo boundary:

- theorem reflection is formalized,
- object recovery from manuscript input is formalized,
- manuscript-facing names on the input object are formalized,
- and the input inhabitant has been authored and packaged into both
  `manuscript_input` and `I`.
