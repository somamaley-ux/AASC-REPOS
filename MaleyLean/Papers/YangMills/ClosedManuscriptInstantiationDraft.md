# Yang-Mills Closed Manuscript Instantiation Draft

Last updated: 2026-04-09

This note records the manuscript-level closed-instance assignments you supplied
for the final Lean target:

- `I : YMClosedInstantiatedManuscript`

It is intended as the concrete draft companion to:

- [ClosedManuscriptAuthorWorksheet.md](/d:/lean/MaleyLean/MaleyLean/Papers/YangMills/ClosedManuscriptAuthorWorksheet.md)
- [ClosedInstantiatedManuscript.lean](/d:/lean/MaleyLean/MaleyLean/Papers/YangMills/Kernel/ClosedInstantiatedManuscript.lean)

## Final Lean Target

We will construct:

- `I : YMClosedInstantiatedManuscript`

with:

- `blueprint : YMClosedManuscriptBlueprint`
- `chosen_sites : YMChosenSiteBlueprint blueprint`

## A. Global Spine Object

Lean field:

- `S : YMLoadBearingSpine`

Concrete manuscript object:

- `S` is the ten-packet public proof spine defined in the core paper.
- It consists of:
  - Packet 1 through Packet 10 theorem objects
  - the auxiliary weak-window certificate
  - the three route interfaces: constructive, vacuum-gap, endpoint

Packet assignments:

- Packet 1: compact-simple A1 ultraviolet theorem `(III.1)` plus public
  group-scope export `(III.2)`
- Packet 2: one-shot entrance `(III.3)`
- Packet 3: tuned fixed-lattice gap `(IV.1)`
- Packet 4: flowed continuum state `(4.92-4.95)`
- Packet 5: exact-dimension plus finite truncation package
  `(L.8, L.11, 5.39, 5.69, F.245)`
- Packet 6: mixed correlator plus finite-cap bridge package
  `(F.330A, F.331, 5.74A-5.76)`
- Packet 7: bounded-base cyclicity `(5.77)`
- Packet 8: Wilson-return plus QE3 transport chain
  `(III.18, F.211-F.216, F.5)`
- Packet 9: Euclidean plus reconstruction packet `(M.1-M.6)`
- Packet 10: universality plus local-net endpoint `(O.2-O.7)`
- Auxiliary weak-window certificate: `F.298`

Theorem-part props:

- all theorem parts are induced by `RC`, `RD`, and `RE`
- no independent theorem-part constants are introduced

Route interfaces:

- `partC_route = RC`
- `partD_route = RD`
- `endpoint_route = RE`

## B. Constructive Route Object

Lean field:

- `RC : YMConstructiveRoute`

Concrete manuscript object:

- `RC` is the Lane A constructive route from core Section V and Companion II

Readiness props:

- `flowed_state_ready =` unique flowed continuum state `(4.92)`
- `finite_truncation_ready =` finite-truncation inverse control `(5.69)`
- `finite_cap_extension_ready =` finite-cap sharp-local extension `(5.74)`
- `cyclicity_ready =` bounded-base cyclicity `(5.77)`
- `finite_cap_bridge_ready =` promoted finite-cap bridge `(5.74A)`
- `bounded_state_compatibility_ready =` restriction compatibility `(5.75)`
- `inductive_union_ready =` inductive-union passage `(5.76)`

Core route content:

- `constructive_part =` Lane A theorem bundle `4.92 -> 5.77`

Structural packages:

- `finite_cap_package =` `{5.39, 5.69, F.245, F.330A, F.331, 5.74A}`
- `sharp_local_package =` `{5.74, 5.75, 5.76, 5.77}`

Construction functions:

- `assemble_sharp_local_state :=`
  `finite_cap_extension -> inductive_union -> cyclicity`
- `extend_finite_cap :=`
  `5.74A -> 5.74 -> 5.75`

Chosen constructive site:

- `win =` fixed engineering cap `Δmax = 4`
- `bridge =` finite-cap positive/unital functional from `5.74A`
- `base =` identity element `1 ∈ A+`
- `state =` `ω_bd`, the bounded positive-time base state from `4.94`
- `unionData =` `ωsharp`, the inductive-union sharp-local state from `5.76`

These are intended as canonical manuscript objects, not arbitrary selections.

Constructive selection rule fixed from manuscript author input:

- reuse an existing cap/index object if present; otherwise define `ym_manuscript_cap := 4`
- reuse the existing promoted finite-cap bridge if present; otherwise define it from `RC.finite_cap_package`
- reuse the identity in `A+` if present; otherwise define `ym_manuscript_base_carrier := 1`
- reuse the existing tuned bounded positive-time base state if present; otherwise define it from the `4.94` base-state package
- reuse the existing inductive-union sharp-local state if present; otherwise define it from the `5.76` glueing package

## C. Vacuum-Gap Route Object

Lean field:

- `RD : YMVacuumGapRoute`

Concrete manuscript object:

- `RD` is the Route 1 plus QE3 transport chain from core Sections III, IV, VI
  and Companion I

Readiness props:

- `ultraviolet_scope_ready =` public group-scope export `(III.2)`
- `entrance_ready =` one-shot entrance `(III.3)`
- `fixed_lattice_gap_ready =` tuned fixed-lattice gap `(IV.1)`
- `weak_window_certificate_ready =` weak-window sufficiency `(IV.4)`
- `continuum_gap_transport_ready =` QE3 transport `(F.216)`
- `reconstruction_ready =` OS reconstruction compatibility `(F.212)`
- `endpoint_ready =` continuum vacuum-gap `(F.5)`

