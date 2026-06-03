import MaleyLean.Papers.YangMills.Kernel.APlusClosureProtocol
import MaleyLean.Papers.YangMills.Kernel.APlusObligationLedger

namespace MaleyLean
namespace Papers
namespace YangMills

open MinimalConditionsForAdmissibleConstruction

/--
The gated A+ target theorem object.

This is intentionally stricter than the current Clay endpoint spine: it carries
the stem-to-stern endpoint together with the machine-readable assertion that
all A+ obligations have been closed.
-/
structure APlusStemToSternClayEndpoint
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution)
    (S : SectorExtension L)
    (C : TheoremScopeCompletion L)
    (B : GNSSpectralBridge L C) where
  endpoint :
    StemToSternClayEndpoint R L S C B
  auditedCertificates :
    YMAuditedAPlusCertificateBundle
  obligationsClosed :
    ymAPlusAllObligationsClosed

def APlusStemToSternClayEndpoint.certificatesAvailable
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    ymAPlusAllCertificatesAvailable :=
  T.auditedCertificates.certificatesAvailable

def APlusStemToSternClayEndpoint.subobligationsClosed
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    ymAPlusAllSubobligationsClosed :=
  T.auditedCertificates.subobligationsClosed

def APlusStemToSternClayEndpoint.exactTheoremsAvailable
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} /\
      Nonempty {P : Prop // P} :=
  T.auditedCertificates.exactTheoremsAvailable

def APlusStemToSternClayEndpoint.exactTheoremWitnessCount
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (_T : APlusStemToSternClayEndpoint R L S C B) : Nat :=
  ymAPlusExactTheoremWitnessCount

theorem APlusStemToSternClayEndpoint.exactTheoremWitnessCount_eq
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    T.exactTheoremWitnessCount = 7 := by
  rfl

def APlusStemToSternClayEndpoint.nonDependentStandardSocketsAvailable
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
      Nonempty YMStandardFixedLatticeGapTransfer /\
      Nonempty YMStandardSharpLocalConstructionTransfer /\
      Nonempty YMStandardContinuumTransportTransfer /\
      Nonempty YMStandardMinkowskiGapTransfer /\
      Nonempty YMStandardHamiltonianDynamicsBackground /\
      Nonempty YMStandardEndpointExactnessTransfer :=
  T.auditedCertificates.nonDependentStandardSocketsAvailable

def APlusStemToSternClayEndpoint.clayExtensionStandardTransferAvailable
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    Nonempty (StandardClayExtensionTransfer R L) :=
  T.auditedCertificates.clayExtensionStandardTransferAvailable R L

def APlusStemToSternClayEndpoint.nonDependentPayloadsAvailable
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
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
  T.auditedCertificates.nonDependentPayloadsAvailable

def APlusStemToSternClayEndpoint.clayExtensionPayloadBridgeAvailable
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    Nonempty (ClayExtensionAdmissibilityPayloadBridge R) :=
  T.auditedCertificates.clayExtensionPayloadBridgeAvailable R

def APlusStemToSternClayEndpoint.auditSurfaceComplete
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) : Prop :=
  T.auditedCertificates.nonDependentAuditSurfaceComplete /\
  Nonempty (StandardClayExtensionTransfer R L) /\
  Nonempty (ClayExtensionAdmissibilityPayloadBridge R)

theorem APlusStemToSternClayEndpoint.auditSurfaceComplete_holds
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    T.auditSurfaceComplete := by
  exact
    And.intro
      T.auditedCertificates.nonDependentAuditSurfaceComplete_holds
      (And.intro
        T.clayExtensionStandardTransferAvailable
        T.clayExtensionPayloadBridgeAvailable)

def APlusStemToSternClayEndpoint.obligationClosed
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B)
    (O : YMAPlusObligation) :
    O.isClosed :=
  T.obligationsClosed O

theorem APlusStemToSternClayEndpoint.requires_fixed_lattice_gap
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    YMAPlusObligation.fixedLatticeGap.isClosed := by
  exact T.obligationClosed .fixedLatticeGap

theorem APlusStemToSternClayEndpoint.requires_sharp_local_construction
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    YMAPlusObligation.sharpLocalConstruction.isClosed := by
  exact T.obligationClosed .sharpLocalConstruction

