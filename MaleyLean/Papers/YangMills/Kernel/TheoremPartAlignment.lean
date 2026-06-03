import MaleyLean.Papers.YangMills.Kernel.CoreAssembly

namespace MaleyLean

/--
Alignment layer connecting the dedicated constructive and vacuum-gap cores
back to the named main-theorem parts carried by the load-bearing spine.
-/
theorem YangMillsConstructiveCoreAlignsWithPartCStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (h : RC.constructive_part -> S.theorem_parts.partC_sharp_local_construction) :
  RC.constructive_part -> S.theorem_parts.partC_sharp_local_construction := by
  intro hC
  exact h hC

theorem YangMillsVacuumGapCoreAlignsWithPartDStatement
  (S : YMLoadBearingSpine)
  (RD : YMVacuumGapRoute)
  (h : RD.vacuum_gap_part -> S.theorem_parts.partD_vacuum_gap) :
  RD.vacuum_gap_part -> S.theorem_parts.partD_vacuum_gap := by
  intro hD
  exact h hD

theorem YangMillsBothCoresAlignWithMainTheoremPartsStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (hCalign : RC.constructive_part -> S.theorem_parts.partC_sharp_local_construction)
  (hDalign : RD.vacuum_gap_part -> S.theorem_parts.partD_vacuum_gap)
  (hcores : RC.constructive_part /\ RD.vacuum_gap_part) :
  S.theorem_parts.partC_sharp_local_construction /\ S.theorem_parts.partD_vacuum_gap := by
  have hC := YangMillsConstructiveCoreAlignsWithPartCStatement S RC hCalign hcores.1
  have hD := YangMillsVacuumGapCoreAlignsWithPartDStatement S RD hDalign hcores.2
  exact And.intro hC hD

theorem YangMillsSpineFeedsAlignedMainTheoremPartsStatement
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
  (hbuildD : ym_route1_vacuum_gap_core RD)
  (hCalign : RC.constructive_part -> S.theorem_parts.partC_sharp_local_construction)
  (hDalign : RD.vacuum_gap_part -> S.theorem_parts.partD_vacuum_gap) :
  S.theorem_parts.partC_sharp_local_construction /\ S.theorem_parts.partD_vacuum_gap := by
  have hcores :=
    YangMillsLoadBearingSpineFeedsBothCoresStatement
      S RC RD
      h4 h5 h6 h7 hb hc hu
      huv hent hlat hww hend
      hflowed htrunc hext hcyc hbridge hcompat hunion hbuildC
      huvR hentR hlatR hwwR hgapR hrecR hendR hbuildD
  exact YangMillsBothCoresAlignWithMainTheoremPartsStatement S RC RD hCalign hDalign hcores

end MaleyLean
