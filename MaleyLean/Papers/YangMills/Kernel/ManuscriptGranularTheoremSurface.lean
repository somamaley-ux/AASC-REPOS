import MaleyLean.Papers.YangMills.Kernel.NamedCoreTheoremReflection
import MaleyLean.Papers.YangMills.Kernel.NamedLaneATheoremContent
import MaleyLean.Papers.YangMills.Kernel.NamedRoute1TheoremContent
import MaleyLean.Papers.YangMills.Kernel.NamedEndpointTheoremContent

namespace MaleyLean

/--
Granular manuscript-facing theorem surface: core theorem reflection together
with per-entry theorem-content bundles for the three live companion families.
-/
structure YMManuscriptGranularTheoremSurface
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  core_reflection : ym_core_named_theorem_reflection S RC RD RE
  laneA_content : YMLaneATheoremContent RC
  route1_content : YMRoute1TheoremContent RD
  endpoint_content : YMEndpointTheoremContent RE

def YangMillsManuscriptGranularTheoremSurfaceData
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
  YMManuscriptGranularTheoremSurface S RC RD RE := by
  have hdirect :=
    YangMillsDirectPaperTheoremStatement
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  exact
    { core_reflection :=
        (YangMillsNamedCoreTheoremReflectionData
          S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP).core_reflection
      laneA_content := YangMillsLaneATheoremContentData RC hdirect.2.2.2.2.1
      route1_content := YangMillsRoute1TheoremContentData RD hdirect.2.2.2.2.2.1
      endpoint_content := YangMillsEndpointTheoremContentData RE hdirect.2.2.2.2.2.2 }

theorem YangMillsManuscriptGranularTheoremSurfaceExportStatement
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
  Nonempty (YMManuscriptGranularTheoremSurface S RC RD RE) /\
  ym_core_named_theorem_reflection S RC RD RE /\
  YMLaneATheoremContent RC /\
  YMRoute1TheoremContent RD /\
  YMEndpointTheoremContent RE := by
  let A :=
    YangMillsManuscriptGranularTheoremSurfaceData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  exact And.intro ⟨A⟩ <|
    And.intro A.core_reflection <|
      And.intro A.laneA_content <|
        And.intro A.route1_content A.endpoint_content

end MaleyLean
