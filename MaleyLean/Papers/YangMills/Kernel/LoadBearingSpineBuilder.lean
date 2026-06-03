import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpine

namespace MaleyLean

def YangMillsBoundedBaseData
  (carrier : Type)
  (state_on_carrier : carrier -> Prop) :
  YMBoundedBase :=
  { carrier := carrier
    state_on_carrier := state_on_carrier }

def YangMillsSharpLocalStateData
  (algebra : Type)
  (state_on_algebra : algebra -> Prop)
  (bounded_base : YMBoundedBase)
  (extends_bounded_base : Prop) :
  YMSharpLocalState :=
  { algebra := algebra
    state_on_algebra := state_on_algebra
    bounded_base := bounded_base
    extends_bounded_base := extends_bounded_base }

def YangMillsOSReconstructionData
  (hilbert : Type)
  (vacuum : hilbert)
  (hamiltonian : hilbert -> hilbert)
  (from_state : YMSharpLocalState)
  (reflection_positive : Prop)
  (bounded_base_dense : Prop) :
  YMOSReconstruction :=
  { hilbert := hilbert
    vacuum := vacuum
    hamiltonian := hamiltonian
    from_state := from_state
    reflection_positive := reflection_positive
    bounded_base_dense := bounded_base_dense }

def YangMillsVacuumGapDataData
  (reconstruction : YMOSReconstruction)
  (positive_gap : Prop)
  (transport_from_lattice_gap : Prop) :
  YMVacuumGapData :=
  { reconstruction := reconstruction
    positive_gap := positive_gap
    transport_from_lattice_gap := transport_from_lattice_gap }

def YangMillsEndpointObjectData
  (local_net : Type)
  (vacuum_sector : Type)
  (faithful_wilson_universality : Prop)
  (exact_local_net_endpoint : Prop) :
  YMEndpointObject :=
  { local_net := local_net
    vacuum_sector := vacuum_sector
    faithful_wilson_universality := faithful_wilson_universality
    exact_local_net_endpoint := exact_local_net_endpoint }

def YangMillsMainTheoremPartsData
  (partA_public_scope : Prop)
  (partC_sharp_local_construction : Prop)
  (partD_vacuum_gap : Prop)
  (endpoint_exact_object : Prop) :
  YMMainTheoremParts :=
  { partA_public_scope := partA_public_scope
    partC_sharp_local_construction := partC_sharp_local_construction
    partD_vacuum_gap := partD_vacuum_gap
    endpoint_exact_object := endpoint_exact_object }

def YangMillsPartCRouteInterfaceData
  (flowed_state_ready : Prop)
  (finite_truncation_ready : Prop)
  (finite_cap_extension_ready : Prop)
  (cyclicity_ready : Prop)
  (finite_cap_bridge_ready : Prop)
  (bounded_state_compatibility_ready : Prop)
  (inductive_union_ready : Prop)
  (partC_output : Prop)
  (concludes_partC :
    flowed_state_ready ->
    finite_truncation_ready ->
    finite_cap_extension_ready ->
    cyclicity_ready ->
    finite_cap_bridge_ready ->
    bounded_state_compatibility_ready ->
    inductive_union_ready ->
    partC_output) :
  YMPartCRouteInterface :=
  { flowed_state_ready := flowed_state_ready
    finite_truncation_ready := finite_truncation_ready
    finite_cap_extension_ready := finite_cap_extension_ready
    cyclicity_ready := cyclicity_ready
    finite_cap_bridge_ready := finite_cap_bridge_ready
    bounded_state_compatibility_ready := bounded_state_compatibility_ready
    inductive_union_ready := inductive_union_ready
    partC_output := partC_output
    concludes_partC := concludes_partC }

