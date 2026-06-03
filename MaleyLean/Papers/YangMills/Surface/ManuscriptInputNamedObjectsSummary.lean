import MaleyLean.Papers.YangMills.Kernel.ManuscriptInputNamedObjects

namespace MaleyLean

theorem YangMillsManuscriptInputNamedObjectsSummaryStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  ym_input_DeltaMax M = M.win /\
  ym_input_finite_cap_bridge M = M.bridge /\
  ym_input_bounded_base_one M = M.base /\
  ym_input_omega_bd M = M.state /\
  ym_input_omega_sharp M = M.unionData /\
  ym_input_transport M = M.tm /\
  ym_input_H M = M.obs /\
  ym_input_Hloc M = M.rsec /\
  ym_input_corr M = M.corr /\
  ym_input_gapf M = M.gapf /\
  ym_input_hgap_statement M /\
  ym_input_Omega_loc M = M.vac /\
  ym_input_phi_star M = M.testFn /\
  ym_input_E_ren M = M.field := by
  exact YangMillsManuscriptInputNamedObjectsStatement M

end MaleyLean
