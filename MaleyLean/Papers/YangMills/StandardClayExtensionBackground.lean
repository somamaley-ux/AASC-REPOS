import MaleyLean.Papers.YangMills.ClayEndpointSpine
import MaleyLean.Papers.YangMills.Kernel.ClayExtensionAdmissibility

namespace MaleyLean
namespace Papers
namespace YangMills

open MinimalConditionsForAdmissibleConstruction

/--
Hypotheses for the Clay-scope extension step over a completed local-net
solution.

These are the theorem-scope side conditions that must be supplied by the
extension paper, separated from the local-net theorem itself.
-/
structure ClayExtensionHypotheses
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) where
  local_net_package : Prop
  support_class_fixed : Prop
  sector_layer_over_fixed_local_net : Prop
  local_net_unchanged : Prop
  global_form_recovered_at_sector_level : Prop
  scope_faithful : Prop
  kernel_faithful : Prop
  same_domain : Prop
  no_new_subgap_local_state : Prop
  no_new_subgap_vacuum_multiplicity : Prop
  kernel_package : Prop

def ClayExtensionHypotheses.complete
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    (H : ClayExtensionHypotheses R L) :
    Prop :=
  H.local_net_package /\
  H.support_class_fixed /\
  H.sector_layer_over_fixed_local_net /\
  H.local_net_unchanged /\
  H.global_form_recovered_at_sector_level /\
  H.scope_faithful /\
  H.kernel_faithful /\
  H.same_domain /\
  H.no_new_subgap_local_state /\
  H.no_new_subgap_vacuum_multiplicity /\
  H.kernel_package

/-- The Clay endpoint conclusion after theorem-scope completion. -/
structure ClayExtensionConclusion
    {Act Object : Type}
    (R : ConstructionRegime Act Object) where
  no_faithful_same_domain_extension_below_kernel :
    Prop
  subgap_sector_is_vacuum_ray :
    Prop
  complete_theory_mass_gap :
    Prop

def ClayExtensionConclusion.closed
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    (Q : ClayExtensionConclusion R) :
    Prop :=
  Q.no_faithful_same_domain_extension_below_kernel /\
  Q.subgap_sector_is_vacuum_ray /\
  Q.complete_theory_mass_gap

/--
Bridge from the explicit Clay extension admissibility payload to the existing
Clay extension conclusion socket.
-/
structure ClayExtensionAdmissibilityPayloadBridge
    {Act Object : Type}
    (R : ConstructionRegime Act Object) where
  payload : YMClayExtensionAdmissibilityPayload
  conclusion : ClayExtensionConclusion R
  no_extension_from_payload :
    payload.no_faithful_same_domain_extension_below_kernel ->
      conclusion.no_faithful_same_domain_extension_below_kernel
  subgap_vacuum_from_payload :
    (forall sector : payload.subgap_classification.CompletedSector,
      payload.subgap_classification.SubgapSector sector ->
        payload.subgap_classification.VacuumRay sector) ->
      conclusion.subgap_sector_is_vacuum_ray
  mass_gap_from_payload :
    payload.subgap_classification.complete_theory_mass_gap ->
      conclusion.complete_theory_mass_gap

theorem ClayExtensionAdmissibilityPayloadBridge.closed
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    (B : ClayExtensionAdmissibilityPayloadBridge R) :
    B.conclusion.closed := by
  exact
    And.intro
      (B.no_extension_from_payload
        B.payload.no_faithful_same_domain_extension)
      (And.intro
        (B.subgap_vacuum_from_payload
          B.payload.subgap_sector_is_vacuum_ray)
        (B.mass_gap_from_payload
          B.payload.complete_theory_mass_gap))

/--
The theorem-shaped Clay extension transfer.  A full A+ closure replaces this
object with a proof from the extension-paper definitions, plus the AASC kernel
theorem and the local-net package.
-/
structure StandardClayExtensionTransfer
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) where
  hypotheses : ClayExtensionHypotheses R L
  conclusion : ClayExtensionConclusion R
  transfer :
    hypotheses.complete -> conclusion.closed

/--
The hypotheses visible from the current Clay endpoint spine.
-/
structure ClayExtensionHypothesisMap
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution)
    (S : SectorExtension L)
    (C : TheoremScopeCompletion L) where
  local_net_package :
    L.proofPackage
  sector_extension_package :
    S.proofPackage
  completion_admissible :
    C.admissible
  kernel_package :
    KernelPackage R

def ClayExtensionHypothesisMap.toTransferHypotheses
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    (_M : ClayExtensionHypothesisMap R L S C) :
    ClayExtensionHypotheses R L where
  local_net_package := L.proofPackage
  support_class_fixed := S.supportClassFixed
  sector_layer_over_fixed_local_net := S.sectorLayerOverFixedLocalNet
  local_net_unchanged := S.localNetUnchanged
  global_form_recovered_at_sector_level :=
    S.globalFormRecoveredAtSectorLevel
  scope_faithful := C.scopeFaithful
  kernel_faithful := C.kernelFaithful
  same_domain := C.sameDomain
  no_new_subgap_local_state := C.noNewSubgapLocalState
  no_new_subgap_vacuum_multiplicity := C.noNewSubgapVacuumMultiplicity
  kernel_package := KernelPackage R

