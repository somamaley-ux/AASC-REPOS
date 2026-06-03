import MaleyLean.Papers.YangMills.Surface.LoadBearingSpineOfInputSummary

namespace MaleyLean

theorem YangMillsLoadBearingSpineOfInputSummaryTopExportStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  let S := YangMillsLoadBearingSpineOfInput M
  S = M.S /\
  S.packet6_finite_cap_closure = M.S.packet6_finite_cap_closure /\
  S.packet8_qe3_transport = M.S.packet8_qe3_transport /\
  S.packet9_reconstruction = M.S.packet9_reconstruction /\
  S.theorem_parts = M.S.theorem_parts /\
  S.partC_route = M.S.partC_route /\
  S.partD_route = M.S.partD_route /\
  S.endpoint_route = M.S.endpoint_route := by
  exact YangMillsLoadBearingSpineOfInputSummaryStatement M

end MaleyLean
