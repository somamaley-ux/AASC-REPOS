import MaleyLean.Papers.YangMills.Kernel.EndpointCoreOfInput

namespace MaleyLean

theorem YangMillsEndpointCoreOfInputSummaryStatement
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
  exact YangMillsEndpointCoreOfInputNamedOutputsStatement M

end MaleyLean
