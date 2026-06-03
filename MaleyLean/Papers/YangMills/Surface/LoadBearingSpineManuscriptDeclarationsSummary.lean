import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpineManuscriptDeclarations

namespace MaleyLean

theorem YangMillsLoadBearingSpineManuscriptDeclarationsSummaryStatement :
  ym_load_bearing_spine_manuscript_object.packet6_finite_cap_closure =
      ym_spine_packet6_finite_cap_closure /\
  ym_load_bearing_spine_manuscript_object.packet8_qe3_transport =
      ym_spine_packet8_qe3_transport /\
  ym_load_bearing_spine_manuscript_object.packet9_reconstruction =
      ym_spine_packet9_reconstruction /\
  ym_load_bearing_spine_manuscript_object.theorem_parts =
      ym_spine_theorem_parts := by
  exact ym_load_bearing_spine_manuscript_object_named_outputs

end MaleyLean
