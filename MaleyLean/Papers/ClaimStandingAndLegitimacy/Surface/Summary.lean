import MaleyLean.Papers.ClaimStandingAndLegitimacy.PaperStatements

namespace MaleyLean
namespace Papers
namespace ClaimStandingAndLegitimacy
namespace Surface

/-- Summary theorem exposing the current UEAP paper-facing theorem surface. -/
theorem SummaryStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (c : Claim)
    (pass : CompletedValidatorPass A c) :
    Verbatim.resultTitle Verbatim.ResultTag.ueapCertificationTheorem =
      "UEAP Certification Theorem" /\
    ValidatorOutput A c := by
  exact And.intro
    Verbatim.manuscriptHasUEAPCertificationEntry
    (PaperUEAPCertificationStatement A c pass)

/-- Summary theorem connecting UEAP conditions to the existing AASC bridge. -/
theorem GovernanceBridgeSummaryStatement
    {Claim Domain : Type}
    (A : ClaimAudit Claim Domain)
    (h_gate : A.domainLedgerDeclared /\ A.carrierStandardDeclared)
    (h_redescription : forall c : Claim, A.meaningFixed c)
    (h_scope : forall c : Claim, A.scopeFixed c)
    (h_failClosed : forall c : Claim, A.reportPreserving c) :
    BivalenceNonDegenerateReasoning.AASCClass (governanceSystemOfUEAP A) := by
  exact
    PaperUEAPGovernanceBivalenceBridgeStatement
      A
      h_gate
      h_redescription
      h_scope
      h_failClosed

end Surface
end ClaimStandingAndLegitimacy
end Papers
end MaleyLean
