import MaleyLean.Papers.YangMills.Extension.VacuumGapConcreteOSProofHomeProjection

namespace MaleyLean

/--
Source-specific name for the reduced continuum-transport payload recovered from
the mass-gap chain.
-/
abbrev ym_concrete_qe3_continuum_transport_reduced_from_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_continuum_transport_reduced_statement I

/--
Source-specific name for the full continuum-transport seam recovered from the
mass-gap chain.
-/
abbrev ym_concrete_qe3_continuum_transport_seam_from_mass_gap_chain_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_continuum_transport_seam_statement I

/--
Source-specific name for the reduced continuum-transport payload recovered from
the Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_continuum_transport_reduced_from_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_continuum_transport_reduced_statement I

/--
Source-specific name for the full continuum-transport seam recovered from the
Route 1 endpoint package.
-/
abbrev ym_concrete_qe3_continuum_transport_seam_from_route1_endpoint_package_statement
    (I : YMClosedInstantiatedManuscript) : Prop :=
  ym_concrete_qe3_continuum_transport_seam_statement I

/--
The mass-gap chain already contains the reduced payload of the manuscript-
facing continuum transport seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_reduced_statement I := by
  have h := YangMillsConcreteVacuumGapMassGapChainStatement I
  dsimp [ym_concrete_qe3_continuum_transport_reduced_statement] at *
  rcases h with
    ⟨_hChain, _hF216, _hF5, _hM5, _hTransport, hPositiveGap, hMinkowski, hOrigin⟩
  exact ⟨hPositiveGap, hMinkowski, hOrigin⟩

/--
Consequently the mass-gap chain already recovers the full manuscript-facing
continuum transport seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChain
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_seam_statement I := by
  exact
    YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
      (YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChain I)

/--
At the current theorem surface, the reduced continuum-transport payload
recovered from the mass-gap chain is exactly the same payload exposed on the
manuscript-facing Route 1 / Part D / side-condition surfaces.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_continuum_transport_reduced_statement I)
      (ym_concrete_qe3_continuum_transport_reduced_from_mass_gap_chain_statement I) := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full continuum-transport seam level for the
mass-gap-chain source.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChainIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_continuum_transport_seam_statement I)
      (ym_concrete_qe3_continuum_transport_seam_from_mass_gap_chain_statement I) := by
  constructor <;> intro h <;> exact h

/--
The Route 1 to endpoint native package also contains the reduced payload of the
manuscript-facing continuum transport seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_reduced_statement I := by
  exact
    YangMillsConcreteQE3TransportGapReducedFromRoute1EndpointPackage I

/--
Consequently the Route 1 to endpoint native package also recovers the full
manuscript-facing continuum transport seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    ym_concrete_qe3_continuum_transport_seam_statement I := by
  exact
    YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
      (YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackage I)

/--
At the current theorem surface, the reduced continuum-transport payload
recovered from the Route 1 endpoint package is exactly the same payload
exposed on the manuscript-facing Route 1 / Part D / side-condition surfaces.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_continuum_transport_reduced_statement I)
      (ym_concrete_qe3_continuum_transport_reduced_from_route1_endpoint_package_statement I) := by
  constructor <;> intro h <;> exact h

/--
The same exactness holds at the full continuum-transport seam level for the
Route 1 endpoint package source.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackageIffRoute1Surface
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_continuum_transport_seam_statement I)
      (ym_concrete_qe3_continuum_transport_seam_from_route1_endpoint_package_statement I) := by
  constructor <;> intro h <;> exact h

/--
At the current theorem surface, the two actual upstream source routes into the
reduced continuum-transport payload agree exactly with one another.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_continuum_transport_reduced_from_mass_gap_chain_statement I)
      (ym_concrete_qe3_continuum_transport_reduced_from_route1_endpoint_package_statement I) := by
  constructor
  intro h
  exact
    (YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackageIffRoute1Surface I).1
      ((YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChainIffRoute1Surface I).2 h)
  intro h
  exact
    (YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChainIffRoute1Surface I).1
      ((YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackageIffRoute1Surface I).2 h)

/--
The same exact source-agreement holds at the full continuum-transport seam
level.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamSourceRoutesIff
    (I : YMClosedInstantiatedManuscript) :
    Iff
      (ym_concrete_qe3_continuum_transport_seam_from_mass_gap_chain_statement I)
      (ym_concrete_qe3_continuum_transport_seam_from_route1_endpoint_package_statement I) := by
  constructor
  intro h
  exact
    (YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackageIffRoute1Surface I).1
      ((YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChainIffRoute1Surface I).2 h)
  intro h
  exact
    (YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChainIffRoute1Surface I).1
      ((YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackageIffRoute1Surface I).2 h)

/--
At the live theorem level, the two actual upstream source routes recover
exactly the same proof of the reduced continuum-transport payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChain_eq_fromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChain I =
      YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the two actual upstream source routes also recover
exactly the same proof of the full continuum-transport seam.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChain_eq_fromRoute1EndpointPackage
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChain I =
      YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackage I := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the mass-gap-chain recovery of the full
continuum-transport seam agrees exactly with the proof rebuilt from its own
reduced payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChain_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ContinuumTransportSeamFromMassGapChain I =
      YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
        (YangMillsConcreteQE3ContinuumTransportReducedFromMassGapChain I) := by
  exact Subsingleton.elim _ _

/--
At the live theorem level, the Route 1 endpoint package recovery of the full
continuum-transport seam agrees exactly with the proof rebuilt from its own
reduced payload.
-/
theorem YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackage_eq_fromReduced
    (I : YMClosedInstantiatedManuscript) :
    YangMillsConcreteQE3ContinuumTransportSeamFromRoute1EndpointPackage I =
      YangMillsConcreteQE3ContinuumTransportSeamFromReduced I
        (YangMillsConcreteQE3ContinuumTransportReducedFromRoute1EndpointPackage I) := by
  exact Subsingleton.elim _ _

end MaleyLean
