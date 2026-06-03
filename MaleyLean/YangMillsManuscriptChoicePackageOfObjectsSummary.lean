import MaleyLean.Papers.YangMills.Surface.ManuscriptChoicePackageOfObjectsSummary

namespace MaleyLean

theorem YangMillsManuscriptChoicePackageOfObjectsSummaryTopExportStatement
  (SO : YMLoadBearingSpineManuscriptObject)
  (CO : YMConstructiveManuscriptObject)
  (VO : YMVacuumGapManuscriptObject)
  (EO : YMEndpointManuscriptObject) :
  let P := YangMillsManuscriptChoicePackageOfObjects SO CO VO EO
  P.objects.S = SO.toSpine /\
  P.objects.RC = CO.toConstructiveRoute /\
  P.objects.RD = VO.toVacuumGapRoute /\
  P.objects.RE = EO.toEndpointCore /\
  P.witnesses.hp1 = SO.hp1 /\
  P.witnesses.hp2 = SO.hp2 /\
  P.witnesses.hAroute = SO.hAroute /\
  P.witnesses.htrunc = CO.htrunc /\
  P.witnesses.hext = CO.hext /\
  P.witnesses.hcompat = CO.hcompat /\
  P.witnesses.hunion = CO.hunion /\
  P.witnesses.hww = VO.hww /\
  P.witnesses.hE = EO.hE /\
  P.witnesses.hP = EO.hP /\
  ym_constructive_DeltaMax_of P.constructive_choices = CO.DeltaMax /\
  ym_vacuum_transport_of P.vacuum_gap_choices = VO.transport /\
  ym_endpoint_Omega_loc_of P.endpoint_choices = EO.Omega_loc := by
  exact YangMillsManuscriptChoicePackageOfObjectsSummaryStatement SO CO VO EO

end MaleyLean
