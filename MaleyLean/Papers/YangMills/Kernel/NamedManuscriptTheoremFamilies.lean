import MaleyLean.Papers.YangMills.Kernel.FaithfulPaperTheoremAssembly
import MaleyLean.Papers.YangMills.Kernel.PacketRegister
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register
import MaleyLean.Papers.YangMills.Verbatim.DependencySpineSimple

namespace MaleyLean

/--
Core-paper theorem layer: public scope plus the direct theorem content exported
by the repaired paper-facing theorem assembly.
-/
def ym_core_manuscript_theorem_statement
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) : Prop :=
  S.theorem_parts.partA_public_scope /\
    ym_paper_partC_statement RC /\
    ym_paper_partD_statement RD /\
    ym_paper_endpoint_statement RE

/--
Companion 1 theorem family: the Route 1 / QE3 transport spine together with
its repaired direct theorem content and packet/source anchoring.
-/
def ym_companion1_manuscript_theorem_statement
    (RD : YMVacuumGapRoute) : Prop :=
  ym_route1_transport_spine =
      [ .publicGroupScopeExport
      , .oneShotEntranceAtBoundedPhysicalScale
      , .tunedFullFixedLatticeOSGap
      , .sameScaleWilsonToPatchedTransport
      , .boundedWilsonDyadicOSLimitTheorem
      , .continuumTimeOSUpgradeOfBoundedBaseState
      , .continuumVacuumGapTransport
      , .continuumSharpLocalVacuumGap
      ] /\
    ym_route1_verbatim_claim_family /\
    ym_paper_partD_statement RD /\
    ym_packet_entries .packet8QE3Transport =
      [ .sameScaleWilsonToPatchedTransport
      , .boundedWilsonDyadicOSLimitTheorem
      , .continuumTimeOSUpgradeOfBoundedBaseState
      , .densityOfBoundedBaseAlgebra
      , .graphCoreApproximationAtQE3Seam
      , .continuumVacuumGapTransport
      , .continuumSharpLocalVacuumGap
      ] /\
    ym_packet_source_labels .packet8QE3Transport =
      ["III.18", "F.211", "F.212", "F.213", "F.214", "F.216", "F.5"]

/--
Companion 2 theorem family: the Lane A constructive spine together with its
repaired direct theorem content and packet/source anchoring.
-/
def ym_companion2_manuscript_theorem_statement
    (RC : YMConstructiveRoute) : Prop :=
  ym_laneA_spine =
      [ .uniqueFlowedContinuumState
      , .exactDimensionQuotientIdentity
      , .coefficientExtractionOnArbitraryQuotientBlocks
      , .oneShellTransportOnFiniteTruncations
      , .finiteTruncationInverseControl
      , .finiteMixedBoundedFamilyPackaging
      , .firstMixedCorrelatorClosureAtFiniteCap
      , .finiteCapSharpLocalExtension
      , .passageToFullSharpLocalInductiveUnion
      , .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace
      ] /\
    (ym_verbatim_theorem_owner .uniqueFlowedContinuumState =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .exactDimensionQuotientIdentity =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .coefficientExtractionOnArbitraryQuotientBlocks =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .oneShellTransportOnFiniteTruncations =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .finiteTruncationInverseControl =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .finiteMixedBoundedFamilyPackaging =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .firstMixedCorrelatorClosureAtFiniteCap =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .finiteCapSharpLocalExtension =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner .passageToFullSharpLocalInductiveUnion =
        .laneASharpLocalConstruction /\
      ym_verbatim_theorem_owner
          .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace =
        .laneASharpLocalConstruction) /\
    ym_laneA_verbatim_claim_family /\
    ym_paper_partC_statement RC /\
    ym_packet_source_labels .packet5FiniteTruncation =
      ["L.8", "L.11", "5.39", "5.69", "F.245"] /\
    ym_packet_source_labels .packet6FiniteCapClosure =
      ["F.330A", "F.331", "5.74A", "5.74", "5.75", "5.76"] /\
    ym_packet_source_labels .packet7Cyclicity = ["5.77"]

