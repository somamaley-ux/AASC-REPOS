import MaleyLean.Papers.YangMills.Kernel.ReadingOrder

namespace MaleyLean

/--
Abstract load-bearing proof spine for the hardened Yang--Mills manuscript.

This is still a manuscript-facing layer, but it is closer to the actual proof
object than the earlier registries: it packages the public packet outputs and
seam outputs as the exact abstract inputs needed to assemble the kernel main
theorem.
-/
structure YMBoundedBase where
  carrier : Type
  state_on_carrier : carrier -> Prop

structure YMSharpLocalState where
  algebra : Type
  state_on_algebra : algebra -> Prop
  bounded_base : YMBoundedBase
  extends_bounded_base : Prop

structure YMOSReconstruction where
  hilbert : Type
  vacuum : hilbert
  hamiltonian : hilbert -> hilbert
  from_state : YMSharpLocalState
  reflection_positive : Prop
  bounded_base_dense : Prop

structure YMVacuumGapData where
  reconstruction : YMOSReconstruction
  positive_gap : Prop
  transport_from_lattice_gap : Prop

structure YMEndpointObject where
  local_net : Type
  vacuum_sector : Type
  faithful_wilson_universality : Prop
  exact_local_net_endpoint : Prop

structure YMMainTheoremParts where
  partA_public_scope : Prop
  partC_sharp_local_construction : Prop
  partD_vacuum_gap : Prop
  endpoint_exact_object : Prop

structure YMPartCRouteInterface where
  flowed_state_ready : Prop
  finite_truncation_ready : Prop
  finite_cap_extension_ready : Prop
  cyclicity_ready : Prop
  finite_cap_bridge_ready : Prop
  bounded_state_compatibility_ready : Prop
  inductive_union_ready : Prop
  partC_output : Prop
  concludes_partC :
    flowed_state_ready ->
    finite_truncation_ready ->
    finite_cap_extension_ready ->
    cyclicity_ready ->
    finite_cap_bridge_ready ->
    bounded_state_compatibility_ready ->
    inductive_union_ready ->
    partC_output

structure YMPartDRouteInterface where
  uv_gate_ready : Prop
  entrance_ready : Prop
  fixed_lattice_gap_ready : Prop
  weak_window_certificate_ready : Prop
  continuum_gap_transport_ready : Prop
  reconstruction_ready : Prop
  endpoint_packet_ready : Prop
  partD_output : Prop
  concludes_partD :
    uv_gate_ready ->
    entrance_ready ->
    fixed_lattice_gap_ready ->
    weak_window_certificate_ready ->
    continuum_gap_transport_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    partD_output

structure YMEndpointRouteInterface where
  euclidean_dossier_ready : Prop
  reconstruction_ready : Prop
  endpoint_packet_ready : Prop
  endpoint_output : Prop
  concludes_endpoint :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_output

structure YMPacket6Interface where
  mixed_correlator_closure : Prop
  positive_unital_bridge : Prop
  finite_cap_sharp_local_extension : Prop
  bounded_state_compatibility : Prop
  inductive_union_passage : Prop
  sharp_local_state : YMSharpLocalState
  bridge_uses_mixed_closure :
    mixed_correlator_closure -> positive_unital_bridge
  finite_cap_extension_uses_bridge :
    positive_unital_bridge -> finite_cap_sharp_local_extension
  bounded_state_compatibility_uses_extension :
    finite_cap_sharp_local_extension -> bounded_state_compatibility
  inductive_union_uses_extension_and_compatibility :
    finite_cap_sharp_local_extension -> bounded_state_compatibility -> inductive_union_passage
  inductive_union_exhibits_state_extension :
    inductive_union_passage -> sharp_local_state.extends_bounded_base

structure YMPacket8Interface where
  wilson_return : Prop
  bounded_dyadic_os_limit : Prop
  continuum_time_os_upgrade : Prop
  density_export : Prop
  graph_core_handoff : Prop
  continuum_gap_transport : Prop
  sharp_local_gap_corollary : Prop
  reconstruction : YMOSReconstruction
  vacuum_gap_data : YMVacuumGapData
  bounded_os_limit_uses_wilson_return :
    wilson_return -> bounded_dyadic_os_limit
  continuum_time_upgrade_uses_bounded_limit_and_laneA :
    bounded_dyadic_os_limit -> Prop -> Prop -> continuum_time_os_upgrade
  density_export_uses_upgrade :
    continuum_time_os_upgrade -> density_export
  graph_core_handoff_uses_density_export :
    density_export -> graph_core_handoff
  continuum_gap_transport_uses_upgrade_and_graph_core :
    continuum_time_os_upgrade -> graph_core_handoff -> continuum_gap_transport
  sharp_local_gap_corollary_uses_transport :
    continuum_gap_transport -> sharp_local_gap_corollary
  upgrade_exhibits_reconstruction :
    continuum_time_os_upgrade -> reconstruction.from_state.extends_bounded_base
  graph_core_exhibits_density :
    graph_core_handoff -> reconstruction.bounded_base_dense
  transport_exhibits_gap :
    continuum_gap_transport -> vacuum_gap_data.positive_gap
  transport_comes_from_lattice_gap :
    continuum_gap_transport -> vacuum_gap_data.transport_from_lattice_gap

