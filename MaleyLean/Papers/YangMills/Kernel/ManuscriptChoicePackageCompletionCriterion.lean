import MaleyLean.Papers.YangMills.Kernel.ManuscriptChoicePackageExistence

namespace MaleyLean

/--
Final package-level completion criterion for the Yang--Mills manuscript
reflection.

At the current deepest boundary, the formalization is complete exactly when the
repository contains one closed manuscript choice package.
-/
def ym_manuscript_choice_package_completion : Prop :=
  Nonempty YMManuscriptChoicePackage

theorem YangMillsManuscriptChoicePackageCompletionCriterionStatement :
  ym_manuscript_choice_package_completion ↔ ym_closed_manuscript_completion := by
  dsimp [ym_manuscript_choice_package_completion]
  constructor
  · intro h
    exact YangMillsClosedManuscriptCompletionFromChoicePackageStatement h
  · intro h
    exact YangMillsChoicePackageFromClosedManuscriptCompletionStatement h

end MaleyLean
