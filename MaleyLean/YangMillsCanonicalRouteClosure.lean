import MaleyLean.Papers.YangMills.Kernel.CanonicalRouteClosure

namespace MaleyLean

theorem YangMillsCanonicalRouteClosureTopExportStatement
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
  Nonempty (YMCanonicalRouteClosure S) /\
  S.theorem_parts.partA_public_scope /\
  S.partC_route.partC_output /\
  S.partD_route.partD_output /\
  S.endpoint_route.endpoint_output := by
  exact
    YangMillsCanonicalRouteClosureExportStatement
      S
      hp1 hp2
      hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
      hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
      hEready1 hEready2 hEready3
      hAroute

end MaleyLean
