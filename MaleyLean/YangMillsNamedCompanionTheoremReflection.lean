import MaleyLean.Papers.YangMills.Kernel.NamedCompanionTheoremReflection

namespace MaleyLean

theorem YangMillsNamedCompanionTheoremReflectionTopExportStatement
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hpartC : ym_paper_partC_statement RC)
  (hpartD : ym_paper_partD_statement RD)
  (hendpoint : ym_paper_endpoint_statement RE) :
  Nonempty (YMNamedCompanionTheoremReflection RC RD RE) /\
  ym_companion1_named_theorem_reflection RD /\
  ym_companion2_named_theorem_reflection RC /\
  ym_companion3_named_theorem_reflection RE := by
  exact
    YangMillsNamedCompanionTheoremReflectionExportStatement
      RC RD RE hpartC hpartD hendpoint

end MaleyLean