structure YMPacket9Interface where
  euclidean_os_dossier : Prop
  wightman_reconstruction : Prop
  field_correspondence : Prop
  minkowski_gap_transfer : Prop
  nontriviality : Prop
  endpoint_object : YMEndpointObject
  wightman_reconstruction_uses_euclidean_dossier :
    euclidean_os_dossier -> wightman_reconstruction
  field_correspondence_uses_reconstruction :
    wightman_reconstruction -> field_correspondence
  minkowski_gap_transfer_uses_reconstruction :
    wightman_reconstruction -> minkowski_gap_transfer
  nontriviality_uses_reconstruction :
    wightman_reconstruction -> nontriviality
  reconstruction_exhibits_endpoint :
    wightman_reconstruction -> endpoint_object.exact_local_net_endpoint
  minkowski_gap_transfer_uses_vacuum_gap :
    minkowski_gap_transfer -> Prop

structure YMLoadBearingSpine where
  packet1_uv_gate : Prop
  packet2_entrance : Prop
  packet3_fixed_lattice_gap : Prop
  packet4_flowed_state : Prop
  packet5_finite_truncation : Prop
  packet6_finite_cap_closure : YMPacket6Interface
  packet7_cyclicity : Prop
  packet8_qe3_transport : YMPacket8Interface
  packet9_reconstruction : YMPacket9Interface
  packet10_endpoint : Prop
  auxiliary_weak_window_certificate : Prop
  seam_finite_cap_bridge : Prop
  seam_bounded_state_compatibility : Prop
  seam_graph_core_handoff : Prop
  theorem_parts : YMMainTheoremParts
  partC_route : YMPartCRouteInterface
  partD_route : YMPartDRouteInterface
  endpoint_route : YMEndpointRouteInterface

/-- The short public Route~1 mass-gap compression advertised by the kernel. -/
def ym_short_mass_gap_route (S : YMLoadBearingSpine) : Prop :=
  S.packet1_uv_gate ->
  S.packet2_entrance ->
  S.packet3_fixed_lattice_gap ->
  S.auxiliary_weak_window_certificate ->
  S.packet8_qe3_transport.continuum_gap_transport ->
  S.packet9_reconstruction.wightman_reconstruction ->
  S.packet10_endpoint ->
  S.theorem_parts.partD_vacuum_gap

/-- The unique constructive Lane~A route isolated by the kernel. -/
def ym_constructive_laneA_route (S : YMLoadBearingSpine) : Prop :=
  S.packet4_flowed_state ->
  S.packet5_finite_truncation ->
  S.packet6_finite_cap_closure.finite_cap_sharp_local_extension ->
  S.packet7_cyclicity ->
  S.packet6_finite_cap_closure.positive_unital_bridge ->
  S.packet6_finite_cap_closure.bounded_state_compatibility ->
  S.packet6_finite_cap_closure.inductive_union_passage ->
  S.theorem_parts.partC_sharp_local_construction

/-- Final endpoint assembly after Route~1 and Lane~A are in place. -/
def ym_endpoint_assembly_route (S : YMLoadBearingSpine) : Prop :=
  S.packet9_reconstruction.euclidean_os_dossier ->
  S.packet9_reconstruction.wightman_reconstruction ->
  S.packet10_endpoint ->
  S.theorem_parts.endpoint_exact_object

/-- Packet 8 is only usable after the visible Lane~A seams are in place. -/
def ym_packet8_consumes_visible_seams (S : YMLoadBearingSpine) : Prop :=
  S.packet8_qe3_transport.graph_core_handoff ->
  S.seam_finite_cap_bridge ->
  S.seam_bounded_state_compatibility ->
  S.seam_graph_core_handoff

/-- Packet 6 is the source of the finite-cap bridge and bounded-state seam outputs. -/
def ym_packet6_realizes_named_seams (S : YMLoadBearingSpine) : Prop :=
  S.packet6_finite_cap_closure.positive_unital_bridge ->
  S.packet6_finite_cap_closure.bounded_state_compatibility ->
  S.seam_finite_cap_bridge /\ S.seam_bounded_state_compatibility

