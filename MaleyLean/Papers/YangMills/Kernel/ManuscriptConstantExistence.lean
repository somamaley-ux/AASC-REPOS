import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite
import MaleyLean.Papers.YangMills.Kernel.ClosedManuscriptCompletionCriterion

namespace MaleyLean

/--
Extract the exact bundled manuscript input from a closed instantiated
manuscript object.
-/
def YangMillsClosedInstantiatedManuscriptInputOfClosed
  (I : YMClosedInstantiatedManuscript) :
  YMClosedInstantiatedManuscriptInput :=
  { S := I.blueprint.objects.S
    RC := I.blueprint.objects.RC
    RD := I.blueprint.objects.RD
    RE := I.blueprint.objects.RE
    hp1 := I.blueprint.witnesses.hp1
    hp2 := I.blueprint.witnesses.hp2
    hAroute := I.blueprint.witnesses.hAroute
    htrunc := I.blueprint.witnesses.htrunc
    hext := I.blueprint.witnesses.hext
    hcompat := I.blueprint.witnesses.hcompat
    hunion := I.blueprint.witnesses.hunion
    hww := I.blueprint.witnesses.hww
    hE := I.blueprint.witnesses.hE
    hP := I.blueprint.witnesses.hP
    win := I.chosen_sites.constructive.win
    bridge := I.chosen_sites.constructive.bridge
    base := I.chosen_sites.constructive.base
    state := I.chosen_sites.constructive.state
    unionData := I.chosen_sites.constructive.unionData
    tm := I.chosen_sites.vacuum_gap.tm
    obs := I.chosen_sites.vacuum_gap.obs
    rsec := I.chosen_sites.vacuum_gap.rsec
    corr := I.chosen_sites.vacuum_gap.corr
    gapf := I.chosen_sites.vacuum_gap.gapf
    hgap := I.chosen_sites.vacuum_gap.hgap
    vac := I.chosen_sites.endpoint.vac
    testFn := I.chosen_sites.endpoint.testFn
    field := I.chosen_sites.endpoint.field }

theorem YangMillsClosedInstantiatedManuscriptRoundTripStatement
  (I : YMClosedInstantiatedManuscript) :
  YangMillsClosedInstantiatedManuscriptOfInput
      (YangMillsClosedInstantiatedManuscriptInputOfClosed I) = I := by
  cases I
  rfl

theorem YangMillsClosedInstantiatedManuscriptInputRoundTripStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  YangMillsClosedInstantiatedManuscriptInputOfClosed
      (YangMillsClosedInstantiatedManuscriptOfInput M) = M := by
  cases M
  rfl

theorem YangMillsClosedManuscriptCompletionIffInputStatement :
  ym_closed_manuscript_completion ↔
    Nonempty YMClosedInstantiatedManuscriptInput := by
  constructor
  · intro h
    rcases h with ⟨I⟩
    exact ⟨YangMillsClosedInstantiatedManuscriptInputOfClosed I⟩
  · intro h
    rcases h with ⟨M⟩
    exact ⟨YangMillsClosedInstantiatedManuscriptOfInput M⟩

end MaleyLean
