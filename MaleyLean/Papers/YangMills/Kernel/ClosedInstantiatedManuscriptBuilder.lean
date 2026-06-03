import MaleyLean.Papers.YangMills.Kernel.ManuscriptNamedObjects

namespace MaleyLean

/--
Named builder for the final closed instantiated Yang--Mills manuscript object.

This does not invent a canonical manuscript constant. It packages the exact
manuscript-level route objects, readiness witnesses, and chosen-site values
into one `YMClosedInstantiatedManuscript` once those inputs are provided.
-/
def YangMillsClosedInstantiatedManuscriptData
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (win :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).finite_cap_window)
  (bridge :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).positive_bridge_map)
  (base :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_base_carrier)
  (state :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).inductive_union_data)
  (tm :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).transport_map)
  (obs :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).lattice_observable_family)
  (rsec :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).reconstructed_sector)
  (corr :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).os_correlation_family)
  (gapf :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).minkowski_gap_functional)
  (hgap :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).evaluate_minkowski_gap
        gapf
        ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector rsec corr))
  (vac :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).vacuum_vector)
  (testFn :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).test_function_space)
  (field :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).field_family) :
  YMClosedInstantiatedManuscript := by
  let blueprint : YMClosedManuscriptBlueprint :=
    { objects :=
        { S := S
          RC := RC
          RD := RD
          RE := RE }
      witnesses :=
        { hp1 := hp1
          hp2 := hp2
          hAroute := hAroute
          htrunc := htrunc
          hext := hext
          hcompat := hcompat
          hunion := hunion
          hww := hww
          hE := hE
          hP := hP } }
  exact
    { blueprint := blueprint
      chosen_sites :=
        { constructive :=
            { win := win
              bridge := bridge
              base := base
              state := state
              unionData := unionData }
          vacuum_gap :=
            { tm := tm
              obs := obs
              rsec := rsec
              corr := corr
              gapf := gapf
              hgap := hgap }
          endpoint :=
            { vac := vac
              testFn := testFn
              field := field } } }

theorem YangMillsClosedInstantiatedManuscriptBuilderStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (win :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).finite_cap_window)
  (bridge :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).positive_bridge_map)
  (base :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_base_carrier)
  (state :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData
      RC htrunc hext hcompat hunion).inductive_union_data)
  (tm :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).transport_map)
  (obs :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).lattice_observable_family)
  (rsec :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).reconstructed_sector)
  (corr :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).os_correlation_family)
  (gapf :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).minkowski_gap_functional)
  (hgap :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).evaluate_minkowski_gap
        gapf
        ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector rsec corr))
  (vac :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).vacuum_vector)
  (testFn :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).test_function_space)
  (field :
    (YangMillsEndpointSemanticBundleData
      RE hE hP).field_family) :
  let I :=
    YangMillsClosedInstantiatedManuscriptData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
      win bridge base state unionData
      tm obs rsec corr gapf hgap
      vac testFn field
  ym_DeltaMax I = win /\
  ym_omega_bd I = state /\
  ym_omega_sharp I = unionData /\
  ym_transport I = tm /\
  ym_H I = obs /\
  ym_Hloc I = rsec /\
  ym_corr I = corr /\
  ym_gapf I = gapf /\
  ym_hgap_statement I /\
  ym_Omega_loc I = vac /\
  ym_phi_star I = testFn /\
  ym_E_ren I = field := by
  dsimp [YangMillsClosedInstantiatedManuscriptData, ym_hgap_statement]
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro hgap <|
                    And.intro rfl <|
                      And.intro rfl rfl

end MaleyLean
