import MaleyLean.Papers.YangMills.Kernel.APlusObligationLedger
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptCarrierDeclarations
import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticDefinitions
import MaleyLean.Papers.YangMills.Kernel.ManuscriptObjectPackageDeclarations
import MaleyLean.Papers.YangMills.Extension.EndpointConcreteProofHomeProjection
import MaleyLean.Papers.YangMills.Extension.EndpointConcreteUpstreamSideConditions

namespace MaleyLean
namespace Papers
namespace YangMills

/-- Sub-obligations for the fixed-lattice spectral gap theorem. -/
inductive YMFixedLatticeGapSubobligation
  | latticeHamiltonianDefinition
  | compactSimpleGaugeGroupHypotheses
  | finiteVolumeSpectralEstimate
  | positiveGapScale
  | uniformVolumeControl
  | transferToRouteLatticeInput
  deriving DecidableEq, Repr

def YMFixedLatticeGapSubobligation.title :
    YMFixedLatticeGapSubobligation -> String
  | .latticeHamiltonianDefinition =>
      "Define the finite-lattice Yang-Mills Hamiltonian"
  | .compactSimpleGaugeGroupHypotheses =>
      "Verify compact simple gauge-group hypotheses"
  | .finiteVolumeSpectralEstimate =>
      "Prove the finite-volume spectral estimate"
  | .positiveGapScale =>
      "Exhibit a positive gap scale"
  | .uniformVolumeControl =>
      "Prove uniform control over the lattice volume parameter"
  | .transferToRouteLatticeInput =>
      "Transfer the spectral estimate to the route lattice input"

def ymFixedLatticeGapSubobligations : List YMFixedLatticeGapSubobligation :=
  [ .latticeHamiltonianDefinition
  , .compactSimpleGaugeGroupHypotheses
  , .finiteVolumeSpectralEstimate
  , .positiveGapScale
  , .uniformVolumeControl
  , .transferToRouteLatticeInput
  ]

/--
Target certificate for the first fixed-lattice A+ subobligation.

This does not assert that the Yang--Mills finite-lattice Hamiltonian has
already been constructed.  It names the data and checks that a future closure
must provide before `latticeHamiltonianDefinition` may honestly be flipped
from open to closed.
-/
structure YMFiniteLatticeHamiltonianDefinitionCertificate where
  LatticeVolume : Type
  GaugeFieldConfiguration : Type
  HilbertSpace : Type
  Hamiltonian : Type
  localDegreesOfFreedomDefined : Prop
  gaugeCovariantKineticTermDefined : Prop
  plaquettePotentialTermDefined : Prop
  finiteHamiltonianSelfAdjoint : Prop
  matchesYangMillsLatticeAction : Prop

/--
Source-faithful finite-lattice carrier data for the paper's construction
around `\mathcal U_\Lambda := G^{E(\Lambda)}`.

The paper fixes a finite lattice `Λ`, its edge set `E(Λ)`, and a compact gauge
group `G`.  At this layer we only need the carrier content forced by that
sentence: a chosen lattice and an identity element of the gauge group.  The
constant identity field then inhabits the gauge-configuration carrier.
-/
structure YMFiniteLatticeSourceData where
  FiniteLattice : Type
  chosenLattice : FiniteLattice
  Edge : FiniteLattice -> Type
  GaugeGroup : Type
  gaugeIdentity : GaugeGroup
  OSHilbertSpace : Type
  vacuumVector : OSHilbertSpace
  OSHamiltonian : Type
  chosenHamiltonian : OSHamiltonian
  KineticTermCarrier : Type
  chosenKineticTerm : KineticTermCarrier
  kineticGaugeCovarianceLaw : Prop
  kineticGaugeCovarianceProof : kineticGaugeCovarianceLaw
  PlaquetteCarrier : Type
  chosenPlaquette : PlaquetteCarrier
  PotentialTermCarrier : Type
  chosenPotentialTerm : PotentialTermCarrier
  plaquettePotentialLaw : Prop
  plaquettePotentialProof : plaquettePotentialLaw
  OperatorDomain : Type
  chosenOperatorDomain : OperatorDomain
  selfAdjointnessLaw : Prop
  selfAdjointnessProof : selfAdjointnessLaw
  LatticeActionCarrier : Type
  chosenLatticeAction : LatticeActionCarrier
  actionMatchingLaw : Prop
  actionMatchingProof : actionMatchingLaw

def ymFiniteLatticeSourceDataConstructorFields :
    List String :=
  [ "FiniteLattice"
  , "chosenLattice"
  , "Edge"
  , "GaugeGroup"
  , "gaugeIdentity"
  , "OSHilbertSpace"
  , "vacuumVector"
  , "OSHamiltonian"
  , "chosenHamiltonian"
  , "KineticTermCarrier"
  , "chosenKineticTerm"
  , "kineticGaugeCovarianceLaw"
  , "kineticGaugeCovarianceProof"
  , "PlaquetteCarrier"
  , "chosenPlaquette"
  , "PotentialTermCarrier"
  , "chosenPotentialTerm"
  , "plaquettePotentialLaw"
  , "plaquettePotentialProof"
  , "OperatorDomain"
  , "chosenOperatorDomain"
  , "selfAdjointnessLaw"
  , "selfAdjointnessProof"
  , "LatticeActionCarrier"
  , "chosenLatticeAction"
  , "actionMatchingLaw"
  , "actionMatchingProof"
  ]

theorem ymFiniteLatticeSourceDataConstructorFields_count_eq :
    ymFiniteLatticeSourceDataConstructorFields.length = 27 := by
  rfl

theorem ymFiniteLatticeSourceData_nonempty_of_fields
    (FiniteLattice : Type)
    (chosenLattice : FiniteLattice)
    (Edge : FiniteLattice -> Type)
    (GaugeGroup : Type)
    (gaugeIdentity : GaugeGroup)
    (OSHilbertSpace : Type)
    (vacuumVector : OSHilbertSpace)
    (OSHamiltonian : Type)
    (chosenHamiltonian : OSHamiltonian)
    (KineticTermCarrier : Type)
    (chosenKineticTerm : KineticTermCarrier)
    (kineticGaugeCovarianceLaw : Prop)
    (kineticGaugeCovarianceProof : kineticGaugeCovarianceLaw)
    (PlaquetteCarrier : Type)
    (chosenPlaquette : PlaquetteCarrier)
    (PotentialTermCarrier : Type)
    (chosenPotentialTerm : PotentialTermCarrier)
    (plaquettePotentialLaw : Prop)
    (plaquettePotentialProof : plaquettePotentialLaw)
    (OperatorDomain : Type)
    (chosenOperatorDomain : OperatorDomain)
    (selfAdjointnessLaw : Prop)
    (selfAdjointnessProof : selfAdjointnessLaw)
    (LatticeActionCarrier : Type)
    (chosenLatticeAction : LatticeActionCarrier)
    (actionMatchingLaw : Prop)
    (actionMatchingProof : actionMatchingLaw) :
    Nonempty YMFiniteLatticeSourceData := by
  exact
    Nonempty.intro
      { FiniteLattice := FiniteLattice
        chosenLattice := chosenLattice
        Edge := Edge
        GaugeGroup := GaugeGroup
        gaugeIdentity := gaugeIdentity
        OSHilbertSpace := OSHilbertSpace
        vacuumVector := vacuumVector
        OSHamiltonian := OSHamiltonian
        chosenHamiltonian := chosenHamiltonian
        KineticTermCarrier := KineticTermCarrier
        chosenKineticTerm := chosenKineticTerm
        kineticGaugeCovarianceLaw := kineticGaugeCovarianceLaw
        kineticGaugeCovarianceProof := kineticGaugeCovarianceProof
        PlaquetteCarrier := PlaquetteCarrier
        chosenPlaquette := chosenPlaquette
        PotentialTermCarrier := PotentialTermCarrier
        chosenPotentialTerm := chosenPotentialTerm
        plaquettePotentialLaw := plaquettePotentialLaw
        plaquettePotentialProof := plaquettePotentialProof
        OperatorDomain := OperatorDomain
        chosenOperatorDomain := chosenOperatorDomain
        selfAdjointnessLaw := selfAdjointnessLaw
        selfAdjointnessProof := selfAdjointnessProof
        LatticeActionCarrier := LatticeActionCarrier
        chosenLatticeAction := chosenLatticeAction
        actionMatchingLaw := actionMatchingLaw
        actionMatchingProof := actionMatchingProof }

def YMFiniteLatticeSourceData.LatticeVolume
    (S : YMFiniteLatticeSourceData) : Type :=
  S.FiniteLattice

def YMFiniteLatticeSourceData.finiteLatticeCarrier
    (S : YMFiniteLatticeSourceData) : Type :=
  S.FiniteLattice

theorem YMFiniteLatticeSourceData.finiteLatticeCarrier_eq
    (S : YMFiniteLatticeSourceData) :
    S.finiteLatticeCarrier = S.FiniteLattice := by
  rfl

theorem
    ymFiniteLatticeSourceData_finiteLatticeCarrier_witness_of_source_data
    (hSource : Nonempty YMFiniteLatticeSourceData) :
    Nonempty
      { T : Type //
        Exists (fun S : YMFiniteLatticeSourceData => T = S.FiniteLattice) } := by
  rcases hSource with ⟨S⟩
  exact ⟨⟨S.FiniteLattice, ⟨S, rfl⟩⟩⟩

/--
The manuscript-to-constructor unpacking target for the 27 fields of
`YMFiniteLatticeSourceData`.

This is intentionally just an unpacked copy of the source-data constructor
surface: it records that every carrier, chosen element, proposition, and proof
needed by `ymFiniteLatticeSourceData_nonempty_of_fields` has been obtained
from a single source-data object.
-/
structure YMFiniteLatticeSourceDataConstructorWitnesses where
  source : YMFiniteLatticeSourceData
  FiniteLattice : Type
  chosenLattice : FiniteLattice
  Edge : FiniteLattice -> Type
  GaugeGroup : Type
  gaugeIdentity : GaugeGroup
  OSHilbertSpace : Type
  vacuumVector : OSHilbertSpace
  OSHamiltonian : Type
  chosenHamiltonian : OSHamiltonian
  KineticTermCarrier : Type
  chosenKineticTerm : KineticTermCarrier
  kineticGaugeCovarianceLaw : Prop
  kineticGaugeCovarianceProof : kineticGaugeCovarianceLaw
  PlaquetteCarrier : Type
  chosenPlaquette : PlaquetteCarrier
  PotentialTermCarrier : Type
  chosenPotentialTerm : PotentialTermCarrier
  plaquettePotentialLaw : Prop
  plaquettePotentialProof : plaquettePotentialLaw
  OperatorDomain : Type
  chosenOperatorDomain : OperatorDomain
  selfAdjointnessLaw : Prop
  selfAdjointnessProof : selfAdjointnessLaw
  LatticeActionCarrier : Type
  chosenLatticeAction : LatticeActionCarrier
  actionMatchingLaw : Prop
  actionMatchingProof : actionMatchingLaw
  finiteLattice_eq_source : FiniteLattice = source.FiniteLattice
  chosenLattice_eq_source :
    HEq chosenLattice source.chosenLattice
  edge_eq_source : HEq Edge source.Edge
  gaugeGroup_eq_source : GaugeGroup = source.GaugeGroup
  gaugeIdentity_eq_source : HEq gaugeIdentity source.gaugeIdentity
  osHilbertSpace_eq_source : OSHilbertSpace = source.OSHilbertSpace
  vacuumVector_eq_source : HEq vacuumVector source.vacuumVector
  osHamiltonian_eq_source : OSHamiltonian = source.OSHamiltonian
  chosenHamiltonian_eq_source :
    HEq chosenHamiltonian source.chosenHamiltonian
  kineticTermCarrier_eq_source :
    KineticTermCarrier = source.KineticTermCarrier
  chosenKineticTerm_eq_source :
    HEq chosenKineticTerm source.chosenKineticTerm
  kineticGaugeCovarianceLaw_eq_source :
    kineticGaugeCovarianceLaw = source.kineticGaugeCovarianceLaw
  kineticGaugeCovarianceProof_eq_source :
    HEq kineticGaugeCovarianceProof source.kineticGaugeCovarianceProof
  plaquetteCarrier_eq_source : PlaquetteCarrier = source.PlaquetteCarrier
  chosenPlaquette_eq_source :
    HEq chosenPlaquette source.chosenPlaquette
  potentialTermCarrier_eq_source :
    PotentialTermCarrier = source.PotentialTermCarrier
  chosenPotentialTerm_eq_source :
    HEq chosenPotentialTerm source.chosenPotentialTerm
  plaquettePotentialLaw_eq_source :
    plaquettePotentialLaw = source.plaquettePotentialLaw
  plaquettePotentialProof_eq_source :
    HEq plaquettePotentialProof source.plaquettePotentialProof
  operatorDomain_eq_source : OperatorDomain = source.OperatorDomain
  chosenOperatorDomain_eq_source :
    HEq chosenOperatorDomain source.chosenOperatorDomain
  selfAdjointnessLaw_eq_source :
    selfAdjointnessLaw = source.selfAdjointnessLaw
  selfAdjointnessProof_eq_source :
    HEq selfAdjointnessProof source.selfAdjointnessProof
  latticeActionCarrier_eq_source :
    LatticeActionCarrier = source.LatticeActionCarrier
  chosenLatticeAction_eq_source :
    HEq chosenLatticeAction source.chosenLatticeAction
  actionMatchingLaw_eq_source :
    actionMatchingLaw = source.actionMatchingLaw
  actionMatchingProof_eq_source :
    HEq actionMatchingProof source.actionMatchingProof

def YMFiniteLatticeSourceData.constructorWitnesses
    (S : YMFiniteLatticeSourceData) :
    YMFiniteLatticeSourceDataConstructorWitnesses where
  source := S
  FiniteLattice := S.FiniteLattice
  chosenLattice := S.chosenLattice
  Edge := S.Edge
  GaugeGroup := S.GaugeGroup
  gaugeIdentity := S.gaugeIdentity
  OSHilbertSpace := S.OSHilbertSpace
  vacuumVector := S.vacuumVector
  OSHamiltonian := S.OSHamiltonian
  chosenHamiltonian := S.chosenHamiltonian
  KineticTermCarrier := S.KineticTermCarrier
  chosenKineticTerm := S.chosenKineticTerm
  kineticGaugeCovarianceLaw := S.kineticGaugeCovarianceLaw
  kineticGaugeCovarianceProof := S.kineticGaugeCovarianceProof
  PlaquetteCarrier := S.PlaquetteCarrier
  chosenPlaquette := S.chosenPlaquette
  PotentialTermCarrier := S.PotentialTermCarrier
  chosenPotentialTerm := S.chosenPotentialTerm
  plaquettePotentialLaw := S.plaquettePotentialLaw
  plaquettePotentialProof := S.plaquettePotentialProof
  OperatorDomain := S.OperatorDomain
  chosenOperatorDomain := S.chosenOperatorDomain
  selfAdjointnessLaw := S.selfAdjointnessLaw
  selfAdjointnessProof := S.selfAdjointnessProof
  LatticeActionCarrier := S.LatticeActionCarrier
  chosenLatticeAction := S.chosenLatticeAction
  actionMatchingLaw := S.actionMatchingLaw
  actionMatchingProof := S.actionMatchingProof
  finiteLattice_eq_source := rfl
  chosenLattice_eq_source := HEq.rfl
  edge_eq_source := HEq.rfl
  gaugeGroup_eq_source := rfl
  gaugeIdentity_eq_source := HEq.rfl
  osHilbertSpace_eq_source := rfl
  vacuumVector_eq_source := HEq.rfl
  osHamiltonian_eq_source := rfl
  chosenHamiltonian_eq_source := HEq.rfl
  kineticTermCarrier_eq_source := rfl
  chosenKineticTerm_eq_source := HEq.rfl
  kineticGaugeCovarianceLaw_eq_source := rfl
  kineticGaugeCovarianceProof_eq_source := HEq.rfl
  plaquetteCarrier_eq_source := rfl
  chosenPlaquette_eq_source := HEq.rfl
  potentialTermCarrier_eq_source := rfl
  chosenPotentialTerm_eq_source := HEq.rfl
  plaquettePotentialLaw_eq_source := rfl
  plaquettePotentialProof_eq_source := HEq.rfl
  operatorDomain_eq_source := rfl
  chosenOperatorDomain_eq_source := HEq.rfl
  selfAdjointnessLaw_eq_source := rfl
  selfAdjointnessProof_eq_source := HEq.rfl
  latticeActionCarrier_eq_source := rfl
  chosenLatticeAction_eq_source := HEq.rfl
  actionMatchingLaw_eq_source := rfl
  actionMatchingProof_eq_source := HEq.rfl

theorem
    ymFiniteLatticeSourceData_constructorWitnesses_nonempty_of_source_data
    (hSource : Nonempty YMFiniteLatticeSourceData) :
    Nonempty YMFiniteLatticeSourceDataConstructorWitnesses := by
  rcases hSource with ⟨S⟩
  exact ⟨S.constructorWitnesses⟩

theorem
    ymFiniteLatticeSourceData_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty YMFiniteLatticeSourceDataConstructorWitnesses) :
    Nonempty YMFiniteLatticeSourceData := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

def YMFiniteLatticeSourceData.GaugeFieldConfiguration
    (S : YMFiniteLatticeSourceData) : Type :=
  S.Edge S.chosenLattice -> S.GaugeGroup

def YMFiniteLatticeSourceData.HilbertSpace
    (S : YMFiniteLatticeSourceData) : Type :=
  S.OSHilbertSpace

def YMFiniteLatticeSourceData.Hamiltonian
    (S : YMFiniteLatticeSourceData) : Type :=
  S.OSHamiltonian

def YMFiniteLatticeSourceData.identityGaugeField
    (S : YMFiniteLatticeSourceData) :
    S.GaugeFieldConfiguration :=
  fun _ => S.gaugeIdentity

def YMFiniteLatticeSourceData.localDegreeCarrier
    (S : YMFiniteLatticeSourceData) :
    S.LatticeVolume -> Type :=
  fun _ => S.GaugeFieldConfiguration

def YMFiniteLatticeSourceData.kineticTermCarrier
    (S : YMFiniteLatticeSourceData) : Type :=
  S.KineticTermCarrier

def YMFiniteLatticeSourceData.plaquetteCarrier
    (S : YMFiniteLatticeSourceData) : Type :=
  S.PlaquetteCarrier

def YMFiniteLatticeSourceData.potentialTermCarrier
    (S : YMFiniteLatticeSourceData) : Type :=
  S.PotentialTermCarrier

def YMFiniteLatticeSourceData.operatorDomain
    (S : YMFiniteLatticeSourceData) : Type :=
  S.OperatorDomain

def YMFiniteLatticeSourceData.latticeActionCarrier
    (S : YMFiniteLatticeSourceData) : Type :=
  S.LatticeActionCarrier

def YMFiniteLatticeSourceData.sourceLocalDegreesOfFreedomDefined
    (S : YMFiniteLatticeSourceData) : Prop :=
  Nonempty S.LatticeVolume /\
  Nonempty S.GaugeFieldConfiguration /\
  Nonempty S.HilbertSpace /\
  Exists
    (fun local_degree_carrier : S.LatticeVolume -> Type =>
      forall V : S.LatticeVolume,
        Nonempty (local_degree_carrier V))

def YMFiniteLatticeSourceData.sourceGaugeCovariantKineticTermDefined
    (S : YMFiniteLatticeSourceData) : Prop :=
  Nonempty S.Hamiltonian /\
  Exists
    (fun kinetic_term_carrier : Type =>
      Nonempty kinetic_term_carrier /\
      S.kineticGaugeCovarianceLaw)

def YMFiniteLatticeSourceData.sourcePlaquettePotentialTermDefined
    (S : YMFiniteLatticeSourceData) : Prop :=
  Nonempty S.GaugeFieldConfiguration /\
  Exists
    (fun plaquette_carrier : Type =>
      Nonempty plaquette_carrier /\
      Exists
        (fun potential_term_carrier : Type =>
          Nonempty potential_term_carrier /\
          S.plaquettePotentialLaw))

def YMFiniteLatticeSourceData.sourceFiniteHamiltonianSelfAdjoint
    (S : YMFiniteLatticeSourceData) : Prop :=
  Nonempty S.HilbertSpace /\
  Nonempty S.Hamiltonian /\
  Exists
    (fun operator_domain : Type =>
      Nonempty operator_domain /\
      S.selfAdjointnessLaw)

def YMFiniteLatticeSourceData.sourceMatchesYangMillsLatticeAction
    (S : YMFiniteLatticeSourceData) : Prop :=
  Nonempty S.Hamiltonian /\
  Exists
    (fun lattice_action_carrier : Type =>
      Nonempty lattice_action_carrier /\
      S.actionMatchingLaw)

def YMFiniteLatticeSourceData.toHamiltonianDefinitionCertificate
    (S : YMFiniteLatticeSourceData)
    (HilbertSpace : Type)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeHamiltonianDefinitionCertificate where
  LatticeVolume := S.LatticeVolume
  GaugeFieldConfiguration := S.GaugeFieldConfiguration
  HilbertSpace := HilbertSpace
  Hamiltonian := Hamiltonian
  localDegreesOfFreedomDefined := localDegreesOfFreedomDefined
  gaugeCovariantKineticTermDefined := gaugeCovariantKineticTermDefined
  plaquettePotentialTermDefined := plaquettePotentialTermDefined
  finiteHamiltonianSelfAdjoint := finiteHamiltonianSelfAdjoint
  matchesYangMillsLatticeAction := matchesYangMillsLatticeAction

def YMFiniteLatticeSourceData.toOSHamiltonianDefinitionCertificate
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeHamiltonianDefinitionCertificate :=
  S.toHamiltonianDefinitionCertificate
    S.HilbertSpace
    Hamiltonian
    localDegreesOfFreedomDefined
    gaugeCovariantKineticTermDefined
    plaquettePotentialTermDefined
    finiteHamiltonianSelfAdjoint
    matchesYangMillsLatticeAction

def YMFiniteLatticeSourceData.toOSSourceLocalDegreesCertificate
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeHamiltonianDefinitionCertificate :=
  S.toOSHamiltonianDefinitionCertificate
    Hamiltonian
    S.sourceLocalDegreesOfFreedomDefined
    gaugeCovariantKineticTermDefined
    plaquettePotentialTermDefined
    finiteHamiltonianSelfAdjoint
    matchesYangMillsLatticeAction

def YMFiniteLatticeSourceData.toOSSourceLocalDegreesKineticCertificate
    (S : YMFiniteLatticeSourceData)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeHamiltonianDefinitionCertificate :=
  S.toOSHamiltonianDefinitionCertificate
    S.Hamiltonian
    S.sourceLocalDegreesOfFreedomDefined
    S.sourceGaugeCovariantKineticTermDefined
    plaquettePotentialTermDefined
    finiteHamiltonianSelfAdjoint
    matchesYangMillsLatticeAction

def YMFiniteLatticeSourceData.toOSSourceLocalDegreesKineticPlaquetteCertificate
    (S : YMFiniteLatticeSourceData)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeHamiltonianDefinitionCertificate :=
  S.toOSHamiltonianDefinitionCertificate
    S.Hamiltonian
    S.sourceLocalDegreesOfFreedomDefined
    S.sourceGaugeCovariantKineticTermDefined
    S.sourcePlaquettePotentialTermDefined
    finiteHamiltonianSelfAdjoint
    matchesYangMillsLatticeAction

def YMFiniteLatticeSourceData.toOSSourceLocalDegreesKineticPlaquetteSelfAdjointCertificate
    (S : YMFiniteLatticeSourceData)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeHamiltonianDefinitionCertificate :=
  S.toOSHamiltonianDefinitionCertificate
    S.Hamiltonian
    S.sourceLocalDegreesOfFreedomDefined
    S.sourceGaugeCovariantKineticTermDefined
    S.sourcePlaquettePotentialTermDefined
    S.sourceFiniteHamiltonianSelfAdjoint
    matchesYangMillsLatticeAction

def YMFiniteLatticeSourceData.toOSSourceHamiltonianDefinitionCertificate
    (S : YMFiniteLatticeSourceData) :
    YMFiniteLatticeHamiltonianDefinitionCertificate :=
  S.toOSHamiltonianDefinitionCertificate
    S.Hamiltonian
    S.sourceLocalDegreesOfFreedomDefined
    S.sourceGaugeCovariantKineticTermDefined
    S.sourcePlaquettePotentialTermDefined
    S.sourceFiniteHamiltonianSelfAdjoint
    S.sourceMatchesYangMillsLatticeAction

theorem YMFiniteLatticeSourceData.latticeVolume_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.LatticeVolume := by
  exact ⟨S.chosenLattice⟩

theorem YMFiniteLatticeSourceData.gaugeFieldConfiguration_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.GaugeFieldConfiguration := by
  exact ⟨S.identityGaugeField⟩

theorem YMFiniteLatticeSourceData.hilbertSpace_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.HilbertSpace := by
  exact ⟨S.vacuumVector⟩

theorem YMFiniteLatticeSourceData.localDegreeCarrier_nonempty
    (S : YMFiniteLatticeSourceData) :
    forall V : S.LatticeVolume,
      Nonempty (S.localDegreeCarrier V) := by
  intro _
  exact S.gaugeFieldConfiguration_nonempty

theorem YMFiniteLatticeSourceData.hamiltonian_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.Hamiltonian := by
  exact Nonempty.intro S.chosenHamiltonian

theorem YMFiniteLatticeSourceData.kineticTermCarrier_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.kineticTermCarrier := by
  exact Nonempty.intro S.chosenKineticTerm

theorem YMFiniteLatticeSourceData.plaquetteCarrier_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.plaquetteCarrier := by
  exact Nonempty.intro S.chosenPlaquette

theorem YMFiniteLatticeSourceData.potentialTermCarrier_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.potentialTermCarrier := by
  exact Nonempty.intro S.chosenPotentialTerm

theorem YMFiniteLatticeSourceData.operatorDomain_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.operatorDomain := by
  exact Nonempty.intro S.chosenOperatorDomain

theorem YMFiniteLatticeSourceData.latticeActionCarrier_nonempty
    (S : YMFiniteLatticeSourceData) :
    Nonempty S.latticeActionCarrier := by
  exact Nonempty.intro S.chosenLatticeAction

theorem YMFiniteLatticeSourceData.sourceLocalDegreesOfFreedomDefined_holds
    (S : YMFiniteLatticeSourceData) :
    S.sourceLocalDegreesOfFreedomDefined := by
  exact
    And.intro
      S.latticeVolume_nonempty
      (And.intro
        S.gaugeFieldConfiguration_nonempty
        (And.intro
          S.hilbertSpace_nonempty
          (Exists.intro
            S.localDegreeCarrier
            S.localDegreeCarrier_nonempty)))

theorem
    YMFiniteLatticeSourceData.sourceGaugeCovariantKineticTermDefined_holds
    (S : YMFiniteLatticeSourceData) :
    S.sourceGaugeCovariantKineticTermDefined := by
  exact
    And.intro
      S.hamiltonian_nonempty
      (Exists.intro
        S.kineticTermCarrier
        (And.intro
          S.kineticTermCarrier_nonempty
          S.kineticGaugeCovarianceProof))

theorem
    YMFiniteLatticeSourceData.sourcePlaquettePotentialTermDefined_holds
    (S : YMFiniteLatticeSourceData) :
    S.sourcePlaquettePotentialTermDefined := by
  exact
    And.intro
      S.gaugeFieldConfiguration_nonempty
      (Exists.intro
        S.plaquetteCarrier
        (And.intro
          S.plaquetteCarrier_nonempty
          (Exists.intro
            S.potentialTermCarrier
            (And.intro
              S.potentialTermCarrier_nonempty
              S.plaquettePotentialProof))))

theorem
    YMFiniteLatticeSourceData.sourceFiniteHamiltonianSelfAdjoint_holds
    (S : YMFiniteLatticeSourceData) :
    S.sourceFiniteHamiltonianSelfAdjoint := by
  exact
    And.intro
      S.hilbertSpace_nonempty
      (And.intro
        S.hamiltonian_nonempty
        (Exists.intro
          S.operatorDomain
          (And.intro
            S.operatorDomain_nonempty
            S.selfAdjointnessProof)))

theorem
    YMFiniteLatticeSourceData.sourceMatchesYangMillsLatticeAction_holds
    (S : YMFiniteLatticeSourceData) :
    S.sourceMatchesYangMillsLatticeAction := by
  exact
    And.intro
      S.hamiltonian_nonempty
      (Exists.intro
        S.latticeActionCarrier
        (And.intro
          S.latticeActionCarrier_nonempty
          S.actionMatchingProof))

def YMFiniteLatticeHamiltonianDefinitionCertificate.closed
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.localDegreesOfFreedomDefined /\
  C.gaugeCovariantKineticTermDefined /\
  C.plaquettePotentialTermDefined /\
  C.finiteHamiltonianSelfAdjoint /\
  C.matchesYangMillsLatticeAction

/--
Typed witness interface for the first Hamiltonian-definition proof atom.

This is deliberately not a proof by itself: a witness still has to provide the
paper-level proposition `C.localDegreesOfFreedomDefined`.  The additional
fields make the intended finite-lattice data visible to Lean before that
proposition can be passed into the main certificate package.
-/
structure YMFiniteLatticeLocalDegreesOfFreedomWitness
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) where
  volume_nonempty : Nonempty C.LatticeVolume
  gauge_configuration_nonempty : Nonempty C.GaugeFieldConfiguration
  hilbert_space_nonempty : Nonempty C.HilbertSpace
  local_degree_carrier : C.LatticeVolume -> Type
  local_degree_carrier_nonempty :
    forall V : C.LatticeVolume, Nonempty (local_degree_carrier V)
  proves_localDegreesOfFreedomDefined :
    C.localDegreesOfFreedomDefined

def ymFiniteLatticeLocalDegreesOfFreedomWitnessFields :
    List String :=
  [ "volume_nonempty"
  , "gauge_configuration_nonempty"
  , "hilbert_space_nonempty"
  , "local_degree_carrier"
  , "local_degree_carrier_nonempty"
  , "proves_localDegreesOfFreedomDefined"
  ]

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessFields_count_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessFields.length = 6 := by
  rfl

/--
Internal input inventory for `YMFiniteLatticeLocalDegreesOfFreedomWitness`.

This records the six pieces still needed before the first witness component can
be constructed.  It is intentionally an audit table: every row remains
unsupplied until a real Lean term provides the corresponding field.
-/
structure YMFiniteLatticeLocalDegreesOfFreedomWitnessInput where
  fieldName : String
  inputRole : String
  targetShape : String
  projectionName : String
  suppliedInLean : Bool

def ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs :
    List YMFiniteLatticeLocalDegreesOfFreedomWitnessInput :=
  [ { fieldName := "volume_nonempty"
      inputRole := "finite-lattice volume carrier exists"
      targetShape := "Nonempty C.LatticeVolume"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_volume_nonempty"
      suppliedInLean := true }
  , { fieldName := "gauge_configuration_nonempty"
      inputRole := "gauge-field configuration carrier exists"
      targetShape := "Nonempty C.GaugeFieldConfiguration"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_configuration_nonempty"
      suppliedInLean := true }
  , { fieldName := "hilbert_space_nonempty"
      inputRole := "finite-lattice Hilbert-space carrier exists"
      targetShape := "Nonempty C.HilbertSpace"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_hilbert_nonempty"
      suppliedInLean := true }
  , { fieldName := "local_degree_carrier"
      inputRole := "local degree-of-freedom carrier over each lattice volume"
      targetShape := "C.LatticeVolume -> Type"
      projectionName := "YMFiniteLatticeLocalDegreesOfFreedomWitness.local_degree_carrier"
      suppliedInLean := true }
  , { fieldName := "local_degree_carrier_nonempty"
      inputRole := "each local degree-of-freedom carrier is inhabited"
      targetShape := "forall V : C.LatticeVolume, Nonempty (local_degree_carrier V)"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_local_carrier_nonempty"
      suppliedInLean := true }
  , { fieldName := "proves_localDegreesOfFreedomDefined"
      inputRole := "paper-level local degrees proposition"
      targetShape := "C.localDegreesOfFreedomDefined"
      projectionName :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.to_localDegrees_proof"
      suppliedInLean := false }
  ]

def ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields :
    List String :=
  ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs.map
    (fun I => I.fieldName)

def ymFiniteLatticeLocalDegreesOfFreedomWitnessInputRoles :
    List String :=
  ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs.map
    (fun I => I.inputRole)

def ymFiniteLatticeLocalDegreesOfFreedomWitnessInputTargetShapes :
    List String :=
  ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs.map
    (fun I => I.targetShape)

def ymFiniteLatticeLocalDegreesOfFreedomWitnessInputProjections :
    List String :=
  ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs.map
    (fun I => I.projectionName)

def ymFiniteLatticeLocalDegreesOfFreedomWitnessInputSuppliedFlags :
    List Bool :=
  ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs.map
    (fun I => I.suppliedInLean)

def ymFiniteLatticeLocalDegreesOfFreedomWitnessInputsAllSuppliedBool :
    Bool :=
  ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs.all
    (fun I => I.suppliedInLean)

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs_length_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputs.length = 6 := by
  rfl

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields_match :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputFields =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessFields := by
  rfl

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessInputRoles_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputRoles =
      [ "finite-lattice volume carrier exists"
      , "gauge-field configuration carrier exists"
      , "finite-lattice Hilbert-space carrier exists"
      , "local degree-of-freedom carrier over each lattice volume"
      , "each local degree-of-freedom carrier is inhabited"
      , "paper-level local degrees proposition"
      ] := by
  rfl

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessInputTargetShapes_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputTargetShapes =
      [ "Nonempty C.LatticeVolume"
      , "Nonempty C.GaugeFieldConfiguration"
      , "Nonempty C.HilbertSpace"
      , "C.LatticeVolume -> Type"
      , "forall V : C.LatticeVolume, Nonempty (local_degree_carrier V)"
      , "C.localDegreesOfFreedomDefined"
      ] := by
  rfl

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessInputProjections_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputProjections =
      [ "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_volume_nonempty"
      , "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_configuration_nonempty"
      , "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_hilbert_nonempty"
      , "YMFiniteLatticeLocalDegreesOfFreedomWitness.local_degree_carrier"
      , "YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_local_carrier_nonempty"
      , "YMFiniteLatticeLocalDegreesOfFreedomWitness.to_localDegrees_proof"
      ] := by
  rfl

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessInputSuppliedFlags_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputSuppliedFlags =
      [true, true, true, true, true, false] := by
  rfl

theorem
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputsAllSuppliedBool_eq_false :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessInputsAllSuppliedBool =
      false := by
  rfl

def ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorInputs :
    List String :=
  [ "volume_nonempty"
  , "gauge_configuration_nonempty"
  , "hilbert_space_nonempty"
  , "local_degree_carrier"
  , "local_degree_carrier_nonempty"
  , "proves_localDegreesOfFreedomDefined"
  ]

theorem
    ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorInputs_match_fields :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorInputs =
      ymFiniteLatticeLocalDegreesOfFreedomWitnessFields := by
  rfl

theorem
    ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorInputs_count_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorInputs.length =
      6 := by
  rfl

def ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorName :
    String :=
  "YMFiniteLatticeLocalDegreesOfFreedomWitness.of_fields"

theorem ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorName_eq :
    ymFiniteLatticeLocalDegreesOfFreedomWitnessConstructorName =
      "YMFiniteLatticeLocalDegreesOfFreedomWitness.of_fields" := by
  rfl

def YMFiniteLatticeLocalDegreesOfFreedomWitness.of_fields
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (volume_nonempty : Nonempty C.LatticeVolume)
    (gauge_configuration_nonempty :
      Nonempty C.GaugeFieldConfiguration)
    (hilbert_space_nonempty : Nonempty C.HilbertSpace)
    (local_degree_carrier : C.LatticeVolume -> Type)
    (local_degree_carrier_nonempty :
      forall V : C.LatticeVolume,
        Nonempty (local_degree_carrier V))
    (proves_localDegreesOfFreedomDefined :
      C.localDegreesOfFreedomDefined) :
    YMFiniteLatticeLocalDegreesOfFreedomWitness C where
  volume_nonempty := volume_nonempty
  gauge_configuration_nonempty := gauge_configuration_nonempty
  hilbert_space_nonempty := hilbert_space_nonempty
  local_degree_carrier := local_degree_carrier
  local_degree_carrier_nonempty := local_degree_carrier_nonempty
  proves_localDegreesOfFreedomDefined :=
    proves_localDegreesOfFreedomDefined

theorem YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_volume_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeLocalDegreesOfFreedomWitness C) :
    Nonempty C.LatticeVolume := by
  exact W.volume_nonempty

theorem
    YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_configuration_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeLocalDegreesOfFreedomWitness C) :
    Nonempty C.GaugeFieldConfiguration := by
  exact W.gauge_configuration_nonempty

theorem YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_hilbert_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeLocalDegreesOfFreedomWitness C) :
    Nonempty C.HilbertSpace := by
  exact W.hilbert_space_nonempty

theorem
    YMFiniteLatticeLocalDegreesOfFreedomWitness.requires_local_carrier_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeLocalDegreesOfFreedomWitness C)
    (V : C.LatticeVolume) :
    Nonempty (W.local_degree_carrier V) := by
  exact W.local_degree_carrier_nonempty V

theorem YMFiniteLatticeLocalDegreesOfFreedomWitness.to_localDegrees_proof
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeLocalDegreesOfFreedomWitness C) :
    C.localDegreesOfFreedomDefined := by
  exact W.proves_localDegreesOfFreedomDefined

def ymFiniteLatticeLocalDegrees_volume_nonempty_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  Nonempty C.LatticeVolume

def ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  Nonempty C.GaugeFieldConfiguration

def ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  Nonempty C.HilbertSpace

def ymFiniteLatticeLocalDegrees_local_degree_carrier_type
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Type 1 :=
  C.LatticeVolume -> Type

def ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (local_degree_carrier :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_type C) : Prop :=
  forall V : C.LatticeVolume, Nonempty (local_degree_carrier V)

def ymFiniteLatticeLocalDegrees_proves_localDegrees_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.localDegreesOfFreedomDefined

def ymFiniteLatticeLocalDegreesInputStatementNames :
    List String :=
  [ "ymFiniteLatticeLocalDegrees_volume_nonempty_statement"
  , "ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement"
  , "ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement"
  , "ymFiniteLatticeLocalDegrees_local_degree_carrier_type"
  , "ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement"
  , "ymFiniteLatticeLocalDegrees_proves_localDegrees_statement"
  ]

theorem ymFiniteLatticeLocalDegrees_volume_nonempty_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeLocalDegrees_volume_nonempty_statement C =
      Nonempty C.LatticeVolume := by
  rfl

