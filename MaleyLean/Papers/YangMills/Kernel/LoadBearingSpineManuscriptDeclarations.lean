import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpineManuscriptObject
import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptWitnessDeclarations
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptWitnessDeclarations
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptWitnessDeclarations

namespace MaleyLean

abbrev ym_spine_packet1_uv_gate : Prop :=
  ym_vacuum_gap_manuscript_object.ultraviolet_scope_ready

abbrev ym_spine_packet2_entrance : Prop :=
  ym_vacuum_gap_manuscript_object.entrance_ready

abbrev ym_spine_packet3_fixed_lattice_gap : Prop :=
  ym_vacuum_gap_manuscript_object.fixed_lattice_gap_ready

abbrev ym_spine_packet4_flowed_state : Prop :=
  ym_constructive_manuscript_object.flowed_state_ready

abbrev ym_spine_packet5_finite_truncation : Prop :=
  ym_constructive_manuscript_object.finite_truncation_ready

abbrev ym_spine_packet7_cyclicity : Prop :=
  ym_constructive_manuscript_object.cyclicity_ready

abbrev ym_spine_packet10_endpoint : Prop :=
  ym_endpoint_manuscript_object.endpoint_packet_ready

abbrev ym_spine_auxiliary_weak_window_certificate : Prop :=
  ym_vacuum_gap_manuscript_object.weak_window_certificate_ready

noncomputable def ym_spine_packet6_finite_cap_closure : YMPacket6Interface :=
  YangMillsPacket6InterfaceData
    ym_constructive_decl_finite_cap_extension_ready
    ym_constructive_decl_finite_cap_extension_ready
    ym_constructive_decl_finite_cap_extension_ready
    ym_constructive_decl_finite_cap_extension_ready
    ym_constructive_decl_finite_cap_extension_ready
    ym_constructive_manuscript_object.sharp_local_package.sharp_local_state
    (fun h => h)
    (fun h => h)
    (fun h => h)
    (fun h _ => h)
    (fun _ =>
      ym_constructive_manuscript_object.inductive_union_extends_bounded_base
        ym_constructive_manuscript_object.hunion)

abbrev ym_spine_seam_finite_cap_bridge : Prop :=
  ym_spine_packet6_finite_cap_closure.positive_unital_bridge

abbrev ym_spine_seam_bounded_state_compatibility : Prop :=
  ym_spine_packet6_finite_cap_closure.bounded_state_compatibility

noncomputable def ym_spine_packet8_reconstruction : YMOSReconstruction :=
  YangMillsOSReconstructionData
    ym_vacuum_gap_manuscript_object.reconstruction_package.reconstructed_sector
    ym_vacuum_gap_manuscript_object.Hloc
    (fun x => x)
    ym_constructive_manuscript_object.sharp_local_package.sharp_local_state
    ym_vacuum_decl_weak_window_certificate_ready
    ym_vacuum_decl_continuum_gap_transport_ready

noncomputable def ym_spine_packet8_gap_data : YMVacuumGapData :=
  YangMillsVacuumGapDataData
    ym_spine_packet8_reconstruction
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_vacuum_decl_fixed_lattice_gap_ready

noncomputable def ym_spine_packet8_qe3_transport : YMPacket8Interface :=
  YangMillsPacket8InterfaceData
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_vacuum_decl_continuum_gap_transport_ready
    ym_spine_packet8_reconstruction
    ym_spine_packet8_gap_data
    (fun h => h)
    (fun h _ _ => h)
    (fun h => h)
    (fun h => h)
    (fun h _ => h)
    (fun h => h)
    (fun _ => ym_constructive_manuscript_object.inductive_union_extends_bounded_base
      ym_constructive_manuscript_object.hunion)
    (fun h => h)
    (fun h => h)
    (fun _ => ym_vacuum_IV1)

abbrev ym_spine_seam_graph_core_handoff : Prop :=
  ym_spine_packet8_qe3_transport.graph_core_handoff

noncomputable def ym_spine_packet9_reconstruction : YMPacket9Interface :=
  YangMillsPacket9InterfaceData
    ym_endpoint_decl_endpoint_packet_ready
    ym_endpoint_decl_endpoint_packet_ready
    ym_endpoint_decl_endpoint_packet_ready
    ym_endpoint_decl_endpoint_packet_ready
    ym_endpoint_decl_endpoint_packet_ready
    ym_endpoint_manuscript_object.endpoint_object
    (fun h => h)
    (fun h => h)
    (fun h => h)
    (fun h => h)
    ym_endpoint_manuscript_object.endpoint_packet_exhibits_exact_endpoint
    (fun _ => ym_vacuum_decl_endpoint_ready)