def YangMillsPartDRouteInterfaceData
  (uv_gate_ready : Prop)
  (entrance_ready : Prop)
  (fixed_lattice_gap_ready : Prop)
  (weak_window_certificate_ready : Prop)
  (continuum_gap_transport_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_packet_ready : Prop)
  (partD_output : Prop)
  (concludes_partD :
    uv_gate_ready ->
    entrance_ready ->
    fixed_lattice_gap_ready ->
    weak_window_certificate_ready ->
    continuum_gap_transport_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    partD_output) :
  YMPartDRouteInterface :=
  { uv_gate_ready := uv_gate_ready
    entrance_ready := entrance_ready
    fixed_lattice_gap_ready := fixed_lattice_gap_ready
    weak_window_certificate_ready := weak_window_certificate_ready
    continuum_gap_transport_ready := continuum_gap_transport_ready
    reconstruction_ready := reconstruction_ready
    endpoint_packet_ready := endpoint_packet_ready
    partD_output := partD_output
    concludes_partD := concludes_partD }

def YangMillsEndpointRouteInterfaceData
  (euclidean_dossier_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_packet_ready : Prop)
  (endpoint_output : Prop)
  (concludes_endpoint :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_output) :
  YMEndpointRouteInterface :=
  { euclidean_dossier_ready := euclidean_dossier_ready
    reconstruction_ready := reconstruction_ready
    endpoint_packet_ready := endpoint_packet_ready
    endpoint_output := endpoint_output
    concludes_endpoint := concludes_endpoint }

def YangMillsPacket6InterfaceData
  (mixed_correlator_closure : Prop)
  (positive_unital_bridge : Prop)
  (finite_cap_sharp_local_extension : Prop)
  (bounded_state_compatibility : Prop)
  (inductive_union_passage : Prop)
  (sharp_local_state : YMSharpLocalState)
  (bridge_uses_mixed_closure :
    mixed_correlator_closure -> positive_unital_bridge)
  (finite_cap_extension_uses_bridge :
    positive_unital_bridge -> finite_cap_sharp_local_extension)
  (bounded_state_compatibility_uses_extension :
    finite_cap_sharp_local_extension -> bounded_state_compatibility)
  (inductive_union_uses_extension_and_compatibility :
    finite_cap_sharp_local_extension -> bounded_state_compatibility -> inductive_union_passage)
  (inductive_union_exhibits_state_extension :
    inductive_union_passage -> sharp_local_state.extends_bounded_base) :
  YMPacket6Interface :=
  { mixed_correlator_closure := mixed_correlator_closure
    positive_unital_bridge := positive_unital_bridge
    finite_cap_sharp_local_extension := finite_cap_sharp_local_extension
    bounded_state_compatibility := bounded_state_compatibility
    inductive_union_passage := inductive_union_passage
    sharp_local_state := sharp_local_state
    bridge_uses_mixed_closure := bridge_uses_mixed_closure
    finite_cap_extension_uses_bridge := finite_cap_extension_uses_bridge
    bounded_state_compatibility_uses_extension := bounded_state_compatibility_uses_extension
    inductive_union_uses_extension_and_compatibility := inductive_union_uses_extension_and_compatibility
    inductive_union_exhibits_state_extension := inductive_union_exhibits_state_extension }

