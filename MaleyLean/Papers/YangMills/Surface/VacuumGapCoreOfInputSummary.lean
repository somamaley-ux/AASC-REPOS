import MaleyLean.Papers.YangMills.Kernel.VacuumGapCoreOfInput

namespace MaleyLean

theorem YangMillsVacuumGapRouteOfInputSummaryStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  let RD := YangMillsVacuumGapRouteOfInput M
  RD = M.RD /\
  RD.transport_package = M.RD.transport_package /\
  RD.reconstruction_package = M.RD.reconstruction_package /\
  RD.transport_package.transport_map = M.RD.transport_package.transport_map /\
  RD.transport_package.lattice_observable_family =
    M.RD.transport_package.lattice_observable_family /\
  RD.reconstruction_package.reconstructed_sector =
    M.RD.reconstruction_package.reconstructed_sector /\
  RD.reconstruction_package.os_correlation_family =
    M.RD.reconstruction_package.os_correlation_family /\
  RD.reconstruction_package.minkowski_gap_functional =
    M.RD.reconstruction_package.minkowski_gap_functional := by
  exact YangMillsVacuumGapRouteOfInputNamedOutputsStatement M

end MaleyLean
