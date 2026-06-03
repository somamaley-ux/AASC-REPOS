import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite
import MaleyLean.Papers.YangMills.Kernel.EndpointCoreBuilder

namespace MaleyLean

/--
Rebuild the endpoint core directly from the bundled manuscript input.

This does not invent any new endpoint ontology. It simply repackages the
already-supplied endpoint dossier, reconstruction package, endpoint object, and
their proof fields through the explicit endpoint-core builder.
-/
def YangMillsEndpointCoreOfInput
  (M : YMClosedInstantiatedManuscriptInput) :
  YMEndpointCore :=
  YangMillsEndpointCoreData
    M.RE.euclidean_dossier_ready
    M.RE.reconstruction_ready
    M.RE.endpoint_packet_ready
    M.RE.endpoint_part
    M.RE.dossier
    M.RE.reconstruction_package
    M.RE.endpoint_object
    M.RE.build_endpoint_part
    M.RE.dossier_yields_reconstruction
    M.RE.reconstruction_exhibits_fields
    M.RE.reconstruction_exhibits_vacuum
    M.RE.reconstruction_exhibits_smearing
    M.RE.reconstruction_exhibits_vacuum_correlations
    M.RE.endpoint_packet_exhibits_exact_endpoint

theorem YangMillsEndpointCoreOfInputIsOriginalStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  YangMillsEndpointCoreOfInput M = M.RE := by
  rfl

theorem YangMillsEndpointCoreOfInputNamedOutputsStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  let RE := YangMillsEndpointCoreOfInput M
  RE = M.RE /\
  RE.dossier = M.RE.dossier /\
  RE.reconstruction_package = M.RE.reconstruction_package /\
  RE.endpoint_object = M.RE.endpoint_object /\
  RE.reconstruction_package.reconstructed_hilbert =
    M.RE.reconstruction_package.reconstructed_hilbert /\
  RE.reconstruction_package.field_family =
    M.RE.reconstruction_package.field_family /\
  RE.reconstruction_package.test_function_space =
    M.RE.reconstruction_package.test_function_space /\
  RE.endpoint_object.local_net = M.RE.endpoint_object.local_net /\
  RE.endpoint_object.vacuum_sector = M.RE.endpoint_object.vacuum_sector := by
  dsimp [YangMillsEndpointCoreOfInput]
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl rfl

end MaleyLean
