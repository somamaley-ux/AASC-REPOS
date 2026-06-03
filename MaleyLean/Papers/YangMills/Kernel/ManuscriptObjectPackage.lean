import MaleyLean.Papers.YangMills.Kernel.ManuscriptChoicePackageOfObjects

namespace MaleyLean

/--
Single authoring package for the four manuscript object inhabitants.

From one inhabitant of this structure, the final `YMManuscriptChoicePackage`
is recovered mechanically.
-/
structure YMManuscriptObjectPackage where
  spine : YMLoadBearingSpineManuscriptObject
  constructive : YMConstructiveManuscriptObject
  vacuum_gap : YMVacuumGapManuscriptObject
  endpoint : YMEndpointManuscriptObject

def YMManuscriptObjectPackage.toChoicePackage
  (P : YMManuscriptObjectPackage) :
  YMManuscriptChoicePackage :=
  YangMillsManuscriptChoicePackageOfObjects
    P.spine
    P.constructive
    P.vacuum_gap
    P.endpoint

def YMManuscriptObjectPackage.toInput
  (P : YMManuscriptObjectPackage) :
  YMClosedInstantiatedManuscriptInput :=
  P.toChoicePackage.toInput

def YMManuscriptObjectPackage.toClosedInstantiatedManuscript
  (P : YMManuscriptObjectPackage) :
  YMClosedInstantiatedManuscript :=
  P.toChoicePackage.toClosedInstantiatedManuscript

theorem YangMillsManuscriptObjectPackageStatement
  (P : YMManuscriptObjectPackage) :
  let Q := P.toChoicePackage
  Q.objects.S = P.spine.toSpine /\
  Q.objects.RC = P.constructive.toConstructiveRoute /\
  Q.objects.RD = P.vacuum_gap.toVacuumGapRoute /\
  Q.objects.RE = P.endpoint.toEndpointCore /\
  ym_constructive_DeltaMax_of Q.constructive_choices = P.constructive.DeltaMax /\
  ym_vacuum_transport_of Q.vacuum_gap_choices = P.vacuum_gap.transport /\
  ym_endpoint_Omega_loc_of Q.endpoint_choices = P.endpoint.Omega_loc := by
  have h :=
    YangMillsManuscriptChoicePackageOfObjectsStatement
      P.spine
      P.constructive
      P.vacuum_gap
      P.endpoint
  rcases h with
    ⟨hS, hRC, hRD, hRE, _hhp1, _hhp2, _hAroute, _htrunc, _hext, _hcompat,
      _hunion, _hww, _hE, _hP, hDelta, hTransport, hOmega⟩
  exact ⟨hS, hRC, hRD, hRE, hDelta, hTransport, hOmega⟩

end MaleyLean
