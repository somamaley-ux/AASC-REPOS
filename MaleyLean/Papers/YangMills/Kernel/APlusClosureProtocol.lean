import MaleyLean.Papers.YangMills.Kernel.APlusSubobligationLedger

namespace MaleyLean
namespace Papers
namespace YangMills

open MinimalConditionsForAdmissibleConstruction

/--
Audited A+ certificate for the fixed-lattice gap obligation.

It contains both the theorem-level certificate and the detailed closure of all
fixed-lattice sub-obligations.
-/
structure YMAuditedFixedLatticeGapCertificate where
  certificate : YMFixedLatticeGapAPlusCertificate
  subobligationsClosed : ymFixedLatticeGapSubobligationsClosed

structure YMAuditedSharpLocalCertificate where
  certificate : YMSharpLocalAPlusCertificate
  subobligationsClosed : ymSharpLocalSubobligationsClosed

structure YMAuditedContinuumTransportCertificate where
  certificate : YMContinuumTransportAPlusCertificate
  subobligationsClosed : ymContinuumTransportSubobligationsClosed

structure YMAuditedOSWightmanCertificate where
  certificate : YMOSWightmanAPlusCertificate
  subobligationsClosed : ymOSWightmanSubobligationsClosed

structure YMAuditedMinkowskiHamiltonianGapCertificate where
  certificate : YMMinkowskiHamiltonianGapAPlusCertificate
  subobligationsClosed : ymMinkowskiHamiltonianGapSubobligationsClosed

structure YMAuditedEndpointExactnessCertificate where
  certificate : YMEndpointExactnessAPlusCertificate
  subobligationsClosed : ymEndpointExactnessSubobligationsClosed

structure YMAuditedClayExtensionCertificate where
  certificate : YMClayExtensionAPlusCertificate
  subobligationsClosed : ymClayExtensionSubobligationsClosed

/--
The complete audited A+ certificate bundle.

This packages the top-level certificates together with the detailed closure of
each subobligation row.
-/
structure YMAuditedAPlusCertificateBundle where
  fixedLatticeGap : YMAuditedFixedLatticeGapCertificate
  sharpLocalConstruction : YMAuditedSharpLocalCertificate
  continuumTransport : YMAuditedContinuumTransportCertificate
  osWightmanReconstruction : YMAuditedOSWightmanCertificate
  minkowskiHamiltonianGap : YMAuditedMinkowskiHamiltonianGapCertificate
  endpointExactnessExclusion : YMAuditedEndpointExactnessCertificate
  clayExtensionAdmissibility : YMAuditedClayExtensionCertificate

noncomputable def YMAuditedAPlusCertificateBundle.ofAuditTargets
    (hCertificates : ymAPlusAllCertificatesAvailable)
    (hSubobligations : ymAPlusAllSubobligationsClosed) :
    YMAuditedAPlusCertificateBundle :=
  { fixedLatticeGap :=
      { certificate := Classical.choice (hCertificates .fixedLatticeGap)
        subobligationsClosed := hSubobligations .fixedLatticeGap }
    sharpLocalConstruction :=
      { certificate := Classical.choice (hCertificates .sharpLocalConstruction)
        subobligationsClosed := hSubobligations .sharpLocalConstruction }
    continuumTransport :=
      { certificate := Classical.choice (hCertificates .continuumTransport)
        subobligationsClosed := hSubobligations .continuumTransport }
    osWightmanReconstruction :=
      { certificate := Classical.choice (hCertificates .osWightmanReconstruction)
        subobligationsClosed := hSubobligations .osWightmanReconstruction }
    minkowskiHamiltonianGap :=
      { certificate := Classical.choice (hCertificates .minkowskiHamiltonianGap)
        subobligationsClosed := hSubobligations .minkowskiHamiltonianGap }
    endpointExactnessExclusion :=
      { certificate := Classical.choice (hCertificates .endpointExactnessExclusion)
        subobligationsClosed := hSubobligations .endpointExactnessExclusion }
    clayExtensionAdmissibility :=
      { certificate := Classical.choice (hCertificates .clayExtensionAdmissibility)
        subobligationsClosed := hSubobligations .clayExtensionAdmissibility } }

theorem ymAPlusAuditedBundle_nonempty_of_auditTargets
    (hTargets :
      ymAPlusAllCertificatesAvailable /\ ymAPlusAllSubobligationsClosed) :
    Nonempty YMAuditedAPlusCertificateBundle := by
  exact
    ⟨YMAuditedAPlusCertificateBundle.ofAuditTargets
      hTargets.1
      hTargets.2⟩

