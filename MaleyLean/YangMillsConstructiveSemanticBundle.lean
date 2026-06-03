import MaleyLean.Papers.YangMills.Kernel.ConstructiveSemanticBundle

namespace MaleyLean

theorem YangMillsConstructiveSemanticBundleExportStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  Nonempty (YMConstructiveSemanticBundle R) := by
  exact YangMillsConstructiveSemanticBundleExistsStatement R htrunc hext hcompat hunion

end MaleyLean
