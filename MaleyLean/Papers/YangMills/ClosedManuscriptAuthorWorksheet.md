# Yang-Mills Closed Manuscript Author Worksheet

Last updated: 2026-04-15

## Purpose

This worksheet is the practical companion to:

- [ClosedManuscriptInstantiationChecklist.md](/d:/lean/MaleyLean/MaleyLean/Papers/YangMills/ClosedManuscriptInstantiationChecklist.md)
- [ClosedManuscriptCompletionCriterion.lean](/d:/lean/MaleyLean/MaleyLean/Papers/YangMills/Kernel/ClosedManuscriptCompletionCriterion.lean)

Its purpose is to audit and trace the realized closed manuscript constant
against the paper itself, field by field, with explicit source anchors.

The exact Lean completion target is:

- `I : YMClosedInstantiatedManuscript`

from [ClosedInstantiatedManuscript.lean](/d:/lean/MaleyLean/MaleyLean/Papers/YangMills/Kernel/ClosedInstantiatedManuscript.lean).

## Final Lean Target

The realized manuscript instance packages:

1. `blueprint : YMClosedManuscriptBlueprint`
2. `chosen_sites : YMChosenSiteBlueprint blueprint`

That expands into:

- one load-bearing spine object `S`
- one constructive route object `RC`
- one vacuum-gap route object `RD`
- one endpoint core object `RE`
- ten readiness witnesses tying those together
- one constructive chosen site
- one vacuum-gap chosen site
- one endpoint chosen site

## A. Global Spine Object

Lean field:

- `S : YMLoadBearingSpine`

What must be supplied:

- packet props `packet1_uv_gate` through `packet10_endpoint`
- auxiliary/seam props
- theorem-part props
- route interfaces `partC_route`, `partD_route`, `endpoint_route`

Paper anchors by packet:

- Packet 1: `N.20`, `N.21`
- Packet 2: `F.3`, `F.317`, `F.318`
- Packet 3: `F.4`, `F.308`
- Packet 4: `4.92`, `4.93`, `4.94`, `4.95`
- Packet 5: `L.8`, `L.11`, `5.39`, `5.69`, `F.245`
- Packet 6: `F.330A`, `F.331`, `5.74A`, `5.74`, `5.75`, `5.76`
- Packet 7: `5.77`
- Packet 8: `III.18`, `F.211`, `F.212`, `F.213`, `F.214`, `F.216`, `F.5`
- Packet 9: `M.1`, `M.2`, `M.3`, `M.4`, `M.5`, `M.6`
- Packet 10: `O.2`, `O.3`, `O.4`, `O.5`, `O.7`
- Auxiliary weak-window certificate: `F.298`

Author fill-in:

- What concrete manuscript object should represent the ten-packet spine?
- Which exact manuscript claims are being used as the values of the packet props?
- Are the theorem-part props intended to be definitional from the routes, or separately named?

## B. Constructive Route Object

Lean field:

- `RC : YMConstructiveRoute`

What must be supplied:

- readiness props:
  - `flowed_state_ready`
  - `finite_truncation_ready`
  - `finite_cap_extension_ready`
  - `cyclicity_ready`
  - `finite_cap_bridge_ready`
  - `bounded_state_compatibility_ready`
  - `inductive_union_ready`
- `constructive_part`
- `finite_cap_package`
- `sharp_local_package`
- constructor/projection fields proving the route closes

Primary paper anchors:

- `4.92`, `4.93`, `4.94`
- `L.8`, `L.11`
- `5.39`, `5.69`
- `F.245`
- `F.330A`, `F.331`
- `5.74A`, `5.74`, `5.75`, `5.76`, `5.77`

Named theorem content already mirrored from this route:

- unique flowed continuum state
- tuned bounded positive-time base state
- exact-dimension quotient identity
- coefficient extraction on arbitrary quotient blocks
- one-shell transport on finite truncations
- finite-truncation inverse control
- finite-truncation SFTE/remainder package
- finite mixed bounded-family packaging
- first mixed-correlator closure at finite cap
- finite-cap sharp-local extension
- passage to full sharp-local inductive union
- bounded-base cyclicity in reconstructed sharp-local Hilbert space

Author fill-in:

- What are the manuscript’s intended concrete finite-cap window, bridge map, bounded-base carrier, bounded-state data, and inductive-union data?
- Which paper constructions should populate `assemble_sharp_local_state` and `extend_finite_cap`?
- Which proposition in the paper is meant to be `constructive_part`, if it remains distinct from the explicit statement bundle?

Constructive data now fixed from manuscript author input:

- finite-cap window `Δmax = 4`:
  reuse an existing cap/index object if present; otherwise define `ym_manuscript_cap := 4`
- finite-cap bridge from `5.74A`:
  reuse the existing promoted finite-cap bridge if present; otherwise define it from `RC.finite_cap_package`
