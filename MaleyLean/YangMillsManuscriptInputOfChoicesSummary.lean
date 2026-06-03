import MaleyLean.Papers.YangMills.Surface.ManuscriptInputOfChoicesSummary

namespace MaleyLean

theorem YangMillsManuscriptInputOfChoicesSummaryTopExportStatement
  (O : YMManuscriptConcreteObjects)
  (W : YMManuscriptReadinessWitnesses O)
  (CC :
    YMConstructiveManuscriptChoices
      O.RC W.htrunc W.hext W.hcompat W.hunion)
  (VC : YMVacuumGapManuscriptChoices O.RD W.hww)
  (EC : YMEndpointManuscriptChoices O.RE W.hE W.hP) :
  let M := YangMillsManuscriptInputOfChoices O W CC VC EC
  M.S = O.S /\
  M.RC = O.RC /\
  M.RD = O.RD /\
  M.RE = O.RE /\
  ym_input_DeltaMax M = CC.DeltaMax /\
  ym_input_omega_bd M = CC.omega_bd /\
  ym_input_omega_sharp M = CC.omega_sharp /\
  ym_input_transport M = VC.transport /\
  ym_input_H M = VC.H /\
  ym_input_Hloc M = VC.Hloc /\
  ym_input_corr M = VC.corr /\
  ym_input_gapf M = VC.gapf /\
  ym_input_hgap_statement M /\
  ym_input_Omega_loc M = EC.Omega_loc /\
  ym_input_phi_star M = EC.phi_star /\
  ym_input_E_ren M = EC.E_ren := by
  exact YangMillsManuscriptInputOfChoicesSummaryStatement O W CC VC EC

end MaleyLean