/--
Companion 3 theorem family: the endpoint spine together with its repaired
direct theorem content and packet/source anchoring.
-/
def ym_companion3_manuscript_theorem_statement
    (RE : YMEndpointCore) : Prop :=
  ym_endpoint_spine =
      [ .euclideanOSDossierOnFullSharpLocalAlgebra
      , .wightmanHaagKastlerReconstruction
      , .fieldCorrespondence
      , .minkowskiHamiltonianInheritsGap
      , .nonTrivialityWitness
      , .faithfulWilsonUniversalityHypotheses
      , .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory
      , .quantitativeLedgerRemainsRhoIndexed
      , .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData
      , .groupOnlyRestatementOfEndpointTheorem
      ] /\
    (ym_verbatim_theorem_owner .euclideanOSDossierOnFullSharpLocalAlgebra =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner .wightmanHaagKastlerReconstruction =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner .fieldCorrespondence =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner .minkowskiHamiltonianInheritsGap =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner .nonTrivialityWitness =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner .faithfulWilsonUniversalityHypotheses =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner
          .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner .quantitativeLedgerRemainsRhoIndexed =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner
          .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData =
        .reconstructionAndUniversality /\
      ym_verbatim_theorem_owner .groupOnlyRestatementOfEndpointTheorem =
        .reconstructionAndUniversality) /\
    ym_endpoint_verbatim_claim_family /\
    ym_paper_endpoint_statement RE /\
    ym_packet_source_labels .packet9Reconstruction =
      ["M.1", "M.2", "M.3", "M.4", "M.5", "M.6"] /\
    ym_packet_source_labels .packet10Endpoint =
      ["O.2", "O.3", "O.4", "O.5", "O.7"]

structure YMNamedManuscriptTheoremFamilies
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  core_statement : ym_core_manuscript_theorem_statement S RC RD RE
  companion1_statement : ym_companion1_manuscript_theorem_statement RD
  companion2_statement : ym_companion2_manuscript_theorem_statement RC
  companion3_statement : ym_companion3_manuscript_theorem_statement RE

def YangMillsNamedManuscriptTheoremFamiliesData
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
  YMNamedManuscriptTheoremFamilies S RC RD RE := by
  have hdirect :=
    YangMillsDirectPaperTheoremStatement
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  exact
    { core_statement :=
        And.intro hdirect.2.2.2.1 <|
          And.intro hdirect.2.2.2.2.1 <|
            And.intro hdirect.2.2.2.2.2.1 hdirect.2.2.2.2.2.2
      companion1_statement :=
        And.intro YangMillsRoute1TransportSpineStatement <|
          And.intro hdirect.2.1 <|
            And.intro hdirect.2.2.2.2.2.1 <|
              And.intro YangMillsPacket8ContainsQE3SeamStatement rfl
      companion2_statement :=
        And.intro rfl <|
          And.intro YangMillsLaneASpineOwnershipStatement <|
            And.intro hdirect.1 <|
              And.intro hdirect.2.2.2.2.1 <|
                And.intro rfl <|
                  And.intro rfl rfl
      companion3_statement :=
        And.intro rfl <|
          And.intro YangMillsEndpointSpineOwnershipStatement <|
            And.intro hdirect.2.2.1 <|
              And.intro hdirect.2.2.2.2.2.2 <|
                And.intro rfl rfl }

theorem YangMillsNamedManuscriptTheoremFamiliesExportStatement
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
  Nonempty (YMNamedManuscriptTheoremFamilies S RC RD RE) /\
  ym_core_manuscript_theorem_statement S RC RD RE /\
  ym_companion1_manuscript_theorem_statement RD /\
  ym_companion2_manuscript_theorem_statement RC /\
  ym_companion3_manuscript_theorem_statement RE := by
  let A :=
    YangMillsNamedManuscriptTheoremFamiliesData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  exact And.intro ⟨A⟩ <|
    And.intro A.core_statement <|
      And.intro A.companion1_statement <|
        And.intro A.companion2_statement A.companion3_statement

end MaleyLean