theorem ymFiniteLatticeLocalDegrees_volume_nonempty_from_source_data
    (S : YMFiniteLatticeSourceData)
    (HilbertSpace : Type)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    ymFiniteLatticeLocalDegrees_volume_nonempty_statement
      (S.toHamiltonianDefinitionCertificate
        HilbertSpace
        Hamiltonian
        localDegreesOfFreedomDefined
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) := by
  exact S.latticeVolume_nonempty

theorem ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_from_source_data
    (S : YMFiniteLatticeSourceData)
    (HilbertSpace : Type)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement
      (S.toHamiltonianDefinitionCertificate
        HilbertSpace
        Hamiltonian
        localDegreesOfFreedomDefined
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) := by
  exact S.gaugeFieldConfiguration_nonempty

theorem ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_from_source_data
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement
      (S.toOSHamiltonianDefinitionCertificate
        Hamiltonian
        localDegreesOfFreedomDefined
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) := by
  exact S.hilbertSpace_nonempty

def ymFiniteLatticeLocalDegrees_local_degree_carrier_from_source_data
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    ymFiniteLatticeLocalDegrees_local_degree_carrier_type
      (S.toOSHamiltonianDefinitionCertificate
        Hamiltonian
        localDegreesOfFreedomDefined
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) :=
  S.localDegreeCarrier

theorem
    ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_from_source_data
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement
      (S.toOSHamiltonianDefinitionCertificate
        Hamiltonian
        localDegreesOfFreedomDefined
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction)
      (ymFiniteLatticeLocalDegrees_local_degree_carrier_from_source_data
        S
        Hamiltonian
        localDegreesOfFreedomDefined
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) := by
  exact S.localDegreeCarrier_nonempty

theorem ymFiniteLatticeLocalDegrees_proves_localDegrees_from_source_data
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    ymFiniteLatticeLocalDegrees_proves_localDegrees_statement
      (S.toOSSourceLocalDegreesCertificate
        Hamiltonian
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) := by
  exact S.sourceLocalDegreesOfFreedomDefined_holds

def ymFiniteLatticeLocalDegreesOfFreedomWitness_from_source_data
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (localDegreesOfFreedomDefined : Prop)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop)
    (proves_localDegreesOfFreedomDefined :
      localDegreesOfFreedomDefined) :
    YMFiniteLatticeLocalDegreesOfFreedomWitness
      (S.toOSHamiltonianDefinitionCertificate
        Hamiltonian
        localDegreesOfFreedomDefined
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) :=
  YMFiniteLatticeLocalDegreesOfFreedomWitness.of_fields
    (ymFiniteLatticeLocalDegrees_volume_nonempty_from_source_data
      S
      S.HilbertSpace
      Hamiltonian
      localDegreesOfFreedomDefined
      gaugeCovariantKineticTermDefined
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction)
    (ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_from_source_data
      S
      S.HilbertSpace
      Hamiltonian
      localDegreesOfFreedomDefined
      gaugeCovariantKineticTermDefined
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction)
    (ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_from_source_data
      S
      Hamiltonian
      localDegreesOfFreedomDefined
      gaugeCovariantKineticTermDefined
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction)
    (ymFiniteLatticeLocalDegrees_local_degree_carrier_from_source_data
      S
      Hamiltonian
      localDegreesOfFreedomDefined
      gaugeCovariantKineticTermDefined
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction)
    (ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_from_source_data
      S
      Hamiltonian
      localDegreesOfFreedomDefined
      gaugeCovariantKineticTermDefined
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction)
    proves_localDegreesOfFreedomDefined

def ymFiniteLatticeLocalDegreesOfFreedomWitness_of_source_local_degrees
    (S : YMFiniteLatticeSourceData)
    (Hamiltonian : Type)
    (gaugeCovariantKineticTermDefined : Prop)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeLocalDegreesOfFreedomWitness
      (S.toOSSourceLocalDegreesCertificate
        Hamiltonian
        gaugeCovariantKineticTermDefined
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) :=
  ymFiniteLatticeLocalDegreesOfFreedomWitness_from_source_data
    S
    Hamiltonian
    S.sourceLocalDegreesOfFreedomDefined
    gaugeCovariantKineticTermDefined
    plaquettePotentialTermDefined
    finiteHamiltonianSelfAdjoint
    matchesYangMillsLatticeAction
    (ymFiniteLatticeLocalDegrees_proves_localDegrees_from_source_data
      S
      Hamiltonian
      gaugeCovariantKineticTermDefined
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction)

theorem
    ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement C =
      Nonempty C.GaugeFieldConfiguration := by
  rfl

theorem ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement C =
      Nonempty C.HilbertSpace := by
  rfl

theorem ymFiniteLatticeLocalDegrees_local_degree_carrier_type_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeLocalDegrees_local_degree_carrier_type C =
      (C.LatticeVolume -> Type) := by
  rfl

theorem
    ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (local_degree_carrier :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_type C) :
    ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement
      C local_degree_carrier =
        (forall V : C.LatticeVolume,
          Nonempty (local_degree_carrier V)) := by
  rfl

theorem ymFiniteLatticeLocalDegrees_proves_localDegrees_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeLocalDegrees_proves_localDegrees_statement C =
      C.localDegreesOfFreedomDefined := by
  rfl

theorem ymFiniteLatticeLocalDegreesInputStatementNames_count_eq :
    ymFiniteLatticeLocalDegreesInputStatementNames.length = 6 := by
  rfl

def ymFiniteLatticeLocalDegreesOfFreedomWitness_of_statements
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (volume_nonempty :
      ymFiniteLatticeLocalDegrees_volume_nonempty_statement C)
    (gauge_configuration_nonempty :
      ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement C)
    (hilbert_space_nonempty :
      ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement C)
    (local_degree_carrier :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_type C)
    (local_degree_carrier_nonempty :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement
        C local_degree_carrier)
    (proves_localDegreesOfFreedomDefined :
      ymFiniteLatticeLocalDegrees_proves_localDegrees_statement C) :
    YMFiniteLatticeLocalDegreesOfFreedomWitness C :=
  YMFiniteLatticeLocalDegreesOfFreedomWitness.of_fields
    volume_nonempty
    gauge_configuration_nonempty
    hilbert_space_nonempty
    local_degree_carrier
    local_degree_carrier_nonempty
    proves_localDegreesOfFreedomDefined

theorem
    ymFiniteLatticeLocalDegreesOfFreedomWitness_of_statements_to_proof
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (volume_nonempty :
      ymFiniteLatticeLocalDegrees_volume_nonempty_statement C)
    (gauge_configuration_nonempty :
      ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement C)
    (hilbert_space_nonempty :
      ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement C)
    (local_degree_carrier :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_type C)
    (local_degree_carrier_nonempty :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement
        C local_degree_carrier)
    (proves_localDegreesOfFreedomDefined :
      ymFiniteLatticeLocalDegrees_proves_localDegrees_statement C) :
    (ymFiniteLatticeLocalDegreesOfFreedomWitness_of_statements
      C
      volume_nonempty
      gauge_configuration_nonempty
      hilbert_space_nonempty
      local_degree_carrier
      local_degree_carrier_nonempty
      proves_localDegreesOfFreedomDefined).to_localDegrees_proof =
        proves_localDegreesOfFreedomDefined := by
  rfl

theorem
    ymFiniteLatticeLocalDegreesOfFreedomWitness_of_statements_requires_volume
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (volume_nonempty :
      ymFiniteLatticeLocalDegrees_volume_nonempty_statement C)
    (gauge_configuration_nonempty :
      ymFiniteLatticeLocalDegrees_gauge_configuration_nonempty_statement C)
    (hilbert_space_nonempty :
      ymFiniteLatticeLocalDegrees_hilbert_space_nonempty_statement C)
    (local_degree_carrier :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_type C)
    (local_degree_carrier_nonempty :
      ymFiniteLatticeLocalDegrees_local_degree_carrier_nonempty_statement
        C local_degree_carrier)
    (proves_localDegreesOfFreedomDefined :
      ymFiniteLatticeLocalDegrees_proves_localDegrees_statement C) :
    (ymFiniteLatticeLocalDegreesOfFreedomWitness_of_statements
      C
      volume_nonempty
      gauge_configuration_nonempty
      hilbert_space_nonempty
      local_degree_carrier
      local_degree_carrier_nonempty
      proves_localDegreesOfFreedomDefined).requires_volume_nonempty =
        volume_nonempty := by
  rfl

/-- Typed witness interface for the gauge-covariant kinetic term atom. -/
structure YMFiniteLatticeGaugeCovariantKineticTermWitness
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) where
  hamiltonian_nonempty : Nonempty C.Hamiltonian
  kinetic_term_carrier : Type
  kinetic_term_carrier_nonempty : Nonempty kinetic_term_carrier
  gauge_covariance_law : Prop
  gauge_covariance_verified : gauge_covariance_law
  proves_gaugeCovariantKineticTermDefined :
    C.gaugeCovariantKineticTermDefined

def ymFiniteLatticeGaugeCovariantKineticTermWitnessFields :
    List String :=
  [ "hamiltonian_nonempty"
  , "kinetic_term_carrier"
  , "kinetic_term_carrier_nonempty"
  , "gauge_covariance_law"
  , "gauge_covariance_verified"
  , "proves_gaugeCovariantKineticTermDefined"
  ]

theorem ymFiniteLatticeGaugeCovariantKineticTermWitnessFields_count_eq :
    ymFiniteLatticeGaugeCovariantKineticTermWitnessFields.length = 6 := by
  rfl

theorem
    YMFiniteLatticeGaugeCovariantKineticTermWitness.requires_hamiltonian_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeGaugeCovariantKineticTermWitness C) :
    Nonempty C.Hamiltonian := by
  exact W.hamiltonian_nonempty

theorem
    YMFiniteLatticeGaugeCovariantKineticTermWitness.requires_kinetic_carrier_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeGaugeCovariantKineticTermWitness C) :
    Nonempty W.kinetic_term_carrier := by
  exact W.kinetic_term_carrier_nonempty

theorem
    YMFiniteLatticeGaugeCovariantKineticTermWitness.requires_covariance_law
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeGaugeCovariantKineticTermWitness C) :
    W.gauge_covariance_law := by
  exact W.gauge_covariance_verified

theorem
    YMFiniteLatticeGaugeCovariantKineticTermWitness.to_kineticTerm_proof
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeGaugeCovariantKineticTermWitness C) :
    C.gaugeCovariantKineticTermDefined := by
  exact W.proves_gaugeCovariantKineticTermDefined

theorem
    ymFiniteLatticeGaugeCovariantKineticTerm_proves_kinetic_from_source_data
    (S : YMFiniteLatticeSourceData)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    (S.toOSSourceLocalDegreesKineticCertificate
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction).gaugeCovariantKineticTermDefined := by
  exact S.sourceGaugeCovariantKineticTermDefined_holds

def ymFiniteLatticeGaugeCovariantKineticTermWitness_from_source_data
    (S : YMFiniteLatticeSourceData)
    (plaquettePotentialTermDefined : Prop)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeGaugeCovariantKineticTermWitness
      (S.toOSSourceLocalDegreesKineticCertificate
        plaquettePotentialTermDefined
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) where
  hamiltonian_nonempty := S.hamiltonian_nonempty
  kinetic_term_carrier := S.kineticTermCarrier
  kinetic_term_carrier_nonempty := S.kineticTermCarrier_nonempty
  gauge_covariance_law := S.kineticGaugeCovarianceLaw
  gauge_covariance_verified := S.kineticGaugeCovarianceProof
  proves_gaugeCovariantKineticTermDefined :=
    ymFiniteLatticeGaugeCovariantKineticTerm_proves_kinetic_from_source_data
      S
      plaquettePotentialTermDefined
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction

/-- Typed witness interface for the plaquette-potential atom. -/
structure YMFiniteLatticePlaquettePotentialTermWitness
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) where
  gauge_configuration_nonempty : Nonempty C.GaugeFieldConfiguration
  plaquette_carrier : Type
  plaquette_carrier_nonempty : Nonempty plaquette_carrier
  potential_term_carrier : Type
  potential_term_carrier_nonempty : Nonempty potential_term_carrier
  proves_plaquettePotentialTermDefined :
    C.plaquettePotentialTermDefined

def ymFiniteLatticePlaquettePotentialTermWitnessFields :
    List String :=
  [ "gauge_configuration_nonempty"
  , "plaquette_carrier"
  , "plaquette_carrier_nonempty"
  , "potential_term_carrier"
  , "potential_term_carrier_nonempty"
  , "proves_plaquettePotentialTermDefined"
  ]

theorem ymFiniteLatticePlaquettePotentialTermWitnessFields_count_eq :
    ymFiniteLatticePlaquettePotentialTermWitnessFields.length = 6 := by
  rfl

theorem
    YMFiniteLatticePlaquettePotentialTermWitness.requires_configuration_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticePlaquettePotentialTermWitness C) :
    Nonempty C.GaugeFieldConfiguration := by
  exact W.gauge_configuration_nonempty

theorem
    YMFiniteLatticePlaquettePotentialTermWitness.requires_plaquette_carrier_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticePlaquettePotentialTermWitness C) :
    Nonempty W.plaquette_carrier := by
  exact W.plaquette_carrier_nonempty

theorem
    YMFiniteLatticePlaquettePotentialTermWitness.requires_potential_carrier_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticePlaquettePotentialTermWitness C) :
    Nonempty W.potential_term_carrier := by
  exact W.potential_term_carrier_nonempty

theorem
    YMFiniteLatticePlaquettePotentialTermWitness.to_plaquettePotential_proof
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticePlaquettePotentialTermWitness C) :
    C.plaquettePotentialTermDefined := by
  exact W.proves_plaquettePotentialTermDefined

theorem
    ymFiniteLatticePlaquettePotentialTerm_proves_plaquette_from_source_data
    (S : YMFiniteLatticeSourceData)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    (S.toOSSourceLocalDegreesKineticPlaquetteCertificate
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction).plaquettePotentialTermDefined := by
  exact S.sourcePlaquettePotentialTermDefined_holds

def ymFiniteLatticePlaquettePotentialTermWitness_from_source_data
    (S : YMFiniteLatticeSourceData)
    (finiteHamiltonianSelfAdjoint : Prop)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticePlaquettePotentialTermWitness
      (S.toOSSourceLocalDegreesKineticPlaquetteCertificate
        finiteHamiltonianSelfAdjoint
        matchesYangMillsLatticeAction) where
  gauge_configuration_nonempty := S.gaugeFieldConfiguration_nonempty
  plaquette_carrier := S.plaquetteCarrier
  plaquette_carrier_nonempty := S.plaquetteCarrier_nonempty
  potential_term_carrier := S.potentialTermCarrier
  potential_term_carrier_nonempty := S.potentialTermCarrier_nonempty
  proves_plaquettePotentialTermDefined :=
    ymFiniteLatticePlaquettePotentialTerm_proves_plaquette_from_source_data
      S
      finiteHamiltonianSelfAdjoint
      matchesYangMillsLatticeAction

/-- Typed witness interface for the finite-Hamiltonian self-adjointness atom. -/
structure YMFiniteLatticeHamiltonianSelfAdjointWitness
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) where
  hilbert_space_nonempty : Nonempty C.HilbertSpace
  hamiltonian_nonempty : Nonempty C.Hamiltonian
  operator_domain : Type
  operator_domain_nonempty : Nonempty operator_domain
  self_adjointness_law : Prop
  self_adjointness_verified : self_adjointness_law
  proves_finiteHamiltonianSelfAdjoint :
    C.finiteHamiltonianSelfAdjoint

def ymFiniteLatticeHamiltonianSelfAdjointWitnessFields :
    List String :=
  [ "hilbert_space_nonempty"
  , "hamiltonian_nonempty"
  , "operator_domain"
  , "operator_domain_nonempty"
  , "self_adjointness_law"
  , "self_adjointness_verified"
  , "proves_finiteHamiltonianSelfAdjoint"
  ]

theorem ymFiniteLatticeHamiltonianSelfAdjointWitnessFields_count_eq :
    ymFiniteLatticeHamiltonianSelfAdjointWitnessFields.length = 7 := by
  rfl

theorem
    YMFiniteLatticeHamiltonianSelfAdjointWitness.requires_hilbert_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeHamiltonianSelfAdjointWitness C) :
    Nonempty C.HilbertSpace := by
  exact W.hilbert_space_nonempty

theorem
    YMFiniteLatticeHamiltonianSelfAdjointWitness.requires_hamiltonian_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeHamiltonianSelfAdjointWitness C) :
    Nonempty C.Hamiltonian := by
  exact W.hamiltonian_nonempty

theorem
    YMFiniteLatticeHamiltonianSelfAdjointWitness.requires_domain_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeHamiltonianSelfAdjointWitness C) :
    Nonempty W.operator_domain := by
  exact W.operator_domain_nonempty

theorem
    YMFiniteLatticeHamiltonianSelfAdjointWitness.requires_self_adjointness_law
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeHamiltonianSelfAdjointWitness C) :
    W.self_adjointness_law := by
  exact W.self_adjointness_verified

theorem
    YMFiniteLatticeHamiltonianSelfAdjointWitness.to_selfAdjoint_proof
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeHamiltonianSelfAdjointWitness C) :
    C.finiteHamiltonianSelfAdjoint := by
  exact W.proves_finiteHamiltonianSelfAdjoint

theorem
    ymFiniteLatticeHamiltonianSelfAdjoint_proves_selfAdjoint_from_source_data
    (S : YMFiniteLatticeSourceData)
    (matchesYangMillsLatticeAction : Prop) :
    (S.toOSSourceLocalDegreesKineticPlaquetteSelfAdjointCertificate
      matchesYangMillsLatticeAction).finiteHamiltonianSelfAdjoint := by
  exact S.sourceFiniteHamiltonianSelfAdjoint_holds

def ymFiniteLatticeHamiltonianSelfAdjointWitness_from_source_data
    (S : YMFiniteLatticeSourceData)
    (matchesYangMillsLatticeAction : Prop) :
    YMFiniteLatticeHamiltonianSelfAdjointWitness
      (S.toOSSourceLocalDegreesKineticPlaquetteSelfAdjointCertificate
        matchesYangMillsLatticeAction) where
  hilbert_space_nonempty := S.hilbertSpace_nonempty
  hamiltonian_nonempty := S.hamiltonian_nonempty
  operator_domain := S.operatorDomain
  operator_domain_nonempty := S.operatorDomain_nonempty
  self_adjointness_law := S.selfAdjointnessLaw
  self_adjointness_verified := S.selfAdjointnessProof
  proves_finiteHamiltonianSelfAdjoint :=
    ymFiniteLatticeHamiltonianSelfAdjoint_proves_selfAdjoint_from_source_data
      S
      matchesYangMillsLatticeAction

/-- Typed witness interface for the action-matching atom. -/
structure YMFiniteLatticeMatchesYangMillsActionWitness
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) where
  hamiltonian_nonempty : Nonempty C.Hamiltonian
  lattice_action_carrier : Type
  lattice_action_carrier_nonempty : Nonempty lattice_action_carrier
  action_matching_law : Prop
  action_matching_verified : action_matching_law
  proves_matchesYangMillsLatticeAction :
    C.matchesYangMillsLatticeAction

def ymFiniteLatticeMatchesYangMillsActionWitnessFields :
    List String :=
  [ "hamiltonian_nonempty"
  , "lattice_action_carrier"
  , "lattice_action_carrier_nonempty"
  , "action_matching_law"
  , "action_matching_verified"
  , "proves_matchesYangMillsLatticeAction"
  ]

theorem ymFiniteLatticeMatchesYangMillsActionWitnessFields_count_eq :
    ymFiniteLatticeMatchesYangMillsActionWitnessFields.length = 6 := by
  rfl

theorem
    YMFiniteLatticeMatchesYangMillsActionWitness.requires_hamiltonian_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeMatchesYangMillsActionWitness C) :
    Nonempty C.Hamiltonian := by
  exact W.hamiltonian_nonempty

theorem
    YMFiniteLatticeMatchesYangMillsActionWitness.requires_action_carrier_nonempty
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeMatchesYangMillsActionWitness C) :
    Nonempty W.lattice_action_carrier := by
  exact W.lattice_action_carrier_nonempty

theorem
    YMFiniteLatticeMatchesYangMillsActionWitness.requires_action_matching_law
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeMatchesYangMillsActionWitness C) :
    W.action_matching_law := by
  exact W.action_matching_verified

theorem
    YMFiniteLatticeMatchesYangMillsActionWitness.to_matchesAction_proof
    {C : YMFiniteLatticeHamiltonianDefinitionCertificate}
    (W : YMFiniteLatticeMatchesYangMillsActionWitness C) :
    C.matchesYangMillsLatticeAction := by
  exact W.proves_matchesYangMillsLatticeAction

theorem
    ymFiniteLatticeMatchesYangMillsAction_proves_matchesAction_from_source_data
    (S : YMFiniteLatticeSourceData) :
    S.toOSSourceHamiltonianDefinitionCertificate.matchesYangMillsLatticeAction := by
  exact S.sourceMatchesYangMillsLatticeAction_holds

def ymFiniteLatticeMatchesYangMillsActionWitness_from_source_data
    (S : YMFiniteLatticeSourceData) :
    YMFiniteLatticeMatchesYangMillsActionWitness
      S.toOSSourceHamiltonianDefinitionCertificate where
  hamiltonian_nonempty := S.hamiltonian_nonempty
  lattice_action_carrier := S.latticeActionCarrier
  lattice_action_carrier_nonempty := S.latticeActionCarrier_nonempty
  action_matching_law := S.actionMatchingLaw
  action_matching_verified := S.actionMatchingProof
  proves_matchesYangMillsLatticeAction :=
    ymFiniteLatticeMatchesYangMillsAction_proves_matchesAction_from_source_data S

def ymFiniteLatticeHamiltonianDefinitionProofObligations : List String :=
  [ "localDegreesOfFreedomDefined"
  , "gaugeCovariantKineticTermDefined"
  , "plaquettePotentialTermDefined"
  , "finiteHamiltonianSelfAdjoint"
  , "matchesYangMillsLatticeAction"
  ]

structure YMFiniteLatticeHamiltonianDefinitionCertificateFieldTarget where
  proofObligation : String
  certificateField : String
  closureProjection : String
  suppliedInLean : Bool

def ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets :
    List YMFiniteLatticeHamiltonianDefinitionCertificateFieldTarget :=
  [ { proofObligation := "localDegreesOfFreedomDefined"
      certificateField := "localDegreesOfFreedomDefined"
      closureProjection :=
        "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_localDegrees"
      suppliedInLean := false }
  , { proofObligation := "gaugeCovariantKineticTermDefined"
      certificateField := "gaugeCovariantKineticTermDefined"
      closureProjection :=
        "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_kinetic"
      suppliedInLean := false }
  , { proofObligation := "plaquettePotentialTermDefined"
      certificateField := "plaquettePotentialTermDefined"
      closureProjection :=
        "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_plaquette"
      suppliedInLean := false }
  , { proofObligation := "finiteHamiltonianSelfAdjoint"
      certificateField := "finiteHamiltonianSelfAdjoint"
      closureProjection :=
        "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_selfAdjoint"
      suppliedInLean := false }
  , { proofObligation := "matchesYangMillsLatticeAction"
      certificateField := "matchesYangMillsLatticeAction"
      closureProjection :=
        "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_matchesAction"
      suppliedInLean := false }
  ]

def ymFiniteLatticeHamiltonianDefinitionCertificateTargetObligations :
    List String :=
  ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets.map
    (fun T => T.proofObligation)

def ymFiniteLatticeHamiltonianDefinitionCertificateTargetFields :
    List String :=
  ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets.map
    (fun T => T.certificateField)

def ymFiniteLatticeHamiltonianDefinitionCertificateTargetProjections :
    List String :=
  ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets.map
    (fun T => T.closureProjection)

def ymFiniteLatticeHamiltonianDefinitionCertificateTargetSuppliedFlags :
    List Bool :=
  ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets.map
    (fun T => T.suppliedInLean)

theorem ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets_count_eq :
    ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets.length = 5 := by
  rfl

theorem ymFiniteLatticeHamiltonianDefinitionCertificateTargetObligations_eq :
    ymFiniteLatticeHamiltonianDefinitionCertificateTargetObligations =
      ymFiniteLatticeHamiltonianDefinitionProofObligations := by
  rfl

theorem ymFiniteLatticeHamiltonianDefinitionCertificateTargetFields_eq :
    ymFiniteLatticeHamiltonianDefinitionCertificateTargetFields =
      [ "localDegreesOfFreedomDefined"
      , "gaugeCovariantKineticTermDefined"
      , "plaquettePotentialTermDefined"
      , "finiteHamiltonianSelfAdjoint"
      , "matchesYangMillsLatticeAction"
      ] := by
  rfl

theorem ymFiniteLatticeHamiltonianDefinitionCertificateTargetProjections_eq :
    ymFiniteLatticeHamiltonianDefinitionCertificateTargetProjections =
      [ "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_localDegrees"
      , "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_kinetic"
      , "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_plaquette"
      , "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_selfAdjoint"
      , "YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_matchesAction"
      ] := by
  rfl

theorem ymFiniteLatticeHamiltonianDefinitionCertificateTargetSuppliedFlags_eq :
    ymFiniteLatticeHamiltonianDefinitionCertificateTargetSuppliedFlags =
      [false, false, false, false, false] := by
  rfl

def ymFiniteLatticeHamiltonianDefinitionCertificateTargetsAllSuppliedBool :
    Bool :=
  ymFiniteLatticeHamiltonianDefinitionCertificateFieldTargets.all
    (fun T => T.suppliedInLean)

theorem ymFiniteLatticeHamiltonianDefinitionCertificateTargetsAllSuppliedBool_eq_false :
    ymFiniteLatticeHamiltonianDefinitionCertificateTargetsAllSuppliedBool =
      false := by
  rfl

theorem ymFiniteLatticeHamiltonianDefinitionProofObligations_count_eq :
    ymFiniteLatticeHamiltonianDefinitionProofObligations.length = 5 := by
  rfl

def ymFiniteLatticeHamiltonianDefinitionProofObligationsPopulatedBool :
    Bool :=
  ymFiniteLatticeHamiltonianDefinitionProofObligations.all
    (fun field => !field.isEmpty)

theorem ymFiniteLatticeHamiltonianDefinitionProofObligationsPopulatedBool_eq_true :
    ymFiniteLatticeHamiltonianDefinitionProofObligationsPopulatedBool = true := by
  rfl

def ymFiniteLatticeHamiltonianDefinition_localDegreesOfFreedomDefined_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.localDegreesOfFreedomDefined

def ymFiniteLatticeHamiltonianDefinition_gaugeCovariantKineticTermDefined_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.gaugeCovariantKineticTermDefined

def ymFiniteLatticeHamiltonianDefinition_plaquettePotentialTermDefined_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.plaquettePotentialTermDefined

def ymFiniteLatticeHamiltonianDefinition_finiteHamiltonianSelfAdjoint_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.finiteHamiltonianSelfAdjoint

def ymFiniteLatticeHamiltonianDefinition_matchesYangMillsLatticeAction_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.matchesYangMillsLatticeAction

def ymFiniteLatticeHamiltonianDefinitionCertificateStatementNames :
    List String :=
  [ "ymFiniteLatticeHamiltonianDefinition_localDegreesOfFreedomDefined_statement"
  , "ymFiniteLatticeHamiltonianDefinition_gaugeCovariantKineticTermDefined_statement"
  , "ymFiniteLatticeHamiltonianDefinition_plaquettePotentialTermDefined_statement"
  , "ymFiniteLatticeHamiltonianDefinition_finiteHamiltonianSelfAdjoint_statement"
  , "ymFiniteLatticeHamiltonianDefinition_matchesYangMillsLatticeAction_statement"
  ]

theorem
    ymFiniteLatticeHamiltonianDefinition_localDegreesOfFreedomDefined_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeHamiltonianDefinition_localDegreesOfFreedomDefined_statement C =
      C.localDegreesOfFreedomDefined := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinition_gaugeCovariantKineticTermDefined_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeHamiltonianDefinition_gaugeCovariantKineticTermDefined_statement C =
      C.gaugeCovariantKineticTermDefined := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinition_plaquettePotentialTermDefined_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeHamiltonianDefinition_plaquettePotentialTermDefined_statement C =
      C.plaquettePotentialTermDefined := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinition_finiteHamiltonianSelfAdjoint_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeHamiltonianDefinition_finiteHamiltonianSelfAdjoint_statement C =
      C.finiteHamiltonianSelfAdjoint := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinition_matchesYangMillsLatticeAction_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeHamiltonianDefinition_matchesYangMillsLatticeAction_statement C =
      C.matchesYangMillsLatticeAction := by
  rfl

theorem ymFiniteLatticeHamiltonianDefinitionCertificateStatementNames_count_eq :
    ymFiniteLatticeHamiltonianDefinitionCertificateStatementNames.length =
      5 := by
  rfl

theorem YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_localDegrees :
    forall C : YMFiniteLatticeHamiltonianDefinitionCertificate,
      C.closed -> C.localDegreesOfFreedomDefined := by
  intro C h
  exact h.left

theorem YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_kinetic :
    forall C : YMFiniteLatticeHamiltonianDefinitionCertificate,
      C.closed -> C.gaugeCovariantKineticTermDefined := by
  intro C h
  exact h.right.left

theorem YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_plaquette :
    forall C : YMFiniteLatticeHamiltonianDefinitionCertificate,
      C.closed -> C.plaquettePotentialTermDefined := by
  intro C h
  exact h.right.right.left

theorem YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_selfAdjoint :
    forall C : YMFiniteLatticeHamiltonianDefinitionCertificate,
      C.closed -> C.finiteHamiltonianSelfAdjoint := by
  intro C h
  exact h.right.right.right.left

theorem YMFiniteLatticeHamiltonianDefinitionCertificate.closed_requires_matchesAction :
    forall C : YMFiniteLatticeHamiltonianDefinitionCertificate,
      C.closed -> C.matchesYangMillsLatticeAction := by
  intro C h
  exact h.right.right.right.right

theorem YMFiniteLatticeHamiltonianDefinitionCertificate.closed_of_fields
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (hLocal : C.localDegreesOfFreedomDefined)
    (hKinetic : C.gaugeCovariantKineticTermDefined)
    (hPlaquette : C.plaquettePotentialTermDefined)
    (hSelfAdjoint : C.finiteHamiltonianSelfAdjoint)
    (hMatchesAction : C.matchesYangMillsLatticeAction) :
    C.closed := by
  exact
    And.intro hLocal <|
      And.intro hKinetic <|
        And.intro hPlaquette <|
          And.intro hSelfAdjoint hMatchesAction

/--
Bridge target from the Hamiltonian-definition certificate to the existing
uniform fixed-lattice spectral-gap payload.

The current Lean tree already has `YMUniformFixedLatticeRealSpectralGap` as
the spectral target for Route 1.  This bridge records the next proof-bearing
interface: the paper's finite-lattice Hamiltonian construction must provide a
closed Hamiltonian-definition certificate and show that its Hamiltonian is the
one used by the uniform spectral payload.
-/
structure YMFiniteLatticeHamiltonianDefinitionSpectralBridge where
  hamiltonian_certificate :
    YMFiniteLatticeHamiltonianDefinitionCertificate
  spectral_payload :
    YMUniformFixedLatticeRealSpectralGap
  hamiltonian_certificate_closed :
    hamiltonian_certificate.closed
  spectral_payload_nonempty_volume :
    Nonempty spectral_payload.Volume
  hamiltonian_matches_spectral_payload :
    Prop
  hamiltonian_matches_spectral_payload_verified :
    hamiltonian_matches_spectral_payload

def ymFiniteLatticeHamiltonianDefinitionSpectralBridge_hamiltonianCertificate_target :
    Type 1 :=
  YMFiniteLatticeHamiltonianDefinitionCertificate

def ymFiniteLatticeHamiltonianDefinitionSpectralBridge_spectralPayload_target :
    Type 1 :=
  YMUniformFixedLatticeRealSpectralGap

def ymFiniteLatticeHamiltonianDefinitionSpectralBridge_certificateClosed_statement
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) : Prop :=
  C.closed

def ymFiniteLatticeHamiltonianDefinitionSpectralBridge_nonemptyVolume_statement
    (S : YMUniformFixedLatticeRealSpectralGap) : Prop :=
  Nonempty S.Volume

def ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchStatement_target
    (_C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (_S : YMUniformFixedLatticeRealSpectralGap) : Type :=
  Prop

def ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchVerified_statement
    (hMatches : Prop) : Prop :=
  hMatches

def ymFiniteLatticeHamiltonianDefinitionSpectralBridgeObjectTargetNames :
    List String :=
  [ "ymFiniteLatticeHamiltonianDefinitionSpectralBridge_hamiltonianCertificate_target"
  , "ymFiniteLatticeHamiltonianDefinitionSpectralBridge_spectralPayload_target"
  ]

def ymFiniteLatticeHamiltonianDefinitionSpectralBridgePropStatementNames :
    List String :=
  [ "ymFiniteLatticeHamiltonianDefinitionSpectralBridge_certificateClosed_statement"
  , "ymFiniteLatticeHamiltonianDefinitionSpectralBridge_nonemptyVolume_statement"
  , "ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchStatement_target"
  , "ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchVerified_statement"
  ]

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_hamiltonianCertificate_target_eq :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_hamiltonianCertificate_target =
      YMFiniteLatticeHamiltonianDefinitionCertificate := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_spectralPayload_target_eq :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_spectralPayload_target =
      YMUniformFixedLatticeRealSpectralGap := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_certificateClosed_statement_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_certificateClosed_statement C =
      C.closed := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_nonemptyVolume_statement_eq
    (S : YMUniformFixedLatticeRealSpectralGap) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_nonemptyVolume_statement S =
      Nonempty S.Volume := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchStatement_target_eq
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (S : YMUniformFixedLatticeRealSpectralGap) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchStatement_target C S =
      Prop := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchVerified_statement_eq
    (hMatches : Prop) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridge_matchVerified_statement hMatches =
      hMatches := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeObjectTargetNames_count_eq :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeObjectTargetNames.length =
      2 := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgePropStatementNames_count_eq :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgePropStatementNames.length =
      4 := by
  rfl

def YMFiniteLatticeHamiltonianDefinitionSpectralBridge.closed
    (B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge) :
    Prop :=
  B.hamiltonian_certificate.closed /\
    Nonempty B.spectral_payload.Volume /\
    B.hamiltonian_matches_spectral_payload

theorem YMFiniteLatticeHamiltonianDefinitionSpectralBridge.closed_holds
    (B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge) :
    B.closed := by
  exact
    And.intro B.hamiltonian_certificate_closed <|
      And.intro
        B.spectral_payload_nonempty_volume
        B.hamiltonian_matches_spectral_payload_verified

theorem YMFiniteLatticeHamiltonianDefinitionSpectralBridge.requires_certificate_closed
    (B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge) :
    B.hamiltonian_certificate.closed := by
  exact B.hamiltonian_certificate_closed

theorem YMFiniteLatticeHamiltonianDefinitionSpectralBridge.requires_spectral_payload_volume
    (B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge) :
    Nonempty B.spectral_payload.Volume := by
  exact B.spectral_payload_nonempty_volume

theorem YMFiniteLatticeHamiltonianDefinitionSpectralBridge.requires_hamiltonian_match
    (B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge) :
    B.hamiltonian_matches_spectral_payload := by
  exact B.hamiltonian_matches_spectral_payload_verified

def ymFiniteLatticeHamiltonianDefinitionSpectralBridgeRequiredFields :
    List String :=
  [ "hamiltonian_certificate"
  , "spectral_payload"
  , "hamiltonian_certificate_closed"
  , "spectral_payload_nonempty_volume"
  , "hamiltonian_matches_spectral_payload"
  , "hamiltonian_matches_spectral_payload_verified"
  ]

theorem ymFiniteLatticeHamiltonianDefinitionSpectralBridgeRequiredFields_count_eq :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeRequiredFields.length =
      6 := by
  rfl

def ymFiniteLatticeHamiltonianDefinitionSpectralBridgeCurrentlyClosedBool :
    Bool :=
  false

theorem ymFiniteLatticeHamiltonianDefinitionSpectralBridgeCurrentlyClosedBool_eq_false :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeCurrentlyClosedBool =
      false := by
  rfl

def ymFiniteLatticeHamiltonianDefinitionRequiredFields : List String :=
  [ "LatticeVolume"
  , "GaugeFieldConfiguration"
  , "HilbertSpace"
  , "Hamiltonian"
  , "localDegreesOfFreedomDefined"
  , "gaugeCovariantKineticTermDefined"
  , "plaquettePotentialTermDefined"
  , "finiteHamiltonianSelfAdjoint"
  , "matchesYangMillsLatticeAction"
  ]

theorem ymFiniteLatticeHamiltonianDefinitionRequiredFields_count_eq :
    ymFiniteLatticeHamiltonianDefinitionRequiredFields.length = 9 := by
  rfl

def ymFiniteLatticeHamiltonianDefinitionRequiredFieldsPopulatedBool :
    Bool :=
  ymFiniteLatticeHamiltonianDefinitionRequiredFields.all
    (fun field => !field.isEmpty)

theorem ymFiniteLatticeHamiltonianDefinitionRequiredFieldsPopulatedBool_eq_true :
    ymFiniteLatticeHamiltonianDefinitionRequiredFieldsPopulatedBool = true := by
  rfl

def ymFiniteLatticeHamiltonianDefinitionCurrentlyClosedBool : Bool :=
  false

theorem ymFiniteLatticeHamiltonianDefinitionCurrentlyClosedBool_eq_false :
    ymFiniteLatticeHamiltonianDefinitionCurrentlyClosedBool = false := by
  rfl

/--
The certificate gate for closing the first fixed-lattice subobligation.

A future proof must provide an actual certificate whose fields satisfy
`YMFiniteLatticeHamiltonianDefinitionCertificate.closed`; this ledger only
names that target.
-/
def ymFiniteLatticeHamiltonianDefinitionClosureCertificate : Prop :=
  Nonempty
    { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
      C.closed }

theorem ymFiniteLatticeHamiltonianDefinitionClosureCertificate_of_closed
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (hC : C.closed) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact ⟨⟨C, hC⟩⟩

theorem ymFiniteLatticeHamiltonianDefinitionClosureCertificate_of_fields
    (C : YMFiniteLatticeHamiltonianDefinitionCertificate)
    (hLocal : C.localDegreesOfFreedomDefined)
    (hKinetic : C.gaugeCovariantKineticTermDefined)
    (hPlaquette : C.plaquettePotentialTermDefined)
    (hSelfAdjoint : C.finiteHamiltonianSelfAdjoint)
    (hMatchesAction : C.matchesYangMillsLatticeAction) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate_of_closed C
      (YMFiniteLatticeHamiltonianDefinitionCertificate.closed_of_fields
        C hLocal hKinetic hPlaquette hSelfAdjoint hMatchesAction)

structure YMFiniteLatticeHamiltonianDefinitionProofPackage where
  certificate : YMFiniteLatticeHamiltonianDefinitionCertificate
  localDegreesOfFreedomDefined_proof :
    certificate.localDegreesOfFreedomDefined
  gaugeCovariantKineticTermDefined_proof :
    certificate.gaugeCovariantKineticTermDefined
  plaquettePotentialTermDefined_proof :
    certificate.plaquettePotentialTermDefined
  finiteHamiltonianSelfAdjoint_proof :
    certificate.finiteHamiltonianSelfAdjoint
  matchesYangMillsLatticeAction_proof :
    certificate.matchesYangMillsLatticeAction

def YMFiniteLatticeHamiltonianDefinitionProofPackage.closed
    (P : YMFiniteLatticeHamiltonianDefinitionProofPackage) :
    Prop :=
  P.certificate.closed

theorem YMFiniteLatticeHamiltonianDefinitionProofPackage.closed_holds
    (P : YMFiniteLatticeHamiltonianDefinitionProofPackage) :
    P.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionCertificate.closed_of_fields
      P.certificate
      P.localDegreesOfFreedomDefined_proof
      P.gaugeCovariantKineticTermDefined_proof
      P.plaquettePotentialTermDefined_proof
      P.finiteHamiltonianSelfAdjoint_proof
      P.matchesYangMillsLatticeAction_proof

theorem
    YMFiniteLatticeHamiltonianDefinitionProofPackage.to_closure_certificate
    (P : YMFiniteLatticeHamiltonianDefinitionProofPackage) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate_of_closed
      P.certificate
      (YMFiniteLatticeHamiltonianDefinitionProofPackage.closed_holds P)

def ymFiniteLatticeHamiltonianDefinitionProofPackageFields :
    List String :=
  [ "certificate"
  , "localDegreesOfFreedomDefined_proof"
  , "gaugeCovariantKineticTermDefined_proof"
  , "plaquettePotentialTermDefined_proof"
  , "finiteHamiltonianSelfAdjoint_proof"
  , "matchesYangMillsLatticeAction_proof"
  ]

theorem ymFiniteLatticeHamiltonianDefinitionProofPackageFields_count_eq :
    ymFiniteLatticeHamiltonianDefinitionProofPackageFields.length = 6 := by
  rfl

/--
Unpacked constructor-surface witness for the Hamiltonian-definition proof
package.

The five proof fields depend on the chosen certificate, so their links back
to the source package are recorded heterogeneously.
-/
structure YMFiniteLatticeHamiltonianDefinitionProofPackageConstructorWitnesses
    where
  source : YMFiniteLatticeHamiltonianDefinitionProofPackage
  certificate : YMFiniteLatticeHamiltonianDefinitionCertificate
  localDegreesOfFreedomDefined_proof :
    certificate.localDegreesOfFreedomDefined
  gaugeCovariantKineticTermDefined_proof :
    certificate.gaugeCovariantKineticTermDefined
  plaquettePotentialTermDefined_proof :
    certificate.plaquettePotentialTermDefined
  finiteHamiltonianSelfAdjoint_proof :
    certificate.finiteHamiltonianSelfAdjoint
  matchesYangMillsLatticeAction_proof :
    certificate.matchesYangMillsLatticeAction
  certificate_eq_source :
    certificate = source.certificate
  localDegreesOfFreedomDefined_proof_eq_source :
    HEq localDegreesOfFreedomDefined_proof
      source.localDegreesOfFreedomDefined_proof
  gaugeCovariantKineticTermDefined_proof_eq_source :
    HEq gaugeCovariantKineticTermDefined_proof
      source.gaugeCovariantKineticTermDefined_proof
  plaquettePotentialTermDefined_proof_eq_source :
    HEq plaquettePotentialTermDefined_proof
      source.plaquettePotentialTermDefined_proof
  finiteHamiltonianSelfAdjoint_proof_eq_source :
    HEq finiteHamiltonianSelfAdjoint_proof
      source.finiteHamiltonianSelfAdjoint_proof
  matchesYangMillsLatticeAction_proof_eq_source :
    HEq matchesYangMillsLatticeAction_proof
      source.matchesYangMillsLatticeAction_proof

def YMFiniteLatticeHamiltonianDefinitionProofPackage.constructorWitnesses
    (P : YMFiniteLatticeHamiltonianDefinitionProofPackage) :
    YMFiniteLatticeHamiltonianDefinitionProofPackageConstructorWitnesses
    where
  source := P
  certificate := P.certificate
  localDegreesOfFreedomDefined_proof :=
    P.localDegreesOfFreedomDefined_proof
  gaugeCovariantKineticTermDefined_proof :=
    P.gaugeCovariantKineticTermDefined_proof
  plaquettePotentialTermDefined_proof :=
    P.plaquettePotentialTermDefined_proof
  finiteHamiltonianSelfAdjoint_proof :=
    P.finiteHamiltonianSelfAdjoint_proof
  matchesYangMillsLatticeAction_proof :=
    P.matchesYangMillsLatticeAction_proof
  certificate_eq_source := rfl
  localDegreesOfFreedomDefined_proof_eq_source := HEq.rfl
  gaugeCovariantKineticTermDefined_proof_eq_source := HEq.rfl
  plaquettePotentialTermDefined_proof_eq_source := HEq.rfl
  finiteHamiltonianSelfAdjoint_proof_eq_source := HEq.rfl
  matchesYangMillsLatticeAction_proof_eq_source := HEq.rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionProofPackageConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty YMFiniteLatticeHamiltonianDefinitionProofPackage) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionProofPackageConstructorWitnesses := by
  rcases hPackage with ⟨P⟩
  exact ⟨P.constructorWitnesses⟩