- bounded-base carrier `1 ∈ A+`:
  reuse the identity in `A+` if present; otherwise define `ym_manuscript_base_carrier := 1`
- `ω_bd`:
  reuse the existing tuned bounded positive-time base state if present; otherwise define it from the `4.94` base-state package
- `ωsharp`:
  reuse the existing inductive-union sharp-local state if present; otherwise define it from the `5.76` glueing package

## C. Vacuum-Gap Route Object

Lean field:

- `RD : YMVacuumGapRoute`

What must be supplied:

- readiness props:
  - `ultraviolet_scope_ready`
  - `entrance_ready`
  - `fixed_lattice_gap_ready`
  - `weak_window_certificate_ready`
  - `continuum_gap_transport_ready`
  - `reconstruction_ready`
  - `endpoint_ready`
- `vacuum_gap_part`
- `transport_package`
- `reconstruction_package`
- constructor/projection fields proving the Route 1/QE3 chain closes

Primary paper anchors:

- `N.20`, `N.21`
- `F.3`, `F.317`, `F.318`
- `F.4`, `F.308`
- `F.298`
- `III.18`
- `F.211`, `F.212`, `F.213`, `F.214`, `F.216`, `F.5`

Named theorem content already mirrored from this route:

- public group-scope export
- one-shot entrance at bounded physical scale
- tuned full fixed-lattice OS gap
- same-scale Wilson-to-patched transport
- bounded Wilson/dyadic OS limit theorem
- continuum-time OS upgrade of bounded-base state
- density of bounded-base algebra
- graph-core approximation at QE3 seam
- continuum vacuum-gap transport
- continuum sharp-local vacuum gap

Author fill-in:

- What are the manuscript’s intended concrete transport state, lattice observable family, transport map, reconstructed sector, OS sector, Minkowski gap functional, and correlation family?
- Which paper constructions should populate `transport_observable`, `realize_os_sector`, and `evaluate_minkowski_gap`?
- Which proposition in the paper is meant to be `vacuum_gap_part`, if it remains distinct from the explicit statement bundle?

Vacuum-gap data now fixed from manuscript author input:

- QE3 transport map:
  reuse the existing `F.216` / QE3 transport object if present; otherwise define it from `RD.transport_package`
- bounded cylinder observable `H`:
  reuse the canonical bounded cylinder observable in the fixed-scale class if present; otherwise use the simplest admissible unit / one-block observable
- `Hloc`:
  reuse the existing reconstructed Hilbert-space carrier if present; otherwise define it as the carrier of `RE.reconstruction_package.reconstructed_hilbert`
- OS correlation family `corr`:
  reuse the existing positive-time OS correlation family if present; otherwise define it from `RE.reconstruction_package.vacuum_correlation_family`
- spectral-gap functional `gapf`:
  reuse the existing reconstructed vacuum-gap functional if present; otherwise define it from the reconstructed Hamiltonian spectral package
- `hgap`:
  reuse the theorem term for Corollary `M.5` if the field is reconstruction-level; otherwise reuse the theorem term for Corollary `F.5`

## D. Endpoint Core Object

Lean field:

- `RE : YMEndpointCore`

What must be supplied:

- readiness props:
  - `euclidean_dossier_ready`
  - `reconstruction_ready`
  - `endpoint_packet_ready`
- `endpoint_part`
- `dossier`
- `reconstruction_package`
- `endpoint_object`
- constructor/projection fields proving endpoint closure

Primary paper anchors:

- `M.1`, `M.2`, `M.3`, `M.4`, `M.5`, `M.6`
- `O.2`, `O.3`, `O.4`, `O.5`, `O.7`

Named theorem content already mirrored from this route:

- Euclidean OS dossier on full sharp-local algebra
- Wightman-Haag-Kastler reconstruction
- field correspondence
- Minkowski Hamiltonian inherits gap
- non-triviality witness
- faithful Wilson universality hypotheses
- qualitative faithful Wilson universality of continuum local theory
- quantitative ledger remains rho-indexed
- exact local-net endpoint and exclusion of extended-support sector data
- group-only restatement of endpoint theorem

Author fill-in:

- What are the manuscript’s intended concrete Euclidean dossier, reconstructed Hilbert space, field family, vacuum vector, test-function space, smeared field operator, and vacuum-correlation family?
- Which paper constructions should populate `smear_field` and `evaluate_vacuum_correlation`?
- Which proposition in the paper is meant to be `endpoint_part`, if it remains distinct from the explicit statement bundle?

Endpoint data now fixed from manuscript author input:

