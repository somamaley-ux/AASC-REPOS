import MaleyLean.Papers.YangMills.Kernel.ManuscriptInputOfChoices

namespace MaleyLean

/--
Single final authoring package for a fully closed manuscript instantiation.

An inhabitant of this structure is exactly the remaining author work needed to
define the bundled manuscript input and then the closed manuscript constant.
-/
structure YMManuscriptChoicePackage where
  objects : YMManuscriptConcreteObjects
  witnesses : YMManuscriptReadinessWitnesses objects
  constructive_choices :
    YMConstructiveManuscriptChoices
      objects.RC
      witnesses.htrunc
      witnesses.hext
      witnesses.hcompat
      witnesses.hunion
  vacuum_gap_choices :
    YMVacuumGapManuscriptChoices
      objects.RD
      witnesses.hww
  endpoint_choices :
    YMEndpointManuscriptChoices
      objects.RE
      witnesses.hE
      witnesses.hP

def YMManuscriptChoicePackage.toInput
  (P : YMManuscriptChoicePackage) :
  YMClosedInstantiatedManuscriptInput :=
  YangMillsManuscriptInputOfChoices
    P.objects
    P.witnesses
    P.constructive_choices
    P.vacuum_gap_choices
    P.endpoint_choices

def YMManuscriptChoicePackage.toClosedInstantiatedManuscript
  (P : YMManuscriptChoicePackage) :
  YMClosedInstantiatedManuscript :=
  YangMillsClosedInstantiatedManuscriptOfInput P.toInput

theorem YangMillsManuscriptChoicePackageStatement
  (P : YMManuscriptChoicePackage) :
  let M := P.toInput
  let I := P.toClosedInstantiatedManuscript
  M.S = P.objects.S /\
  M.RC = P.objects.RC /\
  M.RD = P.objects.RD /\
  M.RE = P.objects.RE /\
  ym_input_DeltaMax M = P.constructive_choices.DeltaMax /\
  ym_input_omega_bd M = P.constructive_choices.omega_bd /\
  ym_input_omega_sharp M = P.constructive_choices.omega_sharp /\
  ym_input_transport M = P.vacuum_gap_choices.transport /\
  ym_input_H M = P.vacuum_gap_choices.H /\
  ym_input_Hloc M = P.vacuum_gap_choices.Hloc /\
  ym_input_corr M = P.vacuum_gap_choices.corr /\
  ym_input_gapf M = P.vacuum_gap_choices.gapf /\
  ym_input_hgap_statement M /\
  ym_input_Omega_loc M = P.endpoint_choices.Omega_loc /\
  ym_input_phi_star M = P.endpoint_choices.phi_star /\
  ym_input_E_ren M = P.endpoint_choices.E_ren /\
  ym_DeltaMax I = P.constructive_choices.DeltaMax /\
  ym_omega_bd I = P.constructive_choices.omega_bd /\
  ym_omega_sharp I = P.constructive_choices.omega_sharp /\
  ym_transport I = P.vacuum_gap_choices.transport /\
  ym_H I = P.vacuum_gap_choices.H /\
  ym_Hloc I = P.vacuum_gap_choices.Hloc /\
  ym_corr I = P.vacuum_gap_choices.corr /\
  ym_gapf I = P.vacuum_gap_choices.gapf /\
  ym_hgap_statement I /\
  ym_Omega_loc I = P.endpoint_choices.Omega_loc /\
  ym_phi_star I = P.endpoint_choices.phi_star /\
  ym_E_ren I = P.endpoint_choices.E_ren := by
  dsimp [YMManuscriptChoicePackage.toInput, YMManuscriptChoicePackage.toClosedInstantiatedManuscript]
  have hInput :=
    YangMillsManuscriptInputOfChoicesStatement
      P.objects
      P.witnesses
      P.constructive_choices
      P.vacuum_gap_choices
      P.endpoint_choices
  have hClosed :=
    YangMillsClosedInstantiatedManuscriptOfInputStatement
      (YangMillsManuscriptInputOfChoices
        P.objects
        P.witnesses
        P.constructive_choices
        P.vacuum_gap_choices
        P.endpoint_choices)
  rcases hInput with
    ⟨hMS, hMRC, hMRD, hMRE, hDelta, homegaBd, homegaSharp,
      hTransport, hH, hHloc, hCorr, hGapf, hHgap,
      hOmega, hPhi, hEren⟩
  rcases hClosed with
    ⟨hIDelta, hIomegaBd, hIomegaSharp, hITransport, hIH, hIHloc, hICorr,
      hIGapf, hIHgap, hIOmega, hIPhi, hIEren⟩
  exact
    ⟨hMS, hMRC, hMRD, hMRE, hDelta, homegaBd, homegaSharp,
      hTransport, hH, hHloc, hCorr, hGapf, hHgap,
      hOmega, hPhi, hEren, hIDelta, hIomegaBd, hIomegaSharp,
      hITransport, hIH, hIHloc, hICorr, hIGapf, hIHgap,
      hIOmega, hIPhi, hIEren⟩

end MaleyLean