theorem
    ymFiniteLatticeHamiltonianDefinitionProofPackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionProofPackageConstructorWitnesses) :
    Nonempty YMFiniteLatticeHamiltonianDefinitionProofPackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate_of_proofPackageConstructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionProofPackageConstructorWitnesses) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_closure_certificate

structure YMFiniteLatticeHamiltonianDefinitionWitnessPackage where
  certificate : YMFiniteLatticeHamiltonianDefinitionCertificate
  local_degrees :
    YMFiniteLatticeLocalDegreesOfFreedomWitness certificate
  kinetic_term :
    YMFiniteLatticeGaugeCovariantKineticTermWitness certificate
  plaquette_potential :
    YMFiniteLatticePlaquettePotentialTermWitness certificate
  self_adjointness :
    YMFiniteLatticeHamiltonianSelfAdjointWitness certificate
  action_matching :
    YMFiniteLatticeMatchesYangMillsActionWitness certificate

def YMFiniteLatticeHamiltonianDefinitionWitnessPackage.to_proof_package
    (W : YMFiniteLatticeHamiltonianDefinitionWitnessPackage) :
    YMFiniteLatticeHamiltonianDefinitionProofPackage where
  certificate := W.certificate
  localDegreesOfFreedomDefined_proof :=
    W.local_degrees.to_localDegrees_proof
  gaugeCovariantKineticTermDefined_proof :=
    W.kinetic_term.to_kineticTerm_proof
  plaquettePotentialTermDefined_proof :=
    W.plaquette_potential.to_plaquettePotential_proof
  finiteHamiltonianSelfAdjoint_proof :=
    W.self_adjointness.to_selfAdjoint_proof
  matchesYangMillsLatticeAction_proof :=
    W.action_matching.to_matchesAction_proof

theorem YMFiniteLatticeHamiltonianDefinitionWitnessPackage.closed
    (W : YMFiniteLatticeHamiltonianDefinitionWitnessPackage) :
    W.certificate.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionProofPackage.closed_holds
      W.to_proof_package

def YMFiniteLatticeSourceData.sourceHamiltonianDefinitionWitnessPackage
    (S : YMFiniteLatticeSourceData) :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage where
  certificate := S.toOSSourceHamiltonianDefinitionCertificate
  local_degrees := {
    volume_nonempty := S.latticeVolume_nonempty
    gauge_configuration_nonempty := S.gaugeFieldConfiguration_nonempty
    hilbert_space_nonempty := S.hilbertSpace_nonempty
    local_degree_carrier := S.localDegreeCarrier
    local_degree_carrier_nonempty := S.localDegreeCarrier_nonempty
    proves_localDegreesOfFreedomDefined :=
      S.sourceLocalDegreesOfFreedomDefined_holds
  }
  kinetic_term := {
    hamiltonian_nonempty := S.hamiltonian_nonempty
    kinetic_term_carrier := S.kineticTermCarrier
    kinetic_term_carrier_nonempty := S.kineticTermCarrier_nonempty
    gauge_covariance_law := S.kineticGaugeCovarianceLaw
    gauge_covariance_verified := S.kineticGaugeCovarianceProof
    proves_gaugeCovariantKineticTermDefined :=
      S.sourceGaugeCovariantKineticTermDefined_holds
  }
  plaquette_potential := {
    gauge_configuration_nonempty := S.gaugeFieldConfiguration_nonempty
    plaquette_carrier := S.plaquetteCarrier
    plaquette_carrier_nonempty := S.plaquetteCarrier_nonempty
    potential_term_carrier := S.potentialTermCarrier
    potential_term_carrier_nonempty := S.potentialTermCarrier_nonempty
    proves_plaquettePotentialTermDefined :=
      S.sourcePlaquettePotentialTermDefined_holds
  }
  self_adjointness := {
    hilbert_space_nonempty := S.hilbertSpace_nonempty
    hamiltonian_nonempty := S.hamiltonian_nonempty
    operator_domain := S.operatorDomain
    operator_domain_nonempty := S.operatorDomain_nonempty
    self_adjointness_law := S.selfAdjointnessLaw
    self_adjointness_verified := S.selfAdjointnessProof
    proves_finiteHamiltonianSelfAdjoint :=
      S.sourceFiniteHamiltonianSelfAdjoint_holds
  }
  action_matching := {
    hamiltonian_nonempty := S.hamiltonian_nonempty
    lattice_action_carrier := S.latticeActionCarrier
    lattice_action_carrier_nonempty := S.latticeActionCarrier_nonempty
    action_matching_law := S.actionMatchingLaw
    action_matching_verified := S.actionMatchingProof
    proves_matchesYangMillsLatticeAction :=
      S.sourceMatchesYangMillsLatticeAction_holds
  }

theorem YMFiniteLatticeSourceData.sourceHamiltonianDefinitionCertificate_closed_holds
    (S : YMFiniteLatticeSourceData) :
    S.toOSSourceHamiltonianDefinitionCertificate.closed := by
  exact S.sourceHamiltonianDefinitionWitnessPackage.closed

theorem
    YMFiniteLatticeSourceData.sourceHamiltonianDefinitionClosureCertificate_holds
    (S : YMFiniteLatticeSourceData) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate_of_closed
      S.toOSSourceHamiltonianDefinitionCertificate
      S.sourceHamiltonianDefinitionCertificate_closed_holds

theorem
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage.to_closure_certificate
    (W : YMFiniteLatticeHamiltonianDefinitionWitnessPackage) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    YMFiniteLatticeHamiltonianDefinitionProofPackage.to_closure_certificate
      W.to_proof_package

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageFields :
    List String :=
  [ "certificate"
  , "local_degrees"
  , "kinetic_term"
  , "plaquette_potential"
  , "self_adjointness"
  , "action_matching"
  ]

theorem ymFiniteLatticeHamiltonianDefinitionWitnessPackageFields_count_eq :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageFields.length = 6 := by
  rfl

/--
Unpacked constructor-surface witness for the Hamiltonian-definition witness
package.

All five component witnesses depend on the selected certificate, so component
links back to the source package are recorded heterogeneously.
-/
structure YMFiniteLatticeHamiltonianDefinitionWitnessPackageConstructorWitnesses
    where
  source : YMFiniteLatticeHamiltonianDefinitionWitnessPackage
  certificate : YMFiniteLatticeHamiltonianDefinitionCertificate
  local_degrees :
    YMFiniteLatticeLocalDegreesOfFreedomWitness certificate
  kinetic_term :
    YMFiniteLatticeGaugeCovariantKineticTermWitness certificate
  plaquette_potential :
    YMFiniteLatticePlaquettePotentialTermWitness certificate
  self_adjointness :
    YMFiniteLatticeHamiltonianSelfAdjointWitness certificate
  action_matching :
    YMFiniteLatticeMatchesYangMillsActionWitness certificate
  certificate_eq_source :
    certificate = source.certificate
  local_degrees_eq_source :
    HEq local_degrees source.local_degrees
  kinetic_term_eq_source :
    HEq kinetic_term source.kinetic_term
  plaquette_potential_eq_source :
    HEq plaquette_potential source.plaquette_potential
  self_adjointness_eq_source :
    HEq self_adjointness source.self_adjointness
  action_matching_eq_source :
    HEq action_matching source.action_matching

def YMFiniteLatticeHamiltonianDefinitionWitnessPackage.constructorWitnesses
    (W : YMFiniteLatticeHamiltonianDefinitionWitnessPackage) :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackageConstructorWitnesses
    where
  source := W
  certificate := W.certificate
  local_degrees := W.local_degrees
  kinetic_term := W.kinetic_term
  plaquette_potential := W.plaquette_potential
  self_adjointness := W.self_adjointness
  action_matching := W.action_matching
  certificate_eq_source := rfl
  local_degrees_eq_source := HEq.rfl
  kinetic_term_eq_source := HEq.rfl
  plaquette_potential_eq_source := HEq.rfl
  self_adjointness_eq_source := HEq.rfl
  action_matching_eq_source := HEq.rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty YMFiniteLatticeHamiltonianDefinitionWitnessPackage) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionWitnessPackageConstructorWitnesses := by
  rcases hPackage with ⟨W⟩
  exact ⟨W.constructorWitnesses⟩

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionWitnessPackageConstructorWitnesses) :
    Nonempty YMFiniteLatticeHamiltonianDefinitionWitnessPackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate_of_witnessPackageConstructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionWitnessPackageConstructorWitnesses) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_closure_certificate

/--
Component inventory for the witness package required by the first exact
hypothesis map.

This is an audit checklist only.  It names the five typed witness objects that
must be constructed from the source papers before a real
`YMFiniteLatticeHamiltonianDefinitionWitnessPackage` can be supplied.
-/
structure YMFiniteLatticeHamiltonianDefinitionWitnessPackageComponent where
  packageField : String
  witnessType : String
  proofProjection : String
  certificateField : String
  suppliedInLean : Bool

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents :
    List YMFiniteLatticeHamiltonianDefinitionWitnessPackageComponent :=
  [ { packageField := "local_degrees"
      witnessType := "YMFiniteLatticeLocalDegreesOfFreedomWitness"
      proofProjection :=
        "YMFiniteLatticeLocalDegreesOfFreedomWitness.to_localDegrees_proof"
      certificateField := "localDegreesOfFreedomDefined"
      suppliedInLean := false }
  , { packageField := "kinetic_term"
      witnessType := "YMFiniteLatticeGaugeCovariantKineticTermWitness"
      proofProjection :=
        "YMFiniteLatticeGaugeCovariantKineticTermWitness.to_kineticTerm_proof"
      certificateField := "gaugeCovariantKineticTermDefined"
      suppliedInLean := false }
  , { packageField := "plaquette_potential"
      witnessType := "YMFiniteLatticePlaquettePotentialTermWitness"
      proofProjection :=
        "YMFiniteLatticePlaquettePotentialTermWitness.to_plaquettePotential_proof"
      certificateField := "plaquettePotentialTermDefined"
      suppliedInLean := false }
  , { packageField := "self_adjointness"
      witnessType := "YMFiniteLatticeHamiltonianSelfAdjointWitness"
      proofProjection :=
        "YMFiniteLatticeHamiltonianSelfAdjointWitness.to_selfAdjoint_proof"
      certificateField := "finiteHamiltonianSelfAdjoint"
      suppliedInLean := false }
  , { packageField := "action_matching"
      witnessType := "YMFiniteLatticeMatchesYangMillsActionWitness"
      proofProjection :=
        "YMFiniteLatticeMatchesYangMillsActionWitness.to_matchesAction_proof"
      certificateField := "matchesYangMillsLatticeAction"
      suppliedInLean := false }
  ]

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentFields :
    List String :=
  ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents.map
    (fun C => C.packageField)

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentTypes :
    List String :=
  ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents.map
    (fun C => C.witnessType)

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentProjections :
    List String :=
  ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents.map
    (fun C => C.proofProjection)

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentCertificateFields :
    List String :=
  ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents.map
    (fun C => C.certificateField)

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentSuppliedFlags :
    List Bool :=
  ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents.map
    (fun C => C.suppliedInLean)

def ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentsAllSuppliedBool :
    Bool :=
  ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents.all
    (fun C => C.suppliedInLean)

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents_length_eq :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponents.length =
      5 := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentFields_eq :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentFields =
      [ "local_degrees"
      , "kinetic_term"
      , "plaquette_potential"
      , "self_adjointness"
      , "action_matching"
      ] := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentTypes_eq :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentTypes =
      [ "YMFiniteLatticeLocalDegreesOfFreedomWitness"
      , "YMFiniteLatticeGaugeCovariantKineticTermWitness"
      , "YMFiniteLatticePlaquettePotentialTermWitness"
      , "YMFiniteLatticeHamiltonianSelfAdjointWitness"
      , "YMFiniteLatticeMatchesYangMillsActionWitness"
      ] := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentProjections_eq :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentProjections =
      [ "YMFiniteLatticeLocalDegreesOfFreedomWitness.to_localDegrees_proof"
      , "YMFiniteLatticeGaugeCovariantKineticTermWitness.to_kineticTerm_proof"
      , "YMFiniteLatticePlaquettePotentialTermWitness.to_plaquettePotential_proof"
      , "YMFiniteLatticeHamiltonianSelfAdjointWitness.to_selfAdjoint_proof"
      , "YMFiniteLatticeMatchesYangMillsActionWitness.to_matchesAction_proof"
      ] := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentCertificateFields_eq :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentCertificateFields =
      ymFiniteLatticeHamiltonianDefinitionCertificateTargetFields := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentSuppliedFlags_eq :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentSuppliedFlags =
      [false, false, false, false, false] := by
  rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentsAllSuppliedBool_eq_false :
    ymFiniteLatticeHamiltonianDefinitionWitnessPackageComponentsAllSuppliedBool =
      false := by
  rfl

/--
Exact hypothesis-map socket for the first open A+ blocker.

An inhabitant of this structure is the mathematical object still missing from
Lean: it must provide the finite-lattice Hamiltonian certificate together with
all five source-backed witness packets.  No inhabitant is constructed here.
-/
structure YMFiniteLatticeHamiltonianDefinitionHypothesisMap where
  witnessPackage : YMFiniteLatticeHamiltonianDefinitionWitnessPackage
  sourceTranslatedLocalDegrees : witnessPackage.certificate.localDegreesOfFreedomDefined
  sourceTranslatedKineticTerm :
    witnessPackage.certificate.gaugeCovariantKineticTermDefined
  sourceTranslatedPlaquettePotential :
    witnessPackage.certificate.plaquettePotentialTermDefined
  sourceTranslatedSelfAdjoint :
    witnessPackage.certificate.finiteHamiltonianSelfAdjoint
  sourceTranslatedActionMatching :
    witnessPackage.certificate.matchesYangMillsLatticeAction

def YMFiniteLatticeHamiltonianDefinitionHypothesisMap.to_proof_package
    (M : YMFiniteLatticeHamiltonianDefinitionHypothesisMap) :
    YMFiniteLatticeHamiltonianDefinitionProofPackage where
  certificate := M.witnessPackage.certificate
  localDegreesOfFreedomDefined_proof :=
    M.sourceTranslatedLocalDegrees
  gaugeCovariantKineticTermDefined_proof :=
    M.sourceTranslatedKineticTerm
  plaquettePotentialTermDefined_proof :=
    M.sourceTranslatedPlaquettePotential
  finiteHamiltonianSelfAdjoint_proof :=
    M.sourceTranslatedSelfAdjoint
  matchesYangMillsLatticeAction_proof :=
    M.sourceTranslatedActionMatching

theorem YMFiniteLatticeHamiltonianDefinitionHypothesisMap.closed
    (M : YMFiniteLatticeHamiltonianDefinitionHypothesisMap) :
    M.witnessPackage.certificate.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionProofPackage.closed_holds
      M.to_proof_package

theorem
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap.to_closure_certificate
    (M : YMFiniteLatticeHamiltonianDefinitionHypothesisMap) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    YMFiniteLatticeHamiltonianDefinitionProofPackage.to_closure_certificate
      M.to_proof_package

def YMFiniteLatticeSourceData.sourceHamiltonianDefinitionHypothesisMap
    (S : YMFiniteLatticeSourceData) :
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap where
  witnessPackage := S.sourceHamiltonianDefinitionWitnessPackage
  sourceTranslatedLocalDegrees :=
    S.sourceLocalDegreesOfFreedomDefined_holds
  sourceTranslatedKineticTerm :=
    S.sourceGaugeCovariantKineticTermDefined_holds
  sourceTranslatedPlaquettePotential :=
    S.sourcePlaquettePotentialTermDefined_holds
  sourceTranslatedSelfAdjoint :=
    S.sourceFiniteHamiltonianSelfAdjoint_holds
  sourceTranslatedActionMatching :=
    S.sourceMatchesYangMillsLatticeAction_holds

theorem YMFiniteLatticeSourceData.sourceHamiltonianDefinitionHypothesisMap_closed
    (S : YMFiniteLatticeSourceData) :
    S.sourceHamiltonianDefinitionHypothesisMap.witnessPackage.certificate.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap.closed
      S.sourceHamiltonianDefinitionHypothesisMap

theorem
    YMFiniteLatticeSourceData.sourceHamiltonianDefinitionHypothesisMap_closureCertificate
    (S : YMFiniteLatticeSourceData) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap.to_closure_certificate
      S.sourceHamiltonianDefinitionHypothesisMap

def ymFiniteLatticeHamiltonianDefinitionHypothesisMapFields :
    List String :=
  [ "witnessPackage"
  , "sourceTranslatedLocalDegrees"
  , "sourceTranslatedKineticTerm"
  , "sourceTranslatedPlaquettePotential"
  , "sourceTranslatedSelfAdjoint"
  , "sourceTranslatedActionMatching"
  ]

theorem ymFiniteLatticeHamiltonianDefinitionHypothesisMapFields_count_eq :
    ymFiniteLatticeHamiltonianDefinitionHypothesisMapFields.length =
      6 := by
  rfl

def ymAPlusFixedLatticeExactTheoremHypothesisMapVerifiedBool :
    Bool :=
  false

theorem ymAPlusFixedLatticeExactTheoremHypothesisMapVerifiedBool_eq_false :
    ymAPlusFixedLatticeExactTheoremHypothesisMapVerifiedBool =
      false := by
  rfl

structure YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage where
  hamiltonian_certificate :
    YMFiniteLatticeHamiltonianDefinitionCertificate
  spectral_payload :
    YMUniformFixedLatticeRealSpectralGap
  hamiltonian_certificate_closed :
    hamiltonian_certificate.closed
  spectral_payload_nonempty_volume :
    Nonempty spectral_payload.Volume
  hamiltonian_matches_spectral_payload :
    Prop
  hamiltonian_matches_spectral_payload_verified :
    hamiltonian_matches_spectral_payload

def YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.bridge
    (P : YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridge where
  hamiltonian_certificate := P.hamiltonian_certificate
  spectral_payload := P.spectral_payload
  hamiltonian_certificate_closed := P.hamiltonian_certificate_closed
  spectral_payload_nonempty_volume := P.spectral_payload_nonempty_volume
  hamiltonian_matches_spectral_payload :=
    P.hamiltonian_matches_spectral_payload
  hamiltonian_matches_spectral_payload_verified :=
    P.hamiltonian_matches_spectral_payload_verified

def YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.closed
    (P : YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage) :
    Prop :=
  P.bridge.closed

theorem YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.closed_holds
    (P : YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage) :
    P.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionSpectralBridge.closed_holds
      P.bridge

def ymFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageFields :
    List String :=
  [ "hamiltonian_certificate"
  , "spectral_payload"
  , "hamiltonian_certificate_closed"
  , "spectral_payload_nonempty_volume"
  , "hamiltonian_matches_spectral_payload"
  , "hamiltonian_matches_spectral_payload_verified"
  ]

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageFields_count_eq :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageFields.length =
      6 := by
  rfl

/--
Unpacked constructor-surface witness for the spectral-bridge proof package.

Several fields depend on earlier fields of the same package, so links back to
the source package are recorded heterogeneously.
-/
structure
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageConstructorWitnesses
    where
  source :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage
  hamiltonian_certificate :
    YMFiniteLatticeHamiltonianDefinitionCertificate
  spectral_payload :
    YMUniformFixedLatticeRealSpectralGap
  hamiltonian_certificate_closed :
    hamiltonian_certificate.closed
  spectral_payload_nonempty_volume :
    Nonempty spectral_payload.Volume
  hamiltonian_matches_spectral_payload :
    Prop
  hamiltonian_matches_spectral_payload_verified :
    hamiltonian_matches_spectral_payload
  hamiltonian_certificate_eq_source :
    hamiltonian_certificate = source.hamiltonian_certificate
  spectral_payload_eq_source :
    spectral_payload = source.spectral_payload
  hamiltonian_certificate_closed_eq_source :
    HEq hamiltonian_certificate_closed
      source.hamiltonian_certificate_closed
  spectral_payload_nonempty_volume_eq_source :
    HEq spectral_payload_nonempty_volume
      source.spectral_payload_nonempty_volume
  hamiltonian_matches_spectral_payload_eq_source :
    hamiltonian_matches_spectral_payload =
      source.hamiltonian_matches_spectral_payload
  hamiltonian_matches_spectral_payload_verified_eq_source :
    HEq hamiltonian_matches_spectral_payload_verified
      source.hamiltonian_matches_spectral_payload_verified

def
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.constructorWitnesses
    (P :
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageConstructorWitnesses
    where
  source := P
  hamiltonian_certificate := P.hamiltonian_certificate
  spectral_payload := P.spectral_payload
  hamiltonian_certificate_closed := P.hamiltonian_certificate_closed
  spectral_payload_nonempty_volume :=
    P.spectral_payload_nonempty_volume
  hamiltonian_matches_spectral_payload :=
    P.hamiltonian_matches_spectral_payload
  hamiltonian_matches_spectral_payload_verified :=
    P.hamiltonian_matches_spectral_payload_verified
  hamiltonian_certificate_eq_source := rfl
  spectral_payload_eq_source := rfl
  hamiltonian_certificate_closed_eq_source := HEq.rfl
  spectral_payload_nonempty_volume_eq_source := HEq.rfl
  hamiltonian_matches_spectral_payload_eq_source := rfl
  hamiltonian_matches_spectral_payload_verified_eq_source := HEq.rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageConstructorWitnesses := by
  rcases hPackage with ⟨P⟩
  exact ⟨P.constructorWitnesses⟩

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageConstructorWitnesses) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

structure YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage where
  hamiltonian_witness :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage
  spectral_payload :
    YMUniformFixedLatticeRealSpectralGap
  spectral_payload_nonempty_volume :
    Nonempty spectral_payload.Volume
  hamiltonian_matches_spectral_payload :
    Prop
  hamiltonian_matches_spectral_payload_verified :
    hamiltonian_matches_spectral_payload

def
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage.to_proof_package
    (W :
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage where
  hamiltonian_certificate := W.hamiltonian_witness.certificate
  spectral_payload := W.spectral_payload
  hamiltonian_certificate_closed := W.hamiltonian_witness.closed
  spectral_payload_nonempty_volume :=
    W.spectral_payload_nonempty_volume
  hamiltonian_matches_spectral_payload :=
    W.hamiltonian_matches_spectral_payload
  hamiltonian_matches_spectral_payload_verified :=
    W.hamiltonian_matches_spectral_payload_verified

def YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage.bridge
    (W :
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridge :=
  W.to_proof_package.bridge

theorem
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage.closed
    (W :
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage) :
    W.bridge.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.closed_holds
      W.to_proof_package

def ymFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageFields :
    List String :=
  [ "hamiltonian_witness"
  , "spectral_payload"
  , "spectral_payload_nonempty_volume"
  , "hamiltonian_matches_spectral_payload"
  , "hamiltonian_matches_spectral_payload_verified"
  ]

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageFields_count_eq :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageFields.length =
      5 := by
  rfl

/--
Unpacked constructor-surface witness for the spectral-bridge witness package.

The spectral payload and matching proposition determine later fields, so those
dependent links back to the source package are recorded heterogeneously.
-/
structure
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageConstructorWitnesses
    where
  source :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage
  hamiltonian_witness :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage
  spectral_payload :
    YMUniformFixedLatticeRealSpectralGap
  spectral_payload_nonempty_volume :
    Nonempty spectral_payload.Volume
  hamiltonian_matches_spectral_payload :
    Prop
  hamiltonian_matches_spectral_payload_verified :
    hamiltonian_matches_spectral_payload
  hamiltonian_witness_eq_source :
    hamiltonian_witness = source.hamiltonian_witness
  spectral_payload_eq_source :
    spectral_payload = source.spectral_payload
  spectral_payload_nonempty_volume_eq_source :
    HEq spectral_payload_nonempty_volume
      source.spectral_payload_nonempty_volume
  hamiltonian_matches_spectral_payload_eq_source :
    hamiltonian_matches_spectral_payload =
      source.hamiltonian_matches_spectral_payload
  hamiltonian_matches_spectral_payload_verified_eq_source :
    HEq hamiltonian_matches_spectral_payload_verified
      source.hamiltonian_matches_spectral_payload_verified

def
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage.constructorWitnesses
    (W :
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageConstructorWitnesses
    where
  source := W
  hamiltonian_witness := W.hamiltonian_witness
  spectral_payload := W.spectral_payload
  spectral_payload_nonempty_volume :=
    W.spectral_payload_nonempty_volume
  hamiltonian_matches_spectral_payload :=
    W.hamiltonian_matches_spectral_payload
  hamiltonian_matches_spectral_payload_verified :=
    W.hamiltonian_matches_spectral_payload_verified
  hamiltonian_witness_eq_source := rfl
  spectral_payload_eq_source := rfl
  spectral_payload_nonempty_volume_eq_source := HEq.rfl
  hamiltonian_matches_spectral_payload_eq_source := rfl
  hamiltonian_matches_spectral_payload_verified_eq_source := HEq.rfl

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageConstructorWitnesses := by
  rcases hPackage with ⟨W⟩
  exact ⟨W.constructorWitnesses⟩

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageConstructorWitnesses) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

structure YMFiniteLatticeSpectralBridgeSourceData
    (S : YMFiniteLatticeSourceData) where
  spectralPayload : YMUniformFixedLatticeRealSpectralGap
  chosenSpectralVolume : spectralPayload.Volume
  hamiltonianSpectralMatchLaw : Prop
  hamiltonianSpectralMatchProof : hamiltonianSpectralMatchLaw

def ymFiniteLatticeSpectralBridgeSourceDataConstructorFields :
    List String :=
  [ "spectralPayload"
  , "chosenSpectralVolume"
  , "hamiltonianSpectralMatchLaw"
  , "hamiltonianSpectralMatchProof"
  ]

theorem
    ymFiniteLatticeSpectralBridgeSourceDataConstructorFields_count_eq :
    ymFiniteLatticeSpectralBridgeSourceDataConstructorFields.length =
      4 := by
  rfl

theorem ymFiniteLatticeSpectralBridgeSourceData_nonempty_of_fields
    (S : YMFiniteLatticeSourceData)
    (spectralPayload : YMUniformFixedLatticeRealSpectralGap)
    (chosenSpectralVolume : spectralPayload.Volume)
    (hamiltonianSpectralMatchLaw : Prop)
    (hamiltonianSpectralMatchProof : hamiltonianSpectralMatchLaw) :
    Nonempty (YMFiniteLatticeSpectralBridgeSourceData S) := by
  exact
    Nonempty.intro
      { spectralPayload := spectralPayload
        chosenSpectralVolume := chosenSpectralVolume
        hamiltonianSpectralMatchLaw :=
          hamiltonianSpectralMatchLaw
        hamiltonianSpectralMatchProof :=
          hamiltonianSpectralMatchProof }

/--
Source package for the positive-gap-scale subobligation.

The finite-volume spectral bridge already supplies a uniform fixed-lattice
spectral payload and a chosen finite volume.  The positive gap scale is exactly
the payload gap, together with the positivity theorem extracted from that
chosen volume.
-/
structure YMPositiveGapScaleSourcePackage where
  sourceData : YMFiniteLatticeSourceData
  spectralBridge : YMFiniteLatticeSpectralBridgeSourceData sourceData
  gapScale : Real
  gapScale_eq_payload_gap :
    gapScale = spectralBridge.spectralPayload.gap
  gapScale_positive :
    0 < gapScale
  sourceLabels : List String
  sourceLabelsVerified : sourceLabels = ["F.216", "F.5"]

def ymPositiveGapScaleSourcePackage_of_spectral_bridge
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMPositiveGapScaleSourcePackage := by
  exact
    { sourceData := S
      spectralBridge := B
      gapScale := B.spectralPayload.gap
      gapScale_eq_payload_gap := rfl
      gapScale_positive :=
        YMUniformFixedLatticeRealSpectralGap.positive_gap
          B.spectralPayload
          B.chosenSpectralVolume
      sourceLabels := ["F.216", "F.5"]
      sourceLabelsVerified := rfl }

theorem ymPositiveGapScaleSourcePackage_nonempty_of_source_pair
    (hSourcePair :
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty YMPositiveGapScaleSourcePackage := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    Nonempty.intro
      (ymPositiveGapScaleSourcePackage_of_spectral_bridge S B)

/--
Source package for uniform control over the lattice-volume parameter.

The uniform fixed-lattice spectral payload already carries a single gap and a
gap certificate for every volume in the family.  This package exposes that
`forall V` family as the official gate witness, keeping it distinct from the
previous positive-scale gate, which only extracted `0 < gap`.
-/
structure YMUniformVolumeControlSourcePackage where
  sourceData : YMFiniteLatticeSourceData
  spectralBridge : YMFiniteLatticeSpectralBridgeSourceData sourceData
  volumeFamilyNonempty :
    Nonempty spectralBridge.spectralPayload.Volume
  uniformHasGap :
    forall V : spectralBridge.spectralPayload.Volume,
      HasRealSpectralGap
        (spectralBridge.spectralPayload.spectrum V)
        spectralBridge.spectralPayload.gap
  uniformHasGap_eq_payload :
    uniformHasGap = spectralBridge.spectralPayload.has_gap
  sourceLabels : List String
  sourceLabelsVerified : sourceLabels = ["F.216", "F.5"]

def ymUniformVolumeControlSourcePackage_of_spectral_bridge
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMUniformVolumeControlSourcePackage := by
  exact
    { sourceData := S
      spectralBridge := B
      volumeFamilyNonempty := Nonempty.intro B.chosenSpectralVolume
      uniformHasGap := B.spectralPayload.has_gap
      uniformHasGap_eq_payload := rfl
      sourceLabels := ["F.216", "F.5"]
      sourceLabelsVerified := rfl }

theorem ymUniformVolumeControlSourcePackage_nonempty_of_source_pair
    (hSourcePair :
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty YMUniformVolumeControlSourcePackage := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    Nonempty.intro
      (ymUniformVolumeControlSourcePackage_of_spectral_bridge S B)

theorem ymUniformVolumeControlSourcePackage_nonempty_of_positive_gap_package
    (hPackage : Nonempty YMPositiveGapScaleSourcePackage) :
    Nonempty YMUniformVolumeControlSourcePackage := by
  rcases hPackage with ⟨P⟩
  exact
    Nonempty.intro
      (ymUniformVolumeControlSourcePackage_of_spectral_bridge
        P.sourceData
        P.spectralBridge)

/--
Source package for transferring the fixed-lattice spectral estimate into the
Route 1 lattice-input socket.

The standard route import turns a closed fixed-lattice conclusion into the
route facts used downstream: fixed-lattice readiness, lattice-gap input, and
positive-gap exhibition.  This package records those exact discharged route
facts.
-/
structure YMTransferToRouteLatticeInputSourcePackage
    (RD : YMVacuumGapRoute) where
  routeImport : YMRouteFixedLatticeGapImport RD
  fixedLatticeReady : RD.fixed_lattice_gap_ready
  routeLatticeInput : RD.transport_package.lattice_gap_input
  routePositiveGap : RD.transport_package.positive_gap_exhibited
  sourceLabels : List String
  sourceLabelsVerified : sourceLabels = ["F.216", "F.5"]

def ymTransferToRouteLatticeInputSourcePackage_of_route_import
    {RD : YMVacuumGapRoute}
    (I : YMRouteFixedLatticeGapImport RD) :
    YMTransferToRouteLatticeInputSourcePackage RD := by
  exact
    { routeImport := I
      fixedLatticeReady :=
        YMRouteFixedLatticeGapImport.dischargeFixedLatticeReady I
      routeLatticeInput :=
        YMRouteFixedLatticeGapImport.dischargeLatticeInput I
      routePositiveGap :=
        YMRouteFixedLatticeGapImport.dischargePositiveGap I
      sourceLabels := ["F.216", "F.5"]
      sourceLabelsVerified := rfl }

theorem ymTransferToRouteLatticeInputSourcePackage_nonempty_of_route_import
    {RD : YMVacuumGapRoute}
    (I : YMRouteFixedLatticeGapImport RD) :
    Nonempty (YMTransferToRouteLatticeInputSourcePackage RD) := by
  exact
    Nonempty.intro
      (ymTransferToRouteLatticeInputSourcePackage_of_route_import I)

theorem ymTransferToRouteLatticeInputSourcePackage_sigma_nonempty_of_route_import
    {RD : YMVacuumGapRoute}
    (I : YMRouteFixedLatticeGapImport RD) :
    Nonempty (Sigma YMTransferToRouteLatticeInputSourcePackage) := by
  exact
    Nonempty.intro
      ⟨RD, ymTransferToRouteLatticeInputSourcePackage_of_route_import I⟩

/--
Unpacked constructor-surface witness for the four spectral-bridge fields over
a fixed finite-lattice source datum.

This does not supply the spectral bridge.  It records that a supplied
`YMFiniteLatticeSpectralBridgeSourceData S` has been unpacked into precisely
the four fields used by its constructor, with definitional links back to the
source bridge.
-/
structure YMFiniteLatticeSpectralBridgeSourceDataConstructorWitnesses
    (S : YMFiniteLatticeSourceData) where
  source : YMFiniteLatticeSpectralBridgeSourceData S
  spectralPayload : YMUniformFixedLatticeRealSpectralGap
  chosenSpectralVolume : spectralPayload.Volume
  hamiltonianSpectralMatchLaw : Prop
  hamiltonianSpectralMatchProof : hamiltonianSpectralMatchLaw
  spectralPayload_eq_source :
    spectralPayload = source.spectralPayload
  chosenSpectralVolume_eq_source :
    HEq chosenSpectralVolume source.chosenSpectralVolume
  hamiltonianSpectralMatchLaw_eq_source :
    hamiltonianSpectralMatchLaw =
      source.hamiltonianSpectralMatchLaw
  hamiltonianSpectralMatchProof_eq_source :
    HEq hamiltonianSpectralMatchProof
      source.hamiltonianSpectralMatchProof

def YMFiniteLatticeSpectralBridgeSourceData.constructorWitnesses
    {S : YMFiniteLatticeSourceData}
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFiniteLatticeSpectralBridgeSourceDataConstructorWitnesses S where
  source := B
  spectralPayload := B.spectralPayload
  chosenSpectralVolume := B.chosenSpectralVolume
  hamiltonianSpectralMatchLaw := B.hamiltonianSpectralMatchLaw
  hamiltonianSpectralMatchProof := B.hamiltonianSpectralMatchProof
  spectralPayload_eq_source := rfl
  chosenSpectralVolume_eq_source := HEq.rfl
  hamiltonianSpectralMatchLaw_eq_source := rfl
  hamiltonianSpectralMatchProof_eq_source := HEq.rfl

theorem
    ymFiniteLatticeSpectralBridgeSourceData_constructorWitnesses_nonempty_of_source_pair
    (hSourcePair :
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty
      (Sigma YMFiniteLatticeSpectralBridgeSourceDataConstructorWitnesses) := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact ⟨⟨S, B.constructorWitnesses⟩⟩

theorem
    ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        (Sigma
          YMFiniteLatticeSpectralBridgeSourceDataConstructorWitnesses)) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  rcases hWitnesses with ⟨⟨S, W⟩⟩
  exact ⟨⟨S, W.source⟩⟩

def YMFiniteLatticeSpectralBridgeSourceData.source_pair
    {S : YMFiniteLatticeSourceData}
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Sigma YMFiniteLatticeSpectralBridgeSourceData :=
  Sigma.mk S B

theorem ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_source_data_and_bridge
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  exact Nonempty.intro B.source_pair

/--
Standard-import contract for the fixed-lattice source pair.

This is the exact Lean surface for the remaining manuscript/import input:
an external or manuscript-derived construction must supply a paper-faithful
finite-lattice source `S` together with its spectral bridge data.  The contract
records source provenance, but it does not manufacture carriers or mark the
source pair as supplied by itself.
-/
structure YMStandardFiniteLatticeSourceImport where
  source_pair : Sigma YMFiniteLatticeSpectralBridgeSourceData
  source_document_key : String
  source_labels : List String
  source_matches_manuscript : Prop
  source_matches_manuscript_verified : source_matches_manuscript

def ymStandardFiniteLatticeSourceImportConstructorFields :
    List String :=
  [ "source_pair"
  , "source_document_key"
  , "source_labels"
  , "source_matches_manuscript"
  , "source_matches_manuscript_verified"
  ]

theorem
    ymStandardFiniteLatticeSourceImportConstructorFields_count_eq :
    ymStandardFiniteLatticeSourceImportConstructorFields.length =
      5 := by
  rfl

/--
Unpacked constructor-surface witness for `YMStandardFiniteLatticeSourceImport`.

This records the exact five import fields obtained from a single standard
source import, together with definitional links back to that import.  It does
not supply the import; it only makes the supplied import mechanically
inspectable once the manuscript/import boundary is inhabited.
-/
structure YMStandardFiniteLatticeSourceImportConstructorWitnesses where
  source : YMStandardFiniteLatticeSourceImport
  source_pair : Sigma YMFiniteLatticeSpectralBridgeSourceData
  source_document_key : String
  source_labels : List String
  source_matches_manuscript : Prop
  source_matches_manuscript_verified : source_matches_manuscript
  source_pair_eq_source : source_pair = source.source_pair
  source_document_key_eq_source :
    source_document_key = source.source_document_key
  source_labels_eq_source : source_labels = source.source_labels
  source_matches_manuscript_eq_source :
    source_matches_manuscript = source.source_matches_manuscript
  source_matches_manuscript_verified_eq_source :
    HEq source_matches_manuscript_verified
      source.source_matches_manuscript_verified

def YMStandardFiniteLatticeSourceImport.constructorWitnesses
    (I : YMStandardFiniteLatticeSourceImport) :
    YMStandardFiniteLatticeSourceImportConstructorWitnesses where
  source := I
  source_pair := I.source_pair
  source_document_key := I.source_document_key
  source_labels := I.source_labels
  source_matches_manuscript := I.source_matches_manuscript
  source_matches_manuscript_verified :=
    I.source_matches_manuscript_verified
  source_pair_eq_source := rfl
  source_document_key_eq_source := rfl
  source_labels_eq_source := rfl
  source_matches_manuscript_eq_source := rfl
  source_matches_manuscript_verified_eq_source := HEq.rfl

theorem
    ymStandardFiniteLatticeSourceImport_constructorWitnesses_nonempty_of_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMStandardFiniteLatticeSourceImportConstructorWitnesses := by
  rcases hImport with ⟨I⟩
  exact ⟨I.constructorWitnesses⟩

theorem
    ymStandardFiniteLatticeSourceImport_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMStandardFiniteLatticeSourceImportConstructorWitnesses) :
    Nonempty YMStandardFiniteLatticeSourceImport := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMStandardFiniteLatticeSourceImportConstructorWitnesses) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source_pair⟩

def YMStandardFiniteLatticeSourceImport.source_data
    (I : YMStandardFiniteLatticeSourceImport) :
    YMFiniteLatticeSourceData :=
  I.source_pair.1

def YMStandardFiniteLatticeSourceImport.spectral_bridge_source
    (I : YMStandardFiniteLatticeSourceImport) :
    YMFiniteLatticeSpectralBridgeSourceData I.source_data :=
  I.source_pair.2

theorem YMStandardFiniteLatticeSourceImport.source_pair_nonempty
    (I : YMStandardFiniteLatticeSourceImport) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  exact Nonempty.intro I.source_pair

theorem
    YMStandardFiniteLatticeSourceImport.nonempty_of_source_pair_and_match
    (source_pair : Sigma YMFiniteLatticeSpectralBridgeSourceData)
    (source_document_key : String)
    (source_labels : List String)
    (source_matches_manuscript : Prop)
    (source_matches_manuscript_verified : source_matches_manuscript) :
    Nonempty YMStandardFiniteLatticeSourceImport := by
  exact
    ⟨{ source_pair := source_pair
       source_document_key := source_document_key
       source_labels := source_labels
       source_matches_manuscript := source_matches_manuscript
       source_matches_manuscript_verified :=
        source_matches_manuscript_verified }⟩

theorem
    ymStandardFiniteLatticeSourceImport_nonempty_of_source_pair_nonempty_and_match
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData))
    (source_document_key : String)
    (source_labels : List String)
    (source_matches_manuscript : Prop)
    (source_matches_manuscript_verified : source_matches_manuscript) :
    Nonempty YMStandardFiniteLatticeSourceImport := by
  rcases hSourcePair with ⟨source_pair⟩
  exact
    YMStandardFiniteLatticeSourceImport.nonempty_of_source_pair_and_match
      source_pair
      source_document_key
      source_labels
      source_matches_manuscript
      source_matches_manuscript_verified

theorem ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  rcases hImport with ⟨I⟩
  exact I.source_pair_nonempty

theorem ymPositiveGapScaleSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMPositiveGapScaleSourcePackage := by
  exact
    ymPositiveGapScaleSourcePackage_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem ymUniformVolumeControlSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMUniformVolumeControlSourcePackage := by
  exact
    ymUniformVolumeControlSourcePackage_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem ymFiniteLatticeSourceData_nonempty_of_source_pair
    (hSourcePair :
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty YMFiniteLatticeSourceData := by
  rcases hSourcePair with ⟨⟨S, _B⟩⟩
  exact ⟨S⟩

theorem ymFiniteLatticeSourceData_nonempty_of_standard_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMFiniteLatticeSourceData := by
  exact
    ymFiniteLatticeSourceData_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFiniteLatticeSourceDataConstructorWitnesses_nonempty_of_standard_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMFiniteLatticeSourceDataConstructorWitnesses := by
  exact
    ymFiniteLatticeSourceData_constructorWitnesses_nonempty_of_source_data
      (ymFiniteLatticeSourceData_nonempty_of_standard_import hImport)

theorem YMFiniteLatticeSpectralBridgeSourceData.spectralPayload_nonempty_volume
    {S : YMFiniteLatticeSourceData}
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty B.spectralPayload.Volume := by
  exact Nonempty.intro B.chosenSpectralVolume

def YMFiniteLatticeSpectralBridgeSourceData.sourceSpectralBridgeWitnessPackage
    {S : YMFiniteLatticeSourceData}
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage where
  hamiltonian_witness := S.sourceHamiltonianDefinitionWitnessPackage
  spectral_payload := B.spectralPayload
  spectral_payload_nonempty_volume := B.spectralPayload_nonempty_volume
  hamiltonian_matches_spectral_payload := B.hamiltonianSpectralMatchLaw
  hamiltonian_matches_spectral_payload_verified :=
    B.hamiltonianSpectralMatchProof

theorem YMFiniteLatticeSpectralBridgeSourceData.sourceSpectralBridge_closed_holds
    {S : YMFiniteLatticeSourceData}
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    B.sourceSpectralBridgeWitnessPackage.bridge.closed := by
  exact B.sourceSpectralBridgeWitnessPackage.closed

def ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure :
    Prop :=
  Nonempty
    { B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
      B.closed }

theorem ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure_of_closed
    (B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge)
    (hB : B.closed) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact ⟨⟨B, hB⟩⟩

theorem ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure_of_bridge
    (B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure_of_closed B
      (YMFiniteLatticeHamiltonianDefinitionSpectralBridge.closed_holds B)

theorem
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.to_bridge_closure
    (P : YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure_of_bridge
      P.bridge

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure_of_proofPackageConstructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackageConstructorWitnesses) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_bridge_closure

theorem
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage.to_bridge_closure
    (W :
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.to_bridge_closure
      W.to_proof_package

theorem
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure_of_witnessPackageConstructorWitnesses
    (hWitnesses :
      Nonempty
        YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackageConstructorWitnesses) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_bridge_closure

theorem YMFiniteLatticeSpectralBridgeSourceData.sourceSpectralBridgeClosure_holds
    {S : YMFiniteLatticeSourceData}
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact B.sourceSpectralBridgeWitnessPackage.to_bridge_closure

/--
Source-derived preclosure for the first fixed-lattice blocker.

This deliberately stops one step before `YMFixedLatticeGapSubobligation.isClosed`.
It packages the paper-shaped finite-lattice Hamiltonian certificate together
with its spectral bridge, and proves that the two mathematical side components
of the enhanced gate are available.  The only missing input remains the
subobligation closure flag itself.
-/
structure YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage where
  source_data : YMFiniteLatticeSourceData
  spectral_bridge_source :
    YMFiniteLatticeSpectralBridgeSourceData source_data

def ymFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorFields :
    List String :=
  [ "source_data"
  , "spectral_bridge_source"
  ]

theorem
    ymFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorFields_count_eq :
    ymFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorFields.length =
      2 := by
  rfl

def YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage where
  source_data := S
  spectral_bridge_source := B

theorem
    ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  exact
    ⟨YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B⟩

/--
Unpacked constructor-surface witness for the source-derived preclosure
package.

This records the two fields that create
`YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage`, together with
definitional links back to a single source preclosure package.
-/
structure
    YMFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorWitnesses
    where
  source : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage
  source_data : YMFiniteLatticeSourceData
  spectral_bridge_source :
    YMFiniteLatticeSpectralBridgeSourceData source_data
  source_data_eq_source : source_data = source.source_data
  spectral_bridge_source_eq_source :
    HEq spectral_bridge_source source.spectral_bridge_source

def
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.constructorWitnesses
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorWitnesses
    where
  source := P
  source_data := P.source_data
  spectral_bridge_source := P.spectral_bridge_source
  source_data_eq_source := rfl
  spectral_bridge_source_eq_source := HEq.rfl

theorem
    ymFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorWitnesses_nonempty_of_source_preclosure
    (hSourcePreclosure :
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorWitnesses := by
  rcases hSourcePreclosure with ⟨P⟩
  exact ⟨P.constructorWitnesses⟩

theorem
    ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorWitnesses) :
    Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFixedLatticeHamiltonianDefinitionSourcePair_nonempty_of_source_preclosure_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionSourcePreclosureConstructorWitnesses) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨⟨W.source_data, W.spectral_bridge_source⟩⟩

def YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.hamiltonian_witness
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage :=
  P.source_data.sourceHamiltonianDefinitionWitnessPackage

def YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.spectral_bridge_witness
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage :=
  P.spectral_bridge_source.sourceSpectralBridgeWitnessPackage

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.certificate_closure_holds
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact P.source_data.sourceHamiltonianDefinitionClosureCertificate_holds

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.spectral_bridge_closure_holds
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact P.spectral_bridge_source.sourceSpectralBridgeClosure_holds

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.enhanced_gate_side_components_holds
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate /\
      ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    And.intro P.certificate_closure_holds
      P.spectral_bridge_closure_holds

def YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.closed_certificate_witness
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
      C.closed } :=
  Subtype.mk P.hamiltonian_witness.certificate
    P.hamiltonian_witness.closed

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.closed_certificate_nonempty
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty
      { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
        C.closed } := by
  exact Nonempty.intro P.closed_certificate_witness

def YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.closed_spectral_bridge_witness
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    { B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
      B.closed } :=
  Subtype.mk P.spectral_bridge_witness.bridge
    P.spectral_bridge_witness.closed

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.closed_spectral_bridge_nonempty
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty
      { B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
        B.closed } := by
  exact Nonempty.intro P.closed_spectral_bridge_witness

def
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.hamiltonian_proof_package
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFiniteLatticeHamiltonianDefinitionProofPackage :=
  P.hamiltonian_witness.to_proof_package

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.hamiltonian_proof_package_closed
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    P.hamiltonian_proof_package.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionProofPackage.closed_holds
      P.hamiltonian_proof_package

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.hamiltonian_proof_package_closureCertificate
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    YMFiniteLatticeHamiltonianDefinitionProofPackage.to_closure_certificate
      P.hamiltonian_proof_package

def
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.spectral_bridge_proof_package
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage :=
  P.spectral_bridge_witness.to_proof_package

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.spectral_bridge_proof_package_closed
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    P.spectral_bridge_proof_package.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.closed_holds
      P.spectral_bridge_proof_package

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.spectral_bridge_proof_package_closure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.to_bridge_closure
      P.spectral_bridge_proof_package

def YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.source_hypothesis_map
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap :=
  P.source_data.sourceHamiltonianDefinitionHypothesisMap

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.source_hypothesis_map_closed
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    P.source_hypothesis_map.witnessPackage.certificate.closed := by
  exact
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap.closed
      P.source_hypothesis_map

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.source_hypothesis_map_closureCertificate
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap.to_closure_certificate
      P.source_hypothesis_map

def ymFixedLatticeHamiltonianDefinitionHamiltonianWitness_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage :=
  (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
    S B).hamiltonian_witness

def ymFixedLatticeHamiltonianDefinitionSpectralBridgeWitness_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage :=
  (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
    S B).spectral_bridge_witness

theorem ymFixedLatticeHamiltonianDefinitionCertificateClosure_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).certificate_closure_holds

theorem ymFixedLatticeHamiltonianDefinitionSpectralBridgeClosure_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).spectral_bridge_closure_holds

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGateSideComponents_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate /\
      ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).enhanced_gate_side_components_holds

theorem ymFixedLatticeHamiltonianDefinitionClosedCertificate_nonempty_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty
      { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
        C.closed } := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).closed_certificate_nonempty

theorem
    ymFixedLatticeHamiltonianDefinitionClosedSpectralBridge_nonempty_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty
      { B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
        B.closed } := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).closed_spectral_bridge_nonempty

def ymFixedLatticeHamiltonianDefinitionHamiltonianProofPackage_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFiniteLatticeHamiltonianDefinitionProofPackage :=
  (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
    S B).hamiltonian_proof_package

theorem
    ymFixedLatticeHamiltonianDefinitionHamiltonianProofPackage_closed_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    (ymFixedLatticeHamiltonianDefinitionHamiltonianProofPackage_of_source_data
      S B).closed := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).hamiltonian_proof_package_closed

theorem
    ymFixedLatticeHamiltonianDefinitionHamiltonianProofPackageClosureCertificate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).hamiltonian_proof_package_closureCertificate

def ymFixedLatticeHamiltonianDefinitionSpectralBridgeProofPackage_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage :=
  (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
    S B).spectral_bridge_proof_package

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeProofPackage_closed_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    (ymFixedLatticeHamiltonianDefinitionSpectralBridgeProofPackage_of_source_data
      S B).closed := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).spectral_bridge_proof_package_closed

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeProofPackageClosure_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).spectral_bridge_proof_package_closure

def ymFixedLatticeHamiltonianDefinitionSourceHypothesisMap_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFiniteLatticeHamiltonianDefinitionHypothesisMap :=
  (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
    S B).source_hypothesis_map

theorem
    ymFixedLatticeHamiltonianDefinitionSourceHypothesisMap_closed_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    (ymFixedLatticeHamiltonianDefinitionSourceHypothesisMap_of_source_data
      S B).witnessPackage.certificate.closed := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).source_hypothesis_map_closed

theorem
    ymFixedLatticeHamiltonianDefinitionSourceHypothesisMapClosureCertificate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
      S B).source_hypothesis_map_closureCertificate

/--
Source-faithful package for the second fixed-lattice A+ subobligation.

The manuscript target here is not a numerical spectral estimate yet; it is the
compact-simple gauge-group hypothesis exported into the fixed-lattice theorem
scope.  The package therefore records the theorem-scope hypotheses, the
compact-simple proof component, and the source labels that identify the
Route-1 ultraviolet gate and public group-scope export.
-/
structure YMCompactSimpleGaugeGroupHypothesesSourcePackage where
  hypotheses : YMFixedLatticeGapHypotheses
  compactSimpleProof : hypotheses.gauge_group_compact_simple
  sourceLabels : List String
  sourceLabelsVerified : sourceLabels = ["N.20", "N.21"]

def YMCompactSimpleGaugeGroupHypothesesSourcePackage.closed
    (_P : YMCompactSimpleGaugeGroupHypothesesSourcePackage) :
    Prop :=
  True

theorem
    YMCompactSimpleGaugeGroupHypothesesSourcePackage.closed_holds
    (P : YMCompactSimpleGaugeGroupHypothesesSourcePackage) :
    P.closed := by
  trivial

theorem
    ymCompactSimpleGaugeGroupHypothesesSourcePackage_nonempty_of_components
    (H : YMFixedLatticeGapHypotheses)
    (hCompact : H.gauge_group_compact_simple) :
    Nonempty YMCompactSimpleGaugeGroupHypothesesSourcePackage := by
  exact
    Nonempty.intro
      { hypotheses := H
        compactSimpleProof := hCompact
        sourceLabels := ["N.20", "N.21"]
        sourceLabelsVerified := rfl }

/--
The first fixed-lattice subobligation is now closed exactly by an actual
source-derived preclosure package.  The second is closed by a compact-simple
gauge-group source package.  The finite-volume spectral-estimate gate is the
paper/import source pair for a finite-lattice source datum together with its
uniform spectral bridge data.  The remaining three fixed-lattice subobligations
stay open until their own paper-shaped source packages are supplied.
-/
def YMFixedLatticeGapSubobligation.isClosed :
    YMFixedLatticeGapSubobligation -> Prop
  | .latticeHamiltonianDefinition =>
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage
  | .compactSimpleGaugeGroupHypotheses =>
      Nonempty YMCompactSimpleGaugeGroupHypothesesSourcePackage
  | .finiteVolumeSpectralEstimate =>
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)
  | .positiveGapScale =>
      Nonempty YMPositiveGapScaleSourcePackage
  | .uniformVolumeControl =>
      Nonempty YMUniformVolumeControlSourcePackage
  | .transferToRouteLatticeInput =>
      Nonempty (Sigma YMTransferToRouteLatticeInputSourcePackage)

def ymFixedLatticeGapSubobligationsClosed : Prop :=
  forall O : YMFixedLatticeGapSubobligation, O.isClosed

theorem YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition_closed_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  exact ⟨P⟩

theorem YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition_preclosure_exists
    (h : YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  exact h

theorem YMFixedLatticeGapSubobligation.compactSimpleGaugeGroupHypotheses_closed_of_source_package
    (P : YMCompactSimpleGaugeGroupHypothesesSourcePackage) :
    YMFixedLatticeGapSubobligation.compactSimpleGaugeGroupHypotheses.isClosed := by
  exact Nonempty.intro P

theorem YMFixedLatticeGapSubobligation.compactSimpleGaugeGroupHypotheses_source_package_exists
    (h : YMFixedLatticeGapSubobligation.compactSimpleGaugeGroupHypotheses.isClosed) :
    Nonempty YMCompactSimpleGaugeGroupHypothesesSourcePackage := by
  exact h

theorem YMFixedLatticeGapSubobligation.finiteVolumeSpectralEstimate_closed_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    YMFixedLatticeGapSubobligation.finiteVolumeSpectralEstimate.isClosed := by
  exact hSourcePair

theorem YMFixedLatticeGapSubobligation.finiteVolumeSpectralEstimate_source_pair_exists
    (h : YMFixedLatticeGapSubobligation.finiteVolumeSpectralEstimate.isClosed) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  exact h

theorem YMFixedLatticeGapSubobligation.positiveGapScale_closed_of_source_package
    (hPackage : Nonempty YMPositiveGapScaleSourcePackage) :
    YMFixedLatticeGapSubobligation.positiveGapScale.isClosed := by
  exact hPackage

theorem YMFixedLatticeGapSubobligation.positiveGapScale_source_package_exists
    (h : YMFixedLatticeGapSubobligation.positiveGapScale.isClosed) :
    Nonempty YMPositiveGapScaleSourcePackage := by
  exact h

theorem YMFixedLatticeGapSubobligation.uniformVolumeControl_closed_of_source_package
    (hPackage : Nonempty YMUniformVolumeControlSourcePackage) :
    YMFixedLatticeGapSubobligation.uniformVolumeControl.isClosed := by
  exact hPackage

theorem YMFixedLatticeGapSubobligation.uniformVolumeControl_source_package_exists
    (h : YMFixedLatticeGapSubobligation.uniformVolumeControl.isClosed) :
    Nonempty YMUniformVolumeControlSourcePackage := by
  exact h

theorem YMFixedLatticeGapSubobligation.transferToRouteLatticeInput_closed_of_source_package
    (hPackage :
      Nonempty (Sigma YMTransferToRouteLatticeInputSourcePackage)) :
    YMFixedLatticeGapSubobligation.transferToRouteLatticeInput.isClosed := by
  exact hPackage

theorem YMFixedLatticeGapSubobligation.transferToRouteLatticeInput_source_package_exists
    (h : YMFixedLatticeGapSubobligation.transferToRouteLatticeInput.isClosed) :
    Nonempty (Sigma YMTransferToRouteLatticeInputSourcePackage) := by
  exact h

theorem ymFixedLatticeHamiltonianDefinitionSubobligationClosure_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  exact YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition_closed_of_source_preclosure P

/--
Focused gate for the current first blocker.  It requires both the current
subobligation to be closed and a populated Hamiltonian-definition certificate.
-/
def ymFixedLatticeHamiltonianDefinitionSubobligationGate : Prop :=
  YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed /\
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate

theorem ymFixedLatticeHamiltonianDefinitionGate_requires_subobligation_closed :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate ->
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  intro h
  exact h.left

theorem ymFixedLatticeHamiltonianDefinitionGate_requires_certificate :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate ->
      ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  intro h
  exact h.right

theorem ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_components
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed)
    (hCertificate :
      ymFiniteLatticeHamiltonianDefinitionClosureCertificate) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact And.intro hClosed hCertificate

/--
Enhanced gate for the first fixed-lattice blocker.  This is the paper-shaped
target: the Hamiltonian definition must close and connect to the Route 1
uniform fixed-lattice spectral payload.
-/
def ymFixedLatticeHamiltonianDefinitionEnhancedGate : Prop :=
  YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed /\
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate /\
      ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_requires_subobligation_closed :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate ->
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  intro h
  exact h.left

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_requires_certificate :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate ->
      ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  intro h
  exact h.right.left

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_requires_spectral_bridge :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate ->
      ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  intro h
  exact h.right.right

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_components
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed)
    (hCertificate :
      ymFiniteLatticeHamiltonianDefinitionClosureCertificate)
    (hSpectralBridge :
      ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact And.intro hClosed (And.intro hCertificate hSpectralBridge)

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.to_subobligation_closed
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  exact ⟨P⟩

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.to_subobligation_gate
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_components
      P.to_subobligation_closed
      P.certificate_closure_holds

theorem
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.to_enhanced_gate
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_components
      P.to_subobligation_closed
      P.certificate_closure_holds
      P.spectral_bridge_closure_holds

theorem ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_source_preclosure
    (h :
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  rcases h with ⟨P⟩
  exact P.to_subobligation_gate

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_source_preclosure
    (h :
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  rcases h with ⟨P⟩
  exact P.to_enhanced_gate

theorem ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_source_preclosure
      hClosed

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_source_preclosure
      hClosed

theorem ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  exact
    ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_data
      S B

theorem ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_data
        S B)

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_source_data
        S B)

theorem ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  exact
    ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_pair
      hSourcePair

theorem
    ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_pair
        hSourcePair)

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_pair
        hSourcePair)

theorem
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

structure YMFixedLatticeHamiltonianDefinitionNativeClosurePackage where
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  certificate_package :
    YMFiniteLatticeHamiltonianDefinitionProofPackage

theorem YMFixedLatticeHamiltonianDefinitionNativeClosurePackage.to_subobligation_gate
    (P : YMFixedLatticeHamiltonianDefinitionNativeClosurePackage) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_components
      P.subobligation_closed
      (YMFiniteLatticeHamiltonianDefinitionProofPackage.to_closure_certificate
        P.certificate_package)

def ymFixedLatticeHamiltonianDefinitionNativeClosurePackageFields :
    List String :=
  [ "subobligation_closed"
  , "certificate_package"
  ]

theorem ymFixedLatticeHamiltonianDefinitionNativeClosurePackageFields_count_eq :
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackageFields.length =
      2 := by
  rfl

/--
Unpacked constructor-surface witness for the native closure package.

This records the two fields that create
`YMFixedLatticeHamiltonianDefinitionNativeClosurePackage`, together with
definitional links back to a single package.
-/
structure YMFixedLatticeHamiltonianDefinitionNativeClosureConstructorWitnesses where
  source : YMFixedLatticeHamiltonianDefinitionNativeClosurePackage
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  certificate_package :
    YMFiniteLatticeHamiltonianDefinitionProofPackage
  subobligation_closed_eq_source :
    subobligation_closed = source.subobligation_closed
  certificate_package_eq_source :
    certificate_package = source.certificate_package

def
    YMFixedLatticeHamiltonianDefinitionNativeClosurePackage.constructorWitnesses
    (P : YMFixedLatticeHamiltonianDefinitionNativeClosurePackage) :
    YMFixedLatticeHamiltonianDefinitionNativeClosureConstructorWitnesses
    where
  source := P
  subobligation_closed := P.subobligation_closed
  certificate_package := P.certificate_package
  subobligation_closed_eq_source := rfl
  certificate_package_eq_source := rfl

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosureConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty YMFixedLatticeHamiltonianDefinitionNativeClosurePackage) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeClosureConstructorWitnesses := by
  rcases hPackage with ⟨P⟩
  exact ⟨P.constructorWitnesses⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionNativeClosureConstructorWitnesses) :
    Nonempty YMFixedLatticeHamiltonianDefinitionNativeClosurePackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionNativeClosureConstructorWitnesses) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_subobligation_gate

structure YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage where
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  certificate_package :
    YMFiniteLatticeHamiltonianDefinitionProofPackage
  spectral_bridge_package :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage

theorem YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage.to_enhanced_gate
    (P : YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_components
      P.subobligation_closed
      (YMFiniteLatticeHamiltonianDefinitionProofPackage.to_closure_certificate
        P.certificate_package)
      (YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage.to_bridge_closure
        P.spectral_bridge_package)

def ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackageFields :
    List String :=
  [ "subobligation_closed"
  , "certificate_package"
  , "spectral_bridge_package"
  ]

theorem ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackageFields_count_eq :
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackageFields.length =
      3 := by
  rfl

/--
Unpacked constructor-surface witness for the enhanced closure package.

This records the three fields that create
`YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage`, together with
definitional links back to a single package.
-/
structure
    YMFixedLatticeHamiltonianDefinitionEnhancedClosureConstructorWitnesses
    where
  source : YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  certificate_package :
    YMFiniteLatticeHamiltonianDefinitionProofPackage
  spectral_bridge_package :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage
  subobligation_closed_eq_source :
    subobligation_closed = source.subobligation_closed
  certificate_package_eq_source :
    certificate_package = source.certificate_package
  spectral_bridge_package_eq_source :
    spectral_bridge_package = source.spectral_bridge_package

def
    YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage.constructorWitnesses
    (P : YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage) :
    YMFixedLatticeHamiltonianDefinitionEnhancedClosureConstructorWitnesses
    where
  source := P
  subobligation_closed := P.subobligation_closed
  certificate_package := P.certificate_package
  spectral_bridge_package := P.spectral_bridge_package
  subobligation_closed_eq_source := rfl
  certificate_package_eq_source := rfl
  spectral_bridge_package_eq_source := rfl

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosureConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedClosureConstructorWitnesses := by
  rcases hPackage with ⟨P⟩
  exact ⟨P.constructorWitnesses⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionEnhancedClosureConstructorWitnesses) :
    Nonempty YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionEnhancedClosureConstructorWitnesses) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_enhanced_gate

structure YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage where
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  hamiltonian_witness :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage

def
    YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage.to_native_closure_package
    (P : YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage) :
    YMFixedLatticeHamiltonianDefinitionNativeClosurePackage where
  subobligation_closed := P.subobligation_closed
  certificate_package := P.hamiltonian_witness.to_proof_package

theorem
    YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage.to_subobligation_gate
    (P : YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    YMFixedLatticeHamiltonianDefinitionNativeClosurePackage.to_subobligation_gate
      P.to_native_closure_package

def
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.to_native_witness_closure_package
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage where
  subobligation_closed := P.to_subobligation_closed
  hamiltonian_witness := P.hamiltonian_witness

def
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.to_native_closure_package
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeHamiltonianDefinitionNativeClosurePackage :=
  P.to_native_witness_closure_package.to_native_closure_package

def ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackageFields :
    List String :=
  [ "subobligation_closed"
  , "hamiltonian_witness"
  ]

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackageFields_count_eq :
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackageFields.length =
      2 := by
  rfl

/--
Unpacked constructor-surface witness for the native witness closure package.

This records the two fields that create
`YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage`, together
with definitional links back to a single package.
-/
structure
    YMFixedLatticeHamiltonianDefinitionNativeWitnessClosureConstructorWitnesses
    where
  source : YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  hamiltonian_witness :
    YMFiniteLatticeHamiltonianDefinitionWitnessPackage
  subobligation_closed_eq_source :
    subobligation_closed = source.subobligation_closed
  hamiltonian_witness_eq_source :
    hamiltonian_witness = source.hamiltonian_witness

def
    YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage.constructorWitnesses
    (P : YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage) :
    YMFixedLatticeHamiltonianDefinitionNativeWitnessClosureConstructorWitnesses
    where
  source := P
  subobligation_closed := P.subobligation_closed
  hamiltonian_witness := P.hamiltonian_witness
  subobligation_closed_eq_source := rfl
  hamiltonian_witness_eq_source := rfl

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosureConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeWitnessClosureConstructorWitnesses := by
  rcases hPackage with ⟨P⟩
  exact ⟨P.constructorWitnesses⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionNativeWitnessClosureConstructorWitnesses) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionNativeWitnessClosureConstructorWitnesses) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_subobligation_gate

structure YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage where
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  spectral_bridge_witness :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage

def
    YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage.to_enhanced_closure_package
    (P : YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage) :
    YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage where
  subobligation_closed := P.subobligation_closed
  certificate_package :=
    P.spectral_bridge_witness.hamiltonian_witness.to_proof_package
  spectral_bridge_package :=
    P.spectral_bridge_witness.to_proof_package

theorem
    YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage.to_enhanced_gate
    (P : YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage.to_enhanced_gate
      P.to_enhanced_closure_package

def
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.to_enhanced_witness_closure_package
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage where
  subobligation_closed := P.to_subobligation_closed
  spectral_bridge_witness := P.spectral_bridge_witness

def
    YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.to_enhanced_closure_package
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage :=
  P.to_enhanced_witness_closure_package.to_enhanced_closure_package

def ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackageFields :
    List String :=
  [ "subobligation_closed"
  , "spectral_bridge_witness"
  ]

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackageFields_count_eq :
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackageFields.length =
      2 := by
  rfl

/--
Unpacked constructor-surface witness for the enhanced witness closure package.

This records the two fields that create
`YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage`, together
with definitional links back to a single package.
-/
structure
    YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosureConstructorWitnesses
    where
  source : YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage
  subobligation_closed :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed
  spectral_bridge_witness :
    YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage
  subobligation_closed_eq_source :
    subobligation_closed = source.subobligation_closed
  spectral_bridge_witness_eq_source :
    spectral_bridge_witness = source.spectral_bridge_witness

def
    YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage.constructorWitnesses
    (P : YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage) :
    YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosureConstructorWitnesses
    where
  source := P
  subobligation_closed := P.subobligation_closed
  spectral_bridge_witness := P.spectral_bridge_witness
  subobligation_closed_eq_source := rfl
  spectral_bridge_witness_eq_source := rfl

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosureConstructorWitnesses_nonempty_of_package
    (hPackage :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosureConstructorWitnesses := by
  rcases hPackage with ⟨P⟩
  exact ⟨P.constructorWitnesses⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosureConstructorWitnesses) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage := by
  rcases hWitnesses with ⟨W⟩
  exact ⟨W.source⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_constructorWitnesses
    (hWitnesses :
      Nonempty
        YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosureConstructorWitnesses) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  rcases hWitnesses with ⟨W⟩
  exact W.source.to_enhanced_gate

/-- Sub-obligations for sharp-local construction. -/
inductive YMSharpLocalSubobligation
  | finiteCapWindowDefinition
  | finiteCapExtensionTheorem
  | positiveUnitalBridge
  | boundedStateCompatibility
  | inductiveSystemCoherence
  | sharpLocalExtendsBoundedBase
  deriving DecidableEq, Repr

def YMSharpLocalSubobligation.title :
    YMSharpLocalSubobligation -> String
  | .finiteCapWindowDefinition =>
      "Define finite-cap windows and their local algebra data"
  | .finiteCapExtensionTheorem =>
      "Prove finite-cap sharp-local extension"
  | .positiveUnitalBridge =>
      "Construct the positive unital bridge"
  | .boundedStateCompatibility =>
      "Prove bounded-state compatibility"
  | .inductiveSystemCoherence =>
      "Prove inductive-system coherence"
  | .sharpLocalExtendsBoundedBase =>
      "Prove the sharp-local state extends the bounded base"

def ymSharpLocalSubobligations : List YMSharpLocalSubobligation :=
  [ .finiteCapWindowDefinition
  , .finiteCapExtensionTheorem
  , .positiveUnitalBridge
  , .boundedStateCompatibility
  , .inductiveSystemCoherence
  , .sharpLocalExtendsBoundedBase
  ]

/--
Source package for the finite-cap window and local-algebra data used by the
sharp-local construction row.

The manuscript payload already carries a finite-cap construction object.  This
package exposes exactly the carrier types and ready/coherence facts needed by
the first sharp-local ledger gate, without yet closing the finite-cap extension
theorem or the downstream bridge/coherence gates.
-/
structure YMFiniteCapWindowDefinitionSourcePackage where
  payload : YMSharpLocalConstructionPayload
  finiteCap : YMFiniteCapConstructionPayload
  BoundedBaseAlgebra : Type
  FiniteCapSystem : Type
  finiteCap_eq_payload :
    finiteCap = payload.finite_cap
  boundedBase_eq_payload :
    BoundedBaseAlgebra = payload.finite_cap.BoundedBaseAlgebra
  finiteCapSystem_eq_payload :
    FiniteCapSystem = payload.finite_cap.FiniteCapSystem
  finiteCapExtensionReady :
    finiteCap.finite_cap_extension_ready
  finiteCapCoherent :
    finiteCap.finite_cap_coherent
  sourceLabels : List String
  sourceLabelsVerified :
    sourceLabels = ["Companion II", "Packet 6: Finite-cap closure"]

def ymFiniteCapWindowDefinitionSourcePackage_of_payload
    (P : YMSharpLocalConstructionPayload) :
    YMFiniteCapWindowDefinitionSourcePackage := by
  exact
    { payload := P
      finiteCap := P.finite_cap
      BoundedBaseAlgebra := P.finite_cap.BoundedBaseAlgebra
      FiniteCapSystem := P.finite_cap.FiniteCapSystem
      finiteCap_eq_payload := rfl
      boundedBase_eq_payload := rfl
      finiteCapSystem_eq_payload := rfl
      finiteCapExtensionReady :=
        P.finite_cap.finite_cap_extension_ready_holds
      finiteCapCoherent :=
        P.finite_cap.finite_cap_coherent_holds
      sourceLabels := ["Companion II", "Packet 6: Finite-cap closure"]
      sourceLabelsVerified := rfl }

theorem ymFiniteCapWindowDefinitionSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMSharpLocalConstructionPayload) :
    Nonempty YMFiniteCapWindowDefinitionSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymFiniteCapWindowDefinitionSourcePackage_of_payload P)

theorem ymFiniteCapWindowDefinitionSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMFiniteCapWindowDefinitionSourcePackage := by
  exact
    ymFiniteCapWindowDefinitionSourcePackage_nonempty_of_payload
      (ymSharpLocalConstructionPayload_nonempty_of_standard_import hImport)

/--
Source package for the finite-cap sharp-local extension theorem.

This is deliberately separate from the window-definition package.  The first
gate records that the finite-cap carriers and coherence data have been named;
this gate records that the manuscript payload actually supplies the extension
readiness theorem for that finite-cap system.
-/
structure YMFiniteCapExtensionTheoremSourcePackage where
  windowPackage : YMFiniteCapWindowDefinitionSourcePackage
  payload : YMSharpLocalConstructionPayload
  finiteCap : YMFiniteCapConstructionPayload
  finiteCapExtensionReady :
    finiteCap.finite_cap_extension_ready
  finiteCapCoherent :
    finiteCap.finite_cap_coherent
  payload_eq_window :
    payload = windowPackage.payload
  finiteCap_eq_window :
    finiteCap = windowPackage.finiteCap
  sourceLabels : List String
  sourceLabelsVerified :
    sourceLabels = ["Companion II", "5.74", "Packet 6: Finite-cap closure"]

def ymFiniteCapExtensionTheoremSourcePackage_of_window_package
    (W : YMFiniteCapWindowDefinitionSourcePackage) :
    YMFiniteCapExtensionTheoremSourcePackage := by
  exact
    { windowPackage := W
      payload := W.payload
      finiteCap := W.finiteCap
      finiteCapExtensionReady := W.finiteCapExtensionReady
      finiteCapCoherent := W.finiteCapCoherent
      payload_eq_window := rfl
      finiteCap_eq_window := rfl
      sourceLabels :=
        ["Companion II", "5.74", "Packet 6: Finite-cap closure"]
      sourceLabelsVerified := rfl }

theorem ymFiniteCapExtensionTheoremSourcePackage_nonempty_of_window_package
    (hWindow : Nonempty YMFiniteCapWindowDefinitionSourcePackage) :
    Nonempty YMFiniteCapExtensionTheoremSourcePackage := by
  rcases hWindow with ⟨W⟩
  exact
    Nonempty.intro
      (ymFiniteCapExtensionTheoremSourcePackage_of_window_package W)

theorem ymFiniteCapExtensionTheoremSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMSharpLocalConstructionPayload) :
    Nonempty YMFiniteCapExtensionTheoremSourcePackage := by
  exact
    ymFiniteCapExtensionTheoremSourcePackage_nonempty_of_window_package
      (ymFiniteCapWindowDefinitionSourcePackage_nonempty_of_payload hPayload)

theorem ymFiniteCapExtensionTheoremSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMFiniteCapExtensionTheoremSourcePackage := by
  exact
    ymFiniteCapExtensionTheoremSourcePackage_nonempty_of_payload
      (ymSharpLocalConstructionPayload_nonempty_of_standard_import hImport)

/--
Source package for the positive-unital bridge subobligation.

The sharp-local payload separates the bounded bridge from the finite-cap
extension theorem.  This package records the bridge carrier types and the
positive-unital readiness theorem, without also closing the bounded-state
compatibility gate.
-/
structure YMPositiveUnitalBridgeSourcePackage where
  payload : YMSharpLocalConstructionPayload
  boundedBridge : YMBoundedStateBridgePayload
  BoundedBaseAlgebra : Type
  FiniteCapSystem : Type
  SharpLocalAlgebra : Type
  boundedBridge_eq_payload :
    boundedBridge = payload.bounded_bridge
  boundedBase_eq_payload :
    BoundedBaseAlgebra = payload.bounded_bridge.BoundedBaseAlgebra
  finiteCapSystem_eq_payload :
    FiniteCapSystem = payload.bounded_bridge.FiniteCapSystem
  sharpLocalAlgebra_eq_payload :
    SharpLocalAlgebra = payload.bounded_bridge.SharpLocalAlgebra
  positiveUnitalBridgeReady :
    boundedBridge.positive_unital_bridge_ready
  sourceLabels : List String
  sourceLabelsVerified :
    sourceLabels = ["Companion II", "Packet 6: Finite-cap closure"]

def ymPositiveUnitalBridgeSourcePackage_of_payload
    (P : YMSharpLocalConstructionPayload) :
    YMPositiveUnitalBridgeSourcePackage := by
  exact
    { payload := P
      boundedBridge := P.bounded_bridge
      BoundedBaseAlgebra := P.bounded_bridge.BoundedBaseAlgebra
      FiniteCapSystem := P.bounded_bridge.FiniteCapSystem
      SharpLocalAlgebra := P.bounded_bridge.SharpLocalAlgebra
      boundedBridge_eq_payload := rfl
      boundedBase_eq_payload := rfl
      finiteCapSystem_eq_payload := rfl
      sharpLocalAlgebra_eq_payload := rfl
      positiveUnitalBridgeReady :=
        P.bounded_bridge.positive_unital_bridge_ready_holds
      sourceLabels := ["Companion II", "Packet 6: Finite-cap closure"]
      sourceLabelsVerified := rfl }

theorem ymPositiveUnitalBridgeSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMSharpLocalConstructionPayload) :
    Nonempty YMPositiveUnitalBridgeSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymPositiveUnitalBridgeSourcePackage_of_payload P)

theorem ymPositiveUnitalBridgeSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMPositiveUnitalBridgeSourcePackage := by
  exact
    ymPositiveUnitalBridgeSourcePackage_nonempty_of_payload
      (ymSharpLocalConstructionPayload_nonempty_of_standard_import hImport)

/--
Source package for the bounded-state compatibility subobligation.

This uses the same bounded-bridge payload as the positive-unital bridge gate,
but records the separate compatibility theorem exported as manuscript item
`5.75`.
-/
structure YMBoundedStateCompatibilitySourcePackage where
  payload : YMSharpLocalConstructionPayload
  boundedBridge : YMBoundedStateBridgePayload
  BoundedBaseAlgebra : Type
  FiniteCapSystem : Type
  SharpLocalAlgebra : Type
  boundedBridge_eq_payload :
    boundedBridge = payload.bounded_bridge
  boundedBase_eq_payload :
    BoundedBaseAlgebra = payload.bounded_bridge.BoundedBaseAlgebra
  finiteCapSystem_eq_payload :
    FiniteCapSystem = payload.bounded_bridge.FiniteCapSystem
  sharpLocalAlgebra_eq_payload :
    SharpLocalAlgebra = payload.bounded_bridge.SharpLocalAlgebra
  boundedStateCompatible :
    boundedBridge.bounded_state_compatible
  sourceLabels : List String
  sourceLabelsVerified :
    sourceLabels = ["Companion II", "5.75"]

def ymBoundedStateCompatibilitySourcePackage_of_payload
    (P : YMSharpLocalConstructionPayload) :
    YMBoundedStateCompatibilitySourcePackage := by
  exact
    { payload := P
      boundedBridge := P.bounded_bridge
      BoundedBaseAlgebra := P.bounded_bridge.BoundedBaseAlgebra
      FiniteCapSystem := P.bounded_bridge.FiniteCapSystem
      SharpLocalAlgebra := P.bounded_bridge.SharpLocalAlgebra
      boundedBridge_eq_payload := rfl
      boundedBase_eq_payload := rfl
      finiteCapSystem_eq_payload := rfl
      sharpLocalAlgebra_eq_payload := rfl
      boundedStateCompatible :=
        P.bounded_bridge.bounded_state_compatible_holds
      sourceLabels := ["Companion II", "5.75"]
      sourceLabelsVerified := rfl }

theorem ymBoundedStateCompatibilitySourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMSharpLocalConstructionPayload) :
    Nonempty YMBoundedStateCompatibilitySourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymBoundedStateCompatibilitySourcePackage_of_payload P)

theorem ymBoundedStateCompatibilitySourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMBoundedStateCompatibilitySourcePackage := by
  exact
    ymBoundedStateCompatibilitySourcePackage_nonempty_of_payload
      (ymSharpLocalConstructionPayload_nonempty_of_standard_import hImport)

/--
Source package for the inductive-system coherence subobligation.

The inductive-union payload contains three distinct facts.  This package
records only the coherence fact, keeping the full inductive-union construction
and bounded-base extension facts for their own ledger gates.
-/
structure YMInductiveSystemCoherenceSourcePackage where
  payload : YMSharpLocalConstructionPayload
  inductiveUnion : YMSharpLocalInductiveUnionPayload
  FiniteCapSystem : Type
  SharpLocalAlgebra : Type
  SharpLocalState : Type
  inductiveUnion_eq_payload :
    inductiveUnion = payload.inductive_union
  finiteCapSystem_eq_payload :
    FiniteCapSystem = payload.inductive_union.FiniteCapSystem
  sharpLocalAlgebra_eq_payload :
    SharpLocalAlgebra = payload.inductive_union.SharpLocalAlgebra
  sharpLocalState_eq_payload :
    SharpLocalState = payload.inductive_union.SharpLocalState
  inductiveSystemCoherent :
    inductiveUnion.inductive_system_coherent
  sourceLabels : List String
  sourceLabelsVerified :
    sourceLabels = ["Companion II", "5.76"]

def ymInductiveSystemCoherenceSourcePackage_of_payload
    (P : YMSharpLocalConstructionPayload) :
    YMInductiveSystemCoherenceSourcePackage := by
  exact
    { payload := P
      inductiveUnion := P.inductive_union
      FiniteCapSystem := P.inductive_union.FiniteCapSystem
      SharpLocalAlgebra := P.inductive_union.SharpLocalAlgebra
      SharpLocalState := P.inductive_union.SharpLocalState
      inductiveUnion_eq_payload := rfl
      finiteCapSystem_eq_payload := rfl
      sharpLocalAlgebra_eq_payload := rfl
      sharpLocalState_eq_payload := rfl
      inductiveSystemCoherent :=
        P.inductive_union.inductive_system_coherent_holds
      sourceLabels := ["Companion II", "5.76"]
      sourceLabelsVerified := rfl }

theorem ymInductiveSystemCoherenceSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMSharpLocalConstructionPayload) :
    Nonempty YMInductiveSystemCoherenceSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymInductiveSystemCoherenceSourcePackage_of_payload P)

theorem ymInductiveSystemCoherenceSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMInductiveSystemCoherenceSourcePackage := by
  exact
    ymInductiveSystemCoherenceSourcePackage_nonempty_of_payload
      (ymSharpLocalConstructionPayload_nonempty_of_standard_import hImport)

/--
Source package for the final sharp-local subobligation: the sharp-local state
extends the bounded base.

This records the bounded-base extension theorem as its own gate, separate from
the inductive-system coherence gate.
-/
structure YMSharpLocalExtendsBoundedBaseSourcePackage where
  payload : YMSharpLocalConstructionPayload
  inductiveUnion : YMSharpLocalInductiveUnionPayload
  FiniteCapSystem : Type
  SharpLocalAlgebra : Type
  SharpLocalState : Type
  inductiveUnion_eq_payload :
    inductiveUnion = payload.inductive_union
  finiteCapSystem_eq_payload :
    FiniteCapSystem = payload.inductive_union.FiniteCapSystem
  sharpLocalAlgebra_eq_payload :
    SharpLocalAlgebra = payload.inductive_union.SharpLocalAlgebra
  sharpLocalState_eq_payload :
    SharpLocalState = payload.inductive_union.SharpLocalState
  sharpLocalExtendsBoundedBase :
    inductiveUnion.sharp_local_extends_bounded_base
  sourceLabels : List String
  sourceLabelsVerified :
    sourceLabels = ["Companion II", "5.76"]

def ymSharpLocalExtendsBoundedBaseSourcePackage_of_payload
    (P : YMSharpLocalConstructionPayload) :
    YMSharpLocalExtendsBoundedBaseSourcePackage := by
  exact
    { payload := P
      inductiveUnion := P.inductive_union
      FiniteCapSystem := P.inductive_union.FiniteCapSystem
      SharpLocalAlgebra := P.inductive_union.SharpLocalAlgebra
      SharpLocalState := P.inductive_union.SharpLocalState
      inductiveUnion_eq_payload := rfl
      finiteCapSystem_eq_payload := rfl
      sharpLocalAlgebra_eq_payload := rfl
      sharpLocalState_eq_payload := rfl
      sharpLocalExtendsBoundedBase :=
        P.inductive_union.sharp_local_extends_bounded_base_holds
      sourceLabels := ["Companion II", "5.76"]
      sourceLabelsVerified := rfl }

theorem ymSharpLocalExtendsBoundedBaseSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMSharpLocalConstructionPayload) :
    Nonempty YMSharpLocalExtendsBoundedBaseSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymSharpLocalExtendsBoundedBaseSourcePackage_of_payload P)

theorem ymSharpLocalExtendsBoundedBaseSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    Nonempty YMSharpLocalExtendsBoundedBaseSourcePackage := by
  exact
    ymSharpLocalExtendsBoundedBaseSourcePackage_nonempty_of_payload
      (ymSharpLocalConstructionPayload_nonempty_of_standard_import hImport)

def YMSharpLocalSubobligation.isClosed
    : YMSharpLocalSubobligation -> Prop
  | .finiteCapWindowDefinition =>
      Nonempty YMFiniteCapWindowDefinitionSourcePackage
  | .finiteCapExtensionTheorem =>
      Nonempty YMFiniteCapExtensionTheoremSourcePackage
  | .positiveUnitalBridge =>
      Nonempty YMPositiveUnitalBridgeSourcePackage
  | .boundedStateCompatibility =>
      Nonempty YMBoundedStateCompatibilitySourcePackage
  | .inductiveSystemCoherence =>
      Nonempty YMInductiveSystemCoherenceSourcePackage
  | .sharpLocalExtendsBoundedBase =>
      Nonempty YMSharpLocalExtendsBoundedBaseSourcePackage

def ymSharpLocalSubobligationsClosed : Prop :=
  forall O : YMSharpLocalSubobligation, O.isClosed

theorem YMSharpLocalSubobligation.finiteCapWindowDefinition_closed_of_source_package
    (hPackage : Nonempty YMFiniteCapWindowDefinitionSourcePackage) :
    YMSharpLocalSubobligation.finiteCapWindowDefinition.isClosed := by
  exact hPackage

theorem YMSharpLocalSubobligation.finiteCapWindowDefinition_source_package_exists
    (h : YMSharpLocalSubobligation.finiteCapWindowDefinition.isClosed) :
    Nonempty YMFiniteCapWindowDefinitionSourcePackage := by
  exact h

theorem ymSharpLocalFiniteCapWindowDefinitionSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    YMSharpLocalSubobligation.finiteCapWindowDefinition.isClosed := by
  exact
    YMSharpLocalSubobligation.finiteCapWindowDefinition_closed_of_source_package
      (ymFiniteCapWindowDefinitionSourcePackage_nonempty_of_standard_import
        hImport)

theorem YMSharpLocalSubobligation.finiteCapExtensionTheorem_closed_of_source_package
    (hPackage : Nonempty YMFiniteCapExtensionTheoremSourcePackage) :
    YMSharpLocalSubobligation.finiteCapExtensionTheorem.isClosed := by
  exact hPackage

theorem YMSharpLocalSubobligation.finiteCapExtensionTheorem_source_package_exists
    (h : YMSharpLocalSubobligation.finiteCapExtensionTheorem.isClosed) :
    Nonempty YMFiniteCapExtensionTheoremSourcePackage := by
  exact h

theorem ymSharpLocalFiniteCapExtensionTheoremSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    YMSharpLocalSubobligation.finiteCapExtensionTheorem.isClosed := by
  exact
    YMSharpLocalSubobligation.finiteCapExtensionTheorem_closed_of_source_package
      (ymFiniteCapExtensionTheoremSourcePackage_nonempty_of_standard_import
        hImport)

theorem YMSharpLocalSubobligation.positiveUnitalBridge_closed_of_source_package
    (hPackage : Nonempty YMPositiveUnitalBridgeSourcePackage) :
    YMSharpLocalSubobligation.positiveUnitalBridge.isClosed := by
  exact hPackage

theorem YMSharpLocalSubobligation.positiveUnitalBridge_source_package_exists
    (h : YMSharpLocalSubobligation.positiveUnitalBridge.isClosed) :
    Nonempty YMPositiveUnitalBridgeSourcePackage := by
  exact h

theorem ymSharpLocalPositiveUnitalBridgeSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    YMSharpLocalSubobligation.positiveUnitalBridge.isClosed := by
  exact
    YMSharpLocalSubobligation.positiveUnitalBridge_closed_of_source_package
      (ymPositiveUnitalBridgeSourcePackage_nonempty_of_standard_import
        hImport)

theorem YMSharpLocalSubobligation.boundedStateCompatibility_closed_of_source_package
    (hPackage : Nonempty YMBoundedStateCompatibilitySourcePackage) :
    YMSharpLocalSubobligation.boundedStateCompatibility.isClosed := by
  exact hPackage

theorem YMSharpLocalSubobligation.boundedStateCompatibility_source_package_exists
    (h : YMSharpLocalSubobligation.boundedStateCompatibility.isClosed) :
    Nonempty YMBoundedStateCompatibilitySourcePackage := by
  exact h

theorem ymSharpLocalBoundedStateCompatibilitySubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    YMSharpLocalSubobligation.boundedStateCompatibility.isClosed := by
  exact
    YMSharpLocalSubobligation.boundedStateCompatibility_closed_of_source_package
      (ymBoundedStateCompatibilitySourcePackage_nonempty_of_standard_import
        hImport)

theorem YMSharpLocalSubobligation.inductiveSystemCoherence_closed_of_source_package
    (hPackage : Nonempty YMInductiveSystemCoherenceSourcePackage) :
    YMSharpLocalSubobligation.inductiveSystemCoherence.isClosed := by
  exact hPackage

theorem YMSharpLocalSubobligation.inductiveSystemCoherence_source_package_exists
    (h : YMSharpLocalSubobligation.inductiveSystemCoherence.isClosed) :
    Nonempty YMInductiveSystemCoherenceSourcePackage := by
  exact h

theorem ymSharpLocalInductiveSystemCoherenceSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    YMSharpLocalSubobligation.inductiveSystemCoherence.isClosed := by
  exact
    YMSharpLocalSubobligation.inductiveSystemCoherence_closed_of_source_package
      (ymInductiveSystemCoherenceSourcePackage_nonempty_of_standard_import
        hImport)

theorem YMSharpLocalSubobligation.sharpLocalExtendsBoundedBase_closed_of_source_package
    (hPackage : Nonempty YMSharpLocalExtendsBoundedBaseSourcePackage) :
    YMSharpLocalSubobligation.sharpLocalExtendsBoundedBase.isClosed := by
  exact hPackage

theorem YMSharpLocalSubobligation.sharpLocalExtendsBoundedBase_source_package_exists
    (h : YMSharpLocalSubobligation.sharpLocalExtendsBoundedBase.isClosed) :
    Nonempty YMSharpLocalExtendsBoundedBaseSourcePackage := by
  exact h

theorem ymSharpLocalExtendsBoundedBaseSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardSharpLocalConstructionImport) :
    YMSharpLocalSubobligation.sharpLocalExtendsBoundedBase.isClosed := by
  exact
    YMSharpLocalSubobligation.sharpLocalExtendsBoundedBase_closed_of_source_package
      (ymSharpLocalExtendsBoundedBaseSourcePackage_nonempty_of_standard_import
        hImport)

/-- Sub-obligations for weak-window / QE3 continuum transport. -/
inductive YMContinuumTransportSubobligation
  | weakWindowCertificateDefinition
  | densityHandoff
  | graphCoreHandoff
  | qe3TransportBound
  | osTransportReadiness
  | positiveGapPreservation
  deriving DecidableEq, Repr

def YMContinuumTransportSubobligation.title :
    YMContinuumTransportSubobligation -> String
  | .weakWindowCertificateDefinition =>
      "Define the weak-window certificate"
  | .densityHandoff =>
      "Prove the density handoff"
  | .graphCoreHandoff =>
      "Prove the graph-core handoff"
  | .qe3TransportBound =>
      "Prove the QE3 transport bound"
  | .osTransportReadiness =>
      "Derive OS transport readiness"
  | .positiveGapPreservation =>
      "Preserve positivity of the transported gap"

def ymContinuumTransportSubobligations :
    List YMContinuumTransportSubobligation :=
  [ .weakWindowCertificateDefinition
  , .densityHandoff
  , .graphCoreHandoff
  , .qe3TransportBound
  , .osTransportReadiness
  , .positiveGapPreservation
  ]

/--
Source-faithful package for the first continuum-transport subobligation.

The manuscripts' weak-window certificate enters the Lean spine through the
Route 1 socket `RD.weak_window_certificate_ready`.  The already-formalized
Route 1 theorem then gives the explicit continuum transport statement used by
the downstream QE3 handoff.
-/
structure YMWeakWindowCertificateDefinitionSourcePackage where
  route : YMVacuumGapRoute
  weak_window_certificate_ready :
    route.weak_window_certificate_ready
  route1_explicit :
    ym_route1_explicit_statement route
  route1_explicit_eq :
    route1_explicit =
      YangMillsRoute1ExplicitStatementFromWeakWindowStatement
        route
        weak_window_certificate_ready
  sourceLabels : List String := ["Companion I", "IV.4", "F.298"]

def ymWeakWindowCertificateDefinitionSourcePackage_of_route
    (RD : YMVacuumGapRoute)
    (hww : RD.weak_window_certificate_ready) :
    YMWeakWindowCertificateDefinitionSourcePackage where
  route := RD
  weak_window_certificate_ready := hww
  route1_explicit :=
    YangMillsRoute1ExplicitStatementFromWeakWindowStatement RD hww
  route1_explicit_eq := rfl

theorem ymWeakWindowCertificateDefinitionSourcePackage_nonempty_of_route
    (RD : YMVacuumGapRoute)
    (hww : RD.weak_window_certificate_ready) :
    Nonempty YMWeakWindowCertificateDefinitionSourcePackage := by
  exact
    Nonempty.intro
      (ymWeakWindowCertificateDefinitionSourcePackage_of_route RD hww)

theorem ymWeakWindowCertificateDefinitionSourcePackage_nonempty_of_hypothesis_map
    {RD : YMVacuumGapRoute}
    (M : YMContinuumTransportHypothesisMap RD) :
    Nonempty YMWeakWindowCertificateDefinitionSourcePackage := by
  exact
    ymWeakWindowCertificateDefinitionSourcePackage_nonempty_of_route
      RD
      M.weak_window_certificate_ready

/--
Source-faithful package for the continuum density-handoff subobligation.

The continuum payload already isolates the manuscript's density handoff from
bounded/sharp-local data into the continuum side.  This package records that
payload component, its carrier endpoints, and the proof term for
`density_handoff_ready`.
-/
structure YMContinuumDensityHandoffSourcePackage where
  payload : YMContinuumTransportPayload
  density_handoff : YMContinuumDensityHandoffPayload
  LatticeSide : Type
  ContinuumSide : Type
  density_handoff_ready : Prop
  density_handoff_ready_holds : density_handoff_ready
  density_handoff_eq_payload :
    density_handoff = payload.density_handoff
  latticeSide_eq_payload :
    LatticeSide = payload.density_handoff.LatticeSide
  continuumSide_eq_payload :
    ContinuumSide = payload.density_handoff.ContinuumSide
  density_handoff_ready_eq_payload :
    density_handoff_ready =
      payload.density_handoff.density_handoff_ready
  sourceLabels : List String := ["Companion I", "QE3", "density handoff"]

def ymContinuumDensityHandoffSourcePackage_of_payload
    (P : YMContinuumTransportPayload) :
    YMContinuumDensityHandoffSourcePackage where
  payload := P
  density_handoff := P.density_handoff
  LatticeSide := P.density_handoff.LatticeSide
  ContinuumSide := P.density_handoff.ContinuumSide
  density_handoff_ready := P.density_handoff.density_handoff_ready
  density_handoff_ready_holds :=
    P.density_handoff.density_handoff_ready_holds
  density_handoff_eq_payload := rfl
  latticeSide_eq_payload := rfl
  continuumSide_eq_payload := rfl
  density_handoff_ready_eq_payload := rfl

theorem ymContinuumDensityHandoffSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    Nonempty YMContinuumDensityHandoffSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymContinuumDensityHandoffSourcePackage_of_payload P)

theorem ymContinuumDensityHandoffSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    Nonempty YMContinuumDensityHandoffSourcePackage := by
  exact
    ymContinuumDensityHandoffSourcePackage_nonempty_of_payload
      (ymAPlusContinuumTransportCertificate_requires_payload hCertificate)

/--
Source-faithful package for the continuum graph-core handoff subobligation.

The continuum payload isolates the graph-core handoff at the QE3 seam.  This
package records that component, its continuum carrier, graph-core carrier, and
the proof term for `graph_core_handoff_ready`.
-/
structure YMContinuumGraphCoreHandoffSourcePackage where
  payload : YMContinuumTransportPayload
  graph_core_handoff : YMContinuumGraphCoreHandoffPayload
  ContinuumSide : Type
  GraphCore : Type
  graph_core_handoff_ready : Prop
  graph_core_handoff_ready_holds : graph_core_handoff_ready
  graph_core_handoff_eq_payload :
    graph_core_handoff = payload.graph_core_handoff
  continuumSide_eq_payload :
    ContinuumSide = payload.graph_core_handoff.ContinuumSide
  graphCore_eq_payload :
    GraphCore = payload.graph_core_handoff.GraphCore
  graph_core_handoff_ready_eq_payload :
    graph_core_handoff_ready =
      payload.graph_core_handoff.graph_core_handoff_ready
  sourceLabels : List String := ["Companion I", "QE3", "graph-core handoff"]

def ymContinuumGraphCoreHandoffSourcePackage_of_payload
    (P : YMContinuumTransportPayload) :
    YMContinuumGraphCoreHandoffSourcePackage where
  payload := P
  graph_core_handoff := P.graph_core_handoff
  ContinuumSide := P.graph_core_handoff.ContinuumSide
  GraphCore := P.graph_core_handoff.GraphCore
  graph_core_handoff_ready :=
    P.graph_core_handoff.graph_core_handoff_ready
  graph_core_handoff_ready_holds :=
    P.graph_core_handoff.graph_core_handoff_ready_holds
  graph_core_handoff_eq_payload := rfl
  continuumSide_eq_payload := rfl
  graphCore_eq_payload := rfl
  graph_core_handoff_ready_eq_payload := rfl

theorem ymContinuumGraphCoreHandoffSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    Nonempty YMContinuumGraphCoreHandoffSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymContinuumGraphCoreHandoffSourcePackage_of_payload P)

theorem ymContinuumGraphCoreHandoffSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    Nonempty YMContinuumGraphCoreHandoffSourcePackage := by
  exact
    ymContinuumGraphCoreHandoffSourcePackage_nonempty_of_payload
      (ymAPlusContinuumTransportCertificate_requires_payload hCertificate)

/--
Source-faithful package for the continuum QE3 transport-bound subobligation.

The continuum payload isolates the QE3 transport-bound component.  This package
records that component, its transport-map carrier, and the proof term for
`qe3_transport_bound`.
-/
structure YMContinuumQE3TransportBoundSourcePackage where
  payload : YMContinuumTransportPayload
  qe3_transport_bound : YMQE3TransportBoundPayload
  TransportMap : Type
  qe3_transport_bound_ready : Prop
  qe3_transport_bound_holds : qe3_transport_bound_ready
  qe3_transport_bound_eq_payload :
    qe3_transport_bound = payload.qe3_transport_bound
  transportMap_eq_payload :
    TransportMap = payload.qe3_transport_bound.TransportMap
  qe3_transport_bound_ready_eq_payload :
    qe3_transport_bound_ready =
      payload.qe3_transport_bound.qe3_transport_bound
  sourceLabels : List String := ["Companion I", "QE3", "transport bound"]

def ymContinuumQE3TransportBoundSourcePackage_of_payload
    (P : YMContinuumTransportPayload) :
    YMContinuumQE3TransportBoundSourcePackage where
  payload := P
  qe3_transport_bound := P.qe3_transport_bound
  TransportMap := P.qe3_transport_bound.TransportMap
  qe3_transport_bound_ready := P.qe3_transport_bound.qe3_transport_bound
  qe3_transport_bound_holds :=
    P.qe3_transport_bound.qe3_transport_bound_holds
  qe3_transport_bound_eq_payload := rfl
  transportMap_eq_payload := rfl
  qe3_transport_bound_ready_eq_payload := rfl

theorem ymContinuumQE3TransportBoundSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    Nonempty YMContinuumQE3TransportBoundSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymContinuumQE3TransportBoundSourcePackage_of_payload P)

theorem ymContinuumQE3TransportBoundSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    Nonempty YMContinuumQE3TransportBoundSourcePackage := by
  exact
    ymContinuumQE3TransportBoundSourcePackage_nonempty_of_payload
      (ymAPlusContinuumTransportCertificate_requires_payload hCertificate)

/--
Source-faithful package for the continuum OS transport-readiness
subobligation.

The continuum payload output isolates the OS transport-readiness component.
This package records that output component and the proof term for
`os_transport_ready`.
-/
structure YMContinuumOSTransportReadinessSourcePackage where
  payload : YMContinuumTransportPayload
  output : YMContinuumTransportOutputPayload
  os_transport_ready : Prop
  os_transport_ready_holds : os_transport_ready
  output_eq_payload :
    output = payload.output
  os_transport_ready_eq_payload :
    os_transport_ready = payload.output.os_transport_ready
  sourceLabels : List String := ["Companion I", "QE3", "OS transport readiness"]

def ymContinuumOSTransportReadinessSourcePackage_of_payload
    (P : YMContinuumTransportPayload) :
    YMContinuumOSTransportReadinessSourcePackage where
  payload := P
  output := P.output
  os_transport_ready := P.output.os_transport_ready
  os_transport_ready_holds := P.output.os_transport_ready_holds
  output_eq_payload := rfl
  os_transport_ready_eq_payload := rfl

theorem ymContinuumOSTransportReadinessSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    Nonempty YMContinuumOSTransportReadinessSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymContinuumOSTransportReadinessSourcePackage_of_payload P)

theorem ymContinuumOSTransportReadinessSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    Nonempty YMContinuumOSTransportReadinessSourcePackage := by
  exact
    ymContinuumOSTransportReadinessSourcePackage_nonempty_of_payload
      (ymAPlusContinuumTransportCertificate_requires_payload hCertificate)

/--
Source-faithful package for the continuum positive-gap preservation
subobligation.

The continuum payload output isolates the transported positive-gap component.
This package records that output component and the proof term for
`positive_gap_exhibited`.
-/
structure YMContinuumPositiveGapPreservationSourcePackage where
  payload : YMContinuumTransportPayload
  output : YMContinuumTransportOutputPayload
  positive_gap_exhibited : Prop
  positive_gap_exhibited_holds : positive_gap_exhibited
  output_eq_payload :
    output = payload.output
  positive_gap_exhibited_eq_payload :
    positive_gap_exhibited = payload.output.positive_gap_exhibited
  sourceLabels : List String := ["Companion I", "QE3", "positive gap preservation"]

def ymContinuumPositiveGapPreservationSourcePackage_of_payload
    (P : YMContinuumTransportPayload) :
    YMContinuumPositiveGapPreservationSourcePackage where
  payload := P
  output := P.output
  positive_gap_exhibited := P.output.positive_gap_exhibited
  positive_gap_exhibited_holds := P.output.positive_gap_exhibited_holds
  output_eq_payload := rfl
  positive_gap_exhibited_eq_payload := rfl

theorem ymContinuumPositiveGapPreservationSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    Nonempty YMContinuumPositiveGapPreservationSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymContinuumPositiveGapPreservationSourcePackage_of_payload P)

theorem ymContinuumPositiveGapPreservationSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    Nonempty YMContinuumPositiveGapPreservationSourcePackage := by
  exact
    ymContinuumPositiveGapPreservationSourcePackage_nonempty_of_payload
      (ymAPlusContinuumTransportCertificate_requires_payload hCertificate)

def YMContinuumTransportSubobligation.isClosed
    (O : YMContinuumTransportSubobligation) : Prop :=
  match O with
  | .weakWindowCertificateDefinition =>
      Nonempty YMWeakWindowCertificateDefinitionSourcePackage
  | .densityHandoff =>
      Nonempty YMContinuumDensityHandoffSourcePackage
  | .graphCoreHandoff =>
      Nonempty YMContinuumGraphCoreHandoffSourcePackage
  | .qe3TransportBound =>
      Nonempty YMContinuumQE3TransportBoundSourcePackage
  | .osTransportReadiness =>
      Nonempty YMContinuumOSTransportReadinessSourcePackage
  | .positiveGapPreservation =>
      Nonempty YMContinuumPositiveGapPreservationSourcePackage

def ymContinuumTransportSubobligationsClosed : Prop :=
  forall O : YMContinuumTransportSubobligation, O.isClosed

theorem
    YMContinuumTransportSubobligation.weakWindowCertificateDefinition_closed_of_source_package
    (hPackage :
      Nonempty YMWeakWindowCertificateDefinitionSourcePackage) :
    YMContinuumTransportSubobligation.weakWindowCertificateDefinition.isClosed := by
  change Nonempty YMWeakWindowCertificateDefinitionSourcePackage
  exact hPackage

theorem
    YMContinuumTransportSubobligation.weakWindowCertificateDefinition_source_package_exists
    (h :
      YMContinuumTransportSubobligation.weakWindowCertificateDefinition.isClosed) :
    Nonempty YMWeakWindowCertificateDefinitionSourcePackage := by
  change Nonempty YMWeakWindowCertificateDefinitionSourcePackage at h
  exact h

theorem
    ymContinuumTransportWeakWindowCertificateDefinitionSubobligationClosed_of_hypothesis_map
    {RD : YMVacuumGapRoute}
    (M : YMContinuumTransportHypothesisMap RD) :
    YMContinuumTransportSubobligation.weakWindowCertificateDefinition.isClosed := by
  exact
    YMContinuumTransportSubobligation.weakWindowCertificateDefinition_closed_of_source_package
      (ymWeakWindowCertificateDefinitionSourcePackage_nonempty_of_hypothesis_map M)

theorem YMContinuumTransportSubobligation.densityHandoff_closed_of_source_package
    (hPackage : Nonempty YMContinuumDensityHandoffSourcePackage) :
    YMContinuumTransportSubobligation.densityHandoff.isClosed := by
  change Nonempty YMContinuumDensityHandoffSourcePackage
  exact hPackage

theorem YMContinuumTransportSubobligation.densityHandoff_source_package_exists
    (h : YMContinuumTransportSubobligation.densityHandoff.isClosed) :
    Nonempty YMContinuumDensityHandoffSourcePackage := by
  change Nonempty YMContinuumDensityHandoffSourcePackage at h
  exact h

theorem ymContinuumTransportDensityHandoffSubobligationClosed_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    YMContinuumTransportSubobligation.densityHandoff.isClosed := by
  exact
    YMContinuumTransportSubobligation.densityHandoff_closed_of_source_package
      (ymContinuumDensityHandoffSourcePackage_nonempty_of_payload hPayload)

theorem ymContinuumTransportDensityHandoffSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    YMContinuumTransportSubobligation.densityHandoff.isClosed := by
  exact
    YMContinuumTransportSubobligation.densityHandoff_closed_of_source_package
      (ymContinuumDensityHandoffSourcePackage_nonempty_of_certificate hCertificate)

theorem YMContinuumTransportSubobligation.graphCoreHandoff_closed_of_source_package
    (hPackage : Nonempty YMContinuumGraphCoreHandoffSourcePackage) :
    YMContinuumTransportSubobligation.graphCoreHandoff.isClosed := by
  change Nonempty YMContinuumGraphCoreHandoffSourcePackage
  exact hPackage

theorem YMContinuumTransportSubobligation.graphCoreHandoff_source_package_exists
    (h : YMContinuumTransportSubobligation.graphCoreHandoff.isClosed) :
    Nonempty YMContinuumGraphCoreHandoffSourcePackage := by
  change Nonempty YMContinuumGraphCoreHandoffSourcePackage at h
  exact h

theorem ymContinuumTransportGraphCoreHandoffSubobligationClosed_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    YMContinuumTransportSubobligation.graphCoreHandoff.isClosed := by
  exact
    YMContinuumTransportSubobligation.graphCoreHandoff_closed_of_source_package
      (ymContinuumGraphCoreHandoffSourcePackage_nonempty_of_payload hPayload)

theorem ymContinuumTransportGraphCoreHandoffSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    YMContinuumTransportSubobligation.graphCoreHandoff.isClosed := by
  exact
    YMContinuumTransportSubobligation.graphCoreHandoff_closed_of_source_package
      (ymContinuumGraphCoreHandoffSourcePackage_nonempty_of_certificate hCertificate)

theorem YMContinuumTransportSubobligation.qe3TransportBound_closed_of_source_package
    (hPackage : Nonempty YMContinuumQE3TransportBoundSourcePackage) :
    YMContinuumTransportSubobligation.qe3TransportBound.isClosed := by
  change Nonempty YMContinuumQE3TransportBoundSourcePackage
  exact hPackage

theorem YMContinuumTransportSubobligation.qe3TransportBound_source_package_exists
    (h : YMContinuumTransportSubobligation.qe3TransportBound.isClosed) :
    Nonempty YMContinuumQE3TransportBoundSourcePackage := by
  change Nonempty YMContinuumQE3TransportBoundSourcePackage at h
  exact h

theorem ymContinuumTransportQE3TransportBoundSubobligationClosed_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    YMContinuumTransportSubobligation.qe3TransportBound.isClosed := by
  exact
    YMContinuumTransportSubobligation.qe3TransportBound_closed_of_source_package
      (ymContinuumQE3TransportBoundSourcePackage_nonempty_of_payload hPayload)

theorem ymContinuumTransportQE3TransportBoundSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    YMContinuumTransportSubobligation.qe3TransportBound.isClosed := by
  exact
    YMContinuumTransportSubobligation.qe3TransportBound_closed_of_source_package
      (ymContinuumQE3TransportBoundSourcePackage_nonempty_of_certificate
        hCertificate)

theorem YMContinuumTransportSubobligation.osTransportReadiness_closed_of_source_package
    (hPackage : Nonempty YMContinuumOSTransportReadinessSourcePackage) :
    YMContinuumTransportSubobligation.osTransportReadiness.isClosed := by
  change Nonempty YMContinuumOSTransportReadinessSourcePackage
  exact hPackage

