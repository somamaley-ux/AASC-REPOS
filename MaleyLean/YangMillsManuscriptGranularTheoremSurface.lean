import MaleyLean.Papers.YangMills.Kernel.ManuscriptGranularTheoremSurface

namespace MaleyLean

theorem YangMillsManuscriptGranularTheoremSurfaceTopExportStatement
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
  Nonempty (YMManuscriptGranularTheoremSurface S RC RD RE) /\
  ym_core_named_theorem_reflection S RC RD RE /\
  YMLaneATheoremContent RC /\
  YMRoute1TheoremContent RD /\
  YMEndpointTheoremContent RE := by
  exact
    YangMillsManuscriptGranularTheoremSurfaceExportStatement
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP

end MaleyLean