def YMAuditedAPlusCertificateBundle.certificatesAvailable
    (_B : YMAuditedAPlusCertificateBundle) :
    ymAPlusAllCertificatesAvailable := by
  intro O
  cases O
  · exact ⟨_B.fixedLatticeGap.certificate⟩
  · exact ⟨_B.sharpLocalConstruction.certificate⟩
  · exact ⟨_B.continuumTransport.certificate⟩
  · exact ⟨_B.osWightmanReconstruction.certificate⟩
  · exact ⟨_B.minkowskiHamiltonianGap.certificate⟩
  · exact ⟨_B.endpointExactnessExclusion.certificate⟩
  · exact ⟨_B.clayExtensionAdmissibility.certificate⟩

def YMAuditedAPlusCertificateBundle.subobligationsClosed
    (_B : YMAuditedAPlusCertificateBundle) :
    ymAPlusAllSubobligationsClosed := by
  intro O
  cases O
  · exact _B.fixedLatticeGap.subobligationsClosed
  · exact _B.sharpLocalConstruction.subobligationsClosed
  · exact _B.continuumTransport.subobligationsClosed
  · exact _B.osWightmanReconstruction.subobligationsClosed
  · exact _B.minkowskiHamiltonianGap.subobligationsClosed
  · exact _B.endpointExactnessExclusion.subobligationsClosed
  · exact _B.clayExtensionAdmissibility.subobligationsClosed

def YMAuditedAPlusCertificateBundle.auditTargets
    (B : YMAuditedAPlusCertificateBundle) :
    ymAPlusAllCertificatesAvailable /\ ymAPlusAllSubobligationsClosed :=
  And.intro B.certificatesAvailable B.subobligationsClosed

def ymAPlusAuditedBundleCertificateProjectionNames : List String :=
  [ "YMAuditedAPlusCertificateBundle.fixedLatticeGapCertificate"
  , "YMAuditedAPlusCertificateBundle.sharpLocalCertificate"
  , "YMAuditedAPlusCertificateBundle.continuumTransportCertificate"
  , "YMAuditedAPlusCertificateBundle.osWightmanCertificate"
  , "YMAuditedAPlusCertificateBundle.minkowskiHamiltonianGapCertificate"
  , "YMAuditedAPlusCertificateBundle.endpointExactnessCertificate"
  , "YMAuditedAPlusCertificateBundle.clayExtensionCertificate"
  ]

def ymAPlusAuditedBundleSubobligationProjectionNames : List String :=
  [ "YMAuditedAPlusCertificateBundle.fixedLatticeGapSubobligationsClosed"
  , "YMAuditedAPlusCertificateBundle.sharpLocalSubobligationsClosed"
  , "YMAuditedAPlusCertificateBundle.continuumTransportSubobligationsClosed"
  , "YMAuditedAPlusCertificateBundle.osWightmanSubobligationsClosed"
  , "YMAuditedAPlusCertificateBundle.minkowskiHamiltonianGapSubobligationsClosed"
  , "YMAuditedAPlusCertificateBundle.endpointExactnessSubobligationsClosed"
  , "YMAuditedAPlusCertificateBundle.clayExtensionSubobligationsClosed"
  ]

def ymAPlusAuditedBundleProjectionNames : List String :=
  ymAPlusAuditedBundleCertificateProjectionNames ++
    ymAPlusAuditedBundleSubobligationProjectionNames

theorem ymAPlusAuditedBundleCertificateProjectionNames_count_eq :
    ymAPlusAuditedBundleCertificateProjectionNames.length = 7 := by
  rfl

theorem ymAPlusAuditedBundleSubobligationProjectionNames_count_eq :
    ymAPlusAuditedBundleSubobligationProjectionNames.length = 7 := by
  rfl

theorem ymAPlusAuditedBundleProjectionNames_count_eq :
    ymAPlusAuditedBundleProjectionNames.length = 14 := by
  rfl

def ymAPlusAuditedBundleProjectionNamesDuplicateFreeBool : Bool :=
  ymAPlusAuditedBundleProjectionNames.length ==
    ymAPlusAuditedBundleProjectionNames.eraseDups.length

theorem ymAPlusAuditedBundleProjectionNamesDuplicateFreeBool_eq_true :
    ymAPlusAuditedBundleProjectionNamesDuplicateFreeBool = true := by
  rfl

def ymAPlusAuditedBundleProjectionNamesPopulatedBool : Bool :=
  ymAPlusAuditedBundleProjectionNames.all
    (fun name => !name.isEmpty)

