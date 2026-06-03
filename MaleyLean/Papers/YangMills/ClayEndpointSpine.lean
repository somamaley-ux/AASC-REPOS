import MaleyLean.Papers.MinimalConditionsForAdmissibleConstruction.PaperStatements
import MaleyLean.YangMillsFullManuscriptNativePackage

namespace MaleyLean
namespace Papers
namespace YangMills

open MinimalConditionsForAdmissibleConstruction

/-!
This file is a Lean-facing theorem spine for the Yang--Mills Clay endpoint
extension.  It does not identify the extension paper with the local-net paper
as text.  Instead, it records the local-net theorem package as an explicit
mathematical input and proves that the admissible completion layer composes
with it to give the Clay-scope endpoint.
-/

/-- The theorem-level output of the prior local-net Yang--Mills construction. -/
structure LocalNetSolution where
  localNetConstructed : Prop
  vacuumRepresentationConstructed : Prop
  nontrivialVacuumWitness : Prop
  exactLocalEndpoint : Prop
  extendedSupportExcludedFromLocalGenerators : Prop
  vacuumHamiltonianMassGap : Prop

/-- All local-net conclusions needed by the extension layer. -/
def LocalNetSolution.proofPackage (L : LocalNetSolution) : Prop :=
  L.localNetConstructed /\
  L.vacuumRepresentationConstructed /\
  L.nontrivialVacuumWitness /\
  L.exactLocalEndpoint /\
  L.extendedSupportExcludedFromLocalGenerators /\
  L.vacuumHamiltonianMassGap

/-- A proof object for the local-net theorem package. -/
structure LocalNetProof (L : LocalNetSolution) where
  localNetConstructed : L.localNetConstructed
  vacuumRepresentationConstructed : L.vacuumRepresentationConstructed
  nontrivialVacuumWitness : L.nontrivialVacuumWitness
  exactLocalEndpoint : L.exactLocalEndpoint
  extendedSupportExcludedFromLocalGenerators :
    L.extendedSupportExcludedFromLocalGenerators
  vacuumHamiltonianMassGap : L.vacuumHamiltonianMassGap

theorem LocalNetProof.toProofPackage
    {L : LocalNetSolution}
    (hL : LocalNetProof L) :
    L.proofPackage := by
  exact And.intro hL.localNetConstructed
    (And.intro hL.vacuumRepresentationConstructed
      (And.intro hL.nontrivialVacuumWitness
        (And.intro hL.exactLocalEndpoint
          (And.intro hL.extendedSupportExcludedFromLocalGenerators
            hL.vacuumHamiltonianMassGap))))

/--
The local-net theorem package as recovered from the standalone Yang--Mills
native package.
-/
def LocalNetSolution.fromRecoveredNativePackage
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) :
    LocalNetSolution where
  localNetConstructed := RC.sharp_local_package.inductive_union_ready
  vacuumRepresentationConstructed := RD.reconstruction_package.os_sector_ready
  nontrivialVacuumWitness := RE.reconstruction_package.vacuum_vector_present
  exactLocalEndpoint := RE.endpoint_object.exact_local_net_endpoint
  extendedSupportExcludedFromLocalGenerators :=
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement RE
  vacuumHamiltonianMassGap := RD.reconstruction_package.minkowski_gap_ready

/--
Projection from the recovered local-net native package into the extension
spine's local theorem object.
-/
theorem LocalNetProof.fromRecoveredNativePackage
    {S : YMLoadBearingSpine}
    {RC : YMConstructiveRoute}
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (P : YMFullManuscriptNativePackage S RC RD RE) :
    LocalNetProof (LocalNetSolution.fromRecoveredNativePackage RC RD RE) := by
  exact
    { localNetConstructed :=
        P.constructive_proof_homes.sharp_local_home.inductive_union_certificate
      vacuumRepresentationConstructed :=
        P.vacuum_gap_proof_homes.reconstruction_home.os_sector_ready_certificate
      nontrivialVacuumWitness :=
        P.endpoint_proof_homes.reconstruction_home.vacuum_vector_certificate
      exactLocalEndpoint :=
        P.endpoint_proof_homes.correlation_home.exact_endpoint_witness
      extendedSupportExcludedFromLocalGenerators :=
        P.endpoint_proof_homes.universality_home.exact_endpoint_exclusion_statement
      vacuumHamiltonianMassGap :=
        P.vacuum_gap_proof_homes.reconstruction_home.minkowski_gap_certificate }

/-- The global sector layer is attached over, not substituted for, the local net. -/
structure SectorExtension (L : LocalNetSolution) where
  supportClassFixed : Prop
  sectorLayerOverFixedLocalNet : Prop
  localNetUnchanged : Prop
  globalFormRecoveredAtSectorLevel : Prop

def SectorExtension.proofPackage
    {L : LocalNetSolution}
    (S : SectorExtension L) :
    Prop :=
  S.supportClassFixed /\
  S.sectorLayerOverFixedLocalNet /\
  S.localNetUnchanged /\
  S.globalFormRecoveredAtSectorLevel

structure SectorExtensionProof
    {L : LocalNetSolution}
    (S : SectorExtension L) where
  supportClassFixed : S.supportClassFixed
  sectorLayerOverFixedLocalNet : S.sectorLayerOverFixedLocalNet
  localNetUnchanged : S.localNetUnchanged
  globalFormRecoveredAtSectorLevel : S.globalFormRecoveredAtSectorLevel