Core route content:

- `vacuum_gap_part =` `{QE1 -> QE2lat -> QE3 chain}`

Structural packages:

- `transport_package =` `{III.18, F.211, F.212, F.213, F.214, F.216}`
- `reconstruction_package =` `{F.212 + Lane A compatibility}`

Construction functions:

- `transport_observable =` bounded cylinder observable `H` supported in at most
  `Msupp` blocks
- `realize_os_sector =` reconstructed vacuum sector `Hloc`
- `evaluate_minkowski_gap =` spectral functional `Spec(Hloc)`

Chosen vacuum-gap site:

- `tm =` QE3 transport map `(F.216)`
- `obs =` bounded cylinder observable `H`, identity-supported on one block
- `rsec =` reconstructed vacuum sector `Hloc`
- `corr =` OS correlation pair `⟨[F], e^{-tHloc}[G]⟩`
- `gapf =` spectral-gap functional `λ ↦ λ` on `Spec(Hloc)`
- `hgap =` proof from `F.5` that `Spec(Hloc) ⊂ {0} ∪ [m*, ∞)`

Vacuum-gap selection rule fixed from manuscript author input:

- reuse the existing `F.216` / QE3 transport object if present; otherwise define it from `RD.transport_package`
- reuse the canonical bounded cylinder observable in the fixed-scale class if present; otherwise use the simplest admissible unit / one-block observable
- reuse the existing reconstructed Hilbert-space carrier if present; otherwise define it as the carrier of `RE.reconstruction_package.reconstructed_hilbert`
- reuse the existing positive-time OS correlation family if present; otherwise define it from `RE.reconstruction_package.vacuum_correlation_family`
- reuse the existing reconstructed vacuum-gap functional if present; otherwise define it from the reconstructed Hamiltonian spectral package
- reuse the theorem term for Corollary `M.5` if the field is reconstruction-level; otherwise reuse the theorem term for Corollary `F.5`

## D. Endpoint Core Object

Lean field:

- `RE : YMEndpointCore`

Concrete manuscript object:

- `RE` is the Companion III endpoint packet

Readiness props:

- `euclidean_dossier_ready =` Theorem `M.1`
- `reconstruction_ready =` Theorem `M.3`
- `endpoint_packet_ready =` Theorem `O.5`

Core content:

- `endpoint_part =` `{M.1-M.6 + O.2-O.7 theorem packet}`
- `dossier =` Euclidean OS dossier `(M.1)`
- `reconstruction_package =` Wightman/Haag-Kastler reconstruction `(M.3)`
- `endpoint_object =` local gauge-invariant sharp-local net `Aloc(G)`

Construction functions:

- `smear_field =` `Φ[P](f)` from field correspondence `(M.4)`
- `evaluate_vacuum_correlation =` `⟨Ω, Φ[P](f) Φ[P](f) Ω⟩`

Chosen endpoint site:

- `vac =` `Ωloc`
- `testFn =` `ϕ*`, canonical witness test function from `M.6`
- `field =` `E_ren`, canonical centered CP-even dimension-4 scalar witness

These are intended to be the same reconstructed packet objects used in the
manuscript narrative.

Endpoint inhabitant selection rule fixed from manuscript author input:

- `Omega_loc =`
  reuse the reconstructed vacuum vector `Omega_loc`
  from the OS/Wightman reconstruction of the full sharp-local state
  `(Appendix M, Theorem M.3 / reconstruction step)`
- `phi_star =`
  reuse the canonical witness test function `phi*,S`
  from the non-triviality witness theorem
- `E_ren =`
  reuse the canonical centered CP-even dimension-4 scalar witness field `E_ren`
  from the non-triviality theorem

Endpoint packet data fixed from manuscript author input:

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

- `hp1 =` Theorem `III.1` plus Corollary `III.2`
- `hp2 =` Proposition `III.3`
- `hAroute =` composition `(III.1 -> III.2 -> III.3)`
- `htrunc =` Theorem `5.69`
- `hext =` Theorem `5.74`
- `hcompat =` Corollary `5.75`
- `hunion =` Corollary `5.76`
- `hww =` Theorem `IV.4`
- `hE =` Theorem `M.1`
- `hP =` Theorem `O.5`

Each witness is intended as a direct theorem, not a synthetic replacement proof.

## F. Final Assembly

Blueprint:

- `blueprint :=`
  - `S :=` ten-packet spine
  - `RC :=` Lane A
  - `RD :=` Route 1/QE3
  - `RE :=` endpoint packet

Chosen sites:

- `chosen_sites :=`
  - constructive `:= (Δmax, bridge, 1, ω_bd, ωsharp)`
  - vacuum-gap `:= (transport, H, Hloc, corr, gapf, hgap)`
  - endpoint `:= (Ωloc, ϕ*, E_ren)`

## Honest Stop Condition

Under this draft, the intended next formal step is to define:

- `I : YMClosedInstantiatedManuscript`

and thereby inhabit:

- `ym_closed_manuscript_completion`

from [ClosedManuscriptCompletionCriterion.lean](/d:/lean/MaleyLean/MaleyLean/Papers/YangMills/Kernel/ClosedManuscriptCompletionCriterion.lean).
