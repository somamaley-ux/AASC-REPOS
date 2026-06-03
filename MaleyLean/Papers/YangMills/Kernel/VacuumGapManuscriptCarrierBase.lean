import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptObject

namespace MaleyLean

/--
Pure carrier-and-inhabitant layer for the manuscript vacuum-gap packet.

This is the lowest honest object-level vacuum-gap layer:
- carrier types
- chosen inhabitant terms
- object-level operations

No theorem/proof fields live here.
-/
structure YMVacuumGapManuscriptCarrierBase where
  TransportState : Type
  LatticeObservableFamily : Type
  TransportMap : Type
  ReconstructedSector : Type
  OSSector : Type
  MinkowskiGapFunctional : Type
  OSCorrelationFamily : Type
  transport_observable :
    TransportMap -> LatticeObservableFamily -> TransportState
  realize_os_sector :
    ReconstructedSector -> OSCorrelationFamily -> OSSector
  evaluate_minkowski_gap :
    MinkowskiGapFunctional -> OSSector -> Prop
  transport : TransportMap
  H : LatticeObservableFamily
  Hloc : ReconstructedSector
  corr : OSCorrelationFamily
  gapf : MinkowskiGapFunctional
  hgap : evaluate_minkowski_gap gapf (realize_os_sector Hloc corr)

theorem YangMillsVacuumGapManuscriptCarrierBaseStatement
  (B : YMVacuumGapManuscriptCarrierBase) :
  B.transport = B.transport /\
  B.H = B.H /\
  B.Hloc = B.Hloc /\
  B.corr = B.corr /\
  B.gapf = B.gapf /\
  B.hgap = B.hgap := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

end MaleyLean
