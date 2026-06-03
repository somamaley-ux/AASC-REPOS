import MaleyLean.Papers.YangMills.Kernel.ManuscriptNamedObjects
import MaleyLean.Papers.YangMills.Kernel.VacuumGapTransportRealizeLawPackage
import MaleyLean.Papers.YangMills.Kernel.VacuumGapMassGapChain
import MaleyLean.Papers.YangMills.Kernel.VacuumGapNativeProofHomes

namespace MaleyLean

/--
Concrete QE3 / vacuum-gap-side statement recovered directly from a closed
instantiated Yang--Mills manuscript object.

This packages the chosen-site transport, reconstruction, and realization data
already carried by `I`, together with the named route outputs exposed by the
existing vacuum-gap semantic and law-package layers.
-/
def ym_concrete_vacuum_gap_side_conditions_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  Nonempty (YMVacuumGapSemanticBundle RD) /\
    RD.continuum_gap_transport_ready /\
    RD.transport_package.os_transport_ready /\
    RD.transport_package.positive_gap_exhibited /\
    RD.transport_package.lattice_gap_input /\
    RD.reconstruction_ready /\
    RD.reconstruction_package.os_sector_ready /\
    RD.reconstruction_package.minkowski_gap_ready /\
    RD.reconstruction_package.obtained_from_transport /\
    Nonempty (YMVacuumGapRelationalInterface RD) /\
    Nonempty (YMVacuumGapTransportRealizeLawPackage RD)

/--
Smaller QE3 boundary statement isolating the transport-side outputs together
with the chosen transport/realization law package.
-/
def ym_concrete_vacuum_gap_boundary_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  let RD := I.blueprint.objects.RD
  RD.continuum_gap_transport_ready /\
    RD.transport_package.os_transport_ready /\
    RD.transport_package.positive_gap_exhibited /\
    Nonempty (YMVacuumGapTransportRealizeLawPackage RD) /\
    Nonempty (YMVacuumGapRelationalInterface RD) /\
    Nonempty (YMVacuumGapSemanticBundle RD)

theorem YangMillsConcreteVacuumGapSideConditionsStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_side_conditions_statement I := by
  let RD := I.blueprint.objects.RD
  let hww := I.blueprint.witnesses.hww
  have hBundle :
      Nonempty (YMVacuumGapSemanticBundle RD) :=
    YangMillsVacuumGapSemanticBundleExistsStatement RD hww
  have hNamed :
      RD.continuum_gap_transport_ready /\
        RD.transport_package.os_transport_ready /\
        RD.transport_package.positive_gap_exhibited /\
        RD.transport_package.lattice_gap_input /\
        RD.reconstruction_ready /\
        RD.reconstruction_package.os_sector_ready /\
        RD.reconstruction_package.minkowski_gap_ready /\
        RD.reconstruction_package.obtained_from_transport :=
    YangMillsVacuumGapCoreExhibitsNamedOutputsStatement RD hww
  have hRel :
      Nonempty (YMVacuumGapRelationalInterface RD) :=
    YangMillsVacuumGapRelationalInterfaceExistsStatement
      RD hww (ym_transport I) (ym_H I) (ym_Hloc I) (ym_corr I) (ym_gapf I)
      (ym_hgap I)
  have hLaw :
      Nonempty (YMVacuumGapTransportRealizeLawPackage RD) :=
    YangMillsVacuumGapTransportRealizeLawPackageExistsStatement
      RD hww (ym_transport I) (ym_H I) (ym_Hloc I) (ym_corr I) (ym_gapf I)
      (ym_hgap I)
  dsimp [ym_concrete_vacuum_gap_side_conditions_statement, RD, hww]
  exact
    And.intro hBundle <|
      And.intro hNamed.1 <|
        And.intro hNamed.2.1 <|
          And.intro hNamed.2.2.1 <|
            And.intro hNamed.2.2.2.1 <|
              And.intro hNamed.2.2.2.2.1 <|
                And.intro hNamed.2.2.2.2.2.1 <|
                  And.intro hNamed.2.2.2.2.2.2.1 <|
                    And.intro hNamed.2.2.2.2.2.2.2 <|
                      And.intro hRel hLaw

