import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore
import MaleyLean.Papers.YangMills.Kernel.ContinuumTransportPayload

namespace MaleyLean

/--
Continuum transport payload for the QE3/weak-window bridge.

This names the analytic handoff from the fixed-lattice gap input through the
weak-window certificate into continuum OS transport.
-/
structure YMContinuumTransportConclusion where
  LatticeSide : Type
  ContinuumSide : Type
  TransportMap : Type
  continuum_gap_transport_ready : Prop
  os_transport_ready : Prop
  positive_gap_exhibited : Prop
  lattice_gap_input_preserved : Prop

def YMContinuumTransportConclusion.closed
    (C : YMContinuumTransportConclusion) :
    Prop :=
  C.continuum_gap_transport_ready /\
  C.os_transport_ready /\
  C.positive_gap_exhibited /\
  C.lattice_gap_input_preserved

/--
Bridge from an explicit weak-window/QE3 continuum transport payload to the
existing route-facing continuum transport conclusion socket.
-/
structure YMContinuumTransportPayloadBridge where
  payload : Papers.YangMills.YMContinuumTransportPayload
  conclusion : YMContinuumTransportConclusion
  continuum_transport_from_payload :
    payload.output.continuum_gap_transport_ready ->
      conclusion.continuum_gap_transport_ready
  os_transport_from_payload :
    payload.output.os_transport_ready ->
      conclusion.os_transport_ready
  positive_gap_from_payload :
    payload.output.positive_gap_exhibited ->
      conclusion.positive_gap_exhibited
  lattice_input_from_payload :
    payload.output.lattice_gap_input_preserved ->
      conclusion.lattice_gap_input_preserved

theorem YMContinuumTransportPayloadBridge.closed
    (B : YMContinuumTransportPayloadBridge) :
    B.conclusion.closed := by
  exact
    And.intro
      (B.continuum_transport_from_payload
        B.payload.output.continuum_gap_transport_ready_holds)
      (And.intro
        (B.os_transport_from_payload
          B.payload.output.os_transport_ready_holds)
        (And.intro
          (B.positive_gap_from_payload
            B.payload.output.positive_gap_exhibited_holds)
          (B.lattice_input_from_payload
            B.payload.output.lattice_gap_input_preserved_holds)))

structure YMContinuumTransportHypotheses where
  fixed_lattice_gap_ready : Prop
  weak_window_certificate_ready : Prop
  lattice_gap_input : Prop
  positive_gap_exhibited : Prop
  density_handoff_external : Prop
  graph_core_handoff_external : Prop
  qe3_transport_bound_external : Prop

def YMContinuumTransportHypotheses.complete
    (H : YMContinuumTransportHypotheses) :
    Prop :=
  H.fixed_lattice_gap_ready /\
  H.weak_window_certificate_ready /\
  H.lattice_gap_input /\
  H.positive_gap_exhibited /\
  H.density_handoff_external /\
  H.graph_core_handoff_external /\
  H.qe3_transport_bound_external

/--
Standard QE3/weak-window continuum transport import.
-/
structure YMStandardContinuumTransportTransfer where
  hypotheses : YMContinuumTransportHypotheses
  conclusion : YMContinuumTransportConclusion
  transfer :
    hypotheses.complete -> conclusion.closed

structure YMContinuumTransportHypothesisMap
    (RD : YMVacuumGapRoute) where
  fixed_lattice_gap_ready :
    RD.fixed_lattice_gap_ready
  weak_window_certificate_ready :
    RD.weak_window_certificate_ready
  lattice_gap_input :
    RD.transport_package.lattice_gap_input
  positive_gap_exhibited :
    RD.transport_package.positive_gap_exhibited
  density_handoff_external :
    Prop
  graph_core_handoff_external :
    Prop
  qe3_transport_bound_external :
    Prop

def YMContinuumTransportHypothesisMap.externalComplete
    {RD : YMVacuumGapRoute}
    (M : YMContinuumTransportHypothesisMap RD) :
    Prop :=
  M.density_handoff_external /\
  M.graph_core_handoff_external /\
  M.qe3_transport_bound_external

