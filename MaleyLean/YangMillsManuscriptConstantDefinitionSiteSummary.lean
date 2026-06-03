import MaleyLean.Papers.YangMills.Surface.ManuscriptConstantDefinitionSiteSummary

namespace MaleyLean

theorem YangMillsManuscriptConstantDefinitionSiteSummaryTopExportStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  let I := YangMillsClosedInstantiatedManuscriptOfInput M
  ym_DeltaMax I = M.win /\
  ym_omega_bd I = M.state /\
  ym_omega_sharp I = M.unionData /\
  ym_transport I = M.tm /\
  ym_H I = M.obs /\
  ym_Hloc I = M.rsec /\
  ym_corr I = M.corr /\
  ym_gapf I = M.gapf /\
  ym_hgap_statement I /\
  ym_Omega_loc I = M.vac /\
  ym_phi_star I = M.testFn /\
  ym_E_ren I = M.field := by
  exact YangMillsManuscriptConstantDefinitionSiteSummaryStatement M

end MaleyLean
