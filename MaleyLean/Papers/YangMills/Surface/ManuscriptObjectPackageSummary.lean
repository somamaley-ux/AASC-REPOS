import MaleyLean.Papers.YangMills.Kernel.ManuscriptObjectPackage

namespace MaleyLean

theorem YangMillsManuscriptObjectPackageSummaryStatement
  (P : YMManuscriptObjectPackage) :
  let Q := P.toChoicePackage
  Q.objects.S = P.spine.toSpine /\
  Q.objects.RC = P.constructive.toConstructiveRoute /\
  Q.objects.RD = P.vacuum_gap.toVacuumGapRoute /\
  Q.objects.RE = P.endpoint.toEndpointCore /\
  ym_constructive_DeltaMax_of Q.constructive_choices = P.constructive.DeltaMax /\
  ym_vacuum_transport_of Q.vacuum_gap_choices = P.vacuum_gap.transport /\
  ym_endpoint_Omega_loc_of Q.endpoint_choices = P.endpoint.Omega_loc := by
  exact YangMillsManuscriptObjectPackageStatement P

end MaleyLean
