import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptChoices

namespace MaleyLean

theorem YangMillsVacuumGapManuscriptChoicesSummaryStatement
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C : YMVacuumGapManuscriptChoices O.RD W.hww) :
  let K := YangMillsVacuumGapChosenSiteDataOfChoices W C
  K.tm = C.transport /\
  K.obs = C.H /\
  K.rsec = C.Hloc /\
  K.corr = C.corr /\
  K.gapf = C.gapf /\
  K.hgap = C.hgap := by
  exact YangMillsVacuumGapChoicesStatement W C

theorem YangMillsVacuumGapManuscriptChoicesBuilderSummaryStatement
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (transport :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).transport_map)
    (H :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).lattice_observable_family)
    (Hloc :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).reconstructed_sector)
    (corr :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).os_correlation_family)
    (gapf :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).minkowski_gap_functional)
    (hgap :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).evaluate_minkowski_gap
          gapf
          ((YangMillsVacuumGapSemanticBundleData
            RD hww).realize_os_sector Hloc corr)) :
  let C := YangMillsVacuumGapManuscriptChoicesData transport H Hloc corr gapf hgap
  C.transport = transport /\
  C.H = H /\
  C.Hloc = Hloc /\
  C.corr = corr /\
  C.gapf = gapf /\
  C.hgap = hgap := by
  exact
    YangMillsVacuumGapManuscriptChoicesBuilderStatement
      transport H Hloc corr gapf hgap

theorem YangMillsVacuumGapChosenInhabitantsSummaryStatement
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  ym_vacuum_transport_of C = C.transport /\
  ym_vacuum_H_of C = C.H /\
  ym_vacuum_Hloc_of C = C.Hloc /\
  ym_vacuum_corr_of C = C.corr /\
  ym_vacuum_gapf_of C = C.gapf /\
  ym_vacuum_hgap_of C = C.hgap := by
  exact YangMillsVacuumGapChosenInhabitantsStatement C

end MaleyLean
