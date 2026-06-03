import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite
import MaleyLean.Papers.YangMills.Kernel.VacuumGapCoreBuilder

namespace MaleyLean

def YangMillsVacuumGapRouteOfInput
  (M : YMClosedInstantiatedManuscriptInput) :
  YMVacuumGapRoute :=
  YangMillsVacuumGapRouteData
    M.RD.ultraviolet_scope_ready
    M.RD.entrance_ready
    M.RD.fixed_lattice_gap_ready
    M.RD.weak_window_certificate_ready
    M.RD.continuum_gap_transport_ready
    M.RD.reconstruction_ready
    M.RD.endpoint_ready
    M.RD.vacuum_gap_part
    M.RD.transport_package
    M.RD.reconstruction_package
    M.RD.build_vacuum_gap_part
    M.RD.weak_window_yields_transport
    M.RD.transport_exhibits_os_transport
    M.RD.transport_exhibits_positive_gap
    M.RD.transport_comes_from_lattice_gap
    M.RD.transport_feeds_reconstruction
    M.RD.reconstruction_exhibits_os_sector
    M.RD.reconstruction_exhibits_minkowski_gap
    M.RD.reconstruction_records_transport_origin

theorem YangMillsVacuumGapRouteOfInputIsOriginalStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  YangMillsVacuumGapRouteOfInput M = M.RD := by
  rfl

theorem YangMillsVacuumGapRouteOfInputNamedOutputsStatement
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
  dsimp [YangMillsVacuumGapRouteOfInput]
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl rfl

end MaleyLean
