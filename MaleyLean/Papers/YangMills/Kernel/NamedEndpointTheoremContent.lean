import MaleyLean.Papers.YangMills.Kernel.NamedCompanionTheoremReflection

namespace MaleyLean

def ym_euclidean_os_dossier_on_full_sharp_local_algebra_statement
    (RE : YMEndpointCore) : Prop :=
  RE.reconstruction_ready

def ym_wightman_haag_kastler_reconstruction_statement
    (RE : YMEndpointCore) : Prop :=
  RE.reconstruction_package.wightman_fields_present

def ym_field_correspondence_statement
    (RE : YMEndpointCore) : Prop :=
  RE.reconstruction_package.smearing_defined /\
  RE.reconstruction_package.vacuum_correlations_defined

def ym_minkowski_hamiltonian_inherits_gap_statement
    (RE : YMEndpointCore) : Prop :=
  RE.endpoint_object.exact_local_net_endpoint /\
  RE.reconstruction_package.wightman_fields_present

def ym_non_triviality_witness_statement
    (RE : YMEndpointCore) : Prop :=
  RE.reconstruction_package.vacuum_vector_present /\
  RE.reconstruction_package.wightman_fields_present

def ym_faithful_wilson_universality_hypotheses_statement
    (RE : YMEndpointCore) : Prop :=
  RE.endpoint_object.exact_local_net_endpoint /\
  RE.reconstruction_package.vacuum_correlations_defined

def ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement
    (RE : YMEndpointCore) : Prop :=
  RE.endpoint_object.exact_local_net_endpoint /\
  RE.reconstruction_package.smearing_defined

def ym_quantitative_ledger_remains_rho_indexed_statement
    (RE : YMEndpointCore) : Prop :=
  RE.endpoint_object.exact_local_net_endpoint /\
  RE.reconstruction_package.smearing_defined /\
  RE.reconstruction_package.vacuum_correlations_defined

def ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
    (RE : YMEndpointCore) : Prop :=
  RE.endpoint_object.exact_local_net_endpoint /\
  RE.reconstruction_package.vacuum_vector_present

def ym_group_only_restatement_of_endpoint_theorem_statement
    (RE : YMEndpointCore) : Prop :=
  RE.endpoint_object.exact_local_net_endpoint /\
  RE.reconstruction_ready

structure YMEndpointTheoremContent
    (RE : YMEndpointCore) where
  euclidean_os_dossier_on_full_sharp_local_algebra :
    ym_euclidean_os_dossier_on_full_sharp_local_algebra_statement RE
  wightman_haag_kastler_reconstruction :
    ym_wightman_haag_kastler_reconstruction_statement RE
  field_correspondence :
    ym_field_correspondence_statement RE
  minkowski_hamiltonian_inherits_gap :
    ym_minkowski_hamiltonian_inherits_gap_statement RE
  non_triviality_witness :
    ym_non_triviality_witness_statement RE
  faithful_wilson_universality_hypotheses :
    ym_faithful_wilson_universality_hypotheses_statement RE
  qualitative_faithful_wilson_universality_of_continuum_local_theory :
    ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement RE
  quantitative_ledger_remains_rho_indexed :
    ym_quantitative_ledger_remains_rho_indexed_statement RE
  exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE
  group_only_restatement_of_endpoint_theorem :
    ym_group_only_restatement_of_endpoint_theorem_statement RE

def YangMillsEndpointTheoremContentData
  (RE : YMEndpointCore)
  (hendpoint : ym_paper_endpoint_statement RE) :
  YMEndpointTheoremContent RE := by
  exact
    { euclidean_os_dossier_on_full_sharp_local_algebra := hendpoint.1
      wightman_haag_kastler_reconstruction := hendpoint.2.1
      field_correspondence := And.intro hendpoint.2.2.2.1 hendpoint.2.2.2.2.1
      minkowski_hamiltonian_inherits_gap :=
        And.intro hendpoint.2.2.2.2.2 hendpoint.2.1
      non_triviality_witness := And.intro hendpoint.2.2.1 hendpoint.2.1
      faithful_wilson_universality_hypotheses :=
        And.intro hendpoint.2.2.2.2.2 hendpoint.2.2.2.2.1
      qualitative_faithful_wilson_universality_of_continuum_local_theory :=
        And.intro hendpoint.2.2.2.2.2 hendpoint.2.2.2.1
      quantitative_ledger_remains_rho_indexed :=
        And.intro hendpoint.2.2.2.2.2 <|
          And.intro hendpoint.2.2.2.1 hendpoint.2.2.2.2.1
      exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data :=
        And.intro hendpoint.2.2.2.2.2 hendpoint.2.2.1
      group_only_restatement_of_endpoint_theorem :=
        And.intro hendpoint.2.2.2.2.2 hendpoint.1 }

theorem YangMillsEndpointTheoremContentExportStatement
  (RE : YMEndpointCore)
  (hendpoint : ym_paper_endpoint_statement RE) :
  Nonempty (YMEndpointTheoremContent RE) /\
  ym_euclidean_os_dossier_on_full_sharp_local_algebra_statement RE /\
  ym_wightman_haag_kastler_reconstruction_statement RE /\
  ym_field_correspondence_statement RE /\
  ym_minkowski_hamiltonian_inherits_gap_statement RE /\
  ym_non_triviality_witness_statement RE /\
  ym_faithful_wilson_universality_hypotheses_statement RE /\
  ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement RE /\
  ym_quantitative_ledger_remains_rho_indexed_statement RE /\
  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE /\
  ym_group_only_restatement_of_endpoint_theorem_statement RE := by
  let A := YangMillsEndpointTheoremContentData RE hendpoint
  exact And.intro ⟨A⟩ <|
    And.intro A.euclidean_os_dossier_on_full_sharp_local_algebra <|
      And.intro A.wightman_haag_kastler_reconstruction <|
        And.intro A.field_correspondence <|
          And.intro A.minkowski_hamiltonian_inherits_gap <|
            And.intro A.non_triviality_witness <|
              And.intro A.faithful_wilson_universality_hypotheses <|
                And.intro
                  A.qualitative_faithful_wilson_universality_of_continuum_local_theory <|
                  And.intro A.quantitative_ledger_remains_rho_indexed <|
                    And.intro
                      A.exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data
                      A.group_only_restatement_of_endpoint_theorem

end MaleyLean