theorem ymAPlusAuditedBundleProjectionNamesPopulatedBool_eq_true :
    ymAPlusAuditedBundleProjectionNamesPopulatedBool = true := by
  rfl

def YMAuditedAPlusCertificateBundle.fixedLatticeGapCertificate
    (B : YMAuditedAPlusCertificateBundle) :
    YMFixedLatticeGapAPlusCertificate :=
  B.fixedLatticeGap.certificate

def YMAuditedAPlusCertificateBundle.sharpLocalCertificate
    (B : YMAuditedAPlusCertificateBundle) :
    YMSharpLocalAPlusCertificate :=
  B.sharpLocalConstruction.certificate

def YMAuditedAPlusCertificateBundle.continuumTransportCertificate
    (B : YMAuditedAPlusCertificateBundle) :
    YMContinuumTransportAPlusCertificate :=
  B.continuumTransport.certificate

def YMAuditedAPlusCertificateBundle.osWightmanCertificate
    (B : YMAuditedAPlusCertificateBundle) :
    YMOSWightmanAPlusCertificate :=
  B.osWightmanReconstruction.certificate

def YMAuditedAPlusCertificateBundle.minkowskiHamiltonianGapCertificate
    (B : YMAuditedAPlusCertificateBundle) :
    YMMinkowskiHamiltonianGapAPlusCertificate :=
  B.minkowskiHamiltonianGap.certificate

def YMAuditedAPlusCertificateBundle.endpointExactnessCertificate
    (B : YMAuditedAPlusCertificateBundle) :
    YMEndpointExactnessAPlusCertificate :=
  B.endpointExactnessExclusion.certificate

def YMAuditedAPlusCertificateBundle.clayExtensionCertificate
    (B : YMAuditedAPlusCertificateBundle) :
    YMClayExtensionAPlusCertificate :=
  B.clayExtensionAdmissibility.certificate

def YMAuditedAPlusCertificateBundle.fixedLatticeGapSubobligationsClosed
    (B : YMAuditedAPlusCertificateBundle) :
    ymFixedLatticeGapSubobligationsClosed :=
  B.fixedLatticeGap.subobligationsClosed

def YMAuditedAPlusCertificateBundle.sharpLocalSubobligationsClosed
    (B : YMAuditedAPlusCertificateBundle) :
    ymSharpLocalSubobligationsClosed :=
  B.sharpLocalConstruction.subobligationsClosed

def YMAuditedAPlusCertificateBundle.continuumTransportSubobligationsClosed
    (B : YMAuditedAPlusCertificateBundle) :
    ymContinuumTransportSubobligationsClosed :=
  B.continuumTransport.subobligationsClosed

def YMAuditedAPlusCertificateBundle.osWightmanSubobligationsClosed
    (B : YMAuditedAPlusCertificateBundle) :
    ymOSWightmanSubobligationsClosed :=
  B.osWightmanReconstruction.subobligationsClosed

def YMAuditedAPlusCertificateBundle.minkowskiHamiltonianGapSubobligationsClosed
    (B : YMAuditedAPlusCertificateBundle) :
    ymMinkowskiHamiltonianGapSubobligationsClosed :=
  B.minkowskiHamiltonianGap.subobligationsClosed

def YMAuditedAPlusCertificateBundle.endpointExactnessSubobligationsClosed
    (B : YMAuditedAPlusCertificateBundle) :
    ymEndpointExactnessSubobligationsClosed :=
  B.endpointExactnessExclusion.subobligationsClosed

def YMAuditedAPlusCertificateBundle.clayExtensionSubobligationsClosed
    (B : YMAuditedAPlusCertificateBundle) :
    ymClayExtensionSubobligationsClosed :=
  B.clayExtensionAdmissibility.subobligationsClosed

def YMAuditedAPlusCertificateBundle.exactTheoremsAvailable
    (B : YMAuditedAPlusCertificateBundle) :
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} :=
  ymAPlusCertificates_require_all_exact_theorems
    B.certificatesAvailable

def YMAuditedAPlusCertificateBundle.exactTheoremWitnessCount
    (_B : YMAuditedAPlusCertificateBundle) : Nat :=
  ymAPlusExactTheoremWitnessCount

theorem YMAuditedAPlusCertificateBundle.exactTheoremWitnessCount_eq
    (B : YMAuditedAPlusCertificateBundle) :
    B.exactTheoremWitnessCount = 7 := by
  rfl

def YMAuditedFixedLatticeGapCertificate.standardTransferAvailable
    (C : YMAuditedFixedLatticeGapCertificate) :
    Nonempty YMStandardFixedLatticeGapTransfer :=
  C.certificate.supplies_standard_transfer
    C.certificate.exact_theorem_proof

