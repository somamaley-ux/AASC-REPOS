import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore
import MaleyLean.Papers.YangMills.Kernel.StandardMinkowskiGapBackground
import MaleyLean.Papers.YangMills.Kernel.VacuumGapSemanticBundle
import MaleyLean.Papers.YangMills.Kernel.VacuumSemanticDefinitions

namespace MaleyLean

/--
The current route-level proof of `minkowski_gap_ready` is a projection from the
vacuum-gap route structure: weak-window readiness gives reconstruction
readiness, and the route field `reconstruction_exhibits_minkowski_gap` converts
that into `minkowski_gap_ready`.
-/
theorem YangMillsMinkowskiGapReadyCurrentRoot
    (R : YMVacuumGapRoute)
    (hww : R.weak_window_certificate_ready) :
    R.reconstruction_package.minkowski_gap_ready := by
  have htransport : R.continuum_gap_transport_ready :=
    R.weak_window_yields_transport hww
  have hreconstruction : R.reconstruction_ready :=
    R.transport_feeds_reconstruction htransport
  exact R.reconstruction_exhibits_minkowski_gap hreconstruction

/--
The lower carrier-level statement currently called `YMVacuumMinkowskiGapReady`
is definitionally just existence of a proposition equal to the chosen evaluation
of the chosen gap functional on the chosen realized OS sector.
-/
theorem YangMillsMinkowskiGapCarrierShadowUnfolds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumMinkowskiGapReady B <->
      Exists fun gap : Prop =>
        gap =
          B.evaluate_minkowski_gap
            B.gapf
            (B.realize_os_sector B.Hloc B.corr) := by
  rfl

#print axioms YangMillsMinkowskiGapReadyCurrentRoot
#print axioms YangMillsMinkowskiGapCarrierShadowUnfolds
#print axioms YMRouteMinkowskiGapImport.discharge
#print axioms YMMinkowskiHamiltonianMassGapPayloadBridge.closed
#print axioms YMRouteHamiltonianDynamicsImport.dischargeExternal
#print axioms YMRouteMinkowskiGapHypothesisMap.completeTransferHypotheses
#print axioms YMRouteMinkowskiGapImport.fromHypothesisMap
#print axioms YMRouteMinkowskiGapImport.dischargeFromHypothesisMap
#print axioms YMStandardMinkowskiHamiltonianGapImport.payload_nonempty
#print axioms YMStandardMinkowskiHamiltonianGapImport.payload_bridge_nonempty
#print axioms YMStandardMinkowskiHamiltonianGapImport.standard_transfer_nonempty
#print axioms YMStandardMinkowskiHamiltonianGapImport.hamiltonian_dynamics_nonempty
#print axioms YMStandardMinkowskiHamiltonianGapImport.hamiltonian_dynamics_complete_nonempty
#print axioms ymHamiltonianRealMassGap_nonempty_of_standard_minkowski_import
#print axioms ymMinkowskiHamiltonianMassGapPayloadBridge_nonempty_of_standard_import
#print axioms ymStandardMinkowskiGapTransfer_nonempty_of_standard_import
#print axioms ymStandardHamiltonianDynamicsBackground_nonempty_of_standard_import
#print axioms ymStandardHamiltonianDynamicsBackgroundComplete_nonempty_of_standard_import
#print axioms ym_vacuum_minkowski_gap_ready_holds

end MaleyLean
