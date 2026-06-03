import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpineManuscriptDeclarations
import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptWitnessDeclarations
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptWitnessDeclarations
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptWitnessDeclarations
import MaleyLean.Papers.YangMills.Kernel.ManuscriptObjectPackage
import MaleyLean.Papers.YangMills.Kernel.ManuscriptChoicePackageCompletionCriterion

namespace MaleyLean

noncomputable def ym_manuscript_object_package :
  YMManuscriptObjectPackage :=
  { spine := ym_load_bearing_spine_manuscript_object
    constructive := ym_constructive_manuscript_object
    vacuum_gap := ym_vacuum_gap_manuscript_object
    endpoint := ym_endpoint_manuscript_object }

noncomputable def ym_manuscript_choice_package :
  YMManuscriptChoicePackage :=
  ym_manuscript_object_package.toChoicePackage

noncomputable def manuscript_input :
  YMClosedInstantiatedManuscriptInput :=
  ym_manuscript_object_package.toInput

noncomputable def I : YMClosedInstantiatedManuscript :=
  ym_manuscript_object_package.toClosedInstantiatedManuscript

theorem ym_manuscript_object_package_assembles :
  ym_manuscript_object_package.spine = ym_load_bearing_spine_manuscript_object /\
  ym_manuscript_object_package.constructive = ym_constructive_manuscript_object /\
  ym_manuscript_object_package.vacuum_gap = ym_vacuum_gap_manuscript_object /\
  ym_manuscript_object_package.endpoint = ym_endpoint_manuscript_object := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem ym_closed_manuscript_completion_realized :
  ym_closed_manuscript_completion := by
  exact ⟨I⟩

theorem ym_manuscript_choice_package_completion_realized :
  ym_manuscript_choice_package_completion := by
  exact ⟨ym_manuscript_choice_package⟩

end MaleyLean
