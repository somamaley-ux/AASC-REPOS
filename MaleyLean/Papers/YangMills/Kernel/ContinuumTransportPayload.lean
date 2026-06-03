namespace MaleyLean
namespace Papers
namespace YangMills

/-- Density handoff from bounded/sharp-local data into the continuum side. -/
structure YMContinuumDensityHandoffPayload where
  LatticeSide : Type
  ContinuumSide : Type
  density_handoff_ready : Prop
  density_handoff_ready_holds : density_handoff_ready

/-- Graph-core handoff at the QE3 seam. -/
structure YMContinuumGraphCoreHandoffPayload where
  ContinuumSide : Type
  GraphCore : Type
  graph_core_handoff_ready : Prop
  graph_core_handoff_ready_holds : graph_core_handoff_ready

/-- Quantitative QE3 transport control. -/
structure YMQE3TransportBoundPayload where
  TransportMap : Type
  qe3_transport_bound : Prop
  qe3_transport_bound_holds : qe3_transport_bound

/-- Output side of continuum transport. -/
structure YMContinuumTransportOutputPayload where
  continuum_gap_transport_ready : Prop
  continuum_gap_transport_ready_holds : continuum_gap_transport_ready
  os_transport_ready : Prop
  os_transport_ready_holds : os_transport_ready
  positive_gap_exhibited : Prop
  positive_gap_exhibited_holds : positive_gap_exhibited
  lattice_gap_input_preserved : Prop
  lattice_gap_input_preserved_holds : lattice_gap_input_preserved

def YMContinuumTransportOutputPayload.closed
    (P : YMContinuumTransportOutputPayload) :
    Prop :=
  P.continuum_gap_transport_ready /\
    P.os_transport_ready /\
    P.positive_gap_exhibited /\
    P.lattice_gap_input_preserved

theorem YMContinuumTransportOutputPayload.closed_holds
    (P : YMContinuumTransportOutputPayload) :
    P.closed := by
  exact
    And.intro
      P.continuum_gap_transport_ready_holds
      (And.intro
        P.os_transport_ready_holds
        (And.intro
          P.positive_gap_exhibited_holds
          P.lattice_gap_input_preserved_holds))

/-- Full continuum transport payload for the weak-window/QE3 bridge. -/
structure YMContinuumTransportPayload where
  density_handoff : YMContinuumDensityHandoffPayload
  graph_core_handoff : YMContinuumGraphCoreHandoffPayload
  qe3_transport_bound : YMQE3TransportBoundPayload
  output : YMContinuumTransportOutputPayload

namespace YMContinuumTransportPayload

theorem density_handoff_ready
    (P : YMContinuumTransportPayload) :
    P.density_handoff.density_handoff_ready := by
  exact P.density_handoff.density_handoff_ready_holds

theorem graph_core_handoff_ready
    (P : YMContinuumTransportPayload) :
    P.graph_core_handoff.graph_core_handoff_ready := by
  exact P.graph_core_handoff.graph_core_handoff_ready_holds

theorem qe3_transport_bound_ready
    (P : YMContinuumTransportPayload) :
    P.qe3_transport_bound.qe3_transport_bound := by
  exact P.qe3_transport_bound.qe3_transport_bound_holds

theorem output_closed
    (P : YMContinuumTransportPayload) :
    P.output.closed := by
  exact P.output.closed_holds

theorem closed
    (P : YMContinuumTransportPayload) :
    P.output.continuum_gap_transport_ready /\
      P.output.os_transport_ready /\
      P.output.positive_gap_exhibited /\
      P.output.lattice_gap_input_preserved := by
  exact P.output.closed_holds

end YMContinuumTransportPayload

end YangMills
end Papers
end MaleyLean
