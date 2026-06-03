import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptObject

namespace MaleyLean

theorem YangMillsConstructiveManuscriptObjectSummaryStatement
  (P : YMConstructiveManuscriptObject) :
  let RC := P.toConstructiveRoute
  let C := P.toChoices
  RC.finite_cap_package = P.finite_cap_package /\
  RC.sharp_local_package = P.sharp_local_package /\
  ym_constructive_DeltaMax_of C = P.DeltaMax /\
  ym_constructive_finite_cap_bridge_of C = P.finite_cap_bridge /\
  ym_constructive_bounded_base_one_of C = P.bounded_base_one /\
  ym_constructive_omega_bd_of C = P.omega_bd /\
  ym_constructive_omega_sharp_of C = P.omega_sharp := by
  exact YangMillsConstructiveManuscriptObjectStatement P

end MaleyLean