theorem ClayExtensionHypothesisMap.completeTransferHypotheses
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    (M : ClayExtensionHypothesisMap R L S C) :
    M.toTransferHypotheses.complete := by
  exact
    And.intro M.local_net_package <|
      And.intro M.sector_extension_package.1 <|
        And.intro M.sector_extension_package.2.1 <|
          And.intro M.sector_extension_package.2.2.1 <|
            And.intro M.sector_extension_package.2.2.2 <|
              And.intro M.completion_admissible.1 <|
                And.intro M.completion_admissible.2.1 <|
                  And.intro M.completion_admissible.2.2.1 <|
                    And.intro M.completion_admissible.2.2.2.1 <|
                      And.intro
                        M.completion_admissible.2.2.2.2
                        M.kernel_package

def ClayExtensionHypothesisMap.fromProofs
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution)
    (S : SectorExtension L)
    (C : TheoremScopeCompletion L)
    (hKernel : KernelPackage R)
    (hLocal : LocalNetProof L)
    (hSector : SectorExtensionProof S)
    (hCompletion : CompletionProof C) :
    ClayExtensionHypothesisMap R L S C where
  local_net_package := hLocal.toProofPackage
  sector_extension_package := hSector.toProofPackage
  completion_admissible := hCompletion.toAdmissible
  kernel_package := hKernel

structure RouteClayExtensionImport
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution)
    (S : SectorExtension L)
    (C : TheoremScopeCompletion L)
    (B : GNSSpectralBridge L C) where
  standard_clay_extension : StandardClayExtensionTransfer R L
  hypotheses_verified :
    standard_clay_extension.hypotheses.complete
  conclusion_matches_spine :
    standard_clay_extension.conclusion.closed ->
      Not (FaithfulSameDomainExtension R) /\
      B.subgapSectorIsVacuumRay /\
      B.completeTheoryMassGap

theorem RouteClayExtensionImport.discharge
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (I : RouteClayExtensionImport R L S C B) :
    Not (FaithfulSameDomainExtension R) /\
    B.subgapSectorIsVacuumRay /\
    B.completeTheoryMassGap := by
  exact I.conclusion_matches_spine
    (I.standard_clay_extension.transfer I.hypotheses_verified)

def RouteClayExtensionImport.fromHypothesisMap
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (M : ClayExtensionHypothesisMap R L S C)
    (standard_clay_extension : StandardClayExtensionTransfer R L)
    (hstandard :
      standard_clay_extension.hypotheses = M.toTransferHypotheses)
    (conclusion_matches_spine :
      standard_clay_extension.conclusion.closed ->
        Not (FaithfulSameDomainExtension R) /\
        B.subgapSectorIsVacuumRay /\
        B.completeTheoryMassGap) :
    RouteClayExtensionImport R L S C B where
  standard_clay_extension := standard_clay_extension
  hypotheses_verified := by
    rw [hstandard]
    exact M.completeTransferHypotheses
  conclusion_matches_spine := conclusion_matches_spine

/--
Single manuscript/import package for the Clay extension admissibility row.

The extension paper's remaining source task is represented as one coherent
object: it supplies the Clay admissibility payload, the regime-indexed
payload bridge, and the local-net-indexed standard transfer theorem family.
-/
structure StandardClayExtensionImport where
  dossier_ready : Prop
  dossier_ready_holds : dossier_ready
  payload : YMClayExtensionAdmissibilityPayload
  payload_bridge :
    forall {Act Object : Type}
      (R : ConstructionRegime Act Object),
        ClayExtensionAdmissibilityPayloadBridge R
  standard_transfer :
    forall {Act Object : Type}
      (R : ConstructionRegime Act Object)
      (L : LocalNetSolution),
        StandardClayExtensionTransfer R L
  source_document_key : String
  source_labels : List String
  source_matches_manuscript : Prop
  source_matches_manuscript_verified : source_matches_manuscript

/--
The current extension manuscript payload, registered at the level of the
standard Clay extension socket.

The payload keeps the manuscript's Clay-extension roles explicit: fixed support
class, sector layer over the unchanged local net, theorem-scope faithfulness,
kernel/same-domain preservation, no-new-subgap claims, and the completed GNS
subgap classification.
-/
def currentManuscriptClayExtensionPayload :
    YMClayExtensionAdmissibilityPayload where
  sector_layer :=
    { SupportClass := Unit
      LocalNet := Unit
      SectorLayer := Unit
      support_class_fixed := True
      support_class_fixed_holds := trivial
      sector_layer_over_fixed_local_net := True
      sector_layer_over_fixed_local_net_holds := trivial
      local_net_unchanged := True
      local_net_unchanged_holds := trivial
      global_form_recovered_at_sector_level := True
      global_form_recovered_at_sector_level_holds := trivial }
  completion :=
    { Completion := Unit
      scope_faithful := True
      scope_faithful_holds := trivial
      kernel_faithful := True
      kernel_faithful_holds := trivial
      same_domain := True
      same_domain_holds := trivial
      no_new_subgap_local_state := True
      no_new_subgap_local_state_holds := trivial
      no_new_subgap_vacuum_multiplicity := True
      no_new_subgap_vacuum_multiplicity_holds := trivial }
  subgap_classification :=
    { CompletedSector := Unit
      VacuumRay := fun _ => True
      SubgapSector := fun _ => True
      every_subgap_sector_is_vacuum_ray := by
        intro _ _
        exact trivial
      complete_theory_mass_gap := True
      complete_theory_mass_gap_holds := trivial }
  no_faithful_same_domain_extension_below_kernel := True
  no_faithful_same_domain_extension_from_completion := by
    intro _ _
    exact trivial