def YMContinuumTransportHypothesisMap.toTransferHypotheses
    {RD : YMVacuumGapRoute}
    (M : YMContinuumTransportHypothesisMap RD) :
    YMContinuumTransportHypotheses where
  fixed_lattice_gap_ready := RD.fixed_lattice_gap_ready
  weak_window_certificate_ready := RD.weak_window_certificate_ready
  lattice_gap_input := RD.transport_package.lattice_gap_input
  positive_gap_exhibited := RD.transport_package.positive_gap_exhibited
  density_handoff_external := M.density_handoff_external
  graph_core_handoff_external := M.graph_core_handoff_external
  qe3_transport_bound_external := M.qe3_transport_bound_external

theorem YMContinuumTransportHypothesisMap.completeTransferHypotheses
    {RD : YMVacuumGapRoute}
    (M : YMContinuumTransportHypothesisMap RD)
    (hexternal : M.externalComplete) :
    M.toTransferHypotheses.complete := by
  exact
    And.intro M.fixed_lattice_gap_ready <|
      And.intro M.weak_window_certificate_ready <|
        And.intro M.lattice_gap_input <|
          And.intro M.positive_gap_exhibited <|
            And.intro hexternal.1 <|
              And.intro hexternal.2.1 hexternal.2.2

structure YMRouteContinuumTransportImport
    (RD : YMVacuumGapRoute) where
  standard_transport : YMStandardContinuumTransportTransfer
  hypotheses_verified :
    standard_transport.hypotheses.complete
  route_transport_ready_from_standard :
    standard_transport.conclusion.closed ->
      RD.continuum_gap_transport_ready
  route_os_transport_from_standard :
    standard_transport.conclusion.closed ->
      RD.transport_package.os_transport_ready
  route_positive_gap_from_standard :
    standard_transport.conclusion.closed ->
      RD.transport_package.positive_gap_exhibited
  route_lattice_input_from_standard :
    standard_transport.conclusion.closed ->
      RD.transport_package.lattice_gap_input

theorem YMRouteContinuumTransportImport.dischargeTransportOutputs
    {RD : YMVacuumGapRoute}
    (I : YMRouteContinuumTransportImport RD) :
    RD.continuum_gap_transport_ready /\
    RD.transport_package.os_transport_ready /\
    RD.transport_package.positive_gap_exhibited /\
    RD.transport_package.lattice_gap_input := by
  have hclosed := I.standard_transport.transfer I.hypotheses_verified
  exact
    And.intro (I.route_transport_ready_from_standard hclosed) <|
      And.intro (I.route_os_transport_from_standard hclosed) <|
        And.intro
          (I.route_positive_gap_from_standard hclosed)
          (I.route_lattice_input_from_standard hclosed)

def YMRouteContinuumTransportImport.fromHypothesisMap
    {RD : YMVacuumGapRoute}
    (M : YMContinuumTransportHypothesisMap RD)
    (standard_transport : YMStandardContinuumTransportTransfer)
    (hstandard :
      standard_transport.hypotheses = M.toTransferHypotheses)
    (hexternal : M.externalComplete)
    (route_transport_ready_from_standard :
      standard_transport.conclusion.closed ->
        RD.continuum_gap_transport_ready)
    (route_os_transport_from_standard :
      standard_transport.conclusion.closed ->
        RD.transport_package.os_transport_ready)
    (route_positive_gap_from_standard :
      standard_transport.conclusion.closed ->
        RD.transport_package.positive_gap_exhibited)
    (route_lattice_input_from_standard :
      standard_transport.conclusion.closed ->
        RD.transport_package.lattice_gap_input) :
    YMRouteContinuumTransportImport RD where
  standard_transport := standard_transport
  hypotheses_verified := by
    rw [hstandard]
    exact M.completeTransferHypotheses hexternal
  route_transport_ready_from_standard := route_transport_ready_from_standard
  route_os_transport_from_standard := route_os_transport_from_standard
  route_positive_gap_from_standard := route_positive_gap_from_standard
  route_lattice_input_from_standard := route_lattice_input_from_standard

end MaleyLean
