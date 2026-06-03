import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptWitnessDeclarations

namespace MaleyLean

theorem YangMillsConstructiveManuscriptWitnessDeclarationsSummaryStatement :
  ym_constructive_manuscript_object.DeltaMax = DeltaMax /\
  ym_constructive_manuscript_object.finite_cap_bridge = constructive_finite_cap_bridge /\
  ym_constructive_manuscript_object.bounded_base_one = constructive_bounded_base_one /\
  ym_constructive_manuscript_object.omega_bd = constructive_omega_bd /\
  ym_constructive_manuscript_object.omega_sharp = constructive_omega_sharp := by
  exact ym_constructive_manuscript_object_named_inhabitants

end MaleyLean