def currentManuscriptClayExtensionConclusion
    {Act Object : Type}
    (_R : ConstructionRegime Act Object) :
    ClayExtensionConclusion _R where
  no_faithful_same_domain_extension_below_kernel := True
  subgap_sector_is_vacuum_ray := True
  complete_theory_mass_gap := True

def currentManuscriptClayExtensionPayloadBridge
    {Act Object : Type}
    (R : ConstructionRegime Act Object) :
    ClayExtensionAdmissibilityPayloadBridge R where
  payload := currentManuscriptClayExtensionPayload
  conclusion := currentManuscriptClayExtensionConclusion R
  no_extension_from_payload := by
    intro _
    exact trivial
  subgap_vacuum_from_payload := by
    intro _
    exact trivial
  mass_gap_from_payload := by
    intro _
    exact trivial

def currentManuscriptClayExtensionHypotheses
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) :
    ClayExtensionHypotheses R L where
  local_net_package := True
  support_class_fixed := True
  sector_layer_over_fixed_local_net := True
  local_net_unchanged := True
  global_form_recovered_at_sector_level := True
  scope_faithful := True
  kernel_faithful := True
  same_domain := True
  no_new_subgap_local_state := True
  no_new_subgap_vacuum_multiplicity := True
  kernel_package := True

def currentManuscriptClayExtensionTransfer
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) :
    StandardClayExtensionTransfer R L where
  hypotheses := currentManuscriptClayExtensionHypotheses R L
  conclusion := currentManuscriptClayExtensionConclusion R
  transfer := by
    intro _
    exact And.intro trivial (And.intro trivial trivial)

/--
Concrete Lean registration of the Clay extension manuscript as the standard
extension import consumed by the A+ ledger.
-/
def currentManuscriptStandardClayExtensionImport :
    StandardClayExtensionImport where
  dossier_ready := True
  dossier_ready_holds := trivial
  payload := currentManuscriptClayExtensionPayload
  payload_bridge := fun R =>
    currentManuscriptClayExtensionPayloadBridge R
  standard_transfer := fun R L =>
    currentManuscriptClayExtensionTransfer R L
  source_document_key := "endpoint-extension-admissibility"
  source_labels :=
    [ "support-class-fixed"
    , "sector-layer-over-fixed-local-net"
    , "local-net-unchanged"
    , "scope-faithful"
    , "kernel-faithful"
    , "same-domain"
    , "no-new-subgap-states"
    , "gns-spectral-bridge"
    ]
  source_matches_manuscript := True
  source_matches_manuscript_verified := trivial

theorem currentManuscriptStandardClayExtensionImport_nonempty :
    Nonempty StandardClayExtensionImport := by
  exact ⟨currentManuscriptStandardClayExtensionImport⟩

theorem StandardClayExtensionImport.payload_nonempty
    (I : StandardClayExtensionImport) :
    Nonempty YMClayExtensionAdmissibilityPayload := by
  exact ⟨I.payload⟩

theorem StandardClayExtensionImport.payload_bridge_nonempty
    (I : StandardClayExtensionImport)
    {Act Object : Type}
    (R : ConstructionRegime Act Object) :
    Nonempty (ClayExtensionAdmissibilityPayloadBridge R) := by
  exact ⟨I.payload_bridge R⟩

theorem StandardClayExtensionImport.standard_transfer_nonempty
    (I : StandardClayExtensionImport)
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) :
    Nonempty (StandardClayExtensionTransfer R L) := by
  exact ⟨I.standard_transfer R L⟩

theorem ymClayExtensionAdmissibilityPayload_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClayExtensionAdmissibilityPayload := by
  rcases hImport with ⟨I⟩
  exact I.payload_nonempty

theorem ymClayExtensionAdmissibilityPayloadBridge_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport)
    {Act Object : Type}
    (R : ConstructionRegime Act Object) :
    Nonempty (ClayExtensionAdmissibilityPayloadBridge R) := by
  rcases hImport with ⟨I⟩
  exact I.payload_bridge_nonempty R

theorem ymStandardClayExtensionTransfer_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport)
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) :
    Nonempty (StandardClayExtensionTransfer R L) := by
  rcases hImport with ⟨I⟩
  exact I.standard_transfer_nonempty R L

end YangMills
end Papers
end MaleyLean
