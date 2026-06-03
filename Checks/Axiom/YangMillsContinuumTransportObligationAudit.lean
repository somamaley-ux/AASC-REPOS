import MaleyLean.Papers.YangMills.Kernel.StandardContinuumTransportBackground

namespace MaleyLean

/--
The current continuum transport root is a direct projection from the
weak-window certificate through the route field.
-/
theorem YangMillsContinuumTransportCurrentRoot
    (RD : YMVacuumGapRoute)
    (hww : RD.weak_window_certificate_ready) :
    RD.continuum_gap_transport_ready := by
  exact RD.weak_window_yields_transport hww

/--
The current transport package outputs are all projections from continuum
transport readiness.
-/
theorem YangMillsContinuumTransportPackageCurrentRoot
    (RD : YMVacuumGapRoute)
    (htransport : RD.continuum_gap_transport_ready) :
    RD.transport_package.os_transport_ready /\
    RD.transport_package.positive_gap_exhibited /\
    RD.transport_package.lattice_gap_input := by
  exact YangMillsTransportPackageStatement RD htransport

#print axioms YangMillsContinuumTransportCurrentRoot
#print axioms YangMillsContinuumTransportPackageCurrentRoot
#print axioms Papers.YangMills.YMContinuumTransportPayload.closed
#print axioms YMContinuumTransportPayloadBridge.closed
#print axioms YMContinuumTransportHypothesisMap.completeTransferHypotheses
#print axioms YMRouteContinuumTransportImport.dischargeTransportOutputs
#print axioms YMRouteContinuumTransportImport.fromHypothesisMap

end MaleyLean