theorem YMContinuumTransportSubobligation.osTransportReadiness_source_package_exists
    (h : YMContinuumTransportSubobligation.osTransportReadiness.isClosed) :
    Nonempty YMContinuumOSTransportReadinessSourcePackage := by
  change Nonempty YMContinuumOSTransportReadinessSourcePackage at h
  exact h

theorem ymContinuumTransportOSTransportReadinessSubobligationClosed_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    YMContinuumTransportSubobligation.osTransportReadiness.isClosed := by
  exact
    YMContinuumTransportSubobligation.osTransportReadiness_closed_of_source_package
      (ymContinuumOSTransportReadinessSourcePackage_nonempty_of_payload hPayload)

theorem ymContinuumTransportOSTransportReadinessSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    YMContinuumTransportSubobligation.osTransportReadiness.isClosed := by
  exact
    YMContinuumTransportSubobligation.osTransportReadiness_closed_of_source_package
      (ymContinuumOSTransportReadinessSourcePackage_nonempty_of_certificate
        hCertificate)

theorem
    YMContinuumTransportSubobligation.positiveGapPreservation_closed_of_source_package
    (hPackage : Nonempty YMContinuumPositiveGapPreservationSourcePackage) :
    YMContinuumTransportSubobligation.positiveGapPreservation.isClosed := by
  change Nonempty YMContinuumPositiveGapPreservationSourcePackage
  exact hPackage

theorem
    YMContinuumTransportSubobligation.positiveGapPreservation_source_package_exists
    (h : YMContinuumTransportSubobligation.positiveGapPreservation.isClosed) :
    Nonempty YMContinuumPositiveGapPreservationSourcePackage := by
  change Nonempty YMContinuumPositiveGapPreservationSourcePackage at h
  exact h

theorem ymContinuumTransportPositiveGapPreservationSubobligationClosed_of_payload
    (hPayload : Nonempty YMContinuumTransportPayload) :
    YMContinuumTransportSubobligation.positiveGapPreservation.isClosed := by
  exact
    YMContinuumTransportSubobligation.positiveGapPreservation_closed_of_source_package
      (ymContinuumPositiveGapPreservationSourcePackage_nonempty_of_payload
        hPayload)

theorem ymContinuumTransportPositiveGapPreservationSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMContinuumTransportAPlusCertificate) :
    YMContinuumTransportSubobligation.positiveGapPreservation.isClosed := by
  exact
    YMContinuumTransportSubobligation.positiveGapPreservation_closed_of_source_package
      (ymContinuumPositiveGapPreservationSourcePackage_nonempty_of_certificate
        hCertificate)

/-- Sub-obligations for OS/Wightman reconstruction. -/
inductive YMOSWightmanSubobligation
  | osAxioms
  | reflectionPositivity
  | reconstructionHilbertSpace
  | vacuumVector
  | wightmanFields
  | smearingAndVacuumCorrelations
  deriving DecidableEq, Repr

def YMOSWightmanSubobligation.title :
    YMOSWightmanSubobligation -> String
  | .osAxioms =>
      "State and verify the OS axioms"
  | .reflectionPositivity =>
      "Prove reflection positivity in the required form"
  | .reconstructionHilbertSpace =>
      "Construct the reconstructed Hilbert space"
  | .vacuumVector =>
      "Construct the vacuum vector"
  | .wightmanFields =>
      "Construct Wightman fields"
  | .smearingAndVacuumCorrelations =>
      "Construct smearing and vacuum correlations"

def ymOSWightmanSubobligations : List YMOSWightmanSubobligation :=
  [ .osAxioms
  , .reflectionPositivity
  , .reconstructionHilbertSpace
  , .vacuumVector
  , .wightmanFields
  , .smearingAndVacuumCorrelations
  ]

/--
Source-faithful package for the OS/Wightman OS-axioms subobligation.

The reconstruction payload isolates the OS reconstruction component and carries
the proof term for `os_axioms_verified`.
-/
structure YMOSWightmanOSAxiomsSourcePackage where
  payload : YMOSWightmanReconstructionPayload
  os_reconstruction : YMOSReconstructionPayload
  os_axioms_verified : Prop
  os_axioms_verified_holds : os_axioms_verified
  os_reconstruction_eq_payload :
    os_reconstruction = payload.os_reconstruction
  os_axioms_verified_eq_payload :
    os_axioms_verified = payload.os_reconstruction.os_axioms_verified
  sourceLabels : List String :=
    ["Companion III", "OS/Wightman", "OS axioms"]

def ymOSWightmanOSAxiomsSourcePackage_of_payload
    (P : YMOSWightmanReconstructionPayload) :
    YMOSWightmanOSAxiomsSourcePackage where
  payload := P
  os_reconstruction := P.os_reconstruction
  os_axioms_verified := P.os_reconstruction.os_axioms_verified
  os_axioms_verified_holds := P.os_reconstruction.os_axioms_verified_holds
  os_reconstruction_eq_payload := rfl
  os_axioms_verified_eq_payload := rfl

theorem ymOSWightmanOSAxiomsSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    Nonempty YMOSWightmanOSAxiomsSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymOSWightmanOSAxiomsSourcePackage_of_payload P)

theorem ymOSWightmanOSAxiomsSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    Nonempty YMOSWightmanOSAxiomsSourcePackage := by
  exact
    ymOSWightmanOSAxiomsSourcePackage_nonempty_of_payload
      (ymAPlusOSWightmanCertificate_requires_payload hCertificate)

/--
Source-faithful package for the OS/Wightman reflection-positivity gate.

At this ledger layer the paper's reflection-positive Euclidean dossier is
represented by the exact theorem statement carried by the OS/Wightman A+
certificate, together with the standard OS background which turns that dossier
into reconstruction readiness.
-/
structure YMOSWightmanReflectionPositivitySourcePackage where
  certificate : YMOSWightmanAPlusCertificate
  background :
    YMStandardOSWightmanBackground
      certificate.exact_theorem_statement
      certificate.vacuum_vector_present
      certificate.wightman_fields_present
      certificate.smearing_defined
      certificate.vacuum_correlations_defined
  reflection_positive_dossier : Prop
  reflection_positive_dossier_holds : reflection_positive_dossier
  reconstruction_ready : Prop
  reconstruction_ready_holds : reconstruction_ready
  reflection_positive_dossier_eq_certificate :
    reflection_positive_dossier = certificate.exact_theorem_statement
  reconstruction_ready_eq_background :
    reconstruction_ready = background.reconstruction_ready
  sourceLabels : List String :=
    ["Companion III", "OS/Wightman", "reflection positivity"]

def ymOSWightmanReflectionPositivitySourcePackage_of_certificate
    (C : YMOSWightmanAPlusCertificate)
    (B :
      YMStandardOSWightmanBackground
        C.exact_theorem_statement
        C.vacuum_vector_present
        C.wightman_fields_present
        C.smearing_defined
        C.vacuum_correlations_defined) :
    YMOSWightmanReflectionPositivitySourcePackage where
  certificate := C
  background := B
  reflection_positive_dossier := C.exact_theorem_statement
  reflection_positive_dossier_holds := C.exact_theorem_proof
  reconstruction_ready := B.reconstruction_ready
  reconstruction_ready_holds :=
    B.dossier_implies_reconstruction C.exact_theorem_proof
  reflection_positive_dossier_eq_certificate := rfl
  reconstruction_ready_eq_background := rfl

theorem
    ymOSWightmanReflectionPositivitySourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    Nonempty YMOSWightmanReflectionPositivitySourcePackage := by
  rcases hCertificate with ⟨C⟩
  rcases C.supplies_standard_background C.exact_theorem_proof with ⟨B⟩
  exact
    Nonempty.intro
      (ymOSWightmanReflectionPositivitySourcePackage_of_certificate C B)

/--
Source-faithful package for the reconstructed Hilbert-space gate.

The OS reconstruction payload already names the reconstructed Hilbert-space
carrier and carries the reconstruction-readiness proof.  This package exposes
that carrier as the official closure witness for the Hilbert-space
subobligation.
-/
structure YMOSWightmanReconstructionHilbertSpaceSourcePackage where
  payload : YMOSWightmanReconstructionPayload
  os_reconstruction : YMOSReconstructionPayload
  HilbertSpace : Type
  reconstruction_ready : Prop
  reconstruction_ready_holds : reconstruction_ready
  os_reconstruction_eq_payload :
    os_reconstruction = payload.os_reconstruction
  hilbertSpace_eq_payload :
    HilbertSpace = payload.os_reconstruction.HilbertSpace
  reconstruction_ready_eq_payload :
    reconstruction_ready = payload.os_reconstruction.reconstruction_ready
  sourceLabels : List String :=
    ["Companion III", "OS/Wightman", "reconstructed Hilbert space"]

def ymOSWightmanReconstructionHilbertSpaceSourcePackage_of_payload
    (P : YMOSWightmanReconstructionPayload) :
    YMOSWightmanReconstructionHilbertSpaceSourcePackage where
  payload := P
  os_reconstruction := P.os_reconstruction
  HilbertSpace := P.os_reconstruction.HilbertSpace
  reconstruction_ready := P.os_reconstruction.reconstruction_ready
  reconstruction_ready_holds := P.os_reconstruction.reconstruction_ready_holds
  os_reconstruction_eq_payload := rfl
  hilbertSpace_eq_payload := rfl
  reconstruction_ready_eq_payload := rfl

theorem
    ymOSWightmanReconstructionHilbertSpaceSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymOSWightmanReconstructionHilbertSpaceSourcePackage_of_payload P)

theorem
    ymOSWightmanReconstructionHilbertSpaceSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage := by
  exact
    ymOSWightmanReconstructionHilbertSpaceSourcePackage_nonempty_of_payload
      (ymAPlusOSWightmanCertificate_requires_payload hCertificate)

/--
Source-faithful package for the OS/Wightman vacuum-vector gate.

The Wightman-field payload names the vacuum-vector carrier and carries the
proof that the vacuum vector is present.  This package exposes exactly that
data as the official closure witness for the vacuum-vector subobligation.
-/
structure YMOSWightmanVacuumVectorSourcePackage where
  payload : YMOSWightmanReconstructionPayload
  wightman_fields : YMWightmanFieldPayload
  VacuumVector : Type
  vacuum_vector_present : Prop
  vacuum_vector_present_holds : vacuum_vector_present
  wightman_fields_eq_payload :
    wightman_fields = payload.wightman_fields
  vacuumVector_eq_payload :
    VacuumVector = payload.wightman_fields.VacuumVector
  vacuum_vector_present_eq_payload :
    vacuum_vector_present = payload.wightman_fields.vacuum_vector_present
  sourceLabels : List String :=
    ["Companion III", "OS/Wightman", "vacuum vector"]

def ymOSWightmanVacuumVectorSourcePackage_of_payload
    (P : YMOSWightmanReconstructionPayload) :
    YMOSWightmanVacuumVectorSourcePackage where
  payload := P
  wightman_fields := P.wightman_fields
  VacuumVector := P.wightman_fields.VacuumVector
  vacuum_vector_present := P.wightman_fields.vacuum_vector_present
  vacuum_vector_present_holds := P.vacuum_vector_present
  wightman_fields_eq_payload := rfl
  vacuumVector_eq_payload := rfl
  vacuum_vector_present_eq_payload := rfl

theorem ymOSWightmanVacuumVectorSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    Nonempty YMOSWightmanVacuumVectorSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymOSWightmanVacuumVectorSourcePackage_of_payload P)

theorem ymOSWightmanVacuumVectorSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    Nonempty YMOSWightmanVacuumVectorSourcePackage := by
  exact
    ymOSWightmanVacuumVectorSourcePackage_nonempty_of_payload
      (ymAPlusOSWightmanCertificate_requires_payload hCertificate)

/--
Source-faithful package for the OS/Wightman Wightman-fields gate.

The Wightman-field payload names the field carrier and carries the proof that
the Wightman fields are present.  This package exposes that payload content as
the official closure witness for the Wightman-fields subobligation.
-/
structure YMOSWightmanFieldsSourcePackage where
  payload : YMOSWightmanReconstructionPayload
  wightman_fields : YMWightmanFieldPayload
  WightmanField : Type
  wightman_fields_present : Prop
  wightman_fields_present_holds : wightman_fields_present
  wightman_fields_eq_payload :
    wightman_fields = payload.wightman_fields
  wightmanField_eq_payload :
    WightmanField = payload.wightman_fields.WightmanField
  wightman_fields_present_eq_payload :
    wightman_fields_present = payload.wightman_fields.wightman_fields_present
  sourceLabels : List String :=
    ["Companion III", "OS/Wightman", "Wightman fields"]

def ymOSWightmanFieldsSourcePackage_of_payload
    (P : YMOSWightmanReconstructionPayload) :
    YMOSWightmanFieldsSourcePackage where
  payload := P
  wightman_fields := P.wightman_fields
  WightmanField := P.wightman_fields.WightmanField
  wightman_fields_present := P.wightman_fields.wightman_fields_present
  wightman_fields_present_holds := P.wightman_fields_present
  wightman_fields_eq_payload := rfl
  wightmanField_eq_payload := rfl
  wightman_fields_present_eq_payload := rfl

theorem ymOSWightmanFieldsSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    Nonempty YMOSWightmanFieldsSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymOSWightmanFieldsSourcePackage_of_payload P)

theorem ymOSWightmanFieldsSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    Nonempty YMOSWightmanFieldsSourcePackage := by
  exact
    ymOSWightmanFieldsSourcePackage_nonempty_of_payload
      (ymAPlusOSWightmanCertificate_requires_payload hCertificate)

/--
Source-faithful package for the OS/Wightman smearing and vacuum-correlation
gate.

The Wightman-field payload names the test-function, smeared-field, and
vacuum-correlation carriers, and carries proof terms for smearing and vacuum
correlations.  This package exposes those payload fields as the official
closure witness for the final OS/Wightman subobligation.
-/
structure YMOSWightmanSmearingVacuumCorrelationsSourcePackage where
  payload : YMOSWightmanReconstructionPayload
  wightman_fields : YMWightmanFieldPayload
  TestFunction : Type
  SmearedField : Type
  VacuumCorrelation : Type
  smearing_defined : Prop
  smearing_defined_holds : smearing_defined
  vacuum_correlations_defined : Prop
  vacuum_correlations_defined_holds : vacuum_correlations_defined
  wightman_fields_eq_payload :
    wightman_fields = payload.wightman_fields
  testFunction_eq_payload :
    TestFunction = payload.wightman_fields.TestFunction
  smearedField_eq_payload :
    SmearedField = payload.wightman_fields.SmearedField
  vacuumCorrelation_eq_payload :
    VacuumCorrelation = payload.wightman_fields.VacuumCorrelation
  smearing_defined_eq_payload :
    smearing_defined = payload.wightman_fields.smearing_defined
  vacuum_correlations_defined_eq_payload :
    vacuum_correlations_defined =
      payload.wightman_fields.vacuum_correlations_defined
  sourceLabels : List String :=
    ["Companion III", "OS/Wightman", "smearing", "vacuum correlations"]

def ymOSWightmanSmearingVacuumCorrelationsSourcePackage_of_payload
    (P : YMOSWightmanReconstructionPayload) :
    YMOSWightmanSmearingVacuumCorrelationsSourcePackage where
  payload := P
  wightman_fields := P.wightman_fields
  TestFunction := P.wightman_fields.TestFunction
  SmearedField := P.wightman_fields.SmearedField
  VacuumCorrelation := P.wightman_fields.VacuumCorrelation
  smearing_defined := P.wightman_fields.smearing_defined
  smearing_defined_holds := P.smearing_defined
  vacuum_correlations_defined :=
    P.wightman_fields.vacuum_correlations_defined
  vacuum_correlations_defined_holds := P.vacuum_correlations_defined
  wightman_fields_eq_payload := rfl
  testFunction_eq_payload := rfl
  smearedField_eq_payload := rfl
  vacuumCorrelation_eq_payload := rfl
  smearing_defined_eq_payload := rfl
  vacuum_correlations_defined_eq_payload := rfl

theorem
    ymOSWightmanSmearingVacuumCorrelationsSourcePackage_nonempty_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage := by
  rcases hPayload with ⟨P⟩
  exact
    Nonempty.intro
      (ymOSWightmanSmearingVacuumCorrelationsSourcePackage_of_payload P)

theorem
    ymOSWightmanSmearingVacuumCorrelationsSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage := by
  exact
    ymOSWightmanSmearingVacuumCorrelationsSourcePackage_nonempty_of_payload
      (ymAPlusOSWightmanCertificate_requires_payload hCertificate)

def YMOSWightmanSubobligation.isClosed
    (O : YMOSWightmanSubobligation) : Prop :=
  match O with
  | .osAxioms =>
      Nonempty YMOSWightmanOSAxiomsSourcePackage
  | .reflectionPositivity =>
      Nonempty YMOSWightmanReflectionPositivitySourcePackage
  | .reconstructionHilbertSpace =>
      Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage
  | .vacuumVector =>
      Nonempty YMOSWightmanVacuumVectorSourcePackage
  | .wightmanFields =>
      Nonempty YMOSWightmanFieldsSourcePackage
  | .smearingAndVacuumCorrelations =>
      Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage

def ymOSWightmanSubobligationsClosed : Prop :=
  forall O : YMOSWightmanSubobligation, O.isClosed

theorem YMOSWightmanSubobligation.osAxioms_closed_of_source_package
    (hPackage : Nonempty YMOSWightmanOSAxiomsSourcePackage) :
    YMOSWightmanSubobligation.osAxioms.isClosed := by
  change Nonempty YMOSWightmanOSAxiomsSourcePackage
  exact hPackage

theorem YMOSWightmanSubobligation.osAxioms_source_package_exists
    (h : YMOSWightmanSubobligation.osAxioms.isClosed) :
    Nonempty YMOSWightmanOSAxiomsSourcePackage := by
  change Nonempty YMOSWightmanOSAxiomsSourcePackage at h
  exact h

theorem
    YMOSWightmanSubobligation.reflectionPositivity_closed_of_source_package
    (hPackage :
      Nonempty YMOSWightmanReflectionPositivitySourcePackage) :
    YMOSWightmanSubobligation.reflectionPositivity.isClosed := by
  change Nonempty YMOSWightmanReflectionPositivitySourcePackage
  exact hPackage

theorem
    YMOSWightmanSubobligation.reflectionPositivity_source_package_exists
    (h : YMOSWightmanSubobligation.reflectionPositivity.isClosed) :
    Nonempty YMOSWightmanReflectionPositivitySourcePackage := by
  change Nonempty YMOSWightmanReflectionPositivitySourcePackage at h
  exact h

theorem
    YMOSWightmanSubobligation.reconstructionHilbertSpace_closed_of_source_package
    (hPackage :
      Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage) :
    YMOSWightmanSubobligation.reconstructionHilbertSpace.isClosed := by
  change Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage
  exact hPackage

theorem
    YMOSWightmanSubobligation.reconstructionHilbertSpace_source_package_exists
    (h : YMOSWightmanSubobligation.reconstructionHilbertSpace.isClosed) :
    Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage := by
  change Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage at h
  exact h

theorem YMOSWightmanSubobligation.vacuumVector_closed_of_source_package
    (hPackage : Nonempty YMOSWightmanVacuumVectorSourcePackage) :
    YMOSWightmanSubobligation.vacuumVector.isClosed := by
  change Nonempty YMOSWightmanVacuumVectorSourcePackage
  exact hPackage

theorem YMOSWightmanSubobligation.vacuumVector_source_package_exists
    (h : YMOSWightmanSubobligation.vacuumVector.isClosed) :
    Nonempty YMOSWightmanVacuumVectorSourcePackage := by
  change Nonempty YMOSWightmanVacuumVectorSourcePackage at h
  exact h

theorem YMOSWightmanSubobligation.wightmanFields_closed_of_source_package
    (hPackage : Nonempty YMOSWightmanFieldsSourcePackage) :
    YMOSWightmanSubobligation.wightmanFields.isClosed := by
  change Nonempty YMOSWightmanFieldsSourcePackage
  exact hPackage

theorem YMOSWightmanSubobligation.wightmanFields_source_package_exists
    (h : YMOSWightmanSubobligation.wightmanFields.isClosed) :
    Nonempty YMOSWightmanFieldsSourcePackage := by
  change Nonempty YMOSWightmanFieldsSourcePackage at h
  exact h

theorem
    YMOSWightmanSubobligation.smearingAndVacuumCorrelations_closed_of_source_package
    (hPackage :
      Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage) :
    YMOSWightmanSubobligation.smearingAndVacuumCorrelations.isClosed := by
  change Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage
  exact hPackage

theorem
    YMOSWightmanSubobligation.smearingAndVacuumCorrelations_source_package_exists
    (h :
      YMOSWightmanSubobligation.smearingAndVacuumCorrelations.isClosed) :
    Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage := by
  change Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage at h
  exact h

theorem ymOSWightmanOSAxiomsSubobligationClosed_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    YMOSWightmanSubobligation.osAxioms.isClosed := by
  exact
    YMOSWightmanSubobligation.osAxioms_closed_of_source_package
      (ymOSWightmanOSAxiomsSourcePackage_nonempty_of_payload hPayload)

theorem ymOSWightmanOSAxiomsSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    YMOSWightmanSubobligation.osAxioms.isClosed := by
  exact
    YMOSWightmanSubobligation.osAxioms_closed_of_source_package
      (ymOSWightmanOSAxiomsSourcePackage_nonempty_of_certificate hCertificate)

theorem ymOSWightmanReflectionPositivitySubobligationClosed_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    YMOSWightmanSubobligation.reflectionPositivity.isClosed := by
  exact
    YMOSWightmanSubobligation.reflectionPositivity_closed_of_source_package
      (ymOSWightmanReflectionPositivitySourcePackage_nonempty_of_certificate
        hCertificate)

theorem
    ymOSWightmanReconstructionHilbertSpaceSubobligationClosed_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    YMOSWightmanSubobligation.reconstructionHilbertSpace.isClosed := by
  exact
    YMOSWightmanSubobligation.reconstructionHilbertSpace_closed_of_source_package
      (ymOSWightmanReconstructionHilbertSpaceSourcePackage_nonempty_of_payload
        hPayload)

theorem
    ymOSWightmanReconstructionHilbertSpaceSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    YMOSWightmanSubobligation.reconstructionHilbertSpace.isClosed := by
  exact
    YMOSWightmanSubobligation.reconstructionHilbertSpace_closed_of_source_package
      (ymOSWightmanReconstructionHilbertSpaceSourcePackage_nonempty_of_certificate
        hCertificate)

theorem ymOSWightmanVacuumVectorSubobligationClosed_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    YMOSWightmanSubobligation.vacuumVector.isClosed := by
  exact
    YMOSWightmanSubobligation.vacuumVector_closed_of_source_package
      (ymOSWightmanVacuumVectorSourcePackage_nonempty_of_payload hPayload)

theorem ymOSWightmanVacuumVectorSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    YMOSWightmanSubobligation.vacuumVector.isClosed := by
  exact
    YMOSWightmanSubobligation.vacuumVector_closed_of_source_package
      (ymOSWightmanVacuumVectorSourcePackage_nonempty_of_certificate
        hCertificate)

theorem ymOSWightmanFieldsSubobligationClosed_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    YMOSWightmanSubobligation.wightmanFields.isClosed := by
  exact
    YMOSWightmanSubobligation.wightmanFields_closed_of_source_package
      (ymOSWightmanFieldsSourcePackage_nonempty_of_payload hPayload)

theorem ymOSWightmanFieldsSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    YMOSWightmanSubobligation.wightmanFields.isClosed := by
  exact
    YMOSWightmanSubobligation.wightmanFields_closed_of_source_package
      (ymOSWightmanFieldsSourcePackage_nonempty_of_certificate hCertificate)

theorem
    ymOSWightmanSmearingVacuumCorrelationsSubobligationClosed_of_payload
    (hPayload : Nonempty YMOSWightmanReconstructionPayload) :
    YMOSWightmanSubobligation.smearingAndVacuumCorrelations.isClosed := by
  exact
    YMOSWightmanSubobligation.smearingAndVacuumCorrelations_closed_of_source_package
      (ymOSWightmanSmearingVacuumCorrelationsSourcePackage_nonempty_of_payload
        hPayload)

theorem
    ymOSWightmanSmearingVacuumCorrelationsSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMOSWightmanAPlusCertificate) :
    YMOSWightmanSubobligation.smearingAndVacuumCorrelations.isClosed := by
  exact
    YMOSWightmanSubobligation.smearingAndVacuumCorrelations_closed_of_source_package
      (ymOSWightmanSmearingVacuumCorrelationsSourcePackage_nonempty_of_certificate
        hCertificate)

/--
Source package closing the first Minkowski Hamiltonian sub-obligation.

It records only the time-translation carrier data from the standard
Hamiltonian-dynamics background.  The remaining analytic assertions in that
background, especially strong continuity and self-adjoint generation, stay as
separate later gates in this row.
-/
structure YMMinkowskiTimeTranslationGroupSourcePackage where
  exact_theorem_statement : Prop
  exact_theorem_proof : exact_theorem_statement
  dynamics : YMStandardHamiltonianDynamicsBackground
  TimeParameter : Type
  HilbertSpace : Type
  TimeTranslation : TimeParameter -> Type
  time_parameter_matches :
    TimeParameter = dynamics.TimeParameter
  hilbert_space_matches :
    HilbertSpace = dynamics.HilbertSpace
  time_translation_matches :
    HEq TimeTranslation dynamics.TimeTranslation

def ymMinkowskiTimeTranslationGroupSourcePackage_of_dynamics
    (exact_theorem_statement : Prop)
    (exact_theorem_proof : exact_theorem_statement)
    (D : YMStandardHamiltonianDynamicsBackground) :
    YMMinkowskiTimeTranslationGroupSourcePackage where
  exact_theorem_statement := exact_theorem_statement
  exact_theorem_proof := exact_theorem_proof
  dynamics := D
  TimeParameter := D.TimeParameter
  HilbertSpace := D.HilbertSpace
  TimeTranslation := D.TimeTranslation
  time_parameter_matches := rfl
  hilbert_space_matches := rfl
  time_translation_matches := HEq.rfl

theorem ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_dynamics
    (exact_theorem_statement : Prop)
    (exact_theorem_proof : exact_theorem_statement)
    (hDynamics : Nonempty YMStandardHamiltonianDynamicsBackground) :
    Nonempty YMMinkowskiTimeTranslationGroupSourcePackage := by
  cases hDynamics with
  | intro D =>
      exact
        Nonempty.intro
          (ymMinkowskiTimeTranslationGroupSourcePackage_of_dynamics
            exact_theorem_statement
            exact_theorem_proof
            D)

theorem ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_certificate
    (hCertificate : Nonempty YMMinkowskiHamiltonianGapAPlusCertificate) :
    Nonempty YMMinkowskiTimeTranslationGroupSourcePackage := by
  cases hCertificate with
  | intro C =>
      exact
        ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_dynamics
          C.exact_theorem_statement
          C.exact_theorem_proof
          (C.supplies_hamiltonian_dynamics C.exact_theorem_proof)

theorem ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiTimeTranslationGroupSourcePackage := by
  exact
    ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_certificate
      (ymAPlusMinkowskiCertificate_nonempty_of_standard_import hImport)

/--
Source package closing strong continuity of the Minkowski time-translation
family.

The proof is projected from the strengthened standard Hamiltonian-dynamics
import.  Later gates still keep the self-adjoint generator, spectral gap, zero
kernel uniqueness, and final route transfer separate.
-/
structure YMMinkowskiStrongContinuitySourcePackage where
  exact_theorem_statement : Prop
  exact_theorem_proof : exact_theorem_statement
  dynamics : YMStandardHamiltonianDynamicsBackground
  dynamics_complete : dynamics.complete
  time_translation_package :
    YMMinkowskiTimeTranslationGroupSourcePackage
  strongly_continuous_time_translations :
    dynamics.strongly_continuous_time_translations

def ymMinkowskiStrongContinuitySourcePackage_of_standard_import
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiStrongContinuitySourcePackage where
  exact_theorem_statement := I.dossier_ready
  exact_theorem_proof := I.dossier_ready_holds
  dynamics := I.hamiltonian_dynamics
  dynamics_complete := I.hamiltonian_dynamics_complete
  time_translation_package :=
    ymMinkowskiTimeTranslationGroupSourcePackage_of_dynamics
      I.dossier_ready
      I.dossier_ready_holds
      I.hamiltonian_dynamics
  strongly_continuous_time_translations :=
    I.hamiltonian_dynamics_complete.1

theorem ymMinkowskiStrongContinuitySourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiStrongContinuitySourcePackage := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ymMinkowskiStrongContinuitySourcePackage_of_standard_import I⟩

/--
Source package closing construction of the self-adjoint Hamiltonian generator.

This is projected from the same complete Hamiltonian-dynamics standard import
used for strong continuity.  The spectral gap statement itself stays as the
next gate.
-/
structure YMMinkowskiSelfAdjointGeneratorSourcePackage where
  exact_theorem_statement : Prop
  exact_theorem_proof : exact_theorem_statement
  dynamics : YMStandardHamiltonianDynamicsBackground
  dynamics_complete : dynamics.complete
  strong_continuity_package :
    YMMinkowskiStrongContinuitySourcePackage
  Hamiltonian : Type
  hamiltonian_matches : Hamiltonian = dynamics.Hamiltonian
  self_adjoint_hamiltonian_generator :
    dynamics.self_adjoint_hamiltonian_generator

def ymMinkowskiSelfAdjointGeneratorSourcePackage_of_standard_import
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiSelfAdjointGeneratorSourcePackage where
  exact_theorem_statement := I.dossier_ready
  exact_theorem_proof := I.dossier_ready_holds
  dynamics := I.hamiltonian_dynamics
  dynamics_complete := I.hamiltonian_dynamics_complete
  strong_continuity_package :=
    ymMinkowskiStrongContinuitySourcePackage_of_standard_import I
  Hamiltonian := I.hamiltonian_dynamics.Hamiltonian
  hamiltonian_matches := rfl
  self_adjoint_hamiltonian_generator :=
    I.hamiltonian_dynamics_complete.2.1

theorem
    ymMinkowskiSelfAdjointGeneratorSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiSelfAdjointGeneratorSourcePackage := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ymMinkowskiSelfAdjointGeneratorSourcePackage_of_standard_import I⟩

/--
Source package closing the Hamiltonian spectral-gap statement.

It records the real spectral payload, the route-facing standard gap object,
and the bridge proofs for positive gap and absence of subgap spectrum.  The
zero-energy vacuum-kernel uniqueness component is intentionally left to the
next sub-obligation.
-/
structure YMMinkowskiSpectralGapStatementSourcePackage where
  exact_theorem_statement : Prop
  exact_theorem_proof : exact_theorem_statement
  self_adjoint_generator_package :
    YMMinkowskiSelfAdjointGeneratorSourcePackage
  spectral_payload : Papers.YangMills.YMHamiltonianRealMassGap
  standard_gap : YMVacuumHamiltonianMassGap
  standard_transfer : YMStandardMinkowskiGapTransfer
  payload_bridge : YMMinkowskiHamiltonianMassGapPayloadBridge
  bridge_matches_payload :
    payload_bridge.spectral_payload = spectral_payload
  transfer_matches_bridge :
    standard_transfer.spectral_gap = payload_bridge.standard_gap
  standard_gap_matches_bridge :
    standard_gap = payload_bridge.standard_gap
  positive_gap : 0 < spectral_payload.gap
  spectral_values_are_vacuum_or_above_gap :
    forall {energy : Real},
      spectral_payload.spectrum energy ->
        energy = 0 \/ spectral_payload.gap <= energy
  standard_positive_gap_scale : standard_gap.positive_gap_scale
  standard_spectrum_gap : standard_gap.spectrum_gap

def ymMinkowskiSpectralGapStatementSourcePackage_of_standard_import
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiSpectralGapStatementSourcePackage where
  exact_theorem_statement := I.dossier_ready
  exact_theorem_proof := I.dossier_ready_holds
  self_adjoint_generator_package :=
    ymMinkowskiSelfAdjointGeneratorSourcePackage_of_standard_import I
  spectral_payload := I.hamiltonian_payload_bridge.spectral_payload
  standard_gap := I.hamiltonian_payload_bridge.standard_gap
  standard_transfer := I.standard_transfer
  payload_bridge := I.hamiltonian_payload_bridge
  bridge_matches_payload := rfl
  transfer_matches_bridge := I.transfer_matches_bridge
  standard_gap_matches_bridge := rfl
  positive_gap :=
    I.hamiltonian_payload_bridge.spectral_payload.positive_gap
  spectral_values_are_vacuum_or_above_gap :=
    fun henergy =>
      YMHamiltonianRealMassGap.spectral_values_are_vacuum_or_above_gap
        I.hamiltonian_payload_bridge.spectral_payload
        henergy
  standard_positive_gap_scale :=
    I.hamiltonian_payload_bridge.positive_gap_from_payload
      I.hamiltonian_payload_bridge.spectral_payload.positive_gap
  standard_spectrum_gap :=
    I.hamiltonian_payload_bridge.spectrum_gap_from_payload
      (fun henergy =>
        YMHamiltonianRealMassGap.spectral_values_are_vacuum_or_above_gap
          I.hamiltonian_payload_bridge.spectral_payload
          henergy)

theorem
    ymMinkowskiSpectralGapStatementSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiSpectralGapStatementSourcePackage := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ymMinkowskiSpectralGapStatementSourcePackage_of_standard_import I⟩

/--
Source package closing uniqueness of the zero-energy vacuum kernel.

It projects the real zero-energy-to-vacuum theorem from the spectral payload
and transports it through the route-facing payload bridge.
-/
structure YMMinkowskiUniqueVacuumKernelSourcePackage where
  exact_theorem_statement : Prop
  exact_theorem_proof : exact_theorem_statement
  spectral_gap_package :
    YMMinkowskiSpectralGapStatementSourcePackage
  spectral_payload : Papers.YangMills.YMHamiltonianRealMassGap
  standard_gap : YMVacuumHamiltonianMassGap
  payload_bridge : YMMinkowskiHamiltonianMassGapPayloadBridge
  bridge_matches_payload :
    payload_bridge.spectral_payload = spectral_payload
  standard_gap_matches_bridge :
    standard_gap = payload_bridge.standard_gap
  zero_energy_state_is_vacuum :
    forall {psi : spectral_payload.HilbertSpace},
      spectral_payload.zeroEnergyState psi ->
        spectral_payload.vacuumSector psi
  standard_vacuum_kernel_unique :
    standard_gap.vacuum_kernel_unique

def ymMinkowskiUniqueVacuumKernelSourcePackage_of_standard_import
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiUniqueVacuumKernelSourcePackage where
  exact_theorem_statement := I.dossier_ready
  exact_theorem_proof := I.dossier_ready_holds
  spectral_gap_package :=
    ymMinkowskiSpectralGapStatementSourcePackage_of_standard_import I
  spectral_payload := I.hamiltonian_payload_bridge.spectral_payload
  standard_gap := I.hamiltonian_payload_bridge.standard_gap
  payload_bridge := I.hamiltonian_payload_bridge
  bridge_matches_payload := rfl
  standard_gap_matches_bridge := rfl
  zero_energy_state_is_vacuum :=
    fun hpsi =>
      YMHamiltonianRealMassGap.zero_energy_is_vacuum
        I.hamiltonian_payload_bridge.spectral_payload
        hpsi
  standard_vacuum_kernel_unique :=
    I.hamiltonian_payload_bridge.vacuum_kernel_from_payload
      (fun hpsi =>
        YMHamiltonianRealMassGap.zero_energy_is_vacuum
          I.hamiltonian_payload_bridge.spectral_payload
          hpsi)

theorem
    ymMinkowskiUniqueVacuumKernelSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiUniqueVacuumKernelSourcePackage := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ymMinkowskiUniqueVacuumKernelSourcePackage_of_standard_import I⟩

/--
Route-level transfer of the completed Minkowski spectral-gap data.

The route object already records the manuscript chain:
weak-window readiness transports to continuum readiness, continuum readiness
feeds reconstruction, and reconstruction exhibits Minkowski-gap readiness.
-/
theorem ymMinkowskiRouteGapReady_of_weak_window
    (R : YMVacuumGapRoute)
    (hWeakWindow : R.weak_window_certificate_ready) :
    R.reconstruction_package.minkowski_gap_ready := by
  have hTransport : R.continuum_gap_transport_ready :=
    R.weak_window_yields_transport hWeakWindow
  have hReconstruction : R.reconstruction_ready :=
    R.transport_feeds_reconstruction hTransport
  exact R.reconstruction_exhibits_minkowski_gap hReconstruction

/--
Source package closing the final Minkowski Hamiltonian-gap transfer gate.

It keeps the spectral-gap/vacuum-kernel closure package attached, records the
standard gap as closed, and exposes the route theorem that turns weak-window
readiness into route-facing Minkowski-gap readiness.
-/
structure YMMinkowskiTransferToRouteSourcePackage where
  exact_theorem_statement : Prop
  exact_theorem_proof : exact_theorem_statement
  unique_vacuum_kernel_package :
    YMMinkowskiUniqueVacuumKernelSourcePackage
  standard_gap : YMVacuumHamiltonianMassGap
  standard_gap_closed : standard_gap.closed
  standard_gap_matches_unique_package :
    standard_gap = unique_vacuum_kernel_package.standard_gap
  route_gap_ready_of_weak_window :
    forall R : YMVacuumGapRoute,
      R.weak_window_certificate_ready ->
        R.reconstruction_package.minkowski_gap_ready

def ymMinkowskiTransferToRouteSourcePackage_of_standard_import
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiTransferToRouteSourcePackage where
  exact_theorem_statement := I.dossier_ready
  exact_theorem_proof := I.dossier_ready_holds
  unique_vacuum_kernel_package :=
    ymMinkowskiUniqueVacuumKernelSourcePackage_of_standard_import I
  standard_gap := I.hamiltonian_payload_bridge.standard_gap
  standard_gap_closed :=
    And.intro
      (ymMinkowskiSpectralGapStatementSourcePackage_of_standard_import I).standard_positive_gap_scale
      (And.intro
        (ymMinkowskiSpectralGapStatementSourcePackage_of_standard_import I).standard_spectrum_gap
        (ymMinkowskiUniqueVacuumKernelSourcePackage_of_standard_import I).standard_vacuum_kernel_unique)
  standard_gap_matches_unique_package := rfl
  route_gap_ready_of_weak_window := ymMinkowskiRouteGapReady_of_weak_window

theorem
    ymMinkowskiTransferToRouteSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiTransferToRouteSourcePackage := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ymMinkowskiTransferToRouteSourcePackage_of_standard_import I⟩

