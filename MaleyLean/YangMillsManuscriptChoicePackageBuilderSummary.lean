import MaleyLean.Papers.YangMills.Surface.ManuscriptChoicePackageBuilderSummary

namespace MaleyLean

theorem YangMillsManuscriptChoicePackageBuilderSummaryTopExportStatement
  (objects : YMManuscriptConcreteObjects)
  (witnesses : YMManuscriptReadinessWitnesses objects)
  (DeltaMax :
    (YangMillsConstructiveSemanticBundleData
      objects.RC
      witnesses.htrunc
      witnesses.hext
      witnesses.hcompat
      witnesses.hunion).finite_cap_window)
  (finite_cap_bridge :
    (YangMillsConstructiveSemanticBundleData
      objects.RC
      witnesses.htrunc
      witnesses.hext
      witnesses.hcompat
      witnesses.hunion).positive_bridge_map)
  (bounded_base_one :
    (YangMillsConstructiveSemanticBundleData
      objects.RC
      witnesses.htrunc
      witnesses.hext
      witnesses.hcompat
      witnesses.hunion).bounded_base_carrier)
  (omega_bd :
    (YangMillsConstructiveSemanticBundleData
      objects.RC
      witnesses.htrunc
      witnesses.hext
      witnesses.hcompat
      witnesses.hunion).bounded_state_data)
  (omega_sharp :
    (YangMillsConstructiveSemanticBundleData
      objects.RC
      witnesses.htrunc
      witnesses.hext
      witnesses.hcompat
      witnesses.hunion).inductive_union_data)
  (transport :
    (YangMillsVacuumGapSemanticBundleData
      objects.RD
      witnesses.hww).transport_map)
  (H :
    (YangMillsVacuumGapSemanticBundleData
      objects.RD
      witnesses.hww).lattice_observable_family)
  (Hloc :
    (YangMillsVacuumGapSemanticBundleData
      objects.RD
      witnesses.hww).reconstructed_sector)
  (corr :
    (YangMillsVacuumGapSemanticBundleData
      objects.RD
      witnesses.hww).os_correlation_family)
  (gapf :
    (YangMillsVacuumGapSemanticBundleData
      objects.RD
      witnesses.hww).minkowski_gap_functional)
  (hgap :
    (YangMillsVacuumGapSemanticBundleData
      objects.RD
      witnesses.hww).evaluate_minkowski_gap
        gapf
        ((YangMillsVacuumGapSemanticBundleData
          objects.RD
          witnesses.hww).realize_os_sector Hloc corr))
  (Omega_loc :
    (YangMillsEndpointSemanticBundleData
      objects.RE
      witnesses.hE
      witnesses.hP).vacuum_vector)
  (phi_star :
    (YangMillsEndpointSemanticBundleData
      objects.RE
      witnesses.hE
      witnesses.hP).test_function_space)
  (E_ren :
    (YangMillsEndpointSemanticBundleData
      objects.RE
      witnesses.hE
      witnesses.hP).field_family) :
  let P :=
    YangMillsManuscriptChoicePackageData
      objects witnesses
      DeltaMax finite_cap_bridge bounded_base_one omega_bd omega_sharp
      transport H Hloc corr gapf hgap
      Omega_loc phi_star E_ren
  P.objects = objects /\
  P.witnesses = witnesses /\
  P.constructive_choices.DeltaMax = DeltaMax /\
  P.constructive_choices.omega_bd = omega_bd /\
  P.constructive_choices.omega_sharp = omega_sharp /\
  P.vacuum_gap_choices.transport = transport /\
  P.vacuum_gap_choices.H = H /\
  P.vacuum_gap_choices.Hloc = Hloc /\
  P.vacuum_gap_choices.corr = corr /\
  P.vacuum_gap_choices.gapf = gapf /\
  P.vacuum_gap_choices.hgap = hgap /\
  P.endpoint_choices.Omega_loc = Omega_loc /\
  P.endpoint_choices.phi_star = phi_star /\
  P.endpoint_choices.E_ren = E_ren := by
  exact
    YangMillsManuscriptChoicePackageBuilderSummaryStatement
      objects witnesses
      DeltaMax finite_cap_bridge bounded_base_one omega_bd omega_sharp
      transport H Hloc corr gapf hgap
      Omega_loc phi_star E_ren

end MaleyLean
