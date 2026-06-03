import MaleyLean.Papers.YangMills.Surface.LoadBearingSpineManuscriptObjectSummary

namespace MaleyLean

theorem YangMillsLoadBearingSpineManuscriptObjectSummaryTopExportStatement
  (P : YMLoadBearingSpineManuscriptObject) :
  let S := P.toSpine
  S.packet6_finite_cap_closure = P.packet6_finite_cap_closure /\
  S.packet8_qe3_transport = P.packet8_qe3_transport /\
  S.packet9_reconstruction = P.packet9_reconstruction /\
  S.theorem_parts = P.theorem_parts /\
  S.partC_route = P.partC_route /\
  S.partD_route = P.partD_route /\
  S.endpoint_route = P.endpoint_route /\
  S.packet1_uv_gate /\
  S.packet2_entrance /\
  ym_public_scope_route S := by
  exact YangMillsLoadBearingSpineManuscriptObjectSummaryStatement P

end MaleyLean
