import MaleyLean.Papers.YangMills.Kernel.StandardLatticeGapBackground
import MaleyLean.Papers.YangMills.Kernel.VacuumSemanticDefinitions

namespace MaleyLean

/--
The current route-level lattice input is obtained from weak-window readiness
through continuum transport and then projected from the route structure.
-/
theorem YangMillsLatticeGapInputCurrentRoot
    (RD : YMVacuumGapRoute)
    (hww : RD.weak_window_certificate_ready) :
    RD.transport_package.lattice_gap_input := by
  have htransport : RD.continuum_gap_transport_ready :=
    RD.weak_window_yields_transport hww
  exact RD.transport_comes_from_lattice_gap htransport

/--
The current route-level positive gap witness is obtained in the same way:
transport readiness is projected through the route field.
-/
theorem YangMillsPositiveGapCurrentRoot
    (RD : YMVacuumGapRoute)
    (hww : RD.weak_window_certificate_ready) :
    RD.transport_package.positive_gap_exhibited := by
  have htransport : RD.continuum_gap_transport_ready :=
    RD.weak_window_yields_transport hww
  exact RD.transport_exhibits_positive_gap htransport

/--
The carrier-level lattice gap input currently unfolds to existence of the
chosen transported observable, not a spectral estimate.
-/
theorem YangMillsLatticeGapCarrierShadowUnfolds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumLatticeGapInputReady B <->
      Exists fun obs : B.TransportState =>
        obs = B.transport_observable B.transport B.H := by
  rfl

#print axioms YangMillsLatticeGapInputCurrentRoot
#print axioms YangMillsPositiveGapCurrentRoot
#print axioms YangMillsLatticeGapCarrierShadowUnfolds
#print axioms YMFixedLatticeSpectralGapPayloadBridge.closed
#print axioms YMLatticeGapHypothesisMap.completeTransferHypotheses
#print axioms YMRouteFixedLatticeGapImport.dischargeFixedLatticeReady
#print axioms YMRouteFixedLatticeGapImport.dischargeLatticeInput
#print axioms YMRouteFixedLatticeGapImport.dischargePositiveGap
#print axioms ym_vacuum_lattice_gap_input_ready_holds
#print axioms ym_vacuum_positive_gap_exhibited_holds

end MaleyLean
