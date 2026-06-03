import MaleyLean.Papers.YangMills.Kernel.FaithfulPaperTheoremAssembly

namespace MaleyLean

theorem YangMillsFaithfulPaperTheoremAssemblyTopExportStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMFaithfulPaperTheoremAssembly S RC RD RE) /\
  S.theorem_parts.partA_public_scope /\
  ym_paper_partC_statement RC /\
  ym_paper_partD_statement RD /\
  ym_paper_endpoint_statement RE := by
  exact
    YangMillsFaithfulPaperTheoremAssemblyExportStatement
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP

theorem YangMillsDirectPaperTheoremTopExportStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  ym_laneA_verbatim_claim_family /\
  ym_route1_verbatim_claim_family /\
  ym_endpoint_verbatim_claim_family /\
  S.theorem_parts.partA_public_scope /\
  ym_paper_partC_statement RC /\
  ym_paper_partD_statement RD /\
  ym_paper_endpoint_statement RE := by
  exact
    YangMillsDirectPaperTheoremStatement
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP

end MaleyLean
