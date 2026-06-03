import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptChoices
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptChoices
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptChoices
import MaleyLean.Papers.YangMills.Kernel.ManuscriptInputNamedObjects

namespace MaleyLean

/--
Build the final bundled manuscript input from:

- the concrete manuscript route objects,
- their readiness witnesses,
- the constructive manuscript choices,
- the vacuum-gap manuscript choices,
- and the endpoint manuscript choices.

This is the final exact assembly site before the closed manuscript constant
itself.
-/
def YangMillsManuscriptInputOfChoices
  (O : YMManuscriptConcreteObjects)
  (W : YMManuscriptReadinessWitnesses O)
  (CC :
    YMConstructiveManuscriptChoices
      O.RC W.htrunc W.hext W.hcompat W.hunion)
  (VC : YMVacuumGapManuscriptChoices O.RD W.hww)
  (EC : YMEndpointManuscriptChoices O.RE W.hE W.hP) :
  YMClosedInstantiatedManuscriptInput :=
  { S := O.S
    RC := O.RC
    RD := O.RD
    RE := O.RE
    hp1 := W.hp1
    hp2 := W.hp2
    hAroute := W.hAroute
    htrunc := W.htrunc
    hext := W.hext
    hcompat := W.hcompat
    hunion := W.hunion
    hww := W.hww
    hE := W.hE
    hP := W.hP
    win := CC.DeltaMax
    bridge := CC.finite_cap_bridge
    base := CC.bounded_base_one
    state := CC.omega_bd
    unionData := CC.omega_sharp
    tm := VC.transport
    obs := VC.H
    rsec := VC.Hloc
    corr := VC.corr
    gapf := VC.gapf
    hgap := VC.hgap
    vac := EC.Omega_loc
    testFn := EC.phi_star
    field := EC.E_ren }

theorem YangMillsManuscriptInputOfChoicesStatement
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
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl <|
                    And.intro rfl <|
                      And.intro rfl <|
                        And.intro rfl <|
                          And.intro rfl <|
                            And.intro VC.hgap <|
                              And.intro rfl <|
                                And.intro rfl rfl

end MaleyLean
