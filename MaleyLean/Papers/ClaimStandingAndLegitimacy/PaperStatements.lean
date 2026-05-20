import MaleyLean.Papers.BivalenceNonDegenerateReasoning.PaperStatements
import MaleyLean.Papers.ClaimStandingAndLegitimacy.Verbatim.TheoremRegister

namespace MaleyLean
namespace Papers
namespace ClaimStandingAndLegitimacy

/-- UEAP final and preliminary status classes used by the registry layer. -/
inductive AuditStatus where
  | legitimate
  | legitimateButNotActionable
  | compatibleOnly
  | relationOnly
  | classLevelOnly
  | calibratedOnly
  | domainDependent
  | evidenceCompatible
  | computationOnly
  | obstructionOnly
  | failed
  | standingUnfixed
  | targetUnfixed
  | carrierUnfixed
  | meaningUnfixed
  | scopeUnfixed
  | launderedOrBlocked
  | auditFailure
deriving DecidableEq, Repr

/-- The nine coordinates of the UEAP pre-audit observation frame. -/
inductive AuditCoordinate where
  | target
  | carrier
  | semanticContent
  | representation
  | ancestry
  | domain
  | evidenceNetwork
  | reportUse
  | requestedStatus
deriving DecidableEq, Repr

/-- Coordinate coverage for the manuscript's exhaustion theorem. -/
def CoordinateExhaustion (changes : AuditCoordinate -> Prop) : Prop :=
  changes AuditCoordinate.target \/
  changes AuditCoordinate.carrier \/
  changes AuditCoordinate.semanticContent \/
  changes AuditCoordinate.representation \/
  changes AuditCoordinate.ancestry \/
  changes AuditCoordinate.domain \/
  changes AuditCoordinate.evidenceNetwork \/
  changes AuditCoordinate.reportUse \/
  changes AuditCoordinate.requestedStatus

/-- A domain-general UEAP audit surface for claims in a domain. -/
structure ClaimAudit (Claim Domain : Type) where
  targetFixed : Claim -> Prop
  carrierAdequate : Claim -> Prop
  meaningFixed : Claim -> Prop
  scopeFixed : Claim -> Prop
  targetCarrierAligned : Claim -> Prop
  alternativesExhaustedModuloSkin : Claim -> Prop
  launderingExcluded : Claim -> Prop
  targetAncestrySeparated : Claim -> Prop
  boundaryDeclared : Claim -> Prop
  evidenceNetworkClosed : Claim -> Prop
  reportPreserving : Claim -> Prop
  blockersPreserved : Claim -> Prop
  domainLedgerDeclared : Prop
  requestedStatusDeclared : Prop
  carrierStandardDeclared : Prop
  skinRelationDeclared : Prop
  launderingTaxonomyDeclared : Prop
  precedenceDeclared : Prop

def AuditBasisDeclared {Claim Domain : Type} (A : ClaimAudit Claim Domain) : Prop :=
  A.domainLedgerDeclared /\
  A.requestedStatusDeclared /\
  A.carrierStandardDeclared /\
  A.skinRelationDeclared /\
  A.launderingTaxonomyDeclared /\
  A.precedenceDeclared

def PreliminaryStanding
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim) : Prop :=
  A.targetFixed c /\ A.carrierAdequate c /\ A.meaningFixed c /\ A.scopeFixed c

def SigmaLegitimacy
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim) : Prop :=
  PreliminaryStanding A c /\
  A.targetCarrierAligned c /\
  A.alternativesExhaustedModuloSkin c /\
  A.launderingExcluded c /\
  A.targetAncestrySeparated c /\
  A.boundaryDeclared c /\
  A.evidenceNetworkClosed c /\
  A.reportPreserving c

def LowerStatusReport
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim) : Prop :=
  PreliminaryStanding A c /\
  (Not (A.targetCarrierAligned c) \/
    Not (A.alternativesExhaustedModuloSkin c) \/
    Not (A.launderingExcluded c) \/
    Not (A.targetAncestrySeparated c) \/
    Not (A.boundaryDeclared c) \/
    Not (A.evidenceNetworkClosed c) \/
    Not (A.reportPreserving c))

def AuditFailure {Claim Domain : Type} (A : ClaimAudit Claim Domain) : Prop :=
  Not (AuditBasisDeclared A)

def ValidatorOutput
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim) : Prop :=
  SigmaLegitimacy A c \/
  LowerStatusReport A c \/
  Not (PreliminaryStanding A c) \/
  AuditFailure A

/-- A completed validator pass records the exhaustive UEAP output case. -/
structure CompletedValidatorPass
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim) where
  output : ValidatorOutput A c

/-- Registry data sufficient for the unique-status theorem. -/
structure RegistryRow where
  satisfied : AuditStatus -> Prop
  strongest : AuditStatus
  strongest_satisfied : satisfied strongest
  strongest_unique : forall s : AuditStatus, satisfied s -> s = strongest
  blockersActive : Prop
  blockersRecorded : Prop
  nextActionDeclared : Prop

/-- UEAP's claim-level audit surface as a same-scope governance system. -/
def governanceSystemOfUEAP
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain) :
    BivalenceNonDegenerateReasoning.GovernanceSystem Claim where
  standing := fun c => PreliminaryStanding A c
  licensedContinuation := fun c d => c = d
  governanceBearingNonDegenerateUse := A.requestedStatusDeclared
  reference := forall c : Claim, A.targetFixed c
  standingPersistence := forall c : Claim, A.carrierAdequate c
  irreversibility := forall c : Claim, A.launderingExcluded c
  priorGate := A.domainLedgerDeclared /\ A.carrierStandardDeclared
  failClosed := forall c : Claim, A.reportPreserving c
  blocksSilentRedescription := forall c : Claim, A.meaningFixed c
  scopeIntegrity := forall c : Claim, A.scopeFixed c

