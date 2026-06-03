import MaleyLean.Papers.YangMills.Surface.ChosenSiteBlueprintSummary

namespace MaleyLean

theorem YangMillsChosenSiteBlueprintSummaryTopExportStatement
  (B : YMClosedManuscriptBlueprint)
  (C : YMChosenSiteBlueprint B) :
  let M := B.toFormalizedManuscript
  Nonempty (YMConstructiveRelationalInterface M.RC) /\
  Nonempty (YMConstructiveExtendAssembleLawPackage M.RC) /\
  Nonempty (YMVacuumGapRelationalInterface M.RD) /\
  Nonempty (YMVacuumGapTransportRealizeLawPackage M.RD) /\
  Nonempty (YMEndpointRelationalInterface M.RE) /\
  Nonempty (YMEndpointCorrelationLawPackage M.RE) := by
  exact YangMillsChosenSiteBlueprintSummaryStatement B C

end MaleyLean
