import MaleyLean.Papers.YangMills.Kernel.ManuscriptObjectPackageDeclarations

namespace MaleyLean

theorem YangMillsManuscriptObjectPackageDeclarationsSummaryStatement :
  ym_manuscript_object_package.spine = ym_load_bearing_spine_manuscript_object /\
  ym_manuscript_object_package.constructive = ym_constructive_manuscript_object /\
  ym_manuscript_object_package.vacuum_gap = ym_vacuum_gap_manuscript_object /\
  ym_manuscript_object_package.endpoint = ym_endpoint_manuscript_object /\
  ym_closed_manuscript_completion /\
  ym_manuscript_choice_package_completion := by
  exact
    ⟨rfl, rfl, rfl, rfl,
      ym_closed_manuscript_completion_realized,
      ym_manuscript_choice_package_completion_realized⟩

end MaleyLean