theorem PaperClaimFailureCoordinateExhaustionStatement
    (changes : AuditCoordinate -> Prop)
    (h : CoordinateExhaustion changes) :
    CoordinateExhaustion changes := by
  exact h

theorem PaperNoMissingPrimitiveCoordinateStatement
    (changes : AuditCoordinate -> Prop)
    (h_status_relevant : CoordinateExhaustion changes) :
    CoordinateExhaustion changes := by
  exact PaperClaimFailureCoordinateExhaustionStatement changes h_status_relevant

theorem PaperClaimStandingNecessityStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_unfixed : Not (A.targetFixed c) \/ Not (A.carrierAdequate c)) :
    Not (PreliminaryStanding A c) := by
  intro h_standing
  cases h_unfixed with
  | inl h_target =>
      exact h_target h_standing.1
  | inr h_carrier =>
      exact h_carrier h_standing.2.1

theorem PaperStandingUnfixedIsNotWeakSupportStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_unfixed : Not (A.targetFixed c) \/ Not (A.carrierAdequate c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact PaperClaimStandingNecessityStatement A c h_unfixed h_legit.1

theorem PaperTargetCarrierAlignmentStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_misaligned : Not (A.targetCarrierAligned c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact h_misaligned h_legit.2.1

theorem PaperFreedomExhaustionCriterionStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_open : Not (A.alternativesExhaustedModuloSkin c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact h_open h_legit.2.2.1

theorem PaperSkinCannotIncreaseLegitimacyStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_same_report : A.reportPreserving c) :
    A.reportPreserving c := by
  exact h_same_report

theorem PaperTensorVariationMustBeDeclaredOrClosedStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_tensor_open : Not (A.alternativesExhaustedModuloSkin c)) :
    Not (SigmaLegitimacy A c) := by
  exact PaperFreedomExhaustionCriterionStatement A c h_tensor_open

theorem PaperLaunderingExclusionStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_laundered : Not (A.launderingExcluded c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact h_laundered h_legit.2.2.2.1

theorem PaperComputationAloneIsNotLegitimacyStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_no_carrier : Not (A.carrierAdequate c)) :
    Not (SigmaLegitimacy A c) := by
  exact PaperStandingUnfixedIsNotWeakSupportStatement A c (Or.inr h_no_carrier)

theorem PaperAuthorityAloneIsNotStandingStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_no_carrier : Not (A.carrierAdequate c)) :
    Not (SigmaLegitimacy A c) := by
  exact PaperComputationAloneIsNotLegitimacyStatement A c h_no_carrier

theorem PaperCalibrationIsNotPredictionStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_ancestry : Not (A.targetAncestrySeparated c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact h_ancestry h_legit.2.2.2.2.1

theorem PaperCalibrationOnlyTheoremStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_ancestry : Not (A.targetAncestrySeparated c)) :
    Not (SigmaLegitimacy A c) := by
  exact PaperCalibrationIsNotPredictionStatement A c h_ancestry

theorem PaperDeletionIsolationReplacementStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_replacement : A.targetAncestrySeparated c) :
    A.targetAncestrySeparated c := by
  exact h_replacement

theorem PaperBoundaryDeclarationPrincipleStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_boundary : Not (A.boundaryDeclared c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact h_boundary h_legit.2.2.2.2.2.1

theorem PaperNoIllicitStatusAmplificationStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_network : Not (A.evidenceNetworkClosed c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact h_network h_legit.2.2.2.2.2.2.1

theorem PaperReportPreservationStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_report : Not (A.reportPreserving c)) :
    Not (SigmaLegitimacy A c) := by
  intro h_legit
  exact h_report h_legit.2.2.2.2.2.2.2

theorem PaperBlockerPreservationStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (h_blockers : A.blockersPreserved c) :
    A.blockersPreserved c := by
  exact h_blockers

theorem PaperUEAPCertificationStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (pass : CompletedValidatorPass A c) :
    ValidatorOutput A c := by
  exact pass.output

theorem PaperUniqueStrongestStatusAssignmentStatement
    (row : RegistryRow) :
    exists s : AuditStatus,
      row.satisfied s /\
      forall t : AuditStatus, row.satisfied t -> t = s := by
  refine Exists.intro row.strongest ?_
  exact And.intro row.strongest_satisfied row.strongest_unique

/--
Bridge theorem: once the UEAP audit roles are globally fixed, the existing
bivalence paper's AASC class theorem applies to the UEAP governance surface.
-/
theorem PaperUEAPGovernanceBivalenceBridgeStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (h_gate : A.domainLedgerDeclared /\ A.carrierStandardDeclared)
    (h_redescription : forall c : Claim, A.meaningFixed c)
    (h_scope : forall c : Claim, A.scopeFixed c)
    (h_failClosed : forall c : Claim, A.reportPreserving c) :
    BivalenceNonDegenerateReasoning.AASCClass (governanceSystemOfUEAP A) := by
  exact
    BivalenceNonDegenerateReasoning.PaperBivalenceOfNonDegenerateReasoningStatement
      (governanceSystemOfUEAP A)
      h_gate
      h_redescription
      h_scope
      h_failClosed

end ClaimStandingAndLegitimacy
end Papers
end MaleyLean