/-- Sub-obligations for Minkowski Hamiltonian mass-gap transfer. -/
inductive YMMinkowskiHamiltonianGapSubobligation
  | timeTranslationGroup
  | strongContinuity
  | selfAdjointGenerator
  | spectralGapStatement
  | uniqueVacuumKernel
  | transferToRouteMinkowskiGap
  deriving DecidableEq, Repr

def YMMinkowskiHamiltonianGapSubobligation.title :
    YMMinkowskiHamiltonianGapSubobligation -> String
  | .timeTranslationGroup =>
      "Construct the time-translation group"
  | .strongContinuity =>
      "Prove strong continuity of time translations"
  | .selfAdjointGenerator =>
      "Construct the self-adjoint Hamiltonian generator"
  | .spectralGapStatement =>
      "Prove the Hamiltonian spectral gap statement"
  | .uniqueVacuumKernel =>
      "Prove uniqueness of the zero-energy vacuum kernel"
  | .transferToRouteMinkowskiGap =>
      "Transfer the spectral gap to route Minkowski-gap readiness"

def ymMinkowskiHamiltonianGapSubobligations :
    List YMMinkowskiHamiltonianGapSubobligation :=
  [ .timeTranslationGroup
  , .strongContinuity
  , .selfAdjointGenerator
  , .spectralGapStatement
  , .uniqueVacuumKernel
  , .transferToRouteMinkowskiGap
  ]

def YMMinkowskiHamiltonianGapSubobligation.isClosed
    : YMMinkowskiHamiltonianGapSubobligation -> Prop
  | .timeTranslationGroup =>
      Nonempty YMMinkowskiTimeTranslationGroupSourcePackage
  | .strongContinuity =>
      Nonempty YMMinkowskiStrongContinuitySourcePackage
  | .selfAdjointGenerator =>
      Nonempty YMMinkowskiSelfAdjointGeneratorSourcePackage
  | .spectralGapStatement =>
      Nonempty YMMinkowskiSpectralGapStatementSourcePackage
  | .uniqueVacuumKernel =>
      Nonempty YMMinkowskiUniqueVacuumKernelSourcePackage
  | .transferToRouteMinkowskiGap =>
      Nonempty YMMinkowskiTransferToRouteSourcePackage

def ymMinkowskiHamiltonianGapSubobligationsClosed : Prop :=
  forall O : YMMinkowskiHamiltonianGapSubobligation, O.isClosed

theorem
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup_closed_of_source_package
    (hPackage : Nonempty YMMinkowskiTimeTranslationGroupSourcePackage) :
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup.isClosed := by
  exact hPackage

theorem
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup_source_package_exists
    (hClosed :
      YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup.isClosed) :
    Nonempty YMMinkowskiTimeTranslationGroupSourcePackage := by
  exact hClosed

theorem ymMinkowskiTimeTranslationGroupSubobligationClosed_of_dynamics
    (exact_theorem_statement : Prop)
    (exact_theorem_proof : exact_theorem_statement)
    (hDynamics : Nonempty YMStandardHamiltonianDynamicsBackground) :
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup_closed_of_source_package
      (ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_dynamics
        exact_theorem_statement
        exact_theorem_proof
        hDynamics)

theorem ymMinkowskiTimeTranslationGroupSubobligationClosed_of_certificate
    (hCertificate : Nonempty YMMinkowskiHamiltonianGapAPlusCertificate) :
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup_closed_of_source_package
      (ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_certificate
        hCertificate)

theorem ymMinkowskiTimeTranslationGroupSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup_closed_of_source_package
      (ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMMinkowskiHamiltonianGapSubobligation.strongContinuity_closed_of_source_package
    (hPackage : Nonempty YMMinkowskiStrongContinuitySourcePackage) :
    YMMinkowskiHamiltonianGapSubobligation.strongContinuity.isClosed := by
  exact hPackage

theorem
    YMMinkowskiHamiltonianGapSubobligation.strongContinuity_source_package_exists
    (hClosed :
      YMMinkowskiHamiltonianGapSubobligation.strongContinuity.isClosed) :
    Nonempty YMMinkowskiStrongContinuitySourcePackage := by
  exact hClosed

theorem ymMinkowskiStrongContinuitySubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiHamiltonianGapSubobligation.strongContinuity.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.strongContinuity_closed_of_source_package
      (ymMinkowskiStrongContinuitySourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMMinkowskiHamiltonianGapSubobligation.selfAdjointGenerator_closed_of_source_package
    (hPackage : Nonempty YMMinkowskiSelfAdjointGeneratorSourcePackage) :
    YMMinkowskiHamiltonianGapSubobligation.selfAdjointGenerator.isClosed := by
  exact hPackage

theorem
    YMMinkowskiHamiltonianGapSubobligation.selfAdjointGenerator_source_package_exists
    (hClosed :
      YMMinkowskiHamiltonianGapSubobligation.selfAdjointGenerator.isClosed) :
    Nonempty YMMinkowskiSelfAdjointGeneratorSourcePackage := by
  exact hClosed

theorem ymMinkowskiSelfAdjointGeneratorSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiHamiltonianGapSubobligation.selfAdjointGenerator.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.selfAdjointGenerator_closed_of_source_package
      (ymMinkowskiSelfAdjointGeneratorSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMMinkowskiHamiltonianGapSubobligation.spectralGapStatement_closed_of_source_package
    (hPackage : Nonempty YMMinkowskiSpectralGapStatementSourcePackage) :
    YMMinkowskiHamiltonianGapSubobligation.spectralGapStatement.isClosed := by
  exact hPackage

theorem
    YMMinkowskiHamiltonianGapSubobligation.spectralGapStatement_source_package_exists
    (hClosed :
      YMMinkowskiHamiltonianGapSubobligation.spectralGapStatement.isClosed) :
    Nonempty YMMinkowskiSpectralGapStatementSourcePackage := by
  exact hClosed

theorem ymMinkowskiSpectralGapStatementSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiHamiltonianGapSubobligation.spectralGapStatement.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.spectralGapStatement_closed_of_source_package
      (ymMinkowskiSpectralGapStatementSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMMinkowskiHamiltonianGapSubobligation.uniqueVacuumKernel_closed_of_source_package
    (hPackage : Nonempty YMMinkowskiUniqueVacuumKernelSourcePackage) :
    YMMinkowskiHamiltonianGapSubobligation.uniqueVacuumKernel.isClosed := by
  exact hPackage

theorem
    YMMinkowskiHamiltonianGapSubobligation.uniqueVacuumKernel_source_package_exists
    (hClosed :
      YMMinkowskiHamiltonianGapSubobligation.uniqueVacuumKernel.isClosed) :
    Nonempty YMMinkowskiUniqueVacuumKernelSourcePackage := by
  exact hClosed

theorem ymMinkowskiUniqueVacuumKernelSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiHamiltonianGapSubobligation.uniqueVacuumKernel.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.uniqueVacuumKernel_closed_of_source_package
      (ymMinkowskiUniqueVacuumKernelSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMMinkowskiHamiltonianGapSubobligation.transferToRouteMinkowskiGap_closed_of_source_package
    (hPackage : Nonempty YMMinkowskiTransferToRouteSourcePackage) :
    YMMinkowskiHamiltonianGapSubobligation.transferToRouteMinkowskiGap.isClosed := by
  exact hPackage

theorem
    YMMinkowskiHamiltonianGapSubobligation.transferToRouteMinkowskiGap_source_package_exists
    (hClosed :
      YMMinkowskiHamiltonianGapSubobligation.transferToRouteMinkowskiGap.isClosed) :
    Nonempty YMMinkowskiTransferToRouteSourcePackage := by
  exact hClosed

theorem ymMinkowskiTransferToRouteMinkowskiGapSubobligationClosed_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    YMMinkowskiHamiltonianGapSubobligation.transferToRouteMinkowskiGap.isClosed := by
  exact
    YMMinkowskiHamiltonianGapSubobligation.transferToRouteMinkowskiGap_closed_of_source_package
      (ymMinkowskiTransferToRouteSourcePackage_nonempty_of_standard_import
        hImport)

/--
Source package for the exact local-net endpoint definition gate.

This is the carrier-level endpoint construction already present in the
manuscript endpoint files: the concrete endpoint carrier determines the
Wightman field witness, vacuum vector, smearing map, and vacuum correlations,
and those combine into the exact local-net endpoint shadow.
-/
structure YMEndpointExactEndpointDefinitionSourcePackage where
  source_carrier : YMEndpointManuscriptCarrierBase
  local_net_endpoint_carrier : Type
  local_net_endpoint_carrier_matches_source :
    local_net_endpoint_carrier = source_carrier.EndpointLocalNet
  exact_endpoint_statement : Prop
  exact_endpoint_statement_matches_source :
    exact_endpoint_statement =
      YMEndpointExactLocalNetEndpoint source_carrier
  faithful_wilson_universality :
    YMEndpointFaithfulWilsonUniversality source_carrier
  os_data_complete :
    YMEndpointOSDataComplete source_carrier
  exact_endpoint_witness :
    exact_endpoint_statement

noncomputable def
    ymEndpointExactEndpointDefinitionSourcePackage_of_manuscript_carrier
    (B : YMEndpointManuscriptCarrierBase) :
    YMEndpointExactEndpointDefinitionSourcePackage where
  source_carrier := B
  local_net_endpoint_carrier := B.EndpointLocalNet
  local_net_endpoint_carrier_matches_source := rfl
  exact_endpoint_statement := YMEndpointExactLocalNetEndpoint B
  exact_endpoint_statement_matches_source := rfl
  faithful_wilson_universality :=
    ym_endpoint_faithful_wilson_universality_holds B
  os_data_complete :=
    ym_endpoint_os_data_complete_holds B
  exact_endpoint_witness :=
    ym_endpoint_exact_local_net_endpoint_holds B

noncomputable def
    ymEndpointExactEndpointDefinitionSourcePackage_of_current_manuscript :
    YMEndpointExactEndpointDefinitionSourcePackage :=
  ymEndpointExactEndpointDefinitionSourcePackage_of_manuscript_carrier
    ym_endpoint_manuscript_carrier_base

theorem ymEndpointExactEndpointDefinitionSourcePackage_nonempty_of_current_manuscript :
    Nonempty YMEndpointExactEndpointDefinitionSourcePackage := by
  exact
    ⟨ymEndpointExactEndpointDefinitionSourcePackage_of_current_manuscript⟩

/--
Source package for faithful-Wilson universality.

At the current endpoint-carrier layer this is the manuscript shadow saying the
reconstructed Wightman field family and reconstructed vacuum vector are both
present.  The stronger named O.2/O.3 theorem-content surfaces remain available
elsewhere and feed later transfer gates.
-/
structure YMEndpointFaithfulWilsonUniversalitySourcePackage where
  source_carrier : YMEndpointManuscriptCarrierBase
  wightman_fields_present :
    YMEndpointWightmanFieldsPresent source_carrier
  vacuum_vector_present :
    YMEndpointVacuumVectorPresent source_carrier
  faithful_wilson_universality :
    YMEndpointFaithfulWilsonUniversality source_carrier

noncomputable def
    ymEndpointFaithfulWilsonUniversalitySourcePackage_of_manuscript_carrier
    (B : YMEndpointManuscriptCarrierBase) :
    YMEndpointFaithfulWilsonUniversalitySourcePackage where
  source_carrier := B
  wightman_fields_present :=
    ym_endpoint_wightman_fields_present_holds B
  vacuum_vector_present :=
    ym_endpoint_vacuum_vector_present_holds B
  faithful_wilson_universality :=
    ym_endpoint_faithful_wilson_universality_holds B

noncomputable def
    ymEndpointFaithfulWilsonUniversalitySourcePackage_of_current_manuscript :
    YMEndpointFaithfulWilsonUniversalitySourcePackage :=
  ymEndpointFaithfulWilsonUniversalitySourcePackage_of_manuscript_carrier
    ym_endpoint_manuscript_carrier_base

theorem ymEndpointFaithfulWilsonUniversalitySourcePackage_nonempty_of_current_manuscript :
    Nonempty YMEndpointFaithfulWilsonUniversalitySourcePackage := by
  exact
    ⟨ymEndpointFaithfulWilsonUniversalitySourcePackage_of_current_manuscript⟩

/--
Source package for endpoint-boundary admissibility.

The boundary statement is the concrete endpoint side-condition already proved
for the closed instantiated manuscript object.  It packages the exact endpoint
witness together with the theorem-register ownership fact for the
exact-endpoint / extended-support exclusion theorem.
-/
structure YMEndpointBoundaryAdmissibilitySourcePackage where
  manuscript : YMClosedInstantiatedManuscript
  side_conditions : YMConcreteEndpointSideConditions
  side_conditions_match_manuscript :
    side_conditions =
      YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript
        manuscript
  boundary_statement : Prop
  boundary_statement_matches_source :
    boundary_statement =
      YMConcreteEndpointSideConditions.endpointBoundaryStatement
        side_conditions
  endpoint_boundary_admissible :
    boundary_statement

noncomputable def
    ymEndpointBoundaryAdmissibilitySourcePackage_of_closed_instantiated_manuscript
    (I : YMClosedInstantiatedManuscript) :
    YMEndpointBoundaryAdmissibilitySourcePackage where
  manuscript := I
  side_conditions :=
    YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I
  side_conditions_match_manuscript := rfl
  boundary_statement :=
    YMConcreteEndpointSideConditions.endpointBoundaryStatement
      (YMConcreteEndpointSideConditions.ofClosedInstantiatedManuscript I)
  boundary_statement_matches_source := rfl
  endpoint_boundary_admissible :=
    YangMillsConcreteEndpointBoundaryStatementOfClosedInstantiatedManuscript I

noncomputable def
    ymEndpointBoundaryAdmissibilitySourcePackage_of_current_manuscript :
    YMEndpointBoundaryAdmissibilitySourcePackage :=
  ymEndpointBoundaryAdmissibilitySourcePackage_of_closed_instantiated_manuscript
    MaleyLean.I

theorem ymEndpointBoundaryAdmissibilitySourcePackage_nonempty_of_current_manuscript :
    Nonempty YMEndpointBoundaryAdmissibilitySourcePackage := by
  exact
    ⟨ymEndpointBoundaryAdmissibilitySourcePackage_of_current_manuscript⟩

/--
Source package for exclusion of extended-support sector data.

The concrete endpoint native proof-home layer exports the manuscript's `O.5`
theorem content: exact local-net endpoint together with exclusion of
extended-support sector data.
-/
structure YMEndpointNoExtendedSupportSectorDataSourcePackage where
  manuscript : YMClosedInstantiatedManuscript
  endpoint_core : YMEndpointCore
  endpoint_core_matches_manuscript :
    endpoint_core = manuscript.blueprint.objects.RE
  exclusion_statement : Prop
  exclusion_statement_matches_source :
    exclusion_statement =
      ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
        endpoint_core
  no_extended_support_sector_data :
    exclusion_statement

noncomputable def
    ymEndpointNoExtendedSupportSectorDataSourcePackage_of_closed_instantiated_manuscript
    (I : YMClosedInstantiatedManuscript) :
    YMEndpointNoExtendedSupportSectorDataSourcePackage where
  manuscript := I
  endpoint_core := I.blueprint.objects.RE
  endpoint_core_matches_manuscript := rfl
  exclusion_statement :=
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
      I.blueprint.objects.RE
  exclusion_statement_matches_source := rfl
  no_extended_support_sector_data :=
    YangMillsConcreteExactEndpointExclusionStatementFromEndpointNativeProofHomes I

noncomputable def
    ymEndpointNoExtendedSupportSectorDataSourcePackage_of_current_manuscript :
    YMEndpointNoExtendedSupportSectorDataSourcePackage :=
  ymEndpointNoExtendedSupportSectorDataSourcePackage_of_closed_instantiated_manuscript
    MaleyLean.I

theorem
    ymEndpointNoExtendedSupportSectorDataSourcePackage_nonempty_of_current_manuscript :
    Nonempty YMEndpointNoExtendedSupportSectorDataSourcePackage := by
  exact
    ⟨ymEndpointNoExtendedSupportSectorDataSourcePackage_of_current_manuscript⟩

/--
Source package for vacuum-vector compatibility.

This packages the endpoint manuscript carrier's chosen reconstructed vacuum
vector `Omega_loc` together with the endpoint proposition saying the vacuum
vector is present. The named-output equality ties the packaged vector back to
the manuscript carrier rather than treating it as free data.
-/
structure YMEndpointVacuumVectorCompatibilitySourcePackage where
  source_carrier : YMEndpointManuscriptCarrierBase
  VacuumVector : Type
  vacuum_vector : VacuumVector
  vacuum_vector_type_matches_source :
    VacuumVector = source_carrier.EndpointReconstructedHilbert
  vacuum_vector_matches_source :
    HEq vacuum_vector source_carrier.Omega_loc
  vacuum_vector_present :
    YMEndpointVacuumVectorPresent source_carrier

noncomputable def
    ymEndpointVacuumVectorCompatibilitySourcePackage_of_manuscript_carrier
    (B : YMEndpointManuscriptCarrierBase) :
    YMEndpointVacuumVectorCompatibilitySourcePackage where
  source_carrier := B
  VacuumVector := B.EndpointReconstructedHilbert
  vacuum_vector := B.Omega_loc
  vacuum_vector_type_matches_source := rfl
  vacuum_vector_matches_source := HEq.rfl
  vacuum_vector_present :=
    ym_endpoint_vacuum_vector_present_holds B

noncomputable def
    ymEndpointVacuumVectorCompatibilitySourcePackage_of_current_manuscript :
    YMEndpointVacuumVectorCompatibilitySourcePackage :=
  ymEndpointVacuumVectorCompatibilitySourcePackage_of_manuscript_carrier
    ym_endpoint_manuscript_carrier_base

theorem
    ymEndpointVacuumVectorCompatibilitySourcePackage_nonempty_of_current_manuscript :
    Nonempty YMEndpointVacuumVectorCompatibilitySourcePackage := by
  exact
    ⟨ymEndpointVacuumVectorCompatibilitySourcePackage_of_current_manuscript⟩

/--
Source package for transfer to the named endpoint theorem statement.

This is the named endpoint theorem surface used by the manuscript and route
tables: exact local-net endpoint plus exclusion of extended-support sector
data, exported at `O.5` from the endpoint native proof-home layer.
-/
structure YMEndpointTransferToNamedEndpointStatementSourcePackage where
  manuscript : YMClosedInstantiatedManuscript
  endpoint_core : YMEndpointCore
  endpoint_core_matches_manuscript :
    endpoint_core = manuscript.blueprint.objects.RE
  named_endpoint_statement : Prop
  named_endpoint_statement_matches_source :
    named_endpoint_statement =
      ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
        endpoint_core
  transfer_to_named_endpoint_statement :
    named_endpoint_statement

noncomputable def
    ymEndpointTransferToNamedEndpointStatementSourcePackage_of_closed_instantiated_manuscript
    (I : YMClosedInstantiatedManuscript) :
    YMEndpointTransferToNamedEndpointStatementSourcePackage where
  manuscript := I
  endpoint_core := I.blueprint.objects.RE
  endpoint_core_matches_manuscript := rfl
  named_endpoint_statement :=
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement
      I.blueprint.objects.RE
  named_endpoint_statement_matches_source := rfl
  transfer_to_named_endpoint_statement :=
    YangMillsConcreteExactEndpointExclusionStatementFromEndpointNativeProofHomes I

noncomputable def
    ymEndpointTransferToNamedEndpointStatementSourcePackage_of_current_manuscript :
    YMEndpointTransferToNamedEndpointStatementSourcePackage :=
  ymEndpointTransferToNamedEndpointStatementSourcePackage_of_closed_instantiated_manuscript
    MaleyLean.I

theorem
    ymEndpointTransferToNamedEndpointStatementSourcePackage_nonempty_of_current_manuscript :
    Nonempty YMEndpointTransferToNamedEndpointStatementSourcePackage := by
  exact
    ⟨ymEndpointTransferToNamedEndpointStatementSourcePackage_of_current_manuscript⟩

/-- Sub-obligations for endpoint exactness and extended-support exclusion. -/
inductive YMEndpointExactnessSubobligation
  | exactEndpointDefinition
  | faithfulWilsonUniversality
  | endpointBoundaryAdmissibility
  | noExtendedSupportSectorData
  | vacuumVectorCompatibility
  | transferToNamedEndpointStatement
  deriving DecidableEq, Repr

def YMEndpointExactnessSubobligation.title :
    YMEndpointExactnessSubobligation -> String
  | .exactEndpointDefinition =>
      "Define exact local-net endpoint"
  | .faithfulWilsonUniversality =>
      "Prove faithful-Wilson universality"
  | .endpointBoundaryAdmissibility =>
      "Prove endpoint-boundary admissibility"
  | .noExtendedSupportSectorData =>
      "Prove exclusion of extended-support sector data"
  | .vacuumVectorCompatibility =>
      "Prove vacuum-vector compatibility"
  | .transferToNamedEndpointStatement =>
      "Transfer exactness and exclusion to the named endpoint theorem"

def ymEndpointExactnessSubobligations :
    List YMEndpointExactnessSubobligation :=
  [ .exactEndpointDefinition
  , .faithfulWilsonUniversality
  , .endpointBoundaryAdmissibility
  , .noExtendedSupportSectorData
  , .vacuumVectorCompatibility
  , .transferToNamedEndpointStatement
  ]

def YMEndpointExactnessSubobligation.isClosed
    : YMEndpointExactnessSubobligation -> Prop
  | .exactEndpointDefinition =>
      Nonempty YMEndpointExactEndpointDefinitionSourcePackage
  | .faithfulWilsonUniversality =>
      Nonempty YMEndpointFaithfulWilsonUniversalitySourcePackage
  | .endpointBoundaryAdmissibility =>
      Nonempty YMEndpointBoundaryAdmissibilitySourcePackage
  | .noExtendedSupportSectorData =>
      Nonempty YMEndpointNoExtendedSupportSectorDataSourcePackage
  | .vacuumVectorCompatibility =>
      Nonempty YMEndpointVacuumVectorCompatibilitySourcePackage
  | .transferToNamedEndpointStatement =>
      Nonempty YMEndpointTransferToNamedEndpointStatementSourcePackage

def ymEndpointExactnessSubobligationsClosed : Prop :=
  forall O : YMEndpointExactnessSubobligation, O.isClosed

theorem
    YMEndpointExactnessSubobligation.exactEndpointDefinition_closed_of_source_package
    (hPackage :
      Nonempty YMEndpointExactEndpointDefinitionSourcePackage) :
    YMEndpointExactnessSubobligation.exactEndpointDefinition.isClosed := by
  exact hPackage

theorem
    YMEndpointExactnessSubobligation.exactEndpointDefinition_source_package_exists
    (hClosed :
      YMEndpointExactnessSubobligation.exactEndpointDefinition.isClosed) :
    Nonempty YMEndpointExactEndpointDefinitionSourcePackage := by
  exact hClosed

theorem ymEndpointExactEndpointDefinitionSubobligationClosed_of_current_manuscript :
    YMEndpointExactnessSubobligation.exactEndpointDefinition.isClosed := by
  exact
    YMEndpointExactnessSubobligation.exactEndpointDefinition_closed_of_source_package
      ymEndpointExactEndpointDefinitionSourcePackage_nonempty_of_current_manuscript

theorem
    YMEndpointExactnessSubobligation.faithfulWilsonUniversality_closed_of_source_package
    (hPackage :
      Nonempty YMEndpointFaithfulWilsonUniversalitySourcePackage) :
    YMEndpointExactnessSubobligation.faithfulWilsonUniversality.isClosed := by
  exact hPackage

theorem
    YMEndpointExactnessSubobligation.faithfulWilsonUniversality_source_package_exists
    (hClosed :
      YMEndpointExactnessSubobligation.faithfulWilsonUniversality.isClosed) :
    Nonempty YMEndpointFaithfulWilsonUniversalitySourcePackage := by
  exact hClosed

theorem ymEndpointFaithfulWilsonUniversalitySubobligationClosed_of_current_manuscript :
    YMEndpointExactnessSubobligation.faithfulWilsonUniversality.isClosed := by
  exact
    YMEndpointExactnessSubobligation.faithfulWilsonUniversality_closed_of_source_package
      ymEndpointFaithfulWilsonUniversalitySourcePackage_nonempty_of_current_manuscript

theorem
    YMEndpointExactnessSubobligation.endpointBoundaryAdmissibility_closed_of_source_package
    (hPackage :
      Nonempty YMEndpointBoundaryAdmissibilitySourcePackage) :
    YMEndpointExactnessSubobligation.endpointBoundaryAdmissibility.isClosed := by
  exact hPackage

theorem
    YMEndpointExactnessSubobligation.endpointBoundaryAdmissibility_source_package_exists
    (hClosed :
      YMEndpointExactnessSubobligation.endpointBoundaryAdmissibility.isClosed) :
    Nonempty YMEndpointBoundaryAdmissibilitySourcePackage := by
  exact hClosed

theorem ymEndpointBoundaryAdmissibilitySubobligationClosed_of_current_manuscript :
    YMEndpointExactnessSubobligation.endpointBoundaryAdmissibility.isClosed := by
  exact
    YMEndpointExactnessSubobligation.endpointBoundaryAdmissibility_closed_of_source_package
      ymEndpointBoundaryAdmissibilitySourcePackage_nonempty_of_current_manuscript

theorem
    YMEndpointExactnessSubobligation.noExtendedSupportSectorData_closed_of_source_package
    (hPackage :
      Nonempty YMEndpointNoExtendedSupportSectorDataSourcePackage) :
    YMEndpointExactnessSubobligation.noExtendedSupportSectorData.isClosed := by
  exact hPackage

theorem
    YMEndpointExactnessSubobligation.noExtendedSupportSectorData_source_package_exists
    (hClosed :
      YMEndpointExactnessSubobligation.noExtendedSupportSectorData.isClosed) :
    Nonempty YMEndpointNoExtendedSupportSectorDataSourcePackage := by
  exact hClosed

theorem ymEndpointNoExtendedSupportSectorDataSubobligationClosed_of_current_manuscript :
    YMEndpointExactnessSubobligation.noExtendedSupportSectorData.isClosed := by
  exact
    YMEndpointExactnessSubobligation.noExtendedSupportSectorData_closed_of_source_package
      ymEndpointNoExtendedSupportSectorDataSourcePackage_nonempty_of_current_manuscript

theorem
    YMEndpointExactnessSubobligation.vacuumVectorCompatibility_closed_of_source_package
    (hPackage :
      Nonempty YMEndpointVacuumVectorCompatibilitySourcePackage) :
    YMEndpointExactnessSubobligation.vacuumVectorCompatibility.isClosed := by
  exact hPackage

theorem
    YMEndpointExactnessSubobligation.vacuumVectorCompatibility_source_package_exists
    (hClosed :
      YMEndpointExactnessSubobligation.vacuumVectorCompatibility.isClosed) :
    Nonempty YMEndpointVacuumVectorCompatibilitySourcePackage := by
  exact hClosed

theorem ymEndpointVacuumVectorCompatibilitySubobligationClosed_of_current_manuscript :
    YMEndpointExactnessSubobligation.vacuumVectorCompatibility.isClosed := by
  exact
    YMEndpointExactnessSubobligation.vacuumVectorCompatibility_closed_of_source_package
      ymEndpointVacuumVectorCompatibilitySourcePackage_nonempty_of_current_manuscript

theorem
    YMEndpointExactnessSubobligation.transferToNamedEndpointStatement_closed_of_source_package
    (hPackage :
      Nonempty YMEndpointTransferToNamedEndpointStatementSourcePackage) :
    YMEndpointExactnessSubobligation.transferToNamedEndpointStatement.isClosed := by
  exact hPackage

theorem
    YMEndpointExactnessSubobligation.transferToNamedEndpointStatement_source_package_exists
    (hClosed :
      YMEndpointExactnessSubobligation.transferToNamedEndpointStatement.isClosed) :
    Nonempty YMEndpointTransferToNamedEndpointStatementSourcePackage := by
  exact hClosed

theorem ymEndpointTransferToNamedEndpointStatementSubobligationClosed_of_current_manuscript :
    YMEndpointExactnessSubobligation.transferToNamedEndpointStatement.isClosed := by
  exact
    YMEndpointExactnessSubobligation.transferToNamedEndpointStatement_closed_of_source_package
      ymEndpointTransferToNamedEndpointStatementSourcePackage_nonempty_of_current_manuscript

theorem ymEndpointExactnessSubobligationsClosed_of_current_manuscript :
    ymEndpointExactnessSubobligationsClosed := by
  intro O
  cases O with
  | exactEndpointDefinition =>
      exact ymEndpointExactEndpointDefinitionSubobligationClosed_of_current_manuscript
  | faithfulWilsonUniversality =>
      exact ymEndpointFaithfulWilsonUniversalitySubobligationClosed_of_current_manuscript
  | endpointBoundaryAdmissibility =>
      exact ymEndpointBoundaryAdmissibilitySubobligationClosed_of_current_manuscript
  | noExtendedSupportSectorData =>
      exact ymEndpointNoExtendedSupportSectorDataSubobligationClosed_of_current_manuscript
  | vacuumVectorCompatibility =>
      exact ymEndpointVacuumVectorCompatibilitySubobligationClosed_of_current_manuscript
  | transferToNamedEndpointStatement =>
      exact ymEndpointTransferToNamedEndpointStatementSubobligationClosed_of_current_manuscript

/-- Sub-obligations for the Clay extension admissibility bridge. -/
inductive YMClayExtensionSubobligation
  | supportClassFixed
  | sectorLayerOverLocalNet
  | localNetUnchanged
  | scopeFaithful
  | kernelFaithful
  | sameDomain
  | noNewSubgapStates
  | gnsSpectralBridge
  deriving DecidableEq, Repr

def YMClayExtensionSubobligation.title :
    YMClayExtensionSubobligation -> String
  | .supportClassFixed =>
      "Prove the support class is fixed"
  | .sectorLayerOverLocalNet =>
      "Prove the sector layer sits over the fixed local net"
  | .localNetUnchanged =>
      "Prove the local net is unchanged"
  | .scopeFaithful =>
      "Prove theorem-scope faithfulness"
  | .kernelFaithful =>
      "Prove kernel faithfulness"
  | .sameDomain =>
      "Prove same-domain preservation"
  | .noNewSubgapStates =>
      "Prove no new subgap states or vacuum multiplicity"
  | .gnsSpectralBridge =>
      "Prove the GNS spectral bridge"

def ymClayExtensionSubobligations : List YMClayExtensionSubobligation :=
  [ .supportClassFixed
  , .sectorLayerOverLocalNet
  , .localNetUnchanged
  , .scopeFaithful
  , .kernelFaithful
  , .sameDomain
  , .noNewSubgapStates
  , .gnsSpectralBridge
  ]

/--
Source package for Clay support-class fixedness.

This is the first Clay-extension subobligation.  The package is extracted from
the standard Clay extension import's admissibility payload, whose sector layer
contains the support class and its fixedness proof.
-/
structure YMClaySupportClassFixedSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  SupportClass : Type
  supportClass_matches_payload :
    SupportClass = payload.sector_layer.SupportClass
  support_class_fixed : Prop
  support_class_fixed_matches_payload :
    support_class_fixed = payload.sector_layer.support_class_fixed
  support_class_fixed_holds :
    support_class_fixed

noncomputable def
    ymClaySupportClassFixedSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClaySupportClassFixedSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  SupportClass := I.payload.sector_layer.SupportClass
  supportClass_matches_payload := rfl
  support_class_fixed := I.payload.sector_layer.support_class_fixed
  support_class_fixed_matches_payload := rfl
  support_class_fixed_holds :=
    I.payload.sector_layer.support_class_fixed_holds

theorem ymClaySupportClassFixedSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClaySupportClassFixedSourcePackage := by
  rcases hImport with ⟨I⟩
  exact ⟨ymClaySupportClassFixedSourcePackage_of_standard_import I⟩

/--
Source package for the Clay assertion that the sector layer is attached over
the fixed local net rather than replacing it.
-/
structure YMClaySectorLayerOverLocalNetSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  LocalNet : Type
  localNet_matches_payload :
    LocalNet = payload.sector_layer.LocalNet
  SectorLayer : Type
  sectorLayer_matches_payload :
    SectorLayer = payload.sector_layer.SectorLayer
  sector_layer_over_fixed_local_net : Prop
  sector_layer_over_fixed_local_net_matches_payload :
    sector_layer_over_fixed_local_net =
      payload.sector_layer.sector_layer_over_fixed_local_net
  sector_layer_over_fixed_local_net_holds :
    sector_layer_over_fixed_local_net

noncomputable def
    ymClaySectorLayerOverLocalNetSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClaySectorLayerOverLocalNetSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  LocalNet := I.payload.sector_layer.LocalNet
  localNet_matches_payload := rfl
  SectorLayer := I.payload.sector_layer.SectorLayer
  sectorLayer_matches_payload := rfl
  sector_layer_over_fixed_local_net :=
    I.payload.sector_layer.sector_layer_over_fixed_local_net
  sector_layer_over_fixed_local_net_matches_payload := rfl
  sector_layer_over_fixed_local_net_holds :=
    I.payload.sector_layer.sector_layer_over_fixed_local_net_holds

theorem
    ymClaySectorLayerOverLocalNetSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClaySectorLayerOverLocalNetSourcePackage := by
  rcases hImport with ⟨I⟩
  exact
    ⟨ymClaySectorLayerOverLocalNetSourcePackage_of_standard_import I⟩

/--
Source package for the Clay assertion that adjoining the sector layer leaves
the already constructed local net unchanged.
-/
structure YMClayLocalNetUnchangedSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  LocalNet : Type
  localNet_matches_payload :
    LocalNet = payload.sector_layer.LocalNet
  local_net_unchanged : Prop
  local_net_unchanged_matches_payload :
    local_net_unchanged = payload.sector_layer.local_net_unchanged
  local_net_unchanged_holds :
    local_net_unchanged

noncomputable def
    ymClayLocalNetUnchangedSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClayLocalNetUnchangedSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  LocalNet := I.payload.sector_layer.LocalNet
  localNet_matches_payload := rfl
  local_net_unchanged := I.payload.sector_layer.local_net_unchanged
  local_net_unchanged_matches_payload := rfl
  local_net_unchanged_holds :=
    I.payload.sector_layer.local_net_unchanged_holds

theorem ymClayLocalNetUnchangedSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClayLocalNetUnchangedSourcePackage := by
  rcases hImport with ⟨I⟩
  exact ⟨ymClayLocalNetUnchangedSourcePackage_of_standard_import I⟩

/-- Source package for theorem-scope faithfulness in the Clay completion. -/
structure YMClayScopeFaithfulSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  Completion : Type
  completion_matches_payload :
    Completion = payload.completion.Completion
  scope_faithful : Prop
  scope_faithful_matches_payload :
    scope_faithful = payload.completion.scope_faithful
  scope_faithful_holds :
    scope_faithful

noncomputable def
    ymClayScopeFaithfulSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClayScopeFaithfulSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  Completion := I.payload.completion.Completion
  completion_matches_payload := rfl
  scope_faithful := I.payload.completion.scope_faithful
  scope_faithful_matches_payload := rfl
  scope_faithful_holds :=
    I.payload.completion.scope_faithful_holds

theorem ymClayScopeFaithfulSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClayScopeFaithfulSourcePackage := by
  rcases hImport with ⟨I⟩
  exact ⟨ymClayScopeFaithfulSourcePackage_of_standard_import I⟩

/-- Source package for kernel faithfulness in the Clay completion. -/
structure YMClayKernelFaithfulSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  Completion : Type
  completion_matches_payload :
    Completion = payload.completion.Completion
  kernel_faithful : Prop
  kernel_faithful_matches_payload :
    kernel_faithful = payload.completion.kernel_faithful
  kernel_faithful_holds :
    kernel_faithful

noncomputable def
    ymClayKernelFaithfulSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClayKernelFaithfulSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  Completion := I.payload.completion.Completion
  completion_matches_payload := rfl
  kernel_faithful := I.payload.completion.kernel_faithful
  kernel_faithful_matches_payload := rfl
  kernel_faithful_holds :=
    I.payload.completion.kernel_faithful_holds

theorem ymClayKernelFaithfulSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClayKernelFaithfulSourcePackage := by
  rcases hImport with ⟨I⟩
  exact ⟨ymClayKernelFaithfulSourcePackage_of_standard_import I⟩

/-- Source package for same-domain preservation in the Clay completion. -/
structure YMClaySameDomainSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  Completion : Type
  completion_matches_payload :
    Completion = payload.completion.Completion
  same_domain : Prop
  same_domain_matches_payload :
    same_domain = payload.completion.same_domain
  same_domain_holds :
    same_domain

noncomputable def
    ymClaySameDomainSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClaySameDomainSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  Completion := I.payload.completion.Completion
  completion_matches_payload := rfl
  same_domain := I.payload.completion.same_domain
  same_domain_matches_payload := rfl
  same_domain_holds :=
    I.payload.completion.same_domain_holds

theorem ymClaySameDomainSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClaySameDomainSourcePackage := by
  rcases hImport with ⟨I⟩
  exact ⟨ymClaySameDomainSourcePackage_of_standard_import I⟩

/--
Source package for excluding new subgap local states and vacuum multiplicity
in the Clay completion.
-/
structure YMClayNoNewSubgapStatesSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  Completion : Type
  completion_matches_payload :
    Completion = payload.completion.Completion
  no_new_subgap_local_state : Prop
  no_new_subgap_local_state_matches_payload :
    no_new_subgap_local_state =
      payload.completion.no_new_subgap_local_state
  no_new_subgap_local_state_holds :
    no_new_subgap_local_state
  no_new_subgap_vacuum_multiplicity : Prop
  no_new_subgap_vacuum_multiplicity_matches_payload :
    no_new_subgap_vacuum_multiplicity =
      payload.completion.no_new_subgap_vacuum_multiplicity
  no_new_subgap_vacuum_multiplicity_holds :
    no_new_subgap_vacuum_multiplicity

noncomputable def
    ymClayNoNewSubgapStatesSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClayNoNewSubgapStatesSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  Completion := I.payload.completion.Completion
  completion_matches_payload := rfl
  no_new_subgap_local_state :=
    I.payload.completion.no_new_subgap_local_state
  no_new_subgap_local_state_matches_payload := rfl
  no_new_subgap_local_state_holds :=
    I.payload.completion.no_new_subgap_local_state_holds
  no_new_subgap_vacuum_multiplicity :=
    I.payload.completion.no_new_subgap_vacuum_multiplicity
  no_new_subgap_vacuum_multiplicity_matches_payload := rfl
  no_new_subgap_vacuum_multiplicity_holds :=
    I.payload.completion.no_new_subgap_vacuum_multiplicity_holds

theorem ymClayNoNewSubgapStatesSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClayNoNewSubgapStatesSourcePackage := by
  rcases hImport with ⟨I⟩
  exact ⟨ymClayNoNewSubgapStatesSourcePackage_of_standard_import I⟩

/-- Source package for the GNS spectral bridge in the Clay completion. -/
structure YMClayGNSSpectralBridgeSourcePackage where
  standard_import : StandardClayExtensionImport
  payload : YMClayExtensionAdmissibilityPayload
  payload_matches_import :
    payload = standard_import.payload
  CompletedSector : Type
  completedSector_matches_payload :
    CompletedSector = payload.subgap_classification.CompletedSector
  VacuumRay : CompletedSector -> Prop
  vacuumRay_matches_payload :
    VacuumRay =
      cast
        (by
          rw [completedSector_matches_payload])
        payload.subgap_classification.VacuumRay
  SubgapSector : CompletedSector -> Prop
  subgapSector_matches_payload :
    SubgapSector =
      cast
        (by
          rw [completedSector_matches_payload])
        payload.subgap_classification.SubgapSector
  every_subgap_sector_is_vacuum_ray :
    forall sector : CompletedSector,
      SubgapSector sector -> VacuumRay sector
  complete_theory_mass_gap : Prop
  complete_theory_mass_gap_matches_payload :
    complete_theory_mass_gap =
      payload.subgap_classification.complete_theory_mass_gap
  complete_theory_mass_gap_holds :
    complete_theory_mass_gap

noncomputable def
    ymClayGNSSpectralBridgeSourcePackage_of_standard_import
    (I : StandardClayExtensionImport) :
    YMClayGNSSpectralBridgeSourcePackage where
  standard_import := I
  payload := I.payload
  payload_matches_import := rfl
  CompletedSector :=
    I.payload.subgap_classification.CompletedSector
  completedSector_matches_payload := rfl
  VacuumRay :=
    I.payload.subgap_classification.VacuumRay
  vacuumRay_matches_payload := rfl
  SubgapSector :=
    I.payload.subgap_classification.SubgapSector
  subgapSector_matches_payload := rfl
  every_subgap_sector_is_vacuum_ray :=
    I.payload.subgap_classification.every_subgap_sector_is_vacuum_ray
  complete_theory_mass_gap :=
    I.payload.subgap_classification.complete_theory_mass_gap
  complete_theory_mass_gap_matches_payload := rfl
  complete_theory_mass_gap_holds :=
    I.payload.subgap_classification.complete_theory_mass_gap_holds

theorem ymClayGNSSpectralBridgeSourcePackage_nonempty_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    Nonempty YMClayGNSSpectralBridgeSourcePackage := by
  rcases hImport with ⟨I⟩
  exact ⟨ymClayGNSSpectralBridgeSourcePackage_of_standard_import I⟩

def YMClayExtensionSubobligation.isClosed
    : YMClayExtensionSubobligation -> Prop
  | .supportClassFixed =>
      Nonempty YMClaySupportClassFixedSourcePackage
  | .sectorLayerOverLocalNet =>
      Nonempty YMClaySectorLayerOverLocalNetSourcePackage
  | .localNetUnchanged =>
      Nonempty YMClayLocalNetUnchangedSourcePackage
  | .scopeFaithful =>
      Nonempty YMClayScopeFaithfulSourcePackage
  | .kernelFaithful =>
      Nonempty YMClayKernelFaithfulSourcePackage
  | .sameDomain =>
      Nonempty YMClaySameDomainSourcePackage
  | .noNewSubgapStates =>
      Nonempty YMClayNoNewSubgapStatesSourcePackage
  | .gnsSpectralBridge =>
      Nonempty YMClayGNSSpectralBridgeSourcePackage

def ymClayExtensionSubobligationsClosed : Prop :=
  forall O : YMClayExtensionSubobligation, O.isClosed

theorem YMClayExtensionSubobligation.supportClassFixed_closed_of_source_package
    (hPackage :
      Nonempty YMClaySupportClassFixedSourcePackage) :
    YMClayExtensionSubobligation.supportClassFixed.isClosed := by
  exact hPackage

theorem YMClayExtensionSubobligation.supportClassFixed_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.supportClassFixed.isClosed) :
    Nonempty YMClaySupportClassFixedSourcePackage := by
  exact hClosed

theorem ymClaySupportClassFixedSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.supportClassFixed.isClosed := by
  exact
    YMClayExtensionSubobligation.supportClassFixed_closed_of_source_package
      (ymClaySupportClassFixedSourcePackage_nonempty_of_standard_import hImport)

theorem
    YMClayExtensionSubobligation.sectorLayerOverLocalNet_closed_of_source_package
    (hPackage :
      Nonempty YMClaySectorLayerOverLocalNetSourcePackage) :
    YMClayExtensionSubobligation.sectorLayerOverLocalNet.isClosed := by
  exact hPackage

theorem
    YMClayExtensionSubobligation.sectorLayerOverLocalNet_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.sectorLayerOverLocalNet.isClosed) :
    Nonempty YMClaySectorLayerOverLocalNetSourcePackage := by
  exact hClosed

theorem ymClaySectorLayerOverLocalNetSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.sectorLayerOverLocalNet.isClosed := by
  exact
    YMClayExtensionSubobligation.sectorLayerOverLocalNet_closed_of_source_package
      (ymClaySectorLayerOverLocalNetSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMClayExtensionSubobligation.localNetUnchanged_closed_of_source_package
    (hPackage :
      Nonempty YMClayLocalNetUnchangedSourcePackage) :
    YMClayExtensionSubobligation.localNetUnchanged.isClosed := by
  exact hPackage

theorem
    YMClayExtensionSubobligation.localNetUnchanged_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.localNetUnchanged.isClosed) :
    Nonempty YMClayLocalNetUnchangedSourcePackage := by
  exact hClosed

theorem ymClayLocalNetUnchangedSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.localNetUnchanged.isClosed := by
  exact
    YMClayExtensionSubobligation.localNetUnchanged_closed_of_source_package
      (ymClayLocalNetUnchangedSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMClayExtensionSubobligation.scopeFaithful_closed_of_source_package
    (hPackage :
      Nonempty YMClayScopeFaithfulSourcePackage) :
    YMClayExtensionSubobligation.scopeFaithful.isClosed := by
  exact hPackage

theorem
    YMClayExtensionSubobligation.scopeFaithful_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.scopeFaithful.isClosed) :
    Nonempty YMClayScopeFaithfulSourcePackage := by
  exact hClosed

theorem ymClayScopeFaithfulSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.scopeFaithful.isClosed := by
  exact
    YMClayExtensionSubobligation.scopeFaithful_closed_of_source_package
      (ymClayScopeFaithfulSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMClayExtensionSubobligation.kernelFaithful_closed_of_source_package
    (hPackage :
      Nonempty YMClayKernelFaithfulSourcePackage) :
    YMClayExtensionSubobligation.kernelFaithful.isClosed := by
  exact hPackage

theorem
    YMClayExtensionSubobligation.kernelFaithful_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.kernelFaithful.isClosed) :
    Nonempty YMClayKernelFaithfulSourcePackage := by
  exact hClosed

theorem ymClayKernelFaithfulSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.kernelFaithful.isClosed := by
  exact
    YMClayExtensionSubobligation.kernelFaithful_closed_of_source_package
      (ymClayKernelFaithfulSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMClayExtensionSubobligation.sameDomain_closed_of_source_package
    (hPackage :
      Nonempty YMClaySameDomainSourcePackage) :
    YMClayExtensionSubobligation.sameDomain.isClosed := by
  exact hPackage

theorem
    YMClayExtensionSubobligation.sameDomain_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.sameDomain.isClosed) :
    Nonempty YMClaySameDomainSourcePackage := by
  exact hClosed

theorem ymClaySameDomainSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.sameDomain.isClosed := by
  exact
    YMClayExtensionSubobligation.sameDomain_closed_of_source_package
      (ymClaySameDomainSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMClayExtensionSubobligation.noNewSubgapStates_closed_of_source_package
    (hPackage :
      Nonempty YMClayNoNewSubgapStatesSourcePackage) :
    YMClayExtensionSubobligation.noNewSubgapStates.isClosed := by
  exact hPackage

theorem
    YMClayExtensionSubobligation.noNewSubgapStates_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.noNewSubgapStates.isClosed) :
    Nonempty YMClayNoNewSubgapStatesSourcePackage := by
  exact hClosed

theorem ymClayNoNewSubgapStatesSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.noNewSubgapStates.isClosed := by
  exact
    YMClayExtensionSubobligation.noNewSubgapStates_closed_of_source_package
      (ymClayNoNewSubgapStatesSourcePackage_nonempty_of_standard_import
        hImport)

theorem
    YMClayExtensionSubobligation.gnsSpectralBridge_closed_of_source_package
    (hPackage :
      Nonempty YMClayGNSSpectralBridgeSourcePackage) :
    YMClayExtensionSubobligation.gnsSpectralBridge.isClosed := by
  exact hPackage

theorem
    YMClayExtensionSubobligation.gnsSpectralBridge_source_package_exists
    (hClosed :
      YMClayExtensionSubobligation.gnsSpectralBridge.isClosed) :
    Nonempty YMClayGNSSpectralBridgeSourcePackage := by
  exact hClosed

theorem ymClayGNSSpectralBridgeSubobligationClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    YMClayExtensionSubobligation.gnsSpectralBridge.isClosed := by
  exact
    YMClayExtensionSubobligation.gnsSpectralBridge_closed_of_source_package
      (ymClayGNSSpectralBridgeSourcePackage_nonempty_of_standard_import
        hImport)

theorem ymClayExtensionSubobligationsClosed_of_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    ymClayExtensionSubobligationsClosed := by
  intro O
  cases O with
  | supportClassFixed =>
      exact ymClaySupportClassFixedSubobligationClosed_of_standard_import hImport
  | sectorLayerOverLocalNet =>
      exact ymClaySectorLayerOverLocalNetSubobligationClosed_of_standard_import
        hImport
  | localNetUnchanged =>
      exact ymClayLocalNetUnchangedSubobligationClosed_of_standard_import
        hImport
  | scopeFaithful =>
      exact ymClayScopeFaithfulSubobligationClosed_of_standard_import hImport
  | kernelFaithful =>
      exact ymClayKernelFaithfulSubobligationClosed_of_standard_import hImport
  | sameDomain =>
      exact ymClaySameDomainSubobligationClosed_of_standard_import hImport
  | noNewSubgapStates =>
      exact ymClayNoNewSubgapStatesSubobligationClosed_of_standard_import
        hImport
  | gnsSpectralBridge =>
      exact ymClayGNSSpectralBridgeSubobligationClosed_of_standard_import
        hImport

def YMAPlusObligation.subobligationTitles :
    YMAPlusObligation -> List String
  | .fixedLatticeGap =>
      ymFixedLatticeGapSubobligations.map YMFixedLatticeGapSubobligation.title
  | .sharpLocalConstruction =>
      ymSharpLocalSubobligations.map YMSharpLocalSubobligation.title
  | .continuumTransport =>
      ymContinuumTransportSubobligations.map YMContinuumTransportSubobligation.title
  | .osWightmanReconstruction =>
      ymOSWightmanSubobligations.map YMOSWightmanSubobligation.title
  | .minkowskiHamiltonianGap =>
      ymMinkowskiHamiltonianGapSubobligations.map
        YMMinkowskiHamiltonianGapSubobligation.title
  | .endpointExactnessExclusion =>
      ymEndpointExactnessSubobligations.map YMEndpointExactnessSubobligation.title
  | .clayExtensionAdmissibility =>
      ymClayExtensionSubobligations.map YMClayExtensionSubobligation.title

def YMAPlusObligation.subobligationCount :
    YMAPlusObligation -> Nat
  | .fixedLatticeGap =>
      ymFixedLatticeGapSubobligations.length
  | .sharpLocalConstruction =>
      ymSharpLocalSubobligations.length
  | .continuumTransport =>
      ymContinuumTransportSubobligations.length
  | .osWightmanReconstruction =>
      ymOSWightmanSubobligations.length
  | .minkowskiHamiltonianGap =>
      ymMinkowskiHamiltonianGapSubobligations.length
  | .endpointExactnessExclusion =>
      ymEndpointExactnessSubobligations.length
  | .clayExtensionAdmissibility =>
      ymClayExtensionSubobligations.length

def ymAPlusSubobligationCounts : List Nat :=
  ymAPlusObligations.map YMAPlusObligation.subobligationCount

def ymAPlusSubobligationTotalCount : Nat :=
  ymAPlusSubobligationCounts.foldl Nat.add 0

def ymAPlusSubobligationCountsPositiveBool : Bool :=
  ymAPlusObligations.all
    (fun O => 0 < O.subobligationCount)

theorem ymAPlusObligation_subobligation_titles_nonempty :
    forall O : YMAPlusObligation, O.subobligationTitles ≠ [] := by
  intro O
  cases O <;> decide

theorem ymAPlusSubobligationCounts_expected :
    ymAPlusSubobligationCounts = [6, 6, 6, 6, 6, 6, 8] := by
  rfl

theorem ymAPlusSubobligationTotalCount_eq :
    ymAPlusSubobligationTotalCount = 44 := by
  rfl

theorem ymAPlusSubobligationCountsPositiveBool_eq_true :
    ymAPlusSubobligationCountsPositiveBool = true := by
  rfl

def YMAPlusObligation.firstSubobligationTitle :
    YMAPlusObligation -> String
  | .fixedLatticeGap =>
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.title
  | .sharpLocalConstruction =>
      YMSharpLocalSubobligation.finiteCapWindowDefinition.title
  | .continuumTransport =>
      YMContinuumTransportSubobligation.weakWindowCertificateDefinition.title
  | .osWightmanReconstruction =>
      YMOSWightmanSubobligation.osAxioms.title
  | .minkowskiHamiltonianGap =>
      YMMinkowskiHamiltonianGapSubobligation.timeTranslationGroup.title
  | .endpointExactnessExclusion =>
      YMEndpointExactnessSubobligation.exactEndpointDefinition.title
  | .clayExtensionAdmissibility =>
      YMClayExtensionSubobligation.supportClassFixed.title

def ymAPlusFirstSubobligationTitles : List String :=
  ymAPlusObligations.map YMAPlusObligation.firstSubobligationTitle

theorem ymAPlusFirstSubobligationTitles_eq :
    ymAPlusFirstSubobligationTitles =
      [ "Define the finite-lattice Yang-Mills Hamiltonian"
      , "Define finite-cap windows and their local algebra data"
      , "Define the weak-window certificate"
      , "State and verify the OS axioms"
      , "Construct the time-translation group"
      , "Define exact local-net endpoint"
      , "Prove the support class is fixed"
      ] := by
  rfl

theorem ymAPlusFirstSubobligationTitles_count_eq :
    ymAPlusFirstSubobligationTitles.length =
      ymAPlusObligations.length := by
  rfl

def ymAPlusFirstSubobligationTitlesPopulatedBool : Bool :=
  ymAPlusFirstSubobligationTitles.all
    (fun title => !title.isEmpty)

theorem ymAPlusFirstSubobligationTitlesPopulatedBool_eq_true :
    ymAPlusFirstSubobligationTitlesPopulatedBool = true := by
  rfl

/--
Each top-level obligation has its own sub-obligation closure gate.  These gates
remain closed until the corresponding detailed proof pieces are supplied.
-/
def YMAPlusObligation.subobligationsClosed :
    YMAPlusObligation -> Prop
  | .fixedLatticeGap =>
      ymFixedLatticeGapSubobligationsClosed
  | .sharpLocalConstruction =>
      ymSharpLocalSubobligationsClosed
  | .continuumTransport =>
      ymContinuumTransportSubobligationsClosed
  | .osWightmanReconstruction =>
      ymOSWightmanSubobligationsClosed
  | .minkowskiHamiltonianGap =>
      ymMinkowskiHamiltonianGapSubobligationsClosed
  | .endpointExactnessExclusion =>
      ymEndpointExactnessSubobligationsClosed
  | .clayExtensionAdmissibility =>
      ymClayExtensionSubobligationsClosed

def ymAPlusAllSubobligationsClosed : Prop :=
  forall O : YMAPlusObligation, O.subobligationsClosed

theorem ymFixedLatticeHamiltonianDefinitionSubobligation_requires_source_preclosure :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed ->
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  intro h
  exact h

theorem ymFixedLatticeHamiltonianDefinitionSourceData_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty YMFiniteLatticeSourceData := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.source_data⟩

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeSource_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  rcases hClosed with ⟨P⟩
  exact ⟨Sigma.mk P.source_data P.spectral_bridge_source⟩

theorem ymFixedLatticeHamiltonianDefinitionHamiltonianWitness_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty YMFiniteLatticeHamiltonianDefinitionWitnessPackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.hamiltonian_witness⟩

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeWitness_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeWitnessPackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.spectral_bridge_witness⟩

theorem
    ymFixedLatticeHamiltonianDefinitionHamiltonianProofPackage_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty YMFiniteLatticeHamiltonianDefinitionProofPackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.hamiltonian_proof_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeProofPackage_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.spectral_bridge_proof_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionClosedCertificateSubtype_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty
      { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
        C.closed } := by
  rcases hClosed with ⟨P⟩
  exact P.closed_certificate_nonempty

theorem
    ymFixedLatticeHamiltonianDefinitionClosedSpectralBridgeSubtype_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty
      { B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
        B.closed } := by
  rcases hClosed with ⟨P⟩
  exact P.closed_spectral_bridge_nonempty

theorem
    ymFixedLatticeHamiltonianDefinitionSourceHypothesisMap_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty YMFiniteLatticeHamiltonianDefinitionHypothesisMap := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.source_hypothesis_map⟩

theorem
    ymFixedLatticeHamiltonianDefinitionClosureCertificate_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  rcases hClosed with ⟨P⟩
  exact P.certificate_closure_holds

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeClosure_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  rcases hClosed with ⟨P⟩
  exact P.spectral_bridge_closure_holds

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedGateSideComponents_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate /\
      ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    And.intro
      (ymFixedLatticeHamiltonianDefinitionClosureCertificate_of_closed
        hClosed)
      (ymFixedLatticeHamiltonianDefinitionSpectralBridgeClosure_of_closed
        hClosed)

theorem
    ymFixedLatticeHamiltonianDefinitionClosedCertificateSubtype_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty
      { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
        C.closed } := by
  exact
    ymFixedLatticeHamiltonianDefinitionClosedCertificateSubtype_nonempty_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionClosedSpectralBridgeSubtype_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty
      { B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
        B.closed } := by
  exact
    ymFixedLatticeHamiltonianDefinitionClosedSpectralBridgeSubtype_nonempty_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionHamiltonianProofPackage_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMFiniteLatticeHamiltonianDefinitionProofPackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionHamiltonianProofPackage_nonempty_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeProofPackage_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty
      YMFiniteLatticeHamiltonianDefinitionSpectralBridgeProofPackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeProofPackage_nonempty_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionSourceHypothesisMap_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMFiniteLatticeHamiltonianDefinitionHypothesisMap := by
  exact
    ymFixedLatticeHamiltonianDefinitionSourceHypothesisMap_nonempty_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionClosureCertificate_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFiniteLatticeHamiltonianDefinitionClosureCertificate := by
  exact
    ymFixedLatticeHamiltonianDefinitionClosureCertificate_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeClosure_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFiniteLatticeHamiltonianDefinitionSpectralBridgeClosure := by
  exact
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeClosure_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_standard_source_import
        hImport)

/--
The exact three missing witnesses named by the current A+ focus, bundled at
the proposition level.  Keeping this as `Prop` avoids choosing concrete data
from `Nonempty`; it remains only a proof-level consequence of closure.
-/
def ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle : Prop :=
  YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed /\
    Nonempty
      { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
        C.closed } /\
    Nonempty
      { B : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
        B.closed }

theorem ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle := by
  exact
    And.intro hClosed
      (And.intro
        (ymFixedLatticeHamiltonianDefinitionClosedCertificateSubtype_nonempty_of_closed
          hClosed)
        (ymFixedLatticeHamiltonianDefinitionClosedSpectralBridgeSubtype_nonempty_of_closed
          hClosed))

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_closed
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed := by
  exact B.left

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_certificate_nonempty
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    Nonempty
      { C : YMFiniteLatticeHamiltonianDefinitionCertificate //
        C.closed } := by
  exact B.right.left

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_spectral_bridge_nonempty
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    Nonempty
      { S : YMFiniteLatticeHamiltonianDefinitionSpectralBridge //
        S.closed } := by
  exact B.right.right

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle := by
  exact
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_closed
      (YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition_closed_of_source_preclosure
        P)

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle := by
  exact
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle := by
  exact
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_closed
      (ymFixedLatticeHamiltonianDefinitionSubobligationClosed_of_source_pair
        hSourcePair)

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle := by
  exact
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_requires_source_preclosure
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligation_requires_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_closed B)

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_requires_source_data
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    Nonempty YMFiniteLatticeSourceData := by
  exact
    ymFixedLatticeHamiltonianDefinitionSourceData_nonempty_of_closed
      (ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_closed B)

theorem
    ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_requires_source_pair
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  exact
    ymFixedLatticeHamiltonianDefinitionSpectralBridgeSource_nonempty_of_closed
      (ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_closed B)

theorem
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_missingWitnessBundle
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligationGate_of_closed
      (ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_closed B)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_missingWitnessBundle
    (B : ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedGate_of_closed
      (ymFixedLatticeHamiltonianDefinitionMissingWitnessBundle_closed B)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty YMFixedLatticeHamiltonianDefinitionNativeClosurePackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.to_native_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.to_enhanced_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.to_native_witness_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage := by
  rcases hClosed with ⟨P⟩
  exact ⟨P.to_enhanced_witness_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  rcases hClosed with ⟨P⟩
  exact P.to_native_closure_package.to_subobligation_gate

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  rcases hClosed with ⟨P⟩
  exact P.to_enhanced_closure_package.to_enhanced_gate

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  rcases hClosed with ⟨P⟩
  exact P.to_native_witness_closure_package.to_subobligation_gate

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_closed
    (hClosed :
      YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition.isClosed) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  rcases hClosed with ⟨P⟩
  exact P.to_enhanced_witness_closure_package.to_enhanced_gate

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty YMFixedLatticeHamiltonianDefinitionNativeClosurePackage := by
  exact ⟨P.to_native_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage := by
  exact ⟨P.to_enhanced_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage := by
  exact ⟨P.to_native_witness_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage := by
  exact ⟨P.to_enhanced_witness_closure_package⟩

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty YMFixedLatticeHamiltonianDefinitionNativeClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty YMFixedLatticeHamiltonianDefinitionNativeClosurePackage := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact P.to_native_closure_package.to_subobligation_gate

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact P.to_enhanced_closure_package.to_enhanced_gate

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact P.to_native_witness_closure_package.to_subobligation_gate

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_source_preclosure
    (P : YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact P.to_enhanced_witness_closure_package.to_enhanced_gate

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_source_data
    (S : YMFiniteLatticeSourceData)
    (B : YMFiniteLatticeSpectralBridgeSourceData S) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_source_preclosure
      (YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage.of_source_data
        S B)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_source_pair
    (hSourcePair : Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData)) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  rcases hSourcePair with ⟨⟨S, B⟩⟩
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_source_data
      S B

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMFixedLatticeHamiltonianDefinitionNativeClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty YMFixedLatticeHamiltonianDefinitionEnhancedClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    Nonempty
      YMFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_nonempty_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeClosurePackage_gate_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedClosurePackage_gate_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionNativeWitnessClosurePackage_gate_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_standard_source_import
    (hImport : Nonempty YMStandardFiniteLatticeSourceImport) :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate := by
  exact
    ymFixedLatticeHamiltonianDefinitionEnhancedWitnessClosurePackage_gate_of_source_pair
      (ymFiniteLatticeSpectralBridgeSourcePair_nonempty_of_standard_import
        hImport)

theorem ymFixedLatticeHamiltonianDefinitionGate_requires_source_preclosure :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate ->
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  intro h
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligation_requires_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionGate_requires_subobligation_closed h)

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_requires_source_preclosure :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate ->
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  intro h
  exact
    ymFixedLatticeHamiltonianDefinitionSubobligation_requires_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionEnhancedGate_requires_subobligation_closed h)

