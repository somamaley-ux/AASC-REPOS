import MaleyLean.Papers.YangMills.Kernel.ClosedInstantiatedManuscriptBuilder

namespace MaleyLean

/--
Single bundled input object for the final closed manuscript constant.

An inhabitant of this structure is exactly the remaining data needed to define
the closed manuscript constant `I : YMClosedInstantiatedManuscript`.
-/
structure YMClosedInstantiatedManuscriptInput where
  S : YMLoadBearingSpine
  RC : YMConstructiveRoute
  RD : YMVacuumGapRoute
  RE : YMEndpointCore
  hp1 : S.packet1_uv_gate
  hp2 : S.packet2_entrance
  hAroute : ym_public_scope_route S
  htrunc : RC.finite_truncation_ready
  hext : RC.finite_cap_extension_ready
  hcompat : RC.bounded_state_compatibility_ready
  hunion : RC.inductive_union_ready
  hww : RD.weak_window_certificate_ready
  hE : RE.euclidean_dossier_ready
  hP : RE.endpoint_packet_ready
  win :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).finite_cap_window
  bridge :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).positive_bridge_map
  base :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_base_carrier
  state :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_state_data
  unionData :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).inductive_union_data
  tm :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).transport_map
  obs :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).lattice_observable_family
  rsec :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).reconstructed_sector
  corr :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).os_correlation_family
  gapf :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).minkowski_gap_functional
  hgap :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).evaluate_minkowski_gap
        gapf
        ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector rsec corr)
  vac :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).vacuum_vector
  testFn :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).test_function_space
  field :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).field_family

/--
The exact definition site for the final manuscript constant.

Once the manuscript terms are bundled into one `YMClosedInstantiatedManuscriptInput`,
the closed instantiated manuscript object is recovered with no further choices.
-/
def YangMillsClosedInstantiatedManuscriptOfInput
  (M : YMClosedInstantiatedManuscriptInput) :
  YMClosedInstantiatedManuscript :=
  YangMillsClosedInstantiatedManuscriptData
    M.S M.RC M.RD M.RE
    M.hp1 M.hp2 M.hAroute M.htrunc M.hext M.hcompat M.hunion M.hww M.hE M.hP
    M.win M.bridge M.base M.state M.unionData
    M.tm M.obs M.rsec M.corr M.gapf M.hgap
    M.vac M.testFn M.field

theorem YangMillsClosedInstantiatedManuscriptOfInputStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  let I := YangMillsClosedInstantiatedManuscriptOfInput M
  ym_DeltaMax I = M.win /\
  ym_omega_bd I = M.state /\
  ym_omega_sharp I = M.unionData /\
  ym_transport I = M.tm /\
  ym_H I = M.obs /\
  ym_Hloc I = M.rsec /\
  ym_corr I = M.corr /\
  ym_gapf I = M.gapf /\
  ym_hgap_statement I /\
  ym_Omega_loc I = M.vac /\
  ym_phi_star I = M.testFn /\
  ym_E_ren I = M.field := by
  exact
    YangMillsClosedInstantiatedManuscriptBuilderStatement
      M.S M.RC M.RD M.RE
      M.hp1 M.hp2 M.hAroute M.htrunc M.hext M.hcompat M.hunion M.hww M.hE M.hP
      M.win M.bridge M.base M.state M.unionData
      M.tm M.obs M.rsec M.corr M.gapf M.hgap
      M.vac M.testFn M.field

end MaleyLean