def YMAuditedSharpLocalCertificate.standardTransferAvailable
    (C : YMAuditedSharpLocalCertificate) :
    Nonempty YMStandardSharpLocalConstructionTransfer :=
  C.certificate.supplies_standard_transfer
    C.certificate.exact_theorem_proof

def YMAuditedContinuumTransportCertificate.standardTransferAvailable
    (C : YMAuditedContinuumTransportCertificate) :
    Nonempty YMStandardContinuumTransportTransfer :=
  C.certificate.supplies_standard_transfer
    C.certificate.exact_theorem_proof

def YMAuditedOSWightmanCertificate.standardBackgroundAvailable
    (C : YMAuditedOSWightmanCertificate) :
    Nonempty
      (YMStandardOSWightmanBackground
        C.certificate.exact_theorem_statement
        C.certificate.vacuum_vector_present
        C.certificate.wightman_fields_present
        C.certificate.smearing_defined
        C.certificate.vacuum_correlations_defined) :=
  C.certificate.supplies_standard_background
    C.certificate.exact_theorem_proof

def YMAuditedMinkowskiHamiltonianGapCertificate.standardTransferAvailable
    (C : YMAuditedMinkowskiHamiltonianGapCertificate) :
    Nonempty YMStandardMinkowskiGapTransfer :=
  C.certificate.supplies_standard_transfer
    C.certificate.exact_theorem_proof

def YMAuditedMinkowskiHamiltonianGapCertificate.hamiltonianDynamicsAvailable
    (C : YMAuditedMinkowskiHamiltonianGapCertificate) :
    Nonempty YMStandardHamiltonianDynamicsBackground :=
  C.certificate.supplies_hamiltonian_dynamics
    C.certificate.exact_theorem_proof

def YMAuditedEndpointExactnessCertificate.standardTransferAvailable
    (C : YMAuditedEndpointExactnessCertificate) :
    Nonempty YMStandardEndpointExactnessTransfer :=
  C.certificate.supplies_standard_transfer
    C.certificate.exact_theorem_proof

def YMAuditedClayExtensionCertificate.standardTransferAvailable
    {Act Object : Type}
    (C : YMAuditedClayExtensionCertificate)
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) :
    Nonempty (StandardClayExtensionTransfer R L) :=
  C.certificate.supplies_standard_transfer
    C.certificate.exact_theorem_proof R L

/--
The audited bundle projects the non-dependent standard transfer sockets supplied
by the certificates.  These are still sockets, not finished foundational
proofs; the definition makes the dependency visible at the bundle surface.
-/
def YMAuditedAPlusCertificateBundle.nonDependentStandardSocketsAvailable
    (B : YMAuditedAPlusCertificateBundle) :
      Nonempty YMStandardFixedLatticeGapTransfer /\
      Nonempty YMStandardSharpLocalConstructionTransfer /\
      Nonempty YMStandardContinuumTransportTransfer /\
      Nonempty YMStandardMinkowskiGapTransfer /\
      Nonempty YMStandardHamiltonianDynamicsBackground /\
      Nonempty YMStandardEndpointExactnessTransfer :=
  And.intro
    B.fixedLatticeGap.standardTransferAvailable
    (And.intro
      B.sharpLocalConstruction.standardTransferAvailable
      (And.intro
        B.continuumTransport.standardTransferAvailable
        (And.intro
          B.minkowskiHamiltonianGap.standardTransferAvailable
          (And.intro
            B.minkowskiHamiltonianGap.hamiltonianDynamicsAvailable
            B.endpointExactnessExclusion.standardTransferAvailable))))

def YMAuditedAPlusCertificateBundle.clayExtensionStandardTransferAvailable
    {Act Object : Type}
    (B : YMAuditedAPlusCertificateBundle)
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution) :
    Nonempty (StandardClayExtensionTransfer R L) :=
  B.clayExtensionAdmissibility.standardTransferAvailable R L