noncomputable def ym_spine_partC_route : YMPartCRouteInterface :=
  YangMillsPartCRouteInterfaceData
    ym_constructive_manuscript_object.flowed_state_ready
    ym_constructive_manuscript_object.finite_truncation_ready
    ym_constructive_manuscript_object.finite_cap_extension_ready
    ym_constructive_manuscript_object.cyclicity_ready
    ym_constructive_manuscript_object.finite_cap_bridge_ready
    ym_constructive_manuscript_object.bounded_state_compatibility_ready
    ym_constructive_manuscript_object.inductive_union_ready
    ym_constructive_manuscript_object.constructive_part
    ym_constructive_manuscript_object.build_constructive_part

noncomputable def ym_spine_partD_route : YMPartDRouteInterface :=
  YangMillsPartDRouteInterfaceData
    ym_vacuum_gap_manuscript_object.ultraviolet_scope_ready
    ym_vacuum_gap_manuscript_object.entrance_ready
    ym_vacuum_gap_manuscript_object.fixed_lattice_gap_ready
    ym_vacuum_gap_manuscript_object.weak_window_certificate_ready
    ym_vacuum_gap_manuscript_object.continuum_gap_transport_ready
    ym_vacuum_gap_manuscript_object.reconstruction_ready
    ym_vacuum_gap_manuscript_object.endpoint_ready
    ym_vacuum_gap_manuscript_object.vacuum_gap_part
    ym_vacuum_gap_manuscript_object.build_vacuum_gap_part

noncomputable def ym_spine_endpoint_route : YMEndpointRouteInterface :=
  YangMillsEndpointRouteInterfaceData
    ym_endpoint_manuscript_object.euclidean_dossier_ready
    ym_endpoint_manuscript_object.reconstruction_ready
    ym_endpoint_manuscript_object.endpoint_packet_ready
    ym_endpoint_manuscript_object.endpoint_part
    ym_endpoint_manuscript_object.build_endpoint_part

abbrev ym_spine_public_scope_part : Prop :=
  ym_spine_packet1_uv_gate /\ ym_spine_packet2_entrance

noncomputable def ym_spine_theorem_parts : YMMainTheoremParts :=
  YangMillsMainTheoremPartsData
    ym_spine_public_scope_part
    ym_constructive_manuscript_object.constructive_part
    ym_vacuum_gap_manuscript_object.vacuum_gap_part
    ym_endpoint_manuscript_object.endpoint_part

theorem ym_spine_hp1 : ym_spine_packet1_uv_gate := by
  exact ym_vacuum_decl_huv

theorem ym_spine_hp2 : ym_spine_packet2_entrance := by
  exact ym_vacuum_decl_hent

theorem ym_spine_hAroute :
  ym_spine_packet1_uv_gate ->
  ym_spine_packet2_entrance ->
  ym_spine_theorem_parts.partA_public_scope := by
  intro hp1 hp2
  exact And.intro hp1 hp2

noncomputable def ym_load_bearing_spine_manuscript_object :
  YMLoadBearingSpineManuscriptObject :=
  { packet1_uv_gate := ym_spine_packet1_uv_gate
    packet2_entrance := ym_spine_packet2_entrance
    packet3_fixed_lattice_gap := ym_spine_packet3_fixed_lattice_gap
    packet4_flowed_state := ym_spine_packet4_flowed_state
    packet5_finite_truncation := ym_spine_packet5_finite_truncation
    packet6_finite_cap_closure := ym_spine_packet6_finite_cap_closure
    packet7_cyclicity := ym_spine_packet7_cyclicity
    packet8_qe3_transport := ym_spine_packet8_qe3_transport
    packet9_reconstruction := ym_spine_packet9_reconstruction
    packet10_endpoint := ym_spine_packet10_endpoint
    auxiliary_weak_window_certificate := ym_spine_auxiliary_weak_window_certificate
    seam_finite_cap_bridge := ym_spine_seam_finite_cap_bridge
    seam_bounded_state_compatibility := ym_spine_seam_bounded_state_compatibility
    seam_graph_core_handoff := ym_spine_seam_graph_core_handoff
    theorem_parts := ym_spine_theorem_parts
    partC_route := ym_spine_partC_route
    partD_route := ym_spine_partD_route
    endpoint_route := ym_spine_endpoint_route
    hp1 := ym_spine_hp1
    hp2 := ym_spine_hp2
    hAroute := ym_spine_hAroute }

theorem ym_load_bearing_spine_manuscript_object_named_outputs :
  ym_load_bearing_spine_manuscript_object.packet6_finite_cap_closure =
      ym_spine_packet6_finite_cap_closure /\
  ym_load_bearing_spine_manuscript_object.packet8_qe3_transport =
      ym_spine_packet8_qe3_transport /\
  ym_load_bearing_spine_manuscript_object.packet9_reconstruction =
      ym_spine_packet9_reconstruction /\
  ym_load_bearing_spine_manuscript_object.theorem_parts =
      ym_spine_theorem_parts := by
  exact by
    simpa [ym_load_bearing_spine_manuscript_object] using
      YangMillsLoadBearingSpineManuscriptObjectStatement
        ym_load_bearing_spine_manuscript_object

end MaleyLean
