import MaleyLean.Papers.YangMills.Kernel.ConstructiveCore
import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore

namespace MaleyLean

/--
Joint assembly layer for the two load-bearing theorem hearts of the manuscript:
the constructive Lane~A route and the short Route~1 vacuum-gap route.
-/
theorem YangMillsLoadBearingSpineFeedsBothCoresStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (h4 : S.packet4_flowed_state)
  (h5 : S.packet5_finite_truncation)
  (h6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (h7 : S.packet7_cyclicity)
  (hb : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hc : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hu : S.packet6_finite_cap_closure.inductive_union_passage)
  (huv : S.packet1_uv_gate)
  (hent : S.packet2_entrance)
  (hlat : S.packet3_fixed_lattice_gap)
  (hww : S.auxiliary_weak_window_certificate)
  (hend : S.packet10_endpoint)
  (hflowed : RC.flowed_state_ready)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcyc : RC.cyclicity_ready)
  (hbridge : RC.finite_cap_bridge_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hbuildC : ym_laneA_constructive_core RC)
  (huvR : RD.ultraviolet_scope_ready)
  (hentR : RD.entrance_ready)
  (hlatR : RD.fixed_lattice_gap_ready)
  (hwwR : RD.weak_window_certificate_ready)
  (hgapR : RD.continuum_gap_transport_ready)
  (hrecR : RD.reconstruction_ready)
  (hendR : RD.endpoint_ready)
  (hbuildD : ym_route1_vacuum_gap_core RD) :
  RC.constructive_part /\ RD.vacuum_gap_part := by
  have hC :=
    YangMillsLoadBearingSpineFeedsConstructiveCoreStatement
      S RC h4 h5 h6 h7 hb hc hu
      hflowed htrunc hext hcyc hbridge hcompat hunion hbuildC
  have hD :=
    YangMillsLoadBearingSpineFeedsVacuumGapCoreStatement
      S RD huv hent hlat hww hend
      huvR hentR hlatR hwwR hgapR hrecR hendR hbuildD
  exact And.intro hC.2.2.2.2.2.2.2 hD.2.2.2.2.2

end MaleyLean
