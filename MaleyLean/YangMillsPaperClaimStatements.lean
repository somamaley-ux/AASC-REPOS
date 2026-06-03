import MaleyLean.Papers.YangMills.Kernel.PaperClaimStatements

namespace MaleyLean

theorem YangMillsPaperClaimStatementsTopExportStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore) :
  ym_laneA_verbatim_claim_family /\
  ym_route1_verbatim_claim_family /\
  ym_endpoint_verbatim_claim_family /\
  (ym_paper_partC_statement RC ↔ ym_laneA_explicit_statement RC) /\
  (ym_paper_partD_statement RD ↔ ym_route1_explicit_statement RD) /\
  (ym_paper_endpoint_statement RE ↔ ym_endpoint_explicit_statement RE) := by
  exact And.intro
    YangMillsLaneAVerbatimClaimFamilyStatement <|
      And.intro YangMillsRoute1VerbatimClaimFamilyStatement <|
        And.intro YangMillsEndpointVerbatimClaimFamilyStatement <|
          And.intro (YangMillsLaneAPaperClaimIffExplicitStatement RC) <|
            And.intro (YangMillsRoute1PaperClaimIffExplicitStatement RD)
              (YangMillsEndpointPaperClaimIffExplicitStatement RE)

end MaleyLean
