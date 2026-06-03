import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpine

namespace MaleyLean

/--
Canonical theorem-facing witness object that avoids arbitrary landing maps into
`S.theorem_parts` by working directly with the spine's own route outputs.
-/
structure YMCanonicalTheoremAssemblyWitness
    (S : YMLoadBearingSpine) where
  public_scope_witness : S.theorem_parts.partA_public_scope
  partC_route_witness : S.partC_route.partC_output
  partD_route_witness : S.partD_route.partD_output
  endpoint_route_witness : S.endpoint_route.endpoint_output

def YangMillsCanonicalTheoremAssemblyWitnessData
  (S : YMLoadBearingSpine)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
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
  (hEready3 : S.endpoint_route.endpoint_packet_ready)
  (hAroute : ym_public_scope_route S) :
  YMCanonicalTheoremAssemblyWitness S := by
  refine
    { public_scope_witness := hAroute hp1 hp2
      partC_route_witness :=
        YangMillsPartCRouteInterfaceStatement
          S hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
      partD_route_witness :=
        YangMillsPartDRouteInterfaceStatement
          S hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
      endpoint_route_witness :=
        YangMillsEndpointRouteInterfaceStatement
          S hEready1 hEready2 hEready3 }

theorem YangMillsCanonicalTheoremAssemblyWitnessExistsStatement
  (S : YMLoadBearingSpine)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
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
  (hEready3 : S.endpoint_route.endpoint_packet_ready)
  (hAroute : ym_public_scope_route S) :
  Nonempty (YMCanonicalTheoremAssemblyWitness S) := by
  exact
    ⟨YangMillsCanonicalTheoremAssemblyWitnessData
      S
      hp1 hp2
      hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
      hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
      hEready1 hEready2 hEready3
      hAroute⟩

theorem YangMillsCanonicalTheoremAssemblyWitnessExportStatement
  (S : YMLoadBearingSpine)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
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
  (hEready3 : S.endpoint_route.endpoint_packet_ready)
  (hAroute : ym_public_scope_route S) :
  Nonempty (YMCanonicalTheoremAssemblyWitness S) /\
  S.theorem_parts.partA_public_scope /\
  S.partC_route.partC_output /\
  S.partD_route.partD_output /\
  S.endpoint_route.endpoint_output := by
  let W :=
    YangMillsCanonicalTheoremAssemblyWitnessData
      S
      hp1 hp2
      hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
      hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
      hEready1 hEready2 hEready3
      hAroute
  exact And.intro ⟨W⟩ <|
    And.intro W.public_scope_witness <|
      And.intro W.partC_route_witness <|
        And.intro W.partD_route_witness W.endpoint_route_witness

end MaleyLean
