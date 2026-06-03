import MaleyLean.Papers.YangMills.Kernel.ManuscriptChoicePackage
import MaleyLean.Papers.YangMills.Kernel.ClosedManuscriptCompletionCriterion

namespace MaleyLean

def YangMillsManuscriptChoicePackageOfClosed
  (I : YMClosedInstantiatedManuscript) :
  YMManuscriptChoicePackage :=
  { objects := I.blueprint.objects
    witnesses := I.blueprint.witnesses
    constructive_choices :=
      { DeltaMax := I.chosen_sites.constructive.win
        finite_cap_bridge := I.chosen_sites.constructive.bridge
        bounded_base_one := I.chosen_sites.constructive.base
        omega_bd := I.chosen_sites.constructive.state
        omega_sharp := I.chosen_sites.constructive.unionData }
    vacuum_gap_choices :=
      { transport := I.chosen_sites.vacuum_gap.tm
        H := I.chosen_sites.vacuum_gap.obs
        Hloc := I.chosen_sites.vacuum_gap.rsec
        corr := I.chosen_sites.vacuum_gap.corr
        gapf := I.chosen_sites.vacuum_gap.gapf
        hgap := I.chosen_sites.vacuum_gap.hgap }
    endpoint_choices :=
      { Omega_loc := I.chosen_sites.endpoint.vac
        phi_star := I.chosen_sites.endpoint.testFn
        E_ren := I.chosen_sites.endpoint.field } }

theorem YangMillsClosedManuscriptCompletionFromChoicePackageStatement :
  Nonempty YMManuscriptChoicePackage -> ym_closed_manuscript_completion := by
  intro h
  rcases h with ⟨P⟩
  exact ⟨P.toClosedInstantiatedManuscript⟩

theorem YangMillsChoicePackageFromClosedManuscriptCompletionStatement :
  ym_closed_manuscript_completion -> Nonempty YMManuscriptChoicePackage := by
  intro h
  rcases h with ⟨I⟩
  exact ⟨YangMillsManuscriptChoicePackageOfClosed I⟩

theorem YangMillsClosedManuscriptCompletionIffChoicePackageStatement :
  ym_closed_manuscript_completion ↔ Nonempty YMManuscriptChoicePackage := by
  constructor
  · exact YangMillsChoicePackageFromClosedManuscriptCompletionStatement
  · exact YangMillsClosedManuscriptCompletionFromChoicePackageStatement

end MaleyLean