/-- Packet 8 is the source of the visible graph-core seam output. -/
def ym_packet8_realizes_named_seam (S : YMLoadBearingSpine) : Prop :=
  S.packet8_qe3_transport.graph_core_handoff ->
  S.seam_graph_core_handoff

/-- Packet 9 is only entered after the QE3 transport node has fired. -/
def ym_packet9_uses_qe3_transport (S : YMLoadBearingSpine) : Prop :=
  S.packet8_qe3_transport.continuum_gap_transport ->
  S.packet9_reconstruction.euclidean_os_dossier

/-- Full kernel assembly route from packet outputs to the theorem object. -/
def ym_load_bearing_spine_closes (S : YMLoadBearingSpine) : Prop :=
  S.theorem_parts.partA_public_scope /\
  S.theorem_parts.partC_sharp_local_construction /\
  S.theorem_parts.partD_vacuum_gap /\
  S.theorem_parts.endpoint_exact_object

/-- Packet 1 and Packet 2 expose the public-scope part of the theorem object. -/
def ym_public_scope_route (S : YMLoadBearingSpine) : Prop :=
  S.packet1_uv_gate ->
  S.packet2_entrance ->
  S.theorem_parts.partA_public_scope

theorem YangMillsShortMassGapRouteStatement
  (S : YMLoadBearingSpine)
  (hroute : ym_short_mass_gap_route S)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hp3 : S.packet3_fixed_lattice_gap)
  (hww : S.auxiliary_weak_window_certificate)
  (hp8 : S.packet8_qe3_transport.continuum_gap_transport)
  (hp9 : S.packet9_reconstruction.wightman_reconstruction)
  (hp10 : S.packet10_endpoint) :
  S.theorem_parts.partD_vacuum_gap := by
  exact hroute hp1 hp2 hp3 hww hp8 hp9 hp10

theorem YangMillsPublicScopeRouteStatement
  (S : YMLoadBearingSpine)
  (hroute : ym_public_scope_route S)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance) :
  S.theorem_parts.partA_public_scope := by
  exact hroute hp1 hp2

