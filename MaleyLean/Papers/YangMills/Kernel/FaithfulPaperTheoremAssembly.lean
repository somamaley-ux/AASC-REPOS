import MaleyLean.Papers.YangMills.Kernel.ExplicitHeartStatementAssembly
import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpine
import MaleyLean.Papers.YangMills.Kernel.PaperClaimStatements

namespace MaleyLean

/--
Faithful top theorem-facing assembly that avoids the abstract theorem-part
landing layer and works directly with the explicit heart-level statements.
-/
structure YMFaithfulPaperTheoremAssembly
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  public_scope_witness : S.theorem_parts.partA_public_scope
  partC_statement_witness : ym_paper_partC_statement RC
  partD_statement_witness : ym_paper_partD_statement RD
  endpoint_statement_witness : ym_paper_endpoint_statement RE
  explicit_heart_assembly : YMExplicitHeartStatementAssembly RC RD RE

def YangMillsFaithfulPaperTheoremAssemblyData
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  YMFaithfulPaperTheoremAssembly S RC RD RE := by
  let A :=
    YangMillsExplicitHeartStatementAssemblyData
      RC RD RE htrunc hext hcompat hunion hww hE hP
  exact
    { public_scope_witness := hAroute hp1 hp2
      partC_statement_witness :=
        (YangMillsLaneAPaperClaimIffExplicitStatement RC).2 A.partC_explicit
      partD_statement_witness :=
        (YangMillsRoute1PaperClaimIffExplicitStatement RD).2 A.partD_explicit
      endpoint_statement_witness :=
        (YangMillsEndpointPaperClaimIffExplicitStatement RE).2
          A.endpoint_explicit
      explicit_heart_assembly := A }

theorem YangMillsFaithfulPaperTheoremAssemblyExistsStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMFaithfulPaperTheoremAssembly S RC RD RE) := by
  exact
    ⟨YangMillsFaithfulPaperTheoremAssemblyData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP⟩

theorem YangMillsFaithfulPaperTheoremAssemblyExportStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMFaithfulPaperTheoremAssembly S RC RD RE) /\
  S.theorem_parts.partA_public_scope /\
  ym_paper_partC_statement RC /\
  ym_paper_partD_statement RD /\
  ym_paper_endpoint_statement RE := by
  let A :=
    YangMillsFaithfulPaperTheoremAssemblyData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  exact
    And.intro ⟨A⟩ <|
      And.intro A.public_scope_witness <|
        And.intro A.partC_statement_witness <|
          And.intro A.partD_statement_witness A.endpoint_statement_witness

theorem YangMillsDirectPaperTheoremStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  ym_laneA_verbatim_claim_family /\
  ym_route1_verbatim_claim_family /\
  ym_endpoint_verbatim_claim_family /\
  S.theorem_parts.partA_public_scope /\
  ym_paper_partC_statement RC /\
  ym_paper_partD_statement RD /\
  ym_paper_endpoint_statement RE := by
  let A :=
    YangMillsFaithfulPaperTheoremAssemblyData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  exact And.intro
    YangMillsLaneAVerbatimClaimFamilyStatement <|
      And.intro YangMillsRoute1VerbatimClaimFamilyStatement <|
        And.intro YangMillsEndpointVerbatimClaimFamilyStatement <|
          And.intro A.public_scope_witness <|
            And.intro A.partC_statement_witness <|
              And.intro A.partD_statement_witness
                A.endpoint_statement_witness

end MaleyLean