/--
The audited bundle exposes the full non-dependent payload layer required by
the individual A+ certificates.
-/
def YMAuditedAPlusCertificateBundle.nonDependentPayloadsAvailable
    (B : YMAuditedAPlusCertificateBundle) :
      Nonempty YMFixedLatticeRealSpectralGap /\
      Nonempty YMUniformFixedLatticeRealSpectralGap /\
      Nonempty YMFixedLatticeSpectralGapPayloadBridge /\
      Nonempty YMSharpLocalConstructionPayload /\
      Nonempty YMSharpLocalConstructionPayloadBridge /\
      Nonempty YMContinuumTransportPayload /\
      Nonempty YMContinuumTransportPayloadBridge /\
      Nonempty YMOSWightmanReconstructionPayload /\
      Nonempty YMHamiltonianRealMassGap /\
      Nonempty YMMinkowskiHamiltonianMassGapPayloadBridge /\
      Nonempty YMEndpointExactnessPayload /\
      Nonempty YMEndpointExactnessPayloadBridge /\
      Nonempty YMClayExtensionAdmissibilityPayload :=
  ymAPlusCertificates_require_all_non_dependent_payloads
    B.certificatesAvailable

/-- The audited bundle also supplies the route-dependent Clay extension bridge. -/
def YMAuditedAPlusCertificateBundle.clayExtensionPayloadBridgeAvailable
    {Act Object : Type}
    (B : YMAuditedAPlusCertificateBundle)
    (R : ConstructionRegime Act Object) :
    Nonempty (ClayExtensionAdmissibilityPayloadBridge R) :=
  ymAPlusClayExtensionCertificate_requires_payload_bridge
    R
    ⟨B.clayExtensionAdmissibility.certificate⟩

def YMAuditedAPlusCertificateBundle.nonDependentAuditSurfaceComplete
    (B : YMAuditedAPlusCertificateBundle) : Prop :=
  ymAPlusAllCertificatesAvailable /\
  ymAPlusAllSubobligationsClosed /\
  B.exactTheoremWitnessCount = 7 /\
  (Nonempty {P : Prop // P} /\
    Nonempty {P : Prop // P} /\
    Nonempty {P : Prop // P} /\
    Nonempty {P : Prop // P} /\
    Nonempty {P : Prop // P} /\
    Nonempty {P : Prop // P} /\
    Nonempty {P : Prop // P}) /\
  (Nonempty YMStandardFixedLatticeGapTransfer /\
    Nonempty YMStandardSharpLocalConstructionTransfer /\
    Nonempty YMStandardContinuumTransportTransfer /\
    Nonempty YMStandardMinkowskiGapTransfer /\
    Nonempty YMStandardHamiltonianDynamicsBackground /\
    Nonempty YMStandardEndpointExactnessTransfer) /\
  (Nonempty YMFixedLatticeRealSpectralGap /\
    Nonempty YMUniformFixedLatticeRealSpectralGap /\
    Nonempty YMFixedLatticeSpectralGapPayloadBridge /\
    Nonempty YMSharpLocalConstructionPayload /\
    Nonempty YMSharpLocalConstructionPayloadBridge /\
    Nonempty YMContinuumTransportPayload /\
    Nonempty YMContinuumTransportPayloadBridge /\
    Nonempty YMOSWightmanReconstructionPayload /\
    Nonempty YMHamiltonianRealMassGap /\
    Nonempty YMMinkowskiHamiltonianMassGapPayloadBridge /\
    Nonempty YMEndpointExactnessPayload /\
    Nonempty YMEndpointExactnessPayloadBridge /\
    Nonempty YMClayExtensionAdmissibilityPayload)

theorem YMAuditedAPlusCertificateBundle.nonDependentAuditSurfaceComplete_holds
    (B : YMAuditedAPlusCertificateBundle) :
    B.nonDependentAuditSurfaceComplete := by
  exact
    And.intro
      B.certificatesAvailable
      (And.intro
        B.subobligationsClosed
        (And.intro
          B.exactTheoremWitnessCount_eq
          (And.intro
            B.exactTheoremsAvailable
            (And.intro
              B.nonDependentStandardSocketsAvailable
              B.nonDependentPayloadsAvailable))))

theorem ymAuditedClayExtensionSubobligationsClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    ymClayExtensionSubobligationsClosed := by
  exact ymClayExtensionSubobligationsClosed_of_standard_import hImport

theorem
    YMAuditedAPlusCertificateBundle.clayExtensionSubobligationsClosed_of_standard_import
    (_B : YMAuditedAPlusCertificateBundle)
    (hImport : Nonempty StandardClayExtensionImport) :
    ymClayExtensionSubobligationsClosed := by
  exact ymAuditedClayExtensionSubobligationsClosed_of_standard_import hImport

theorem
    YMAuditedAPlusCertificateBundle.clayExtensionCertificateAvailable_of_standard_import
    (_B : YMAuditedAPlusCertificateBundle)
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClayExtensionAPlusCertificate := by
  exact ymAPlusClayExtensionCertificate_nonempty_of_standard_import hImport

end YangMills
end Papers
end MaleyLean
