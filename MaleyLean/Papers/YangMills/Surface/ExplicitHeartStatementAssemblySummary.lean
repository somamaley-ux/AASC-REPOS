import MaleyLean.Papers.YangMills.Kernel.ExplicitHeartStatementAssembly

namespace MaleyLean

theorem YangMillsExplicitHeartStatementAssemblySummaryStatement :
  forall RC : YMConstructiveRoute,
    forall RD : YMVacuumGapRoute,
      forall RE : YMEndpointCore,
        forall _htrunc : RC.finite_truncation_ready,
          forall _hext : RC.finite_cap_extension_ready,
            forall _hcompat : RC.bounded_state_compatibility_ready,
              forall _hunion : RC.inductive_union_ready,
                forall _hww : RD.weak_window_certificate_ready,
                  forall _hE : RE.euclidean_dossier_ready,
                    forall _hP : RE.endpoint_packet_ready,
                      Nonempty (YMExplicitHeartStatementAssembly RC RD RE) /\
                      ym_laneA_explicit_statement RC /\
                      ym_route1_explicit_statement RD /\
                      ym_endpoint_explicit_statement RE := by
  intro RC RD RE _htrunc _hext _hcompat _hunion _hww _hE _hP
  exact
    YangMillsExplicitHeartStatementAssemblyExportStatement
      RC RD RE _htrunc _hext _hcompat _hunion _hww _hE _hP

end MaleyLean
