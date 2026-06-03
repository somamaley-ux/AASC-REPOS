import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptDraft

namespace MaleyLean

theorem YangMillsConstructiveManuscriptDraftSummaryStatement
  (I : YMClosedInstantiatedManuscript) :
  let RC := I.blueprint.objects.RC
  Nonempty (YMConstructiveRelationalInterface RC) /\
  Nonempty (YMConstructiveExtendAssembleLawPackage RC) /\
  ym_DeltaMax I = I.chosen_sites.constructive.win /\
  ym_finite_cap_bridge I = I.chosen_sites.constructive.bridge /\
  ym_bounded_base_one I = I.chosen_sites.constructive.base /\
  ym_omega_bd I = I.chosen_sites.constructive.state /\
  ym_omega_sharp I = I.chosen_sites.constructive.unionData := by
  exact YangMillsConstructiveManuscriptDraftStatement I

end MaleyLean