- `dossier.euclidean_input = (A_loc, ω^(uren))`
- `dossier.reflection_positive =` OS reflection positivity on `P+,sharp`
- `dossier.os_data_complete =` Theorem `M.1`
- `reconstruction_package.reconstructed_hilbert = H_loc`
- `reconstruction_package.field_family =` reconstructed Wightman field family `Φ_[P]`
- `reconstruction_package.vacuum_vector = Ω_loc : H_loc`
- `reconstruction_package.test_function_space = Schwartz(MinkowskiSpace)`
- `reconstruction_package.smeared_field_operator =` operator-on-domain over `H_loc`
- `reconstruction_package.vacuum_correlation_family =` vacuum Wightman correlation family
- `reconstruction_package.smear_field = (Φ_[P], f) ↦ Φ_[P](f)`
- `reconstruction_package.evaluate_vacuum_correlation = (A, B) ↦ ⟨Ω_loc, A B Ω_loc⟩`
- `endpoint_object.local_net =` bounded-region local gauge-invariant sharp-local net `A_loc(G)`
- `endpoint_object.vacuum_sector =` reconstructed vacuum representation of `A_loc(G)` on `H_loc`
- `endpoint_object.faithful_wilson_universality =` Theorem `O.3`

## E. Readiness Witnesses

Lean fields:

- `hp1 : S.packet1_uv_gate`
- `hp2 : S.packet2_entrance`
- `hAroute : ym_public_scope_route S`
- `htrunc : RC.finite_truncation_ready`
- `hext : RC.finite_cap_extension_ready`
- `hcompat : RC.bounded_state_compatibility_ready`
- `hunion : RC.inductive_union_ready`
- `hww : RD.weak_window_certificate_ready`
- `hE : RE.euclidean_dossier_ready`
- `hP : RE.endpoint_packet_ready`

Author fill-in:

- For each witness above, what exact theorem/proposition from the paper is intended to inhabit it?
- Is each witness a direct named theorem, or a short derivation from nearby named results?

## F. Chosen Constructive Site

Lean fields inside `YMConstructiveChosenSiteData`:

- `win`
- `bridge`
- `base`
- `state`
- `unionData`

Paper anchors:

- finite truncation / finite cap: `L.8`, `L.11`, `5.39`, `5.69`, `F.245`
- bridge / closure / inductive union: `F.330A`, `F.331`, `5.74A`, `5.74`, `5.75`, `5.76`

Author fill-in:

- What are the manuscript’s canonical chosen values for these five objects?
- Are they intended to be generic placeholders, or one distinguished worked instance from the paper?

## G. Chosen Vacuum-Gap Site

Lean fields inside `YMVacuumGapChosenSiteData`:

- `tm`
- `obs`
- `rsec`
- `corr`
- `gapf`
- `hgap`

Paper anchors:

- weak-window / transport / QE3: `F.298`, `III.18`, `F.211`, `F.212`, `F.213`, `F.214`, `F.216`
- sharp-local gap: `F.5`

Author fill-in:

- What are the manuscript’s canonical chosen transport map, observable, reconstructed sector, OS correlation, and gap functional?
- Which exact paper statement justifies `hgap`?

## H. Chosen Endpoint Site

Lean fields inside `YMEndpointChosenSiteData`:

- `vac`
- `testFn`
- `field`

Paper anchors:

- reconstruction: `M.3`, `M.4`, `M.5`, `M.6`
- endpoint/universality: `O.2`, `O.3`, `O.4`, `O.5`, `O.7`

Author fill-in:

- What are the manuscript’s canonical chosen vacuum vector, test function, and field?
- Are these meant to come from the same reconstructed endpoint packet used in the manuscript narrative?

Endpoint chosen-site values now fixed from manuscript author input:

- `Omega_loc =`
  reuse the reconstructed vacuum vector `Omega_loc`
  coming from the OS/Wightman reconstruction of the full sharp-local state
  `(Appendix M, Theorem M.3 / reconstruction step)`
- `phi_star =`
  reuse the canonical witness test function `phi*,S`
  used in the non-triviality witness theorem
- `E_ren =`
  reuse the canonical centered CP-even dimension-4 scalar witness field `E_ren`
  from the non-triviality theorem

## Recommended Completion Order

1. Fill `RE` and its chosen endpoint site.
2. Fill `RD` and its chosen vacuum-gap site.
3. Fill `RC` and its chosen constructive site.
4. Fill `S` last, using the already chosen route objects as the packet-level source.
5. Then assemble:
   - `YMClosedManuscriptBlueprint`
   - `YMChosenSiteBlueprint`
   - `YMClosedInstantiatedManuscript`

## Honest Stop Condition

The formalization reaches the closed-instance finish line exactly when we can define:

- a constant `I : YMClosedInstantiatedManuscript`

equivalently:

- a proof of `ym_closed_manuscript_completion`

from [ClosedManuscriptCompletionCriterion.lean](/d:/lean/MaleyLean/MaleyLean/Papers/YangMills/Kernel/ClosedManuscriptCompletionCriterion.lean).
