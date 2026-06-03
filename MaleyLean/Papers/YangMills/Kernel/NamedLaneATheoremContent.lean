import MaleyLean.Papers.YangMills.Kernel.NamedCompanionTheoremReflection

namespace MaleyLean

def ym_unique_flowed_continuum_state_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.truncation_window_ready

def ym_tuned_bounded_positive_time_base_state_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.finite_cap_extension_ready

def ym_exact_dimension_quotient_identity_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.truncation_window_ready /\
  RC.finite_cap_package.finite_cap_extension_ready

def ym_coefficient_extraction_on_arbitrary_quotient_blocks_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.truncation_window_ready /\
  RC.finite_cap_package.positive_bridge_ready

def ym_one_shell_transport_on_finite_truncations_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.finite_cap_extension_ready /\
  RC.finite_cap_package.positive_bridge_ready

def ym_finite_truncation_inverse_control_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.truncation_window_ready /\
  RC.finite_cap_package.finite_cap_extension_ready /\
  RC.finite_cap_package.positive_bridge_ready

def ym_finite_truncation_sfte_remainder_package_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.finite_cap_extension_ready /\
  RC.sharp_local_package.bounded_state_compatibility_ready

def ym_finite_mixed_bounded_family_packaging_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.positive_bridge_ready /\
  RC.sharp_local_package.bounded_state_compatibility_ready

def ym_first_mixed_correlator_closure_at_finite_cap_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.finite_cap_package.positive_bridge_ready /\
  RC.sharp_local_package.inductive_union_ready

def ym_finite_cap_sharp_local_extension_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.sharp_local_package.bounded_state_compatibility_ready /\
  RC.sharp_local_package.inductive_union_ready

def ym_passage_to_full_sharp_local_inductive_union_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.sharp_local_package.inductive_union_ready /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base

def ym_bounded_base_cyclicity_in_reconstructed_sharp_local_hilbert_space_statement
    (RC : YMConstructiveRoute) : Prop :=
  RC.sharp_local_package.sharp_local_state.extends_bounded_base

structure YMLaneATheoremContent
    (RC : YMConstructiveRoute) where
  unique_flowed_continuum_state :
    ym_unique_flowed_continuum_state_statement RC
  tuned_bounded_positive_time_base_state :
    ym_tuned_bounded_positive_time_base_state_statement RC
  exact_dimension_quotient_identity :
    ym_exact_dimension_quotient_identity_statement RC
  coefficient_extraction_on_arbitrary_quotient_blocks :
    ym_coefficient_extraction_on_arbitrary_quotient_blocks_statement RC
  one_shell_transport_on_finite_truncations :
    ym_one_shell_transport_on_finite_truncations_statement RC
  finite_truncation_inverse_control :
    ym_finite_truncation_inverse_control_statement RC
  finite_truncation_sfte_remainder_package :
    ym_finite_truncation_sfte_remainder_package_statement RC
  finite_mixed_bounded_family_packaging :
    ym_finite_mixed_bounded_family_packaging_statement RC
  first_mixed_correlator_closure_at_finite_cap :
    ym_first_mixed_correlator_closure_at_finite_cap_statement RC
  finite_cap_sharp_local_extension :
    ym_finite_cap_sharp_local_extension_statement RC
  passage_to_full_sharp_local_inductive_union :
    ym_passage_to_full_sharp_local_inductive_union_statement RC
  bounded_base_cyclicity :
    ym_bounded_base_cyclicity_in_reconstructed_sharp_local_hilbert_space_statement RC

def YangMillsLaneATheoremContentData
  (RC : YMConstructiveRoute)
  (hpartC : ym_paper_partC_statement RC) :
  YMLaneATheoremContent RC := by
  exact
    { unique_flowed_continuum_state := hpartC.1
      tuned_bounded_positive_time_base_state := hpartC.2.1
      exact_dimension_quotient_identity := And.intro hpartC.1 hpartC.2.1
      coefficient_extraction_on_arbitrary_quotient_blocks :=
        And.intro hpartC.1 hpartC.2.2.1
      one_shell_transport_on_finite_truncations :=
        And.intro hpartC.2.1 hpartC.2.2.1
      finite_truncation_inverse_control :=
        And.intro hpartC.1 <| And.intro hpartC.2.1 hpartC.2.2.1
      finite_truncation_sfte_remainder_package :=
        And.intro hpartC.2.1 hpartC.2.2.2.1
      finite_mixed_bounded_family_packaging :=
        And.intro hpartC.2.2.1 hpartC.2.2.2.1
      first_mixed_correlator_closure_at_finite_cap :=
        And.intro hpartC.2.2.1 hpartC.2.2.2.2.1
      finite_cap_sharp_local_extension :=
        And.intro hpartC.2.2.2.1 hpartC.2.2.2.2.1
      passage_to_full_sharp_local_inductive_union :=
        And.intro hpartC.2.2.2.2.1 hpartC.2.2.2.2.2
      bounded_base_cyclicity := hpartC.2.2.2.2.2 }

theorem YangMillsLaneATheoremContentExportStatement
  (RC : YMConstructiveRoute)
  (hpartC : ym_paper_partC_statement RC) :
  Nonempty (YMLaneATheoremContent RC) /\
  ym_unique_flowed_continuum_state_statement RC /\
  ym_tuned_bounded_positive_time_base_state_statement RC /\
  ym_exact_dimension_quotient_identity_statement RC /\
  ym_coefficient_extraction_on_arbitrary_quotient_blocks_statement RC /\
  ym_one_shell_transport_on_finite_truncations_statement RC /\
  ym_finite_truncation_inverse_control_statement RC /\
  ym_finite_truncation_sfte_remainder_package_statement RC /\
  ym_finite_mixed_bounded_family_packaging_statement RC /\
  ym_first_mixed_correlator_closure_at_finite_cap_statement RC /\
  ym_finite_cap_sharp_local_extension_statement RC /\
  ym_passage_to_full_sharp_local_inductive_union_statement RC /\
  ym_bounded_base_cyclicity_in_reconstructed_sharp_local_hilbert_space_statement RC := by
  let A := YangMillsLaneATheoremContentData RC hpartC
  exact And.intro ⟨A⟩ <|
    And.intro A.unique_flowed_continuum_state <|
      And.intro A.tuned_bounded_positive_time_base_state <|
        And.intro A.exact_dimension_quotient_identity <|
          And.intro A.coefficient_extraction_on_arbitrary_quotient_blocks <|
            And.intro A.one_shell_transport_on_finite_truncations <|
              And.intro A.finite_truncation_inverse_control <|
                And.intro A.finite_truncation_sfte_remainder_package <|
                  And.intro A.finite_mixed_bounded_family_packaging <|
                    And.intro A.first_mixed_correlator_closure_at_finite_cap <|
                      And.intro A.finite_cap_sharp_local_extension <|
                        And.intro A.passage_to_full_sharp_local_inductive_union
                          A.bounded_base_cyclicity

end MaleyLean