theorem YangMillsConstructiveLaneARouteStatement
  (S : YMLoadBearingSpine)
  (hroute : ym_constructive_laneA_route S)
  (hp4 : S.packet4_flowed_state)
  (hp5 : S.packet5_finite_truncation)
  (hp6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (hp7 : S.packet7_cyclicity)
  (hbridge : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hcompat : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hunion : S.packet6_finite_cap_closure.inductive_union_passage) :
  S.theorem_parts.partC_sharp_local_construction := by
  exact hroute hp4 hp5 hp6 hp7 hbridge hcompat hunion

theorem YangMillsEndpointAssemblyRouteStatement
  (S : YMLoadBearingSpine)
  (hroute : ym_endpoint_assembly_route S)
  (hE : S.packet9_reconstruction.euclidean_os_dossier)
  (hW : S.packet9_reconstruction.wightman_reconstruction)
  (hp10 : S.packet10_endpoint) :
  S.theorem_parts.endpoint_exact_object := by
  exact hroute hE hW hp10

theorem YangMillsEndpointRouteInterfaceStatement
  (S : YMLoadBearingSpine)
  (hE : S.endpoint_route.euclidean_dossier_ready)
  (hR : S.endpoint_route.reconstruction_ready)
  (hP : S.endpoint_route.endpoint_packet_ready) :
  S.endpoint_route.endpoint_output := by
  exact S.endpoint_route.concludes_endpoint hE hR hP

theorem YangMillsLoadBearingSpineClosesStatement
  (S : YMLoadBearingSpine)
  (hA : S.theorem_parts.partA_public_scope)
  (hC : S.theorem_parts.partC_sharp_local_construction)
  (hD : S.theorem_parts.partD_vacuum_gap)
  (hE : S.theorem_parts.endpoint_exact_object) :
  ym_load_bearing_spine_closes S := by
  exact And.intro hA <| And.intro hC <| And.intro hD hE

theorem YangMillsPacket8ConsumesLaneASeamsStatement
  (S : YMLoadBearingSpine)
  (hconsume : ym_packet8_consumes_visible_seams S)
  (hp8 : S.packet8_qe3_transport.graph_core_handoff)
  (hbridge : S.seam_finite_cap_bridge)
  (hcompat : S.seam_bounded_state_compatibility)
  (_hgraph : S.seam_graph_core_handoff) :
  S.seam_graph_core_handoff := by
  exact hconsume hp8 hbridge hcompat

theorem YangMillsPacket6RealizesNamedSeamsStatement
  (S : YMLoadBearingSpine)
  (hrealize : ym_packet6_realizes_named_seams S)
  (hbridge : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hcompat : S.packet6_finite_cap_closure.bounded_state_compatibility) :
  S.seam_finite_cap_bridge /\ S.seam_bounded_state_compatibility := by
  exact hrealize hbridge hcompat

theorem YangMillsPacket8RealizesNamedSeamStatement
  (S : YMLoadBearingSpine)
  (hrealize : ym_packet8_realizes_named_seam S)
  (hgraph : S.packet8_qe3_transport.graph_core_handoff) :
  S.seam_graph_core_handoff := by
  exact hrealize hgraph

theorem YangMillsPacket9UsesQE3TransportStatement
  (S : YMLoadBearingSpine)
  (huse : ym_packet9_uses_qe3_transport S)
  (htransport : S.packet8_qe3_transport.continuum_gap_transport) :
  S.packet9_reconstruction.euclidean_os_dossier := by
  exact huse htransport

theorem YangMillsPacket6InterfaceExportsStatement
  (S : YMLoadBearingSpine) :
  S.packet6_finite_cap_closure.mixed_correlator_closure /\
  S.packet6_finite_cap_closure.positive_unital_bridge /\
  S.packet6_finite_cap_closure.finite_cap_sharp_local_extension /\
  S.packet6_finite_cap_closure.bounded_state_compatibility /\
  S.packet6_finite_cap_closure.inductive_union_passage ->
  S.packet6_finite_cap_closure.mixed_correlator_closure := by
  intro h
  exact h.1

theorem YangMillsPacket6InterfaceFlowStatement
  (S : YMLoadBearingSpine)
  (hmix : S.packet6_finite_cap_closure.mixed_correlator_closure) :
  S.packet6_finite_cap_closure.positive_unital_bridge /\
  S.packet6_finite_cap_closure.finite_cap_sharp_local_extension /\
  S.packet6_finite_cap_closure.bounded_state_compatibility /\
  S.packet6_finite_cap_closure.inductive_union_passage := by
  let hbridge :=
    S.packet6_finite_cap_closure.bridge_uses_mixed_closure hmix
  let hext :=
    S.packet6_finite_cap_closure.finite_cap_extension_uses_bridge hbridge
  let hcompat :=
    S.packet6_finite_cap_closure.bounded_state_compatibility_uses_extension hext
  let hunion :=
    S.packet6_finite_cap_closure.inductive_union_uses_extension_and_compatibility hext hcompat
  exact And.intro hbridge <| And.intro hext <| And.intro hcompat hunion

theorem YangMillsPacket8InterfaceExportsStatement
  (S : YMLoadBearingSpine) :
  S.packet8_qe3_transport.wilson_return /\
  S.packet8_qe3_transport.bounded_dyadic_os_limit /\
  S.packet8_qe3_transport.continuum_time_os_upgrade /\
  S.packet8_qe3_transport.density_export /\
  S.packet8_qe3_transport.graph_core_handoff /\
  S.packet8_qe3_transport.continuum_gap_transport /\
  S.packet8_qe3_transport.sharp_local_gap_corollary ->
  S.packet8_qe3_transport.continuum_gap_transport := by
  intro h
  exact h.2.2.2.2.2.1

theorem YangMillsPacket8InterfaceFlowStatement
  (S : YMLoadBearingSpine)
  (hreturn : S.packet8_qe3_transport.wilson_return)
  (hcompat : Prop)
  (hunion : Prop) :
  S.packet8_qe3_transport.bounded_dyadic_os_limit /\
  S.packet8_qe3_transport.continuum_time_os_upgrade /\
  S.packet8_qe3_transport.density_export /\
  S.packet8_qe3_transport.graph_core_handoff /\
  S.packet8_qe3_transport.continuum_gap_transport /\
  S.packet8_qe3_transport.sharp_local_gap_corollary := by
  let hlimit :=
    S.packet8_qe3_transport.bounded_os_limit_uses_wilson_return hreturn
  let hupgrade :=
    S.packet8_qe3_transport.continuum_time_upgrade_uses_bounded_limit_and_laneA hlimit hcompat hunion
  let hdensity :=
    S.packet8_qe3_transport.density_export_uses_upgrade hupgrade
  let hgraph :=
    S.packet8_qe3_transport.graph_core_handoff_uses_density_export hdensity
  let htransport :=
    S.packet8_qe3_transport.continuum_gap_transport_uses_upgrade_and_graph_core hupgrade hgraph
  let hcor :=
    S.packet8_qe3_transport.sharp_local_gap_corollary_uses_transport htransport
  exact And.intro hlimit <|
    And.intro hupgrade <|
    And.intro hdensity <|
    And.intro hgraph <|
    And.intro htransport hcor

theorem YangMillsPacket9InterfaceExportsStatement
  (S : YMLoadBearingSpine) :
  S.packet9_reconstruction.euclidean_os_dossier /\
  S.packet9_reconstruction.wightman_reconstruction /\
  S.packet9_reconstruction.field_correspondence /\
  S.packet9_reconstruction.minkowski_gap_transfer /\
  S.packet9_reconstruction.nontriviality ->
  S.packet9_reconstruction.wightman_reconstruction := by
  intro h
  exact h.2.1

theorem YangMillsPacket9InterfaceFlowStatement
  (S : YMLoadBearingSpine)
  (hdossier : S.packet9_reconstruction.euclidean_os_dossier) :
  S.packet9_reconstruction.wightman_reconstruction /\
  S.packet9_reconstruction.field_correspondence /\
  S.packet9_reconstruction.minkowski_gap_transfer /\
  S.packet9_reconstruction.nontriviality := by
  let hw :=
    S.packet9_reconstruction.wightman_reconstruction_uses_euclidean_dossier hdossier
  let hf :=
    S.packet9_reconstruction.field_correspondence_uses_reconstruction hw
  let hm :=
    S.packet9_reconstruction.minkowski_gap_transfer_uses_reconstruction hw
  let hn :=
    S.packet9_reconstruction.nontriviality_uses_reconstruction hw
  exact And.intro hw <| And.intro hf <| And.intro hm hn

theorem YangMillsPacket6ExhibitsSharpLocalStateStatement
  (S : YMLoadBearingSpine)
  (hunion : S.packet6_finite_cap_closure.inductive_union_passage) :
  S.packet6_finite_cap_closure.sharp_local_state.extends_bounded_base := by
  exact S.packet6_finite_cap_closure.inductive_union_exhibits_state_extension hunion

theorem YangMillsPacket8ExhibitsOSReconstructionStatement
  (S : YMLoadBearingSpine)
  (hupgrade : S.packet8_qe3_transport.continuum_time_os_upgrade)
  (hgraph : S.packet8_qe3_transport.graph_core_handoff) :
  S.packet8_qe3_transport.reconstruction.from_state.extends_bounded_base /\
  S.packet8_qe3_transport.reconstruction.bounded_base_dense := by
  exact And.intro
    (S.packet8_qe3_transport.upgrade_exhibits_reconstruction hupgrade)
    (S.packet8_qe3_transport.graph_core_exhibits_density hgraph)

theorem YangMillsPacket8ExhibitsVacuumGapStatement
  (S : YMLoadBearingSpine)
  (htransport : S.packet8_qe3_transport.continuum_gap_transport) :
  S.packet8_qe3_transport.vacuum_gap_data.positive_gap /\
  S.packet8_qe3_transport.vacuum_gap_data.transport_from_lattice_gap := by
  exact And.intro
    (S.packet8_qe3_transport.transport_exhibits_gap htransport)
    (S.packet8_qe3_transport.transport_comes_from_lattice_gap htransport)

theorem YangMillsPacket9ExhibitsEndpointObjectStatement
  (S : YMLoadBearingSpine)
  (hw : S.packet9_reconstruction.wightman_reconstruction) :
  S.packet9_reconstruction.endpoint_object.exact_local_net_endpoint := by
  exact S.packet9_reconstruction.reconstruction_exhibits_endpoint hw

theorem YangMillsLoadBearingSeamMediatedFlowStatement
  (S : YMLoadBearingSpine)
  (h6 : ym_packet6_realizes_named_seams S)
  (h8 : ym_packet8_realizes_named_seam S)
  (h9 : ym_packet9_uses_qe3_transport S)
  (hp6bridge : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hp6compat : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hp8graph : S.packet8_qe3_transport.graph_core_handoff)
  (hp8transport : S.packet8_qe3_transport.continuum_gap_transport) :
  S.seam_finite_cap_bridge /\
  S.seam_bounded_state_compatibility /\
  S.seam_graph_core_handoff /\
  S.packet9_reconstruction.euclidean_os_dossier := by
  have hseams := YangMillsPacket6RealizesNamedSeamsStatement S h6 hp6bridge hp6compat
  have hgraph := YangMillsPacket8RealizesNamedSeamStatement S h8 hp8graph
  have hdossier := YangMillsPacket9UsesQE3TransportStatement S h9 hp8transport
  exact And.intro hseams.1 <| And.intro hseams.2 <| And.intro hgraph hdossier

theorem YangMillsDomainShapedLoadBearingFlowStatement
  (S : YMLoadBearingSpine)
  (h6flow : S.packet6_finite_cap_closure.inductive_union_passage)
  (h8upgrade : S.packet8_qe3_transport.continuum_time_os_upgrade)
  (h8graph : S.packet8_qe3_transport.graph_core_handoff)
  (h8transport : S.packet8_qe3_transport.continuum_gap_transport)
  (h9w : S.packet9_reconstruction.wightman_reconstruction) :
  S.packet6_finite_cap_closure.sharp_local_state.extends_bounded_base /\
  S.packet8_qe3_transport.reconstruction.bounded_base_dense /\
  S.packet8_qe3_transport.vacuum_gap_data.positive_gap /\
  S.packet9_reconstruction.endpoint_object.exact_local_net_endpoint := by
  have hstate := YangMillsPacket6ExhibitsSharpLocalStateStatement S h6flow
  have hrec := YangMillsPacket8ExhibitsOSReconstructionStatement S h8upgrade h8graph
  have hgap := YangMillsPacket8ExhibitsVacuumGapStatement S h8transport
  have hend := YangMillsPacket9ExhibitsEndpointObjectStatement S h9w
  exact And.intro hstate <| And.intro hrec.2 <| And.intro hgap.1 hend

theorem YangMillsMainTheoremPartAssemblyStatement
  (S : YMLoadBearingSpine)
  (hAroute : ym_public_scope_route S)
  (hCroute : ym_constructive_laneA_route S)
  (hDroute : ym_short_mass_gap_route S)
  (hEroute : ym_endpoint_assembly_route S)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hp3 : S.packet3_fixed_lattice_gap)
  (hp4 : S.packet4_flowed_state)
  (hp5 : S.packet5_finite_truncation)
  (hp6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (hp7 : S.packet7_cyclicity)
  (hp8 : S.packet8_qe3_transport.continuum_gap_transport)
  (hp9E : S.packet9_reconstruction.euclidean_os_dossier)
  (hp9W : S.packet9_reconstruction.wightman_reconstruction)
  (hp10 : S.packet10_endpoint)
  (hww : S.auxiliary_weak_window_certificate)
  (hbridge : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hcompat : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hunion : S.packet6_finite_cap_closure.inductive_union_passage) :
  ym_load_bearing_spine_closes S := by
  have hA := YangMillsPublicScopeRouteStatement S hAroute hp1 hp2
  have hC := YangMillsConstructiveLaneARouteStatement S hCroute hp4 hp5 hp6 hp7 hbridge hcompat hunion
  have hD := YangMillsShortMassGapRouteStatement S hDroute hp1 hp2 hp3 hww hp8 hp9W hp10
  have hE := YangMillsEndpointAssemblyRouteStatement S hEroute hp9E hp9W hp10
  exact YangMillsLoadBearingSpineClosesStatement S hA hC hD hE

theorem YangMillsPartCRouteInterfaceStatement
  (S : YMLoadBearingSpine)
  (hflowed : S.partC_route.flowed_state_ready)
  (htrunc : S.partC_route.finite_truncation_ready)
  (hext : S.partC_route.finite_cap_extension_ready)
  (hcyc : S.partC_route.cyclicity_ready)
  (hbridge : S.partC_route.finite_cap_bridge_ready)
  (hcompat : S.partC_route.bounded_state_compatibility_ready)
  (hunion : S.partC_route.inductive_union_ready) :
  S.partC_route.partC_output := by
  exact S.partC_route.concludes_partC hflowed htrunc hext hcyc hbridge hcompat hunion

theorem YangMillsPartDRouteInterfaceStatement
  (S : YMLoadBearingSpine)
  (huv : S.partD_route.uv_gate_ready)
  (hent : S.partD_route.entrance_ready)
  (hlat : S.partD_route.fixed_lattice_gap_ready)
  (hww : S.partD_route.weak_window_certificate_ready)
  (hgap : S.partD_route.continuum_gap_transport_ready)
  (hrec : S.partD_route.reconstruction_ready)
  (hend : S.partD_route.endpoint_packet_ready) :
  S.partD_route.partD_output := by
  exact S.partD_route.concludes_partD huv hent hlat hww hgap hrec hend

theorem YangMillsSpineFeedsPartCRouteInterfaceStatement
  (S : YMLoadBearingSpine)
  (h4 : S.packet4_flowed_state)
  (h5 : S.packet5_finite_truncation)
  (h6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (h7 : S.packet7_cyclicity)
  (hb : S.packet6_finite_cap_closure.positive_unital_bridge)
  (hc : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (hu : S.packet6_finite_cap_closure.inductive_union_passage)
  (hflowed : S.partC_route.flowed_state_ready)
  (htrunc : S.partC_route.finite_truncation_ready)
  (hext : S.partC_route.finite_cap_extension_ready)
  (hcyc : S.partC_route.cyclicity_ready)
  (hbridge : S.partC_route.finite_cap_bridge_ready)
  (hcompat : S.partC_route.bounded_state_compatibility_ready)
  (hunion : S.partC_route.inductive_union_ready) :
  S.packet4_flowed_state /\ S.packet5_finite_truncation /\ S.packet6_finite_cap_closure.finite_cap_sharp_local_extension /\
  S.packet7_cyclicity /\ S.packet6_finite_cap_closure.positive_unital_bridge /\
  S.packet6_finite_cap_closure.bounded_state_compatibility /\ S.packet6_finite_cap_closure.inductive_union_passage /\
  S.partC_route.partC_output := by
  have hroute := YangMillsPartCRouteInterfaceStatement S hflowed htrunc hext hcyc hbridge hcompat hunion
  exact And.intro h4 <|
    And.intro h5 <|
    And.intro h6 <|
    And.intro h7 <|
    And.intro hb <|
    And.intro hc <|
    And.intro hu hroute

theorem YangMillsSpineFeedsPartDRouteInterfaceStatement
  (S : YMLoadBearingSpine)
  (h1 : S.packet1_uv_gate)
  (h2 : S.packet2_entrance)
  (h3 : S.packet3_fixed_lattice_gap)
  (hwws : S.auxiliary_weak_window_certificate)
  (h8 : S.packet8_qe3_transport.continuum_gap_transport)
  (h9 : S.packet9_reconstruction.wightman_reconstruction)
  (h10 : S.packet10_endpoint)
  (huv : S.partD_route.uv_gate_ready)
  (hent : S.partD_route.entrance_ready)
  (hlat : S.partD_route.fixed_lattice_gap_ready)
  (hww : S.partD_route.weak_window_certificate_ready)
  (hgap : S.partD_route.continuum_gap_transport_ready)
  (hrec : S.partD_route.reconstruction_ready)
  (hend : S.partD_route.endpoint_packet_ready) :
  S.packet1_uv_gate /\ S.packet2_entrance /\ S.packet3_fixed_lattice_gap /\
  S.auxiliary_weak_window_certificate /\ S.packet8_qe3_transport.continuum_gap_transport /\
  S.packet9_reconstruction.wightman_reconstruction /\ S.packet10_endpoint /\
  S.partD_route.partD_output := by
  have hroute := YangMillsPartDRouteInterfaceStatement S huv hent hlat hww hgap hrec hend
  exact And.intro h1 <|
    And.intro h2 <|
    And.intro h3 <|
    And.intro hwws <|
    And.intro h8 <|
    And.intro h9 <|
    And.intro h10 hroute

theorem YangMillsSpineFeedsEndpointRouteInterfaceStatement
  (S : YMLoadBearingSpine)
  (h9E : S.packet9_reconstruction.euclidean_os_dossier)
  (h9W : S.packet9_reconstruction.wightman_reconstruction)
  (h10 : S.packet10_endpoint)
  (hE : S.endpoint_route.euclidean_dossier_ready)
  (hR : S.endpoint_route.reconstruction_ready)
  (hP : S.endpoint_route.endpoint_packet_ready) :
  S.packet9_reconstruction.euclidean_os_dossier /\
  S.packet9_reconstruction.wightman_reconstruction /\
  S.packet10_endpoint /\
  S.endpoint_route.endpoint_output := by
  have hroute := YangMillsEndpointRouteInterfaceStatement S hE hR hP
  exact And.intro h9E <| And.intro h9W <| And.intro h10 hroute

theorem YangMillsPartCRouteOutputAgreesWithTheoremPartStatement
  (S : YMLoadBearingSpine)
  (h :
    S.partC_route.partC_output ->
    S.theorem_parts.partC_sharp_local_construction) :
  S.partC_route.partC_output ->
  S.theorem_parts.partC_sharp_local_construction := by
  intro hc
  exact h hc

theorem YangMillsPartDRouteOutputAgreesWithTheoremPartStatement
  (S : YMLoadBearingSpine)
  (h :
    S.partD_route.partD_output ->
    S.theorem_parts.partD_vacuum_gap) :
  S.partD_route.partD_output ->
  S.theorem_parts.partD_vacuum_gap := by
  intro hd
  exact h hd

theorem YangMillsEndpointRouteOutputAgreesWithTheoremPartStatement
  (S : YMLoadBearingSpine)
  (h :
    S.endpoint_route.endpoint_output ->
    S.theorem_parts.endpoint_exact_object) :
  S.endpoint_route.endpoint_output ->
  S.theorem_parts.endpoint_exact_object := by
  intro he
  exact h he

theorem YangMillsUnifiedRouteToTheoremPartAssemblyStatement
  (S : YMLoadBearingSpine)
  (hAroute : ym_public_scope_route S)
  (_hCroute : ym_constructive_laneA_route S)
  (_hDroute : ym_short_mass_gap_route S)
  (_hEroute : ym_endpoint_assembly_route S)
  (hCalign : S.partC_route.partC_output -> S.theorem_parts.partC_sharp_local_construction)
  (hDalign : S.partD_route.partD_output -> S.theorem_parts.partD_vacuum_gap)
  (hEalign : S.endpoint_route.endpoint_output -> S.theorem_parts.endpoint_exact_object)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (_hp3 : S.packet3_fixed_lattice_gap)
  (_hp4 : S.packet4_flowed_state)
  (_hp5 : S.packet5_finite_truncation)
  (_hp6 : S.packet6_finite_cap_closure.finite_cap_sharp_local_extension)
  (_hp7 : S.packet7_cyclicity)
  (_hp8 : S.packet8_qe3_transport.continuum_gap_transport)
  (_hp9E : S.packet9_reconstruction.euclidean_os_dossier)
  (_hp9W : S.packet9_reconstruction.wightman_reconstruction)
  (_hp10 : S.packet10_endpoint)
  (_hww : S.auxiliary_weak_window_certificate)
  (_hbridge : S.packet6_finite_cap_closure.positive_unital_bridge)
  (_hcompat : S.packet6_finite_cap_closure.bounded_state_compatibility)
  (_hunion : S.packet6_finite_cap_closure.inductive_union_passage)
  (hCready1 : S.partC_route.flowed_state_ready)
  (hCready2 : S.partC_route.finite_truncation_ready)
  (hCready3 : S.partC_route.finite_cap_extension_ready)
  (hCready4 : S.partC_route.cyclicity_ready)
  (hCready5 : S.partC_route.finite_cap_bridge_ready)
  (hCready6 : S.partC_route.bounded_state_compatibility_ready)
  (hCready7 : S.partC_route.inductive_union_ready)
  (hDready1 : S.partD_route.uv_gate_ready)
  (hDready2 : S.partD_route.entrance_ready)
  (hDready3 : S.partD_route.fixed_lattice_gap_ready)
  (hDready4 : S.partD_route.weak_window_certificate_ready)
  (hDready5 : S.partD_route.continuum_gap_transport_ready)
  (hDready6 : S.partD_route.reconstruction_ready)
  (hDready7 : S.partD_route.endpoint_packet_ready)
  (hEready1 : S.endpoint_route.euclidean_dossier_ready)
  (hEready2 : S.endpoint_route.reconstruction_ready)
  (hEready3 : S.endpoint_route.endpoint_packet_ready) :
  ym_load_bearing_spine_closes S := by
  have hA := YangMillsPublicScopeRouteStatement S hAroute hp1 hp2
  have hCraw := YangMillsPartCRouteInterfaceStatement S hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
  have hDraw := YangMillsPartDRouteInterfaceStatement S hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
  have hEraw := YangMillsEndpointRouteInterfaceStatement S hEready1 hEready2 hEready3
  have hC := YangMillsPartCRouteOutputAgreesWithTheoremPartStatement S hCalign hCraw
  have hD := YangMillsPartDRouteOutputAgreesWithTheoremPartStatement S hDalign hDraw
  have hE := YangMillsEndpointRouteOutputAgreesWithTheoremPartStatement S hEalign hEraw
  exact YangMillsLoadBearingSpineClosesStatement S hA hC hD hE

theorem YangMillsKernelReadingOrderHitsLoadBearingPacketsStatement :
  ym_reading_track_packets .shortMassGapCompression =
      [ .packet1UVGate
      , .packet2Entrance
      , .packet3FixedLatticeGap
      , .packet8QE3Transport
      , .packet9Reconstruction
      , .packet10Endpoint
      ] /\
    ym_reading_track_packets .constructiveLaneA =
      [ .packet4FlowedState
      , .packet5FiniteTruncation
      , .packet6FiniteCapClosure
      , .packet7Cyclicity
      ] := by
  exact And.intro rfl rfl

end MaleyLean