theorem ymFixedLatticeHamiltonianDefinitionSourcePair_nonempty_of_source_preclosure
    (hSourcePreclosure :
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage) :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  rcases hSourcePreclosure with ⟨P⟩
  exact ⟨⟨P.source_data, P.spectral_bridge_source⟩⟩

theorem
    ymFixedLatticeHamiltonianDefinitionSourcePair_iff_source_preclosure_nonempty :
    Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) ↔
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage := by
  constructor
  · exact ymFixedLatticeHamiltonianDefinitionSourcePreclosure_nonempty_of_source_pair
  · exact ymFixedLatticeHamiltonianDefinitionSourcePair_nonempty_of_source_preclosure

theorem ymFixedLatticeHamiltonianDefinitionGate_requires_source_pair :
    ymFixedLatticeHamiltonianDefinitionSubobligationGate ->
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  intro h
  exact
    ymFixedLatticeHamiltonianDefinitionSourcePair_nonempty_of_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionGate_requires_source_preclosure h)

theorem ymFixedLatticeHamiltonianDefinitionEnhancedGate_requires_source_pair :
    ymFixedLatticeHamiltonianDefinitionEnhancedGate ->
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData) := by
  intro h
  exact
    ymFixedLatticeHamiltonianDefinitionSourcePair_nonempty_of_source_preclosure
      (ymFixedLatticeHamiltonianDefinitionEnhancedGate_requires_source_preclosure h)

theorem ymFixedLatticeGapRemainingSubobligations_are_currently_open :
    forall O : YMFixedLatticeGapSubobligation,
      O ≠ YMFixedLatticeGapSubobligation.latticeHamiltonianDefinition ->
      O ≠ YMFixedLatticeGapSubobligation.compactSimpleGaugeGroupHypotheses ->
      O ≠ YMFixedLatticeGapSubobligation.finiteVolumeSpectralEstimate ->
      O ≠ YMFixedLatticeGapSubobligation.positiveGapScale ->
      O ≠ YMFixedLatticeGapSubobligation.uniformVolumeControl ->
      O ≠ YMFixedLatticeGapSubobligation.transferToRouteLatticeInput ->
        Not O.isClosed := by
  intro O hneHamiltonian hneCompact hneSpectral hnePositive hneUniform hneTransfer h
  cases O with
  | latticeHamiltonianDefinition =>
      exact hneHamiltonian rfl
  | compactSimpleGaugeGroupHypotheses =>
      exact hneCompact rfl
  | finiteVolumeSpectralEstimate =>
      exact hneSpectral rfl
  | positiveGapScale =>
      exact hnePositive rfl
  | uniformVolumeControl =>
      exact hneUniform rfl
  | transferToRouteLatticeInput =>
      exact hneTransfer rfl

theorem ymSharpLocalSubobligations_are_currently_open :
    forall O : YMSharpLocalSubobligation,
      O ≠ YMSharpLocalSubobligation.finiteCapWindowDefinition ->
      O ≠ YMSharpLocalSubobligation.finiteCapExtensionTheorem ->
      O ≠ YMSharpLocalSubobligation.positiveUnitalBridge ->
      O ≠ YMSharpLocalSubobligation.boundedStateCompatibility ->
      O ≠ YMSharpLocalSubobligation.inductiveSystemCoherence ->
      O ≠ YMSharpLocalSubobligation.sharpLocalExtendsBoundedBase ->
        Not O.isClosed := by
  intro O hneFiniteCap hneExtension hneBridge hneCompat hneCoherence hneExtends h
  cases O with
  | finiteCapWindowDefinition =>
      exact hneFiniteCap rfl
  | finiteCapExtensionTheorem =>
      exact hneExtension rfl
  | positiveUnitalBridge =>
      exact hneBridge rfl
  | boundedStateCompatibility =>
      exact hneCompat rfl
  | inductiveSystemCoherence =>
      exact hneCoherence rfl
  | sharpLocalExtendsBoundedBase =>
      exact hneExtends rfl

theorem ymContinuumTransportSubobligations_are_currently_open :
    forall O : YMContinuumTransportSubobligation,
      O ≠ YMContinuumTransportSubobligation.weakWindowCertificateDefinition ->
      O ≠ YMContinuumTransportSubobligation.densityHandoff ->
      O ≠ YMContinuumTransportSubobligation.graphCoreHandoff ->
      O ≠ YMContinuumTransportSubobligation.qe3TransportBound ->
      O ≠ YMContinuumTransportSubobligation.osTransportReadiness ->
      O ≠ YMContinuumTransportSubobligation.positiveGapPreservation ->
        Not O.isClosed := by
  intro O hneWeakWindow hneDensity hneGraphCore hneQE3 hneOS hnePositive h
  cases O with
  | weakWindowCertificateDefinition =>
      exact hneWeakWindow rfl
  | densityHandoff =>
      exact hneDensity rfl
  | graphCoreHandoff =>
      exact hneGraphCore rfl
  | qe3TransportBound =>
      exact hneQE3 rfl
  | osTransportReadiness =>
      exact hneOS rfl
  | positiveGapPreservation =>
      exact hnePositive rfl

theorem ymOSWightmanSubobligationsClosed_of_source_packages
    (hOSAxioms :
      Nonempty YMOSWightmanOSAxiomsSourcePackage)
    (hReflection :
      Nonempty YMOSWightmanReflectionPositivitySourcePackage)
    (hHilbert :
      Nonempty YMOSWightmanReconstructionHilbertSpaceSourcePackage)
    (hVacuum :
      Nonempty YMOSWightmanVacuumVectorSourcePackage)
    (hFields :
      Nonempty YMOSWightmanFieldsSourcePackage)
    (hSmearing :
      Nonempty YMOSWightmanSmearingVacuumCorrelationsSourcePackage) :
    ymOSWightmanSubobligationsClosed := by
  intro O
  cases O with
  | osAxioms =>
      exact hOSAxioms
  | reflectionPositivity =>
      exact hReflection
  | reconstructionHilbertSpace =>
      exact hHilbert
  | vacuumVector =>
      exact hVacuum
  | wightmanFields =>
      exact hFields
  | smearingAndVacuumCorrelations =>
      exact hSmearing

theorem ymEndpointExactnessSubobligations_are_currently_open :
    forall O : YMEndpointExactnessSubobligation,
      O ≠ .exactEndpointDefinition ->
      O ≠ .faithfulWilsonUniversality ->
      O ≠ .endpointBoundaryAdmissibility ->
      O ≠ .noExtendedSupportSectorData ->
      O ≠ .vacuumVectorCompatibility ->
      O ≠ .transferToNamedEndpointStatement ->
        Not O.isClosed := by
  intro O hneExact hneFaithful hneBoundary hneNoExtended hneVacuum hneTransfer h
  cases O with
  | exactEndpointDefinition =>
      exact hneExact rfl
  | faithfulWilsonUniversality =>
      exact hneFaithful rfl
  | endpointBoundaryAdmissibility =>
      exact hneBoundary rfl
  | noExtendedSupportSectorData =>
      exact hneNoExtended rfl
  | vacuumVectorCompatibility =>
      exact hneVacuum rfl
  | transferToNamedEndpointStatement =>
      exact hneTransfer rfl

theorem ymClayExtensionSubobligations_are_conditionally_closed_by_standard_import
    (hImport : Nonempty StandardClayExtensionImport) :
    ymClayExtensionSubobligationsClosed := by
  exact ymClayExtensionSubobligationsClosed_of_standard_import hImport

theorem ymClayExtensionSubobligationsClosed_of_current_manuscript :
    ymClayExtensionSubobligationsClosed := by
  exact
    ymClayExtensionSubobligationsClosed_of_standard_import
      currentManuscriptStandardClayExtensionImport_nonempty

theorem ymAPlusSubobligationClosure_requires_fixed_lattice_gap :
    ymAPlusAllSubobligationsClosed ->
      ymFixedLatticeGapSubobligationsClosed := by
  intro h
  exact h .fixedLatticeGap

theorem ymAPlusSubobligationClosure_requires_sharp_local_construction :
    ymAPlusAllSubobligationsClosed ->
      ymSharpLocalSubobligationsClosed := by
  intro h
  exact h .sharpLocalConstruction

theorem ymAPlusSubobligationClosure_requires_continuum_transport :
    ymAPlusAllSubobligationsClosed ->
      ymContinuumTransportSubobligationsClosed := by
  intro h
  exact h .continuumTransport

theorem ymAPlusSubobligationClosure_requires_os_wightman_reconstruction :
    ymAPlusAllSubobligationsClosed ->
      ymOSWightmanSubobligationsClosed := by
  intro h
  exact h .osWightmanReconstruction

theorem ymAPlusSubobligationClosure_requires_minkowski_hamiltonian_gap :
    ymAPlusAllSubobligationsClosed ->
      ymMinkowskiHamiltonianGapSubobligationsClosed := by
  intro h
  exact h .minkowskiHamiltonianGap

theorem ymAPlusSubobligationClosure_requires_endpoint_exactness_exclusion :
    ymAPlusAllSubobligationsClosed ->
      ymEndpointExactnessSubobligationsClosed := by
  intro h
  exact h .endpointExactnessExclusion

theorem ymAPlusSubobligationClosure_requires_clay_extension_admissibility :
    ymAPlusAllSubobligationsClosed ->
      ymClayExtensionSubobligationsClosed := by
  intro h
  exact h .clayExtensionAdmissibility

theorem ymFixedLatticeGapSubobligationsClosed_of_source_packages
    (hHamiltonian :
      Nonempty YMFixedLatticeHamiltonianDefinitionSourcePreclosurePackage)
    (hCompact :
      Nonempty YMCompactSimpleGaugeGroupHypothesesSourcePackage)
    (hSpectral :
      Nonempty (Sigma YMFiniteLatticeSpectralBridgeSourceData))
    (hPositive :
      Nonempty YMPositiveGapScaleSourcePackage)
    (hUniform :
      Nonempty YMUniformVolumeControlSourcePackage)
    (hTransfer :
      Nonempty (Sigma YMTransferToRouteLatticeInputSourcePackage)) :
    ymFixedLatticeGapSubobligationsClosed := by
  intro O
  cases O with
  | latticeHamiltonianDefinition =>
      exact hHamiltonian
  | compactSimpleGaugeGroupHypotheses =>
      exact hCompact
  | finiteVolumeSpectralEstimate =>
      exact hSpectral
  | positiveGapScale =>
      exact hPositive
  | uniformVolumeControl =>
      exact hUniform
  | transferToRouteLatticeInput =>
      exact hTransfer

theorem ymSharpLocalSubobligationsClosed_of_source_packages
    (hWindow :
      Nonempty YMFiniteCapWindowDefinitionSourcePackage)
    (hExtension :
      Nonempty YMFiniteCapExtensionTheoremSourcePackage)
    (hBridge :
      Nonempty YMPositiveUnitalBridgeSourcePackage)
    (hCompatibility :
      Nonempty YMBoundedStateCompatibilitySourcePackage)
    (hCoherence :
      Nonempty YMInductiveSystemCoherenceSourcePackage)
    (hExtends :
      Nonempty YMSharpLocalExtendsBoundedBaseSourcePackage) :
    ymSharpLocalSubobligationsClosed := by
  intro O
  cases O with
  | finiteCapWindowDefinition =>
      exact hWindow
  | finiteCapExtensionTheorem =>
      exact hExtension
  | positiveUnitalBridge =>
      exact hBridge
  | boundedStateCompatibility =>
      exact hCompatibility
  | inductiveSystemCoherence =>
      exact hCoherence
  | sharpLocalExtendsBoundedBase =>
      exact hExtends

theorem ymContinuumTransportSubobligationsClosed_of_source_packages
    (hWeakWindow :
      Nonempty YMWeakWindowCertificateDefinitionSourcePackage)
    (hDensity :
      Nonempty YMContinuumDensityHandoffSourcePackage)
    (hGraphCore :
      Nonempty YMContinuumGraphCoreHandoffSourcePackage)
    (hQE3 :
      Nonempty YMContinuumQE3TransportBoundSourcePackage)
    (hOS :
      Nonempty YMContinuumOSTransportReadinessSourcePackage)
    (hPositive :
      Nonempty YMContinuumPositiveGapPreservationSourcePackage) :
    ymContinuumTransportSubobligationsClosed := by
  intro O
  cases O with
  | weakWindowCertificateDefinition =>
      exact hWeakWindow
  | densityHandoff =>
      exact hDensity
  | graphCoreHandoff =>
      exact hGraphCore
  | qe3TransportBound =>
      exact hQE3
  | osTransportReadiness =>
      exact hOS
  | positiveGapPreservation =>
      exact hPositive

theorem ymMinkowskiHamiltonianGapSubobligationsClosed_of_source_packages
    (hTime :
      Nonempty YMMinkowskiTimeTranslationGroupSourcePackage)
    (hStrong :
      Nonempty YMMinkowskiStrongContinuitySourcePackage)
    (hSelfAdjoint :
      Nonempty YMMinkowskiSelfAdjointGeneratorSourcePackage)
    (hSpectral :
      Nonempty YMMinkowskiSpectralGapStatementSourcePackage)
    (hKernel :
      Nonempty YMMinkowskiUniqueVacuumKernelSourcePackage)
    (hTransfer :
      Nonempty YMMinkowskiTransferToRouteSourcePackage) :
    ymMinkowskiHamiltonianGapSubobligationsClosed := by
  intro O
  cases O with
  | timeTranslationGroup =>
      exact hTime
  | strongContinuity =>
      exact hStrong
  | selfAdjointGenerator =>
      exact hSelfAdjoint
  | spectralGapStatement =>
      exact hSpectral
  | uniqueVacuumKernel =>
      exact hKernel
  | transferToRouteMinkowskiGap =>
      exact hTransfer

theorem ymMinkowskiHamiltonianGapSubobligationsClosed_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    ymMinkowskiHamiltonianGapSubobligationsClosed := by
  exact
    ymMinkowskiHamiltonianGapSubobligationsClosed_of_source_packages
      (ymMinkowskiTimeTranslationGroupSourcePackage_nonempty_of_standard_import
        hImport)
      (ymMinkowskiStrongContinuitySourcePackage_nonempty_of_standard_import
        hImport)
      (ymMinkowskiSelfAdjointGeneratorSourcePackage_nonempty_of_standard_import
        hImport)
      (ymMinkowskiSpectralGapStatementSourcePackage_nonempty_of_standard_import
        hImport)
      (ymMinkowskiUniqueVacuumKernelSourcePackage_nonempty_of_standard_import
        hImport)
      (ymMinkowskiTransferToRouteSourcePackage_nonempty_of_standard_import
        hImport)

end YangMills
end Papers
end MaleyLean