theorem SectorExtensionProof.toProofPackage
    {L : LocalNetSolution}
    {S : SectorExtension L}
    (hS : SectorExtensionProof S) :
    S.proofPackage := by
  exact And.intro hS.supportClassFixed
    (And.intro hS.sectorLayerOverFixedLocalNet
      (And.intro hS.localNetUnchanged hS.globalFormRecoveredAtSectorLevel))

/-- The completion hypotheses used by the Clay extension paper. -/
structure TheoremScopeCompletion (L : LocalNetSolution) where
  scopeFaithful : Prop
  kernelFaithful : Prop
  sameDomain : Prop
  noNewSubgapLocalState : Prop
  noNewSubgapVacuumMultiplicity : Prop

def TheoremScopeCompletion.admissible
    {L : LocalNetSolution}
    (C : TheoremScopeCompletion L) :
    Prop :=
  C.scopeFaithful /\
  C.kernelFaithful /\
  C.sameDomain /\
  C.noNewSubgapLocalState /\
  C.noNewSubgapVacuumMultiplicity

structure CompletionProof
    {L : LocalNetSolution}
    (C : TheoremScopeCompletion L) where
  scopeFaithful : C.scopeFaithful
  kernelFaithful : C.kernelFaithful
  sameDomain : C.sameDomain
  noNewSubgapLocalState : C.noNewSubgapLocalState
  noNewSubgapVacuumMultiplicity : C.noNewSubgapVacuumMultiplicity

theorem CompletionProof.toAdmissible
    {L : LocalNetSolution}
    {C : TheoremScopeCompletion L}
    (hC : CompletionProof C) :
    C.admissible := by
  exact And.intro hC.scopeFaithful
    (And.intro hC.kernelFaithful
      (And.intro hC.sameDomain
        (And.intro hC.noNewSubgapLocalState
          hC.noNewSubgapVacuumMultiplicity)))

/--
The spectral bridge supplied by the extension proof: from the local-net mass gap
and theorem-scope admissibility, the completion has only the vacuum ray below
threshold and hence has the Clay-scope mass gap.
-/
structure GNSSpectralBridge
    (L : LocalNetSolution)
    (C : TheoremScopeCompletion L) where
  subgapSectorIsVacuumRay : Prop
  completeTheoryMassGap : Prop
  bridge :
    LocalNetProof L ->
    CompletionProof C ->
    subgapSectorIsVacuumRay /\ completeTheoryMassGap

/-- The single endpoint theorem object joining local net and Clay completion. -/
structure StemToSternClayEndpoint
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (L : LocalNetSolution)
    (S : SectorExtension L)
    (C : TheoremScopeCompletion L)
    (B : GNSSpectralBridge L C) where
  localNetTheorem : L.proofPackage
  sectorExtensionTheorem : S.proofPackage
  admissibleCompletionTheorem : C.admissible
  noFaithfulSameDomainExtensionBelowKernel :
    Not (FaithfulSameDomainExtension R)
  subgapSectorIsVacuumRay : B.subgapSectorIsVacuumRay
  completeTheoryMassGap : B.completeTheoryMassGap

/--
The Lean statement that the two papers are mathematically joined: once the
local-net theorem package, the AASC kernel package, the sector extension, and
the admissible completion bridge are supplied, the Clay endpoint follows as one
formal proof chain.
-/
theorem stemToSternClayEndpoint
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (hKernel : KernelPackage R)
    (L : LocalNetSolution)
    (S : SectorExtension L)
    (C : TheoremScopeCompletion L)
    (B : GNSSpectralBridge L C)
    (hLocal : LocalNetProof L)
    (hSector : SectorExtensionProof S)
    (hCompletion : CompletionProof C) :
    StemToSternClayEndpoint R L S C B := by
  have hBridge := B.bridge hLocal hCompletion
  exact
    { localNetTheorem := hLocal.toProofPackage
      sectorExtensionTheorem := hSector.toProofPackage
      admissibleCompletionTheorem := hCompletion.toAdmissible
      noFaithfulSameDomainExtensionBelowKernel :=
        PaperNoFaithfulSameDomainExtensionStatement R hKernel
      subgapSectorIsVacuumRay := hBridge.1
      completeTheoryMassGap := hBridge.2 }

/--
Stem-to-stern Clay endpoint theorem using the recovered local-net native package
as the local theorem input.
-/
theorem stemToSternClayEndpointFromRecoveredNativePackage
    {Act Object : Type}
    (R : ConstructionRegime Act Object)
    (hKernel : KernelPackage R)
    {S0 : YMLoadBearingSpine}
    {RC : YMConstructiveRoute}
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (P : YMFullManuscriptNativePackage S0 RC RD RE)
    (S : SectorExtension (LocalNetSolution.fromRecoveredNativePackage RC RD RE))
    (C :
      TheoremScopeCompletion
        (LocalNetSolution.fromRecoveredNativePackage RC RD RE))
    (B :
      GNSSpectralBridge
        (LocalNetSolution.fromRecoveredNativePackage RC RD RE)
        C)
    (hSector : SectorExtensionProof S)
    (hCompletion : CompletionProof C) :
    StemToSternClayEndpoint
      R
      (LocalNetSolution.fromRecoveredNativePackage RC RD RE)
      S
      C
      B := by
  exact
    stemToSternClayEndpoint
      R
      hKernel
      (LocalNetSolution.fromRecoveredNativePackage RC RD RE)
      S
      C
      B
      (LocalNetProof.fromRecoveredNativePackage P)
      hSector
      hCompletion

end YangMills
end Papers
end MaleyLean