def YangMillsPacket8InterfaceData
  (wilson_return : Prop)
  (bounded_dyadic_os_limit : Prop)
  (continuum_time_os_upgrade : Prop)
  (density_export : Prop)
  (graph_core_handoff : Prop)
  (continuum_gap_transport : Prop)
  (sharp_local_gap_corollary : Prop)
  (reconstruction : YMOSReconstruction)
  (vacuum_gap_data : YMVacuumGapData)
  (bounded_os_limit_uses_wilson_return :
    wilson_return -> bounded_dyadic_os_limit)
  (continuum_time_upgrade_uses_bounded_limit_and_laneA :
    bounded_dyadic_os_limit -> Prop -> Prop -> continuum_time_os_upgrade)
  (density_export_uses_upgrade :
    continuum_time_os_upgrade -> density_export)
  (graph_core_handoff_uses_density_export :
    density_export -> graph_core_handoff)
  (continuum_gap_transport_uses_upgrade_and_graph_core :
    continuum_time_os_upgrade -> graph_core_handoff -> continuum_gap_transport)
  (sharp_local_gap_corollary_uses_transport :
    continuum_gap_transport -> sharp_local_gap_corollary)
  (upgrade_exhibits_reconstruction :
    continuum_time_os_upgrade -> reconstruction.from_state.extends_bounded_base)
  (graph_core_exhibits_density :
    graph_core_handoff -> reconstruction.bounded_base_dense)
  (transport_exhibits_gap :
    continuum_gap_transport -> vacuum_gap_data.positive_gap)
  (transport_comes_from_lattice_gap :
    continuum_gap_transport -> vacuum_gap_data.transport_from_lattice_gap) :
  YMPacket8Interface :=
  { wilson_return := wilson_return
    bounded_dyadic_os_limit := bounded_dyadic_os_limit
    continuum_time_os_upgrade := continuum_time_os_upgrade
    density_export := density_export
    graph_core_handoff := graph_core_handoff
    continuum_gap_transport := continuum_gap_transport
    sharp_local_gap_corollary := sharp_local_gap_corollary
    reconstruction := reconstruction
    vacuum_gap_data := vacuum_gap_data
    bounded_os_limit_uses_wilson_return := bounded_os_limit_uses_wilson_return
    continuum_time_upgrade_uses_bounded_limit_and_laneA := continuum_time_upgrade_uses_bounded_limit_and_laneA
    density_export_uses_upgrade := density_export_uses_upgrade
    graph_core_handoff_uses_density_export := graph_core_handoff_uses_density_export
    continuum_gap_transport_uses_upgrade_and_graph_core := continuum_gap_transport_uses_upgrade_and_graph_core
    sharp_local_gap_corollary_uses_transport := sharp_local_gap_corollary_uses_transport
    upgrade_exhibits_reconstruction := upgrade_exhibits_reconstruction
    graph_core_exhibits_density := graph_core_exhibits_density
    transport_exhibits_gap := transport_exhibits_gap
    transport_comes_from_lattice_gap := transport_comes_from_lattice_gap }

def YangMillsPacket9InterfaceData
  (euclidean_os_dossier : Prop)
  (wightman_reconstruction : Prop)
  (field_correspondence : Prop)
  (minkowski_gap_transfer : Prop)
  (nontriviality : Prop)
  (endpoint_object : YMEndpointObject)
  (wightman_reconstruction_uses_euclidean_dossier :
    euclidean_os_dossier -> wightman_reconstruction)
  (field_correspondence_uses_reconstruction :
    wightman_reconstruction -> field_correspondence)
  (minkowski_gap_transfer_uses_reconstruction :
    wightman_reconstruction -> minkowski_gap_transfer)
  (nontriviality_uses_reconstruction :
    wightman_reconstruction -> nontriviality)
  (reconstruction_exhibits_endpoint :
    wightman_reconstruction -> endpoint_object.exact_local_net_endpoint)
  (minkowski_gap_transfer_uses_vacuum_gap :
    minkowski_gap_transfer -> Prop) :
  YMPacket9Interface :=
  { euclidean_os_dossier := euclidean_os_dossier
    wightman_reconstruction := wightman_reconstruction
    field_correspondence := field_correspondence
    minkowski_gap_transfer := minkowski_gap_transfer
    nontriviality := nontriviality
    endpoint_object := endpoint_object
    wightman_reconstruction_uses_euclidean_dossier := wightman_reconstruction_uses_euclidean_dossier
    field_correspondence_uses_reconstruction := field_correspondence_uses_reconstruction
    minkowski_gap_transfer_uses_reconstruction := minkowski_gap_transfer_uses_reconstruction
    nontriviality_uses_reconstruction := nontriviality_uses_reconstruction
    reconstruction_exhibits_endpoint := reconstruction_exhibits_endpoint
    minkowski_gap_transfer_uses_vacuum_gap := minkowski_gap_transfer_uses_vacuum_gap }

