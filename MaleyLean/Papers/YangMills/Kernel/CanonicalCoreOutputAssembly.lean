import MaleyLean.Papers.YangMills.Kernel.EndpointCore
import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore
import MaleyLean.Papers.YangMills.Kernel.ConstructiveCore

namespace MaleyLean

/--
Canonical assembly of the three intrinsic core outputs that feed the
manuscript-facing theorem pipeline.

This stays below the theorem-part alignment layer: it records only the native
core witnesses already exposed by the constructive, vacuum-gap, and endpoint
hearts.
-/
structure YMCanonicalCoreOutputAssembly
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  constructive_base_witness :
    RC.sharp_local_package.sharp_local_state.extends_bounded_base
  transport_ready_witness :
    RD.transport_package.os_transport_ready
  endpoint_exact_witness :
    RE.endpoint_object.exact_local_net_endpoint

def YangMillsCanonicalCoreOutputAssemblyData
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  YMCanonicalCoreOutputAssembly RC RD RE := by
  have hC := YangMillsSharpLocalPackageStatement RC hcompat hunion
  have hD := YangMillsVacuumGapCoreExhibitsNamedOutputsStatement RD hww
  have hEnd := YangMillsEndpointCoreExhibitsNamedOutputsStatement RE hE hP
  exact
    { constructive_base_witness := hC.2.2
      transport_ready_witness := hD.2.1
      endpoint_exact_witness := hEnd.2.2.2.2.2 }

theorem YangMillsCanonicalCoreOutputAssemblyExistsStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMCanonicalCoreOutputAssembly RC RD RE) := by
  exact
    ⟨YangMillsCanonicalCoreOutputAssemblyData
      RC RD RE hcompat hunion hww hE hP⟩

theorem YangMillsCanonicalCoreOutputAssemblyExportStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMCanonicalCoreOutputAssembly RC RD RE) /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  RD.transport_package.os_transport_ready /\
  RE.endpoint_object.exact_local_net_endpoint := by
  let A := YangMillsCanonicalCoreOutputAssemblyData RC RD RE hcompat hunion hww hE hP
  exact
    And.intro ⟨A⟩ <|
      And.intro A.constructive_base_witness <|
        And.intro A.transport_ready_witness A.endpoint_exact_witness

end MaleyLean
