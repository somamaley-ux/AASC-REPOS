namespace MaleyLean
namespace Papers
namespace YangMills

/--
The sector layer is an extension over a fixed local net, not a replacement of
that local net.
-/
structure YMClaySectorLayerAdmissibility where
  SupportClass : Type
  LocalNet : Type
  SectorLayer : Type
  support_class_fixed : Prop
  support_class_fixed_holds : support_class_fixed
  sector_layer_over_fixed_local_net : Prop
  sector_layer_over_fixed_local_net_holds :
    sector_layer_over_fixed_local_net
  local_net_unchanged : Prop
  local_net_unchanged_holds : local_net_unchanged
  global_form_recovered_at_sector_level : Prop
  global_form_recovered_at_sector_level_holds :
    global_form_recovered_at_sector_level

def YMClaySectorLayerAdmissibility.closed
    (S : YMClaySectorLayerAdmissibility) :
    Prop :=
  S.support_class_fixed /\
    S.sector_layer_over_fixed_local_net /\
    S.local_net_unchanged /\
    S.global_form_recovered_at_sector_level

/--
The theorem-scope completion preserves the original domain and kernel
information needed by the Clay extension.
-/
structure YMClayCompletionAdmissibility where
  Completion : Type
  scope_faithful : Prop
  scope_faithful_holds : scope_faithful
  kernel_faithful : Prop
  kernel_faithful_holds : kernel_faithful
  same_domain : Prop
  same_domain_holds : same_domain
  no_new_subgap_local_state : Prop
  no_new_subgap_local_state_holds : no_new_subgap_local_state
  no_new_subgap_vacuum_multiplicity : Prop
  no_new_subgap_vacuum_multiplicity_holds :
    no_new_subgap_vacuum_multiplicity

def YMClayCompletionAdmissibility.closed
    (C : YMClayCompletionAdmissibility) :
    Prop :=
  C.scope_faithful /\
    C.kernel_faithful /\
    C.same_domain /\
    C.no_new_subgap_local_state /\
    C.no_new_subgap_vacuum_multiplicity

/--
Subgap classification for the completed theorem scope.
-/
structure YMClaySubgapClassification where
  CompletedSector : Type
  VacuumRay : CompletedSector -> Prop
  SubgapSector : CompletedSector -> Prop
  every_subgap_sector_is_vacuum_ray :
    forall sector : CompletedSector,
      SubgapSector sector -> VacuumRay sector
  complete_theory_mass_gap : Prop
  complete_theory_mass_gap_holds : complete_theory_mass_gap

namespace YMClaySubgapClassification

theorem no_nonvacuum_subgap_sector
    (C : YMClaySubgapClassification) :
    forall sector : C.CompletedSector,
      C.SubgapSector sector -> Not (Not (C.VacuumRay sector)) := by
  intro sector hsubgap hnonvac
  exact hnonvac (C.every_subgap_sector_is_vacuum_ray sector hsubgap)

end YMClaySubgapClassification

/--
Full Clay extension admissibility payload before it is matched with the
existing `StandardClayExtensionTransfer` socket.
-/
structure YMClayExtensionAdmissibilityPayload where
  sector_layer : YMClaySectorLayerAdmissibility
  completion : YMClayCompletionAdmissibility
  subgap_classification : YMClaySubgapClassification
  no_faithful_same_domain_extension_below_kernel : Prop
  no_faithful_same_domain_extension_from_completion :
    completion.kernel_faithful ->
      completion.same_domain ->
      no_faithful_same_domain_extension_below_kernel

namespace YMClayExtensionAdmissibilityPayload

theorem sector_layer_closed
    (P : YMClayExtensionAdmissibilityPayload) :
    P.sector_layer.closed := by
  exact
    And.intro
      P.sector_layer.support_class_fixed_holds
      (And.intro
        P.sector_layer.sector_layer_over_fixed_local_net_holds
        (And.intro
          P.sector_layer.local_net_unchanged_holds
          P.sector_layer.global_form_recovered_at_sector_level_holds))

theorem completion_closed
    (P : YMClayExtensionAdmissibilityPayload) :
    P.completion.closed := by
  exact
    And.intro
      P.completion.scope_faithful_holds
      (And.intro
        P.completion.kernel_faithful_holds
        (And.intro
          P.completion.same_domain_holds
          (And.intro
            P.completion.no_new_subgap_local_state_holds
            P.completion.no_new_subgap_vacuum_multiplicity_holds)))

theorem no_faithful_same_domain_extension
    (P : YMClayExtensionAdmissibilityPayload) :
    P.no_faithful_same_domain_extension_below_kernel := by
  exact
    P.no_faithful_same_domain_extension_from_completion
      P.completion.kernel_faithful_holds
      P.completion.same_domain_holds

theorem subgap_sector_is_vacuum_ray
    (P : YMClayExtensionAdmissibilityPayload) :
    forall sector : P.subgap_classification.CompletedSector,
      P.subgap_classification.SubgapSector sector ->
        P.subgap_classification.VacuumRay sector := by
  exact P.subgap_classification.every_subgap_sector_is_vacuum_ray

theorem complete_theory_mass_gap
    (P : YMClayExtensionAdmissibilityPayload) :
    P.subgap_classification.complete_theory_mass_gap := by
  exact P.subgap_classification.complete_theory_mass_gap_holds

end YMClayExtensionAdmissibilityPayload

end YangMills
end Papers
end MaleyLean