def YangMillsLoadBearingSpineData
  (packet1_uv_gate : Prop)
  (packet2_entrance : Prop)
  (packet3_fixed_lattice_gap : Prop)
  (packet4_flowed_state : Prop)
  (packet5_finite_truncation : Prop)
  (packet6_finite_cap_closure : YMPacket6Interface)
  (packet7_cyclicity : Prop)
  (packet8_qe3_transport : YMPacket8Interface)
  (packet9_reconstruction : YMPacket9Interface)
  (packet10_endpoint : Prop)
  (auxiliary_weak_window_certificate : Prop)
  (seam_finite_cap_bridge : Prop)
  (seam_bounded_state_compatibility : Prop)
  (seam_graph_core_handoff : Prop)
  (theorem_parts : YMMainTheoremParts)
  (partC_route : YMPartCRouteInterface)
  (partD_route : YMPartDRouteInterface)
  (endpoint_route : YMEndpointRouteInterface) :
  YMLoadBearingSpine :=
  { packet1_uv_gate := packet1_uv_gate
    packet2_entrance := packet2_entrance
    packet3_fixed_lattice_gap := packet3_fixed_lattice_gap
    packet4_flowed_state := packet4_flowed_state
    packet5_finite_truncation := packet5_finite_truncation
    packet6_finite_cap_closure := packet6_finite_cap_closure
    packet7_cyclicity := packet7_cyclicity
    packet8_qe3_transport := packet8_qe3_transport
    packet9_reconstruction := packet9_reconstruction
    packet10_endpoint := packet10_endpoint
    auxiliary_weak_window_certificate := auxiliary_weak_window_certificate
    seam_finite_cap_bridge := seam_finite_cap_bridge
    seam_bounded_state_compatibility := seam_bounded_state_compatibility
    seam_graph_core_handoff := seam_graph_core_handoff
    theorem_parts := theorem_parts
    partC_route := partC_route
    partD_route := partD_route
    endpoint_route := endpoint_route }

theorem YangMillsLoadBearingSpineBuilderStatement
  (packet1_uv_gate : Prop)
  (packet2_entrance : Prop)
  (packet3_fixed_lattice_gap : Prop)
  (packet4_flowed_state : Prop)
  (packet5_finite_truncation : Prop)
  (packet6_finite_cap_closure : YMPacket6Interface)
  (packet7_cyclicity : Prop)
  (packet8_qe3_transport : YMPacket8Interface)
  (packet9_reconstruction : YMPacket9Interface)
  (packet10_endpoint : Prop)
  (auxiliary_weak_window_certificate : Prop)
  (seam_finite_cap_bridge : Prop)
  (seam_bounded_state_compatibility : Prop)
  (seam_graph_core_handoff : Prop)
  (theorem_parts : YMMainTheoremParts)
  (partC_route : YMPartCRouteInterface)
  (partD_route : YMPartDRouteInterface)
  (endpoint_route : YMEndpointRouteInterface)
  (hp1 : packet1_uv_gate)
  (hp2 : packet2_entrance) :
  let S :=
    YangMillsLoadBearingSpineData
      packet1_uv_gate packet2_entrance packet3_fixed_lattice_gap
      packet4_flowed_state packet5_finite_truncation packet6_finite_cap_closure
      packet7_cyclicity packet8_qe3_transport packet9_reconstruction packet10_endpoint
      auxiliary_weak_window_certificate seam_finite_cap_bridge
      seam_bounded_state_compatibility seam_graph_core_handoff
      theorem_parts partC_route partD_route endpoint_route
  S.packet1_uv_gate /\
  S.packet2_entrance := by
  exact And.intro hp1 hp2

end MaleyLean
