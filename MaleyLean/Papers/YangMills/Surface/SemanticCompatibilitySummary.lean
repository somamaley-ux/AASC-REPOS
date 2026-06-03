import MaleyLean.Papers.YangMills.Kernel.SemanticCompatibility

namespace MaleyLean

/--
Surface-level summary exposing the operation-compatibility laws carried by the
three-heart semantic assembly.
-/
theorem YangMillsSemanticCompatibilitySummaryStatement :
  forall RC : YMConstructiveRoute,
    forall RD : YMVacuumGapRoute,
      forall RE : YMEndpointCore,
        forall htrunc : RC.finite_truncation_ready,
          forall hext : RC.finite_cap_extension_ready,
            forall hcompat : RC.bounded_state_compatibility_ready,
              forall hunion : RC.inductive_union_ready,
                forall hww : RD.weak_window_certificate_ready,
                  forall hEE : RE.euclidean_dossier_ready,
                    forall hEP : RE.endpoint_packet_ready,
                      let A := YangMillsSemanticAssemblyData
                        RC RD RE htrunc hext hcompat hunion hww hEE hEP
                      YMConstructiveOperationCompatibility A.constructive /\
                      YMVacuumGapOperationCompatibility A.vacuum_gap /\
                      YMEndpointOperationCompatibility A.endpoint := by
  intro RC RD RE htrunc hext hcompat hunion hww hEE hEP
  exact
    YangMillsSemanticAssemblyCompatibilityStatement
      RC RD RE htrunc hext hcompat hunion hww hEE hEP

end MaleyLean
