import MaleyLean.Papers.YangMills.Kernel.CanonicalTheoremAssemblyWitness

namespace MaleyLean

theorem YangMillsCanonicalTheoremAssemblyWitnessWrapperExportStatement :
  forall S : YMLoadBearingSpine,
    forall hp1 : S.packet1_uv_gate,
      forall hp2 : S.packet2_entrance,
        forall hCready1 : S.partC_route.flowed_state_ready,
          forall hCready2 : S.partC_route.finite_truncation_ready,
            forall hCready3 : S.partC_route.finite_cap_extension_ready,
              forall hCready4 : S.partC_route.cyclicity_ready,
                forall hCready5 : S.partC_route.finite_cap_bridge_ready,
                  forall hCready6 : S.partC_route.bounded_state_compatibility_ready,
                    forall hCready7 : S.partC_route.inductive_union_ready,
                      forall hDready1 : S.partD_route.uv_gate_ready,
                        forall hDready2 : S.partD_route.entrance_ready,
                          forall hDready3 : S.partD_route.fixed_lattice_gap_ready,
                            forall hDready4 : S.partD_route.weak_window_certificate_ready,
                              forall hDready5 : S.partD_route.continuum_gap_transport_ready,
                                forall hDready6 : S.partD_route.reconstruction_ready,
                                  forall hDready7 : S.partD_route.endpoint_packet_ready,
                                    forall hEready1 : S.endpoint_route.euclidean_dossier_ready,
                                      forall hEready2 : S.endpoint_route.reconstruction_ready,
                                        forall hEready3 : S.endpoint_route.endpoint_packet_ready,
                                          forall hAroute : ym_public_scope_route S,
                                            Nonempty (YMCanonicalTheoremAssemblyWitness S) /\
                                            S.theorem_parts.partA_public_scope /\
                                            S.partC_route.partC_output /\
                                            S.partD_route.partD_output /\
                                            S.endpoint_route.endpoint_output := by
  intro S hp1 hp2
  intro hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
  intro hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
  intro hEready1 hEready2 hEready3 hAroute
  exact
    YangMillsCanonicalTheoremAssemblyWitnessExportStatement
      S
      hp1 hp2
      hCready1 hCready2 hCready3 hCready4 hCready5 hCready6 hCready7
      hDready1 hDready2 hDready3 hDready4 hDready5 hDready6 hDready7
      hEready1 hEready2 hEready3
      hAroute

end MaleyLean
