import MaleyLean.Papers.YangMills.Kernel.FixedLatticeSpectralGap
import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore

namespace MaleyLean

/--
The fixed-lattice spectral gap payload needed before continuum transport.

The present route exposes this as readiness and lattice-input propositions.
For A+ audit, the spectral estimate itself is named separately.
-/
structure YMLatticeGapConclusion where
  LatticeConfigurationSpace : Type
  LatticeHamiltonian : Type
  GapScale : Type
  finite_volume_gap_bound : Prop
  positive_gap_scale : Prop
  uniform_volume_control : Prop

def YMLatticeGapConclusion.closed
    (C : YMLatticeGapConclusion) :
    Prop :=
  C.finite_volume_gap_bound /\
  C.positive_gap_scale /\
  C.uniform_volume_control

/--
Bridge from explicit uniform real spectral-gap data to the existing
fixed-lattice gap conclusion socket.
-/
structure YMFixedLatticeSpectralGapPayloadBridge where
  spectral_payload :
    Papers.YangMills.YMUniformFixedLatticeRealSpectralGap
  conclusion : YMLatticeGapConclusion
  finite_volume_bound_from_payload :
    (forall V : spectral_payload.Volume,
      0 < spectral_payload.gap /\
        spectral_payload.spectrum V 0 /\
        forall {energy : Real},
          spectral_payload.spectrum V energy ->
            energy = 0 \/ spectral_payload.gap <= energy) ->
      conclusion.finite_volume_gap_bound
  positive_gap_from_payload :
    (forall _V : spectral_payload.Volume, 0 < spectral_payload.gap) ->
      conclusion.positive_gap_scale
  uniform_volume_control_from_payload :
    (forall _V : spectral_payload.Volume,
      Papers.YangMills.YMFixedLatticeRealSpectralGap) ->
      conclusion.uniform_volume_control

theorem YMFixedLatticeSpectralGapPayloadBridge.closed
    (B : YMFixedLatticeSpectralGapPayloadBridge) :
    B.conclusion.closed := by
  exact
    And.intro
      (B.finite_volume_bound_from_payload
        (fun V =>
          And.intro
            (B.spectral_payload.positive_gap V)
            (And.intro
              (B.spectral_payload.vacuum_in_each_spectrum V)
              (fun henergy =>
                B.spectral_payload.spectral_values_are_vacuum_or_above_gap
                  V
                  henergy))))
      (And.intro
        (B.positive_gap_from_payload
          (fun V => B.spectral_payload.positive_gap V))
        (B.uniform_volume_control_from_payload
          (fun V =>
            B.spectral_payload.fixed_volume_certificate V)))

/--
Hypotheses for the fixed-lattice gap theorem used by the route.
-/
structure YMFixedLatticeGapHypotheses where
  ultraviolet_scope_ready : Prop
  entrance_ready : Prop
  lattice_action_admissible : Prop
  gauge_group_compact_simple : Prop
  fixed_lattice_volume_control : Prop

def YMFixedLatticeGapHypotheses.complete
    (H : YMFixedLatticeGapHypotheses) :
    Prop :=
  H.ultraviolet_scope_ready /\
  H.entrance_ready /\
  H.lattice_action_admissible /\
  H.gauge_group_compact_simple /\
  H.fixed_lattice_volume_control

/--
Standard fixed-lattice gap import.  A future A+ closure must replace this
theorem object with an actual finite-lattice spectral proof or an exact cited
library theorem with verified hypotheses.
-/
structure YMStandardFixedLatticeGapTransfer where
  hypotheses : YMFixedLatticeGapHypotheses
  conclusion : YMLatticeGapConclusion
  transfer :
    hypotheses.complete -> conclusion.closed

structure YMLatticeGapHypothesisMap
    (RD : YMVacuumGapRoute) where
  ultraviolet_scope_ready :
    RD.ultraviolet_scope_ready
  entrance_ready :
    RD.entrance_ready
  lattice_action_admissible_external :
    Prop
  gauge_group_compact_simple_external :
    Prop
  fixed_lattice_volume_control_external :
    Prop

def YMLatticeGapHypothesisMap.externalComplete
    {RD : YMVacuumGapRoute}
    (M : YMLatticeGapHypothesisMap RD) :
    Prop :=
  M.lattice_action_admissible_external /\
  M.gauge_group_compact_simple_external /\
  M.fixed_lattice_volume_control_external

def YMLatticeGapHypothesisMap.toTransferHypotheses
    {RD : YMVacuumGapRoute}
    (M : YMLatticeGapHypothesisMap RD) :
    YMFixedLatticeGapHypotheses where
  ultraviolet_scope_ready := RD.ultraviolet_scope_ready
  entrance_ready := RD.entrance_ready
  lattice_action_admissible := M.lattice_action_admissible_external
  gauge_group_compact_simple := M.gauge_group_compact_simple_external
  fixed_lattice_volume_control := M.fixed_lattice_volume_control_external

theorem YMLatticeGapHypothesisMap.completeTransferHypotheses
    {RD : YMVacuumGapRoute}
    (M : YMLatticeGapHypothesisMap RD)
    (hexternal : M.externalComplete) :
    M.toTransferHypotheses.complete := by
  exact
    And.intro M.ultraviolet_scope_ready <|
      And.intro M.entrance_ready <|
        And.intro hexternal.1 <|
          And.intro hexternal.2.1 hexternal.2.2

structure YMRouteFixedLatticeGapImport
    (RD : YMVacuumGapRoute) where
  standard_lattice_gap : YMStandardFixedLatticeGapTransfer
  hypotheses_verified :
    standard_lattice_gap.hypotheses.complete
  route_lattice_gap_from_standard :
    standard_lattice_gap.conclusion.closed ->
      RD.fixed_lattice_gap_ready
  route_lattice_input_from_standard :
    standard_lattice_gap.conclusion.closed ->
      RD.transport_package.lattice_gap_input
  route_positive_gap_from_standard :
    standard_lattice_gap.conclusion.closed ->
      RD.transport_package.positive_gap_exhibited

theorem YMRouteFixedLatticeGapImport.dischargeFixedLatticeReady
    {RD : YMVacuumGapRoute}
    (I : YMRouteFixedLatticeGapImport RD) :
    RD.fixed_lattice_gap_ready := by
  exact I.route_lattice_gap_from_standard
    (I.standard_lattice_gap.transfer I.hypotheses_verified)

theorem YMRouteFixedLatticeGapImport.dischargeLatticeInput
    {RD : YMVacuumGapRoute}
    (I : YMRouteFixedLatticeGapImport RD) :
    RD.transport_package.lattice_gap_input := by
  exact I.route_lattice_input_from_standard
    (I.standard_lattice_gap.transfer I.hypotheses_verified)

theorem YMRouteFixedLatticeGapImport.dischargePositiveGap
    {RD : YMVacuumGapRoute}
    (I : YMRouteFixedLatticeGapImport RD) :
    RD.transport_package.positive_gap_exhibited := by
  exact I.route_positive_gap_from_standard
    (I.standard_lattice_gap.transfer I.hypotheses_verified)

end MaleyLean
