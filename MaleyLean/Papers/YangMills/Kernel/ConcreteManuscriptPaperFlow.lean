import MaleyLean.Papers.YangMills.Kernel.ManuscriptObjectPackageDeclarations
import MaleyLean.Papers.YangMills.Kernel.ClosedInstantiatedManuscript
import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptPaperFlow
import MaleyLean.Papers.YangMills.Kernel.VacuumManuscriptPaperFlow
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptPaperFlow

namespace MaleyLean

/--
Concrete paper-flow summary realized by the closed instantiated manuscript `I`.

This ties the manuscript-facing theorem spines for Lane A, Route 1 / QE3, and
the endpoint packet back to the actual closed manuscript object now present in
the repository.
-/
def ym_concrete_closed_manuscript_paper_flow_statement : Prop :=
  let M := I.blueprint.toFormalizedManuscript
  ym_constructive_laneA_theorem_flow_statement /\
  ym_vacuum_route1_theorem_flow_statement /\
  (ym_endpoint_M1_internal_input_statement /\
    ym_endpoint_M1_dossier_statement /\
    ym_endpoint_M3_reconstruction_statement /\
    ym_endpoint_M4_field_correspondence_statement /\
    ym_endpoint_O3_universality_statement /\
    ym_endpoint_O5_exact_local_net_endpoint_statement) /\
  ym_unique_flowed_continuum_state_statement M.RC /\
  ym_finite_cap_sharp_local_extension_statement M.RC /\
  ym_passage_to_full_sharp_local_inductive_union_statement M.RC /\
  ym_continuum_vacuum_gap_transport_statement M.RD /\
  ym_continuum_sharp_local_vacuum_gap_statement M.RD /\
  ym_euclidean_os_dossier_on_full_sharp_local_algebra_statement M.RE /\
  ym_wightman_haag_kastler_reconstruction_statement M.RE /\
  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement M.RE

theorem ym_concrete_closed_manuscript_paper_flow :
  ym_concrete_closed_manuscript_paper_flow_statement := by
  let M := I.blueprint.toFormalizedManuscript
  have hExport := YangMillsClosedInstantiatedManuscriptExportStatement I
  dsimp [ym_concrete_closed_manuscript_paper_flow_statement, M] at hExport ⊢
  rcases hExport with
    ⟨_, _, _, hLaneA1, _, _, _, _, _, _, _, _, hLaneA10, hLaneA11, _,
      _, _, _, _, _, _, _, _, hRoute1_9, hRoute1_10,
      hEnd1, hEnd2, _, _, _, _, _, _, hEnd9, _, _, _, _, _, _⟩
  refine And.intro ym_constructive_laneA_theorem_flow ?_
  refine And.intro ym_vacuum_route1_theorem_flow ?_
  refine And.intro ym_endpoint_manuscript_theorem_flow ?_
  refine And.intro hLaneA1 ?_
  refine And.intro hLaneA10 ?_
  refine And.intro hLaneA11 ?_
  refine And.intro hRoute1_9 ?_
  refine And.intro hRoute1_10 ?_
  refine And.intro hEnd1 ?_
  refine And.intro hEnd2 ?_
  exact hEnd9

end MaleyLean