theorem YangMillsConcreteVacuumGapBoundaryStatement
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_vacuum_gap_boundary_statement I := by
  have h := YangMillsConcreteVacuumGapSideConditionsStatement I
  dsimp [ym_concrete_vacuum_gap_boundary_statement] at *
  rcases h with
    ⟨_hBundle, hTransport, hOSTransport, hPositiveGap, _hLatticeGap,
      _hReconstruction, _hOSSector, _hMinkowskiGap, _hOrigin, hRel, hLaw⟩
  exact ⟨hTransport, hOSTransport, hPositiveGap, hLaw, hRel, _hBundle⟩

theorem ym_concrete_vacuum_gap_boundary_of_side_conditions
    {I : YMClosedInstantiatedManuscript}
    (h : ym_concrete_vacuum_gap_side_conditions_statement I) :
    ym_concrete_vacuum_gap_boundary_statement I := by
  dsimp [ym_concrete_vacuum_gap_side_conditions_statement,
    ym_concrete_vacuum_gap_boundary_statement] at *
  rcases h with
    ⟨hBundle, hTransport, hOSTransport, hPositiveGap, _hLatticeGap,
      _hReconstruction, _hOSSector, _hMinkowskiGap, _hOrigin, hRel, hLaw⟩
  exact ⟨hTransport, hOSTransport, hPositiveGap, hLaw, hRel, hBundle⟩

/--
Concrete chosen-site export of the current vacuum-gap mass-gap chain from the
closed manuscript object `I`.
-/
theorem YangMillsConcreteVacuumGapMassGapChainStatement
    (I : YMClosedInstantiatedManuscript) :
    let RD := I.blueprint.objects.RD
    Nonempty (YMVacuumGapMassGapChain RD) /\
      ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
      ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
      ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
      RD.continuum_gap_transport_ready /\
      RD.transport_package.positive_gap_exhibited /\
      RD.reconstruction_package.minkowski_gap_ready /\
      RD.reconstruction_package.obtained_from_transport := by
  let RD := I.blueprint.objects.RD
  let hww := I.blueprint.witnesses.hww
  have h :=
    YangMillsVacuumGapMassGapChainExportStatement
      RD hww (ym_transport I) (ym_H I) (ym_Hloc I) (ym_corr I) (ym_gapf I)
      (ym_hgap I)
  dsimp [RD]
  exact
    ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1, h.2.2.2.2.1, h.2.2.2.2.2.1,
      h.2.2.2.2.2.2.1, h.2.2.2.2.2.2.2.1⟩

/--
Concrete chosen-site export of the current vacuum-gap native proof-home layer
from the closed manuscript object `I`.
-/
theorem YangMillsConcreteVacuumGapNativeProofHomesStatement
    (I : YMClosedInstantiatedManuscript) :
    let RD := I.blueprint.objects.RD
    Nonempty (YMVacuumGapNativeProofHomes RD) /\
      ym_source_labels .continuumVacuumGapTransport = ["F.216"] /\
      ym_source_labels .continuumSharpLocalVacuumGap = ["F.5"] /\
      ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
      RD.continuum_gap_transport_ready /\
      RD.transport_package.os_transport_ready /\
      RD.transport_package.positive_gap_exhibited /\
      RD.transport_package.lattice_gap_input /\
      RD.reconstruction_ready /\
      RD.reconstruction_package.os_sector_ready /\
      RD.reconstruction_package.minkowski_gap_ready /\
      RD.reconstruction_package.obtained_from_transport := by
  let RD := I.blueprint.objects.RD
  let hww := I.blueprint.witnesses.hww
  have h :=
    YangMillsVacuumGapNativeProofHomesExportStatement
      RD hww (ym_transport I) (ym_H I) (ym_Hloc I) (ym_corr I) (ym_gapf I)
      (ym_hgap I)
  dsimp [RD]
  exact
    ⟨h.1, h.2.1, h.2.2.1, h.2.2.2.1, h.2.2.2.2.1, h.2.2.2.2.2.1,
      h.2.2.2.2.2.2.1, h.2.2.2.2.2.2.2.1, h.2.2.2.2.2.2.2.2.1,
      h.2.2.2.2.2.2.2.2.2.1, h.2.2.2.2.2.2.2.2.2.2.1,
      h.2.2.2.2.2.2.2.2.2.2.2.1⟩

end MaleyLean