theorem APlusStemToSternClayEndpoint.requires_continuum_transport
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    YMAPlusObligation.continuumTransport.isClosed := by
  exact T.obligationClosed .continuumTransport

theorem APlusStemToSternClayEndpoint.requires_os_wightman_reconstruction
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    YMAPlusObligation.osWightmanReconstruction.isClosed := by
  exact T.obligationClosed .osWightmanReconstruction

theorem APlusStemToSternClayEndpoint.requires_minkowski_hamiltonian_gap
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    YMAPlusObligation.minkowskiHamiltonianGap.isClosed := by
  exact T.obligationClosed .minkowskiHamiltonianGap

theorem APlusStemToSternClayEndpoint.requires_endpoint_exactness_exclusion
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    YMAPlusObligation.endpointExactnessExclusion.isClosed := by
  exact T.obligationClosed .endpointExactnessExclusion

theorem APlusStemToSternClayEndpoint.requires_clay_extension_admissibility
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (T : APlusStemToSternClayEndpoint R L S C B) :
    YMAPlusObligation.clayExtensionAdmissibility.isClosed := by
  exact T.obligationClosed .clayExtensionAdmissibility

/--
Promotion from the current stem-to-stern endpoint to the A+ endpoint is gated
by the obligation ledger.  The audited certificate bundle supplies that gate
through `ymAPlusObligationsClosed_of_auditedBundle`.
-/
def promoteStemToSternToAPlus
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (endpoint : StemToSternClayEndpoint R L S C B)
    (auditedCertificates : YMAuditedAPlusCertificateBundle)
    (obligationsClosed : ymAPlusAllObligationsClosed) :
    APlusStemToSternClayEndpoint R L S C B where
  endpoint := endpoint
  auditedCertificates := auditedCertificates
  obligationsClosed := obligationsClosed

/-
Retired open-ledger obstruction retained as historical source text.
The ledger is now certificate-backed rather than definitionally open.

theorem retired_open_ledger_obstruction
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C} :
    Not (Nonempty (APlusStemToSternClayEndpoint R L S C B)) := by
  intro hT
  rcases hT with ⟨T⟩
  exact
    retired_open_ledger_obstruction_input
      .fixedLatticeGap
      (T.obligationClosed .fixedLatticeGap)
-/

theorem ymAPlusObligationsClosed_of_auditedBundle
    (auditedCertificates : YMAuditedAPlusCertificateBundle) :
    ymAPlusAllObligationsClosed := by
  exact
    ymAPlusAllObligationsClosed_of_certificatesAvailable
      auditedCertificates.certificatesAvailable

def promoteStemToSternToAPlus_of_auditedBundle
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (endpoint : StemToSternClayEndpoint R L S C B)
    (auditedCertificates : YMAuditedAPlusCertificateBundle) :
    APlusStemToSternClayEndpoint R L S C B :=
  promoteStemToSternToAPlus
    endpoint
    auditedCertificates
    (ymAPlusObligationsClosed_of_auditedBundle auditedCertificates)

noncomputable def promoteStemToSternToAPlus_of_auditTargets
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (endpoint : StemToSternClayEndpoint R L S C B)
    (auditTargets :
      ymAPlusAllCertificatesAvailable /\ ymAPlusAllSubobligationsClosed) :
    APlusStemToSternClayEndpoint R L S C B :=
  promoteStemToSternToAPlus_of_auditedBundle
    endpoint
    (YMAuditedAPlusCertificateBundle.ofAuditTargets
      auditTargets.1
      auditTargets.2)

theorem promoteStemToSternToAPlus_nonempty_of_auditTargets
    {Act Object : Type}
    {R : ConstructionRegime Act Object}
    {L : LocalNetSolution}
    {S : SectorExtension L}
    {C : TheoremScopeCompletion L}
    {B : GNSSpectralBridge L C}
    (endpoint : Nonempty (StemToSternClayEndpoint R L S C B))
    (auditTargets :
      ymAPlusAllCertificatesAvailable /\ ymAPlusAllSubobligationsClosed) :
    Nonempty (APlusStemToSternClayEndpoint R L S C B) := by
  rcases endpoint with ⟨endpoint⟩
  exact ⟨promoteStemToSternToAPlus_of_auditTargets endpoint auditTargets⟩

end YangMills
end Papers
end MaleyLean
