import MaleyLean.Papers.YangMills.Kernel.ConstructiveTheoremObjects
import MaleyLean.Papers.YangMills.Kernel.ConstructiveBoundedStateConstructionStage
import MaleyLean.Papers.YangMills.Kernel.ConstructiveFiniteCapConstructionStage
import MaleyLean.Papers.YangMills.Kernel.ConstructiveChosenSiteLawAtoms
import MaleyLean.Papers.YangMills.Kernel.ConstructiveChosenSiteExecutionTrace
import MaleyLean.Papers.YangMills.Kernel.ConstructiveInductiveUnionConstructionStage
import MaleyLean.Papers.YangMills.Kernel.ConstructiveNativeProofHomes
import MaleyLean.Papers.YangMills.Kernel.ConstructiveOperatorApplicationCertificates
import MaleyLean.Papers.YangMills.Kernel.ConstructivePrimitiveConstructions
import MaleyLean.Papers.YangMills.Kernel.ConstructiveOperatorPrimitives
import MaleyLean.Papers.YangMills.Kernel.ConstructiveSharpLocalConstructionStage
import MaleyLean.Papers.YangMills.Kernel.EndpointChosenSiteLawAtoms
import MaleyLean.Papers.YangMills.Kernel.EndpointChosenSiteExecutionTrace
import MaleyLean.Papers.YangMills.Kernel.EndpointCorrelationConstructionStage
import MaleyLean.Papers.YangMills.Kernel.EndpointPrimitiveConstructions
import MaleyLean.Papers.YangMills.Kernel.EndpointReconstructionCarrierConstructionStage
import MaleyLean.Papers.YangMills.Kernel.EndpointReconstructionOperationsConstructionStage
import MaleyLean.Papers.YangMills.Kernel.EndpointNativeProofHomes
import MaleyLean.Papers.YangMills.Kernel.EndpointOperatorApplicationCertificates
import MaleyLean.Papers.YangMills.Kernel.EndpointOperatorPrimitives
import MaleyLean.Papers.YangMills.Kernel.EndpointSmearingConstructionStage
import MaleyLean.Papers.YangMills.Kernel.Route1EndpointNativePackage
import MaleyLean.Papers.YangMills.Kernel.VacuumGapChosenSiteLawAtoms
import MaleyLean.Papers.YangMills.Kernel.VacuumGapChosenSiteExecutionTrace
import MaleyLean.Papers.YangMills.Kernel.VacuumGapNativeProofHomes
import MaleyLean.Papers.YangMills.Kernel.VacuumGapOSSectorConstructionStage
import MaleyLean.Papers.YangMills.Kernel.VacuumGapOperatorApplicationCertificates
import MaleyLean.Papers.YangMills.Kernel.VacuumGapGapEvaluationConstructionStage
import MaleyLean.Papers.YangMills.Kernel.VacuumGapPrimitiveConstructions
import MaleyLean.Papers.YangMills.Kernel.VacuumGapReconstructionConstructionStage
import MaleyLean.Papers.YangMills.Kernel.VacuumGapTransportConstructionStage
import MaleyLean.Papers.YangMills.Kernel.VacuumGapOperatorPrimitives

namespace MaleyLean

/--
Submission-facing native package combining the deepened Lane A constructive
heart with the deepened Route 1 to endpoint chain.

This is the current highest native theorem-object package spanning:
- public scope,
- Lane A constructive heart,
- Route 1 / mass-gap heart together with explicit proof-home support,
- endpoint / universality heart,
- and the native inter-heart bridge data already assembled below.
-/
structure YMFullManuscriptNativePackage
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  faithful_assembly : YMFaithfulPaperTheoremAssembly S RC RD RE
  constructive_objects : YMConstructiveNativeTheoremObjects RC
  vacuum_gap_objects : YMVacuumGapNativeTheoremObjects RD
  endpoint_objects : YMEndpointNativeTheoremObjects RE
  constructive_operator_primitives : YMConstructiveOperatorPrimitives RC
  constructive_operator_certificates : YMConstructiveOperatorApplicationCertificates RC
  constructive_execution_trace : YMConstructiveChosenSiteExecutionTrace RC
  constructive_primitive_constructions : YMConstructivePrimitiveConstructions RC
  constructive_finite_cap_stage : YMConstructiveFiniteCapConstructionStage RC
  constructive_bounded_state_stage : YMConstructiveBoundedStateConstructionStage RC
  constructive_inductive_union_stage : YMConstructiveInductiveUnionConstructionStage RC
  constructive_sharp_local_stage : YMConstructiveSharpLocalConstructionStage RC
  constructive_law_atoms : YMConstructiveChosenSiteLawAtoms RC
  constructive_proof_homes : YMConstructiveNativeProofHomes RC
  vacuum_gap_operator_primitives : YMVacuumGapOperatorPrimitives RD
  vacuum_gap_operator_certificates : YMVacuumGapOperatorApplicationCertificates RD
  vacuum_gap_execution_trace : YMVacuumGapChosenSiteExecutionTrace RD
  vacuum_gap_primitive_constructions : YMVacuumGapPrimitiveConstructions RD
  vacuum_gap_transport_stage : YMVacuumGapTransportConstructionStage RD
  vacuum_gap_os_sector_stage : YMVacuumGapOSSectorConstructionStage RD
  vacuum_gap_gap_evaluation_stage : YMVacuumGapGapEvaluationConstructionStage RD
  vacuum_gap_reconstruction_stage : YMVacuumGapReconstructionConstructionStage RD
  vacuum_gap_law_atoms : YMVacuumGapChosenSiteLawAtoms RD
  vacuum_gap_proof_homes : YMVacuumGapNativeProofHomes RD
  endpoint_operator_primitives : YMEndpointOperatorPrimitives RE
  endpoint_operator_certificates : YMEndpointOperatorApplicationCertificates RE
  endpoint_primitive_constructions : YMEndpointPrimitiveConstructions RE
  endpoint_reconstruction_carrier_stage : YMEndpointReconstructionCarrierConstructionStage RE
  endpoint_reconstruction_operations_stage : YMEndpointReconstructionOperationsConstructionStage RE
  endpoint_execution_trace : YMEndpointChosenSiteExecutionTrace RE
  endpoint_smearing_stage : YMEndpointSmearingConstructionStage RE
  endpoint_correlation_stage : YMEndpointCorrelationConstructionStage RE
  endpoint_law_atoms : YMEndpointChosenSiteLawAtoms RE
  endpoint_proof_homes : YMEndpointNativeProofHomes RE
  route1_endpoint_package : YMRoute1EndpointNativePackage S RC RD RE
  partC_statement : ym_paper_partC_statement RC
  partD_statement : ym_paper_partD_statement RD
  endpoint_statement : ym_paper_endpoint_statement RE

def YangMillsFullManuscriptNativePackageData
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
  (cwin : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window)
  (cbridge :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map)
  (cbase :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier)
  (cstate :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data)
  (cunion :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data)
  (hww : RD.weak_window_certificate_ready)
  (vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map)
  (vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family)
  (vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector)
  (vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family)
  (vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional)
  (vhgap :
    (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
      vgapf
      ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr))
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector)
  (etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space)
  (efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family) :
  YMFullManuscriptNativePackage S RC RD RE := by
  let A :=
    YangMillsFaithfulPaperTheoremAssemblyData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  let C :=
    YangMillsConstructiveNativeTheoremObjectsData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CO :=
    YangMillsConstructiveOperatorPrimitivesData
      RC htrunc hext hcompat hunion
  let CC :=
    YangMillsConstructiveOperatorApplicationCertificatesData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CT :=
    YangMillsConstructiveChosenSiteExecutionTraceData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CFC :=
    YangMillsConstructiveFiniteCapConstructionStageData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CBS :=
    YangMillsConstructiveBoundedStateConstructionStageData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CIU :=
    YangMillsConstructiveInductiveUnionConstructionStageData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CPC :=
    YangMillsConstructivePrimitiveConstructionsData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CSL :=
    YangMillsConstructiveSharpLocalConstructionStageData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CP :=
    YangMillsConstructiveNativeProofHomesData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let CA :=
    YangMillsConstructiveChosenSiteLawAtomsData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion
  let V :=
    YangMillsVacuumGapNativeProofHomesData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VO :=
    YangMillsVacuumGapOperatorPrimitivesData
      RD hww
  let VC :=
    YangMillsVacuumGapOperatorApplicationCertificatesData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VT :=
    YangMillsVacuumGapChosenSiteExecutionTraceData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VPC :=
    YangMillsVacuumGapPrimitiveConstructionsData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VTS :=
    YangMillsVacuumGapTransportConstructionStageData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VOS :=
    YangMillsVacuumGapOSSectorConstructionStageData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VGE :=
    YangMillsVacuumGapGapEvaluationConstructionStageData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VRS :=
    YangMillsVacuumGapReconstructionConstructionStageData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let VA :=
    YangMillsVacuumGapChosenSiteLawAtomsData
      RD hww vtm vobs vrsec vcorr vgapf vhgap
  let EO :=
    YangMillsEndpointOperatorPrimitivesData
      RE hE hP
  let EPC :=
    YangMillsEndpointPrimitiveConstructionsData
      RE hE hP evac etest efield
  let ERC :=
    YangMillsEndpointReconstructionCarrierConstructionStageData
      RE hE hP
  let ERO :=
    YangMillsEndpointReconstructionOperationsConstructionStageData
      RE hE hP
  let EC :=
    YangMillsEndpointOperatorApplicationCertificatesData
      RE hE hP evac etest efield
  let ET :=
    YangMillsEndpointChosenSiteExecutionTraceData
      RE hE hP evac etest efield
  let ES :=
    YangMillsEndpointSmearingConstructionStageData
      RE hE hP evac etest efield
  let ECR :=
    YangMillsEndpointCorrelationConstructionStageData
      RE hE hP evac etest efield
  let EA :=
    YangMillsEndpointChosenSiteLawAtomsData
      RE hE hP evac etest efield
  let E :=
    YangMillsEndpointNativeProofHomesData
      RE hE hP evac etest efield
  let R1 :=
    YangMillsRoute1EndpointNativePackageData
      S RC RD RE
      hp1 hp2 hAroute
      htrunc hext hcompat hunion
      cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  let VTO :=
    R1.route1_endpoint_bridge.vacuum_gap_bridge.compatibility.chain.native_objects
  let ETO :=
    R1.route1_endpoint_bridge.endpoint_objects
  exact
    { faithful_assembly := A
      constructive_objects := C
      vacuum_gap_objects := VTO
      endpoint_objects := ETO
      constructive_operator_primitives := CO
      constructive_operator_certificates := CC
      constructive_execution_trace := CT
      constructive_primitive_constructions := CPC
      constructive_finite_cap_stage := CFC
      constructive_bounded_state_stage := CBS
      constructive_inductive_union_stage := CIU
      constructive_sharp_local_stage := CSL
      constructive_law_atoms := CA
      constructive_proof_homes := CP
      vacuum_gap_operator_primitives := VO
      vacuum_gap_operator_certificates := VC
      vacuum_gap_execution_trace := VT
      vacuum_gap_primitive_constructions := VPC
      vacuum_gap_transport_stage := VTS
      vacuum_gap_os_sector_stage := VOS
      vacuum_gap_gap_evaluation_stage := VGE
      vacuum_gap_reconstruction_stage := VRS
      vacuum_gap_law_atoms := VA
      vacuum_gap_proof_homes := V
      endpoint_operator_primitives := EO
      endpoint_operator_certificates := EC
      endpoint_primitive_constructions := EPC
      endpoint_reconstruction_carrier_stage := ERC
      endpoint_reconstruction_operations_stage := ERO
      endpoint_execution_trace := ET
      endpoint_smearing_stage := ES
      endpoint_correlation_stage := ECR
      endpoint_law_atoms := EA
      endpoint_proof_homes := E
      route1_endpoint_package := R1
      partC_statement := A.partC_statement_witness
      partD_statement := A.partD_statement_witness
      endpoint_statement := A.endpoint_statement_witness }

theorem YangMillsFullManuscriptNativePackageExportStatement
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
  (cwin : (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).finite_cap_window)
  (cbridge :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).positive_bridge_map)
  (cbase :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_base_carrier)
  (cstate :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).bounded_state_data)
  (cunion :
    (YangMillsConstructiveSemanticBundleData RC htrunc hext hcompat hunion).inductive_union_data)
  (hww : RD.weak_window_certificate_ready)
  (vtm : (YangMillsVacuumGapSemanticBundleData RD hww).transport_map)
  (vobs : (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family)
  (vrsec : (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector)
  (vcorr : (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family)
  (vgapf : (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional)
  (vhgap :
    (YangMillsVacuumGapSemanticBundleData RD hww).evaluate_minkowski_gap
      vgapf
      ((YangMillsVacuumGapSemanticBundleData RD hww).realize_os_sector vrsec vcorr))
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready)
  (evac : (YangMillsEndpointSemanticBundleData RE hE hP).vacuum_vector)
  (etest : (YangMillsEndpointSemanticBundleData RE hE hP).test_function_space)
  (efield : (YangMillsEndpointSemanticBundleData RE hE hP).field_family) :
  Nonempty (YMFullManuscriptNativePackage S RC RD RE) /\
  S.theorem_parts.partA_public_scope /\
  ym_paper_partC_statement RC /\
  ym_paper_partD_statement RD /\
  ym_paper_endpoint_statement RE /\
  ym_source_labels .finiteCapSharpLocalExtension = ["5.74A", "5.74", "5.75"] /\
  ym_source_labels .passageToFullSharpLocalInductiveUnion = ["5.76"] /\
  ym_source_labels
      .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace = ["5.77"] /\
  ym_source_labels .minkowskiHamiltonianInheritsGap = ["M.5"] /\
  ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
  ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
  ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
  ym_constructive_witness_source_labels .boundedBaseExtensionWitness = ["5.76"] /\
  ym_vacuum_gap_witness_source_labels .transportOriginWitness = ["M.5"] /\
  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
  Nonempty (YMConstructiveNativeTheoremObjects RC) /\
  Nonempty (YMVacuumGapNativeTheoremObjects RD) /\
  Nonempty (YMEndpointNativeTheoremObjects RE) /\
  Nonempty (YMConstructiveOperatorPrimitives RC) /\
  Nonempty (YMConstructiveOperatorApplicationCertificates RC) /\
  Nonempty (YMConstructiveChosenSiteExecutionTrace RC) /\
  Nonempty (YMConstructivePrimitiveConstructions RC) /\
  Nonempty (YMConstructiveFiniteCapConstructionStage RC) /\
  Nonempty (YMConstructiveBoundedStateConstructionStage RC) /\
  Nonempty (YMConstructiveInductiveUnionConstructionStage RC) /\
  Nonempty (YMConstructiveSharpLocalConstructionStage RC) /\
  Nonempty (YMConstructiveChosenSiteLawAtoms RC) /\
  Nonempty (YMConstructiveNativeProofHomes RC) /\
  Nonempty (YMVacuumGapOperatorPrimitives RD) /\
  Nonempty (YMVacuumGapOperatorApplicationCertificates RD) /\
  Nonempty (YMVacuumGapChosenSiteExecutionTrace RD) /\
  Nonempty (YMVacuumGapPrimitiveConstructions RD) /\
  Nonempty (YMVacuumGapTransportConstructionStage RD) /\
  Nonempty (YMVacuumGapOSSectorConstructionStage RD) /\
  Nonempty (YMVacuumGapGapEvaluationConstructionStage RD) /\
  Nonempty (YMVacuumGapReconstructionConstructionStage RD) /\
  Nonempty (YMVacuumGapChosenSiteLawAtoms RD) /\
  Nonempty (YMVacuumGapNativeProofHomes RD) /\
  Nonempty (YMEndpointOperatorPrimitives RE) /\
  Nonempty (YMEndpointOperatorApplicationCertificates RE) /\
  Nonempty (YMEndpointPrimitiveConstructions RE) /\
  Nonempty (YMEndpointReconstructionCarrierConstructionStage RE) /\
  Nonempty (YMEndpointReconstructionOperationsConstructionStage RE) /\
  Nonempty (YMEndpointChosenSiteExecutionTrace RE) /\
  Nonempty (YMEndpointSmearingConstructionStage RE) /\
  Nonempty (YMEndpointCorrelationConstructionStage RE) /\
  Nonempty (YMEndpointChosenSiteLawAtoms RE) /\
  Nonempty (YMEndpointNativeProofHomes RE) /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  RC.finite_cap_package.truncation_window_ready /\
  RC.finite_cap_package.finite_cap_extension_ready /\
  RC.finite_cap_package.positive_bridge_ready /\
  RC.sharp_local_package.bounded_state_compatibility_ready /\
  RC.sharp_local_package.inductive_union_ready /\
  RD.continuum_gap_transport_ready /\
  RD.transport_package.os_transport_ready /\
  RD.transport_package.positive_gap_exhibited /\
  RD.transport_package.lattice_gap_input /\
  RD.reconstruction_ready /\
  RD.reconstruction_package.os_sector_ready /\
  RD.reconstruction_package.minkowski_gap_ready /\
  RD.reconstruction_package.obtained_from_transport /\
  RE.reconstruction_ready /\
  RE.reconstruction_package.wightman_fields_present /\
  RE.reconstruction_package.vacuum_vector_present /\
  RE.reconstruction_package.smearing_defined /\
  RE.reconstruction_package.vacuum_correlations_defined /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).source_dossier =
    RE.reconstruction_package.from_dossier) /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).constructed_reconstructed_hilbert =
    RE.reconstruction_package.reconstructed_hilbert) /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).constructed_field_family =
    RE.reconstruction_package.field_family) /\
  ((YangMillsEndpointReconstructionCarrierConstructionStageData RE hE hP).constructed_vacuum_vector =
    RE.reconstruction_package.vacuum_vector) /\
  ((YangMillsEndpointReconstructionOperationsConstructionStageData RE hE hP).constructed_test_function_space =
    RE.reconstruction_package.test_function_space) /\
  ((YangMillsEndpointReconstructionOperationsConstructionStageData RE hE hP).constructed_smeared_field_operator =
    RE.reconstruction_package.smeared_field_operator) /\
  ((YangMillsEndpointReconstructionOperationsConstructionStageData RE hE hP).constructed_vacuum_correlation_family =
    RE.reconstruction_package.vacuum_correlation_family) /\
  RE.reconstruction_package.smearing_defined /\
  RE.reconstruction_package.vacuum_correlations_defined /\
  ((YangMillsConstructiveOperatorPrimitivesData RC htrunc hext hcompat hunion).extend_operator
      (YangMillsConstructiveRelationalInterfaceData
        RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_window
      (YangMillsConstructiveRelationalInterfaceData
        RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_bridge_map =
    (YangMillsConstructiveRelationalInterfaceData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_extension_data) /\
  ((YangMillsConstructiveRelationalInterfaceData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).bundle.extend_finite_cap
      (YangMillsConstructiveRelationalInterfaceData
        RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_window
      (YangMillsConstructiveRelationalInterfaceData
        RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_bridge_map =
    (YangMillsConstructiveRelationalInterfaceData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_extension_data) /\
  ((YangMillsConstructiveBoundedStateConstructionStageData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).trace.certificates.law_atoms.interface.bundle.assemble_sharp_local_state
      (YangMillsConstructiveBoundedStateConstructionStageData
        RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_bounded_base
      (YangMillsConstructiveBoundedStateConstructionStageData
        RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_bounded_state
      (YangMillsConstructiveBoundedStateConstructionStageData
        RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).chosen_inductive_union =
    (YangMillsConstructiveBoundedStateConstructionStageData
      RC htrunc hext hcompat hunion cwin cbridge cbase cstate cunion).constructed_sharp_local_state) /\
  RC.sharp_local_package.inductive_union_ready /\
  RC.sharp_local_package.sharp_local_state.extends_bounded_base /\
  ((YangMillsVacuumGapOperatorPrimitivesData RD hww).transport_operator
      (YangMillsVacuumGapRelationalInterfaceData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_transport_map
      (YangMillsVacuumGapRelationalInterfaceData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_observable =
    (YangMillsVacuumGapRelationalInterfaceData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_transport_state) /\
  ((YangMillsVacuumGapRelationalInterfaceData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).bundle.transport_observable
      (YangMillsVacuumGapRelationalInterfaceData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_transport_map
      (YangMillsVacuumGapRelationalInterfaceData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_observable =
    (YangMillsVacuumGapRelationalInterfaceData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_transport_state) /\
  ((YangMillsVacuumGapPrimitiveConstructionsData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).trace.certificates.law_atoms.interface.bundle.realize_os_sector
      (YangMillsVacuumGapPrimitiveConstructionsData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).trace.chosen_reconstructed_sector
      (YangMillsVacuumGapPrimitiveConstructionsData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).trace.chosen_correlation_family =
    (YangMillsVacuumGapPrimitiveConstructionsData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).constructed_os_sector) /\
  ((YangMillsVacuumGapOSSectorConstructionStageData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).constructions.trace.certificates.law_atoms.interface.bundle.realize_os_sector
      (YangMillsVacuumGapOSSectorConstructionStageData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_reconstructed_sector
      (YangMillsVacuumGapOSSectorConstructionStageData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_correlation_family =
    (YangMillsVacuumGapOSSectorConstructionStageData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).constructed_os_sector) /\
  ((YangMillsVacuumGapPrimitiveConstructionsData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
      (YangMillsVacuumGapPrimitiveConstructionsData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).trace.chosen_gap_functional
      (YangMillsVacuumGapPrimitiveConstructionsData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).constructed_os_sector) /\
  ((YangMillsVacuumGapGapEvaluationConstructionStageData
      RD hww vtm vobs vrsec vcorr vgapf vhgap).os_sector_stage.constructions.trace.certificates.law_atoms.interface.bundle.evaluate_minkowski_gap
      (YangMillsVacuumGapGapEvaluationConstructionStageData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).chosen_gap_functional
      (YangMillsVacuumGapGapEvaluationConstructionStageData
        RD hww vtm vobs vrsec vcorr vgapf vhgap).constructed_os_sector) /\
  ((YangMillsEndpointOperatorPrimitivesData RE hE hP).correlate_operator
      (YangMillsEndpointRelationalInterfaceData
        RE hE hP evac etest efield).chosen_vacuum_vector
      (YangMillsEndpointRelationalInterfaceData
        RE hE hP evac etest efield).chosen_smeared_operator =
    (YangMillsEndpointRelationalInterfaceData
      RE hE hP evac etest efield).chosen_vacuum_correlation) /\
  ((YangMillsEndpointRelationalInterfaceData
      RE hE hP evac etest efield).bundle.smear_field
      (YangMillsEndpointRelationalInterfaceData
        RE hE hP evac etest efield).chosen_test_function
      (YangMillsEndpointRelationalInterfaceData
        RE hE hP evac etest efield).chosen_field =
    (YangMillsEndpointRelationalInterfaceData
      RE hE hP evac etest efield).chosen_smeared_operator) /\
  ((YangMillsEndpointSmearingConstructionStageData
      RE hE hP evac etest efield).trace.certificates.law_atoms.interface.bundle.smear_field
      (YangMillsEndpointSmearingConstructionStageData
        RE hE hP evac etest efield).chosen_test_function
      (YangMillsEndpointSmearingConstructionStageData
        RE hE hP evac etest efield).chosen_field =
    (YangMillsEndpointSmearingConstructionStageData
      RE hE hP evac etest efield).constructed_smeared_operator) /\
  ((YangMillsEndpointCorrelationConstructionStageData
      RE hE hP evac etest efield).smearing_stage.trace.certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
      (YangMillsEndpointCorrelationConstructionStageData
        RE hE hP evac etest efield).chosen_vacuum_vector
      (YangMillsEndpointCorrelationConstructionStageData
        RE hE hP evac etest efield).chosen_smeared_operator =
    (YangMillsEndpointCorrelationConstructionStageData
      RE hE hP evac etest efield).constructed_vacuum_correlation) /\
  RE.endpoint_object.exact_local_net_endpoint := by
  let P :=
    YangMillsFullManuscriptNativePackageData
      S RC RD RE
      hp1 hp2 hAroute
      htrunc hext hcompat hunion
      cwin cbridge cbase cstate cunion
      hww vtm vobs vrsec vcorr vgapf vhgap
      hE hP evac etest efield
  let B := P.route1_endpoint_package.route1_endpoint_bridge
  let N := B.vacuum_gap_bridge.compatibility.chain.native_objects
  have hM5 : RD.reconstruction_package.minkowski_gap_ready :=
    N.reconstruction_transfer_object.minkowski_gap_ready
  have hTransport : RD.continuum_gap_transport_ready :=
    P.vacuum_gap_proof_homes.transport_home.continuum_gap_transport_certificate
  have hTruncWindow : RC.finite_cap_package.truncation_window_ready :=
    P.constructive_proof_homes.finite_cap_home.truncation_window_certificate
  have hFiniteExt : RC.finite_cap_package.finite_cap_extension_ready :=
    P.constructive_proof_homes.finite_cap_home.finite_cap_extension_certificate
  have hPositiveBridge : RC.finite_cap_package.positive_bridge_ready :=
    P.constructive_proof_homes.finite_cap_home.positive_bridge_certificate
  have hBoundedCompat : RC.sharp_local_package.bounded_state_compatibility_ready :=
    P.constructive_proof_homes.sharp_local_home.bounded_state_compatibility_certificate
  have hInductiveUnion : RC.sharp_local_package.inductive_union_ready :=
    P.constructive_proof_homes.sharp_local_home.inductive_union_certificate
  have hOSTransport : RD.transport_package.os_transport_ready :=
    P.vacuum_gap_proof_homes.transport_home.os_transport_certificate
  have hPositiveGap : RD.transport_package.positive_gap_exhibited :=
    P.vacuum_gap_proof_homes.transport_home.positive_gap_certificate
  have hLatticeInput : RD.transport_package.lattice_gap_input :=
    P.vacuum_gap_proof_homes.transport_home.lattice_gap_input_certificate
  have hReconReady : RD.reconstruction_ready :=
    P.vacuum_gap_proof_homes.reconstruction_home.reconstruction_ready_certificate
  have hSectorReady : RD.reconstruction_package.os_sector_ready :=
    P.vacuum_gap_proof_homes.reconstruction_home.os_sector_ready_certificate
  have hOrigin : RD.reconstruction_package.obtained_from_transport :=
    P.vacuum_gap_proof_homes.reconstruction_home.transport_origin_certificate
  have hEndpointRecon : RE.reconstruction_ready :=
    P.endpoint_proof_homes.reconstruction_home.reconstruction_ready_certificate
  have hEndpointFields : RE.reconstruction_package.wightman_fields_present :=
    P.endpoint_proof_homes.reconstruction_home.wightman_fields_certificate
  have hEndpointVacuum : RE.reconstruction_package.vacuum_vector_present :=
    P.endpoint_proof_homes.reconstruction_home.vacuum_vector_certificate
  have hEndpointSmearing : RE.reconstruction_package.smearing_defined :=
    P.endpoint_proof_homes.reconstruction_home.smearing_certificate
  have hEndpointCorr : RE.reconstruction_package.vacuum_correlations_defined :=
    P.endpoint_proof_homes.reconstruction_home.vacuum_correlations_certificate
  have hConAtom : Nonempty (YMConstructiveChosenSiteLawAtoms RC) :=
    Nonempty.intro P.constructive_law_atoms
  have hConOp : Nonempty (YMConstructiveOperatorPrimitives RC) :=
    Nonempty.intro P.constructive_operator_primitives
  have hConObjs : Nonempty (YMConstructiveNativeTheoremObjects RC) :=
    Nonempty.intro P.constructive_objects
  have hConCert : Nonempty (YMConstructiveOperatorApplicationCertificates RC) :=
    Nonempty.intro P.constructive_operator_certificates
  have hConTrace : Nonempty (YMConstructiveChosenSiteExecutionTrace RC) :=
    Nonempty.intro P.constructive_execution_trace
  have hConPrim : Nonempty (YMConstructivePrimitiveConstructions RC) :=
    Nonempty.intro P.constructive_primitive_constructions
  have hConFiniteCap : Nonempty (YMConstructiveFiniteCapConstructionStage RC) :=
    Nonempty.intro P.constructive_finite_cap_stage
  have hConBoundedState : Nonempty (YMConstructiveBoundedStateConstructionStage RC) :=
    Nonempty.intro P.constructive_bounded_state_stage
  have hConInductiveUnion : Nonempty (YMConstructiveInductiveUnionConstructionStage RC) :=
    Nonempty.intro P.constructive_inductive_union_stage
  have hConSharpLocal : Nonempty (YMConstructiveSharpLocalConstructionStage RC) :=
    Nonempty.intro P.constructive_sharp_local_stage
  have hVacOp : Nonempty (YMVacuumGapOperatorPrimitives RD) :=
    Nonempty.intro P.vacuum_gap_operator_primitives
  have hVacObjs : Nonempty (YMVacuumGapNativeTheoremObjects RD) :=
    Nonempty.intro P.vacuum_gap_objects
  have hVacCert : Nonempty (YMVacuumGapOperatorApplicationCertificates RD) :=
    Nonempty.intro P.vacuum_gap_operator_certificates
  have hVacTrace : Nonempty (YMVacuumGapChosenSiteExecutionTrace RD) :=
    Nonempty.intro P.vacuum_gap_execution_trace
  have hVacPrimitive : Nonempty (YMVacuumGapPrimitiveConstructions RD) :=
    Nonempty.intro P.vacuum_gap_primitive_constructions
  have hVacTransportStage : Nonempty (YMVacuumGapTransportConstructionStage RD) :=
    Nonempty.intro P.vacuum_gap_transport_stage
  have hVacOSStage : Nonempty (YMVacuumGapOSSectorConstructionStage RD) :=
    Nonempty.intro P.vacuum_gap_os_sector_stage
  have hVacGapEvalStage : Nonempty (YMVacuumGapGapEvaluationConstructionStage RD) :=
    Nonempty.intro P.vacuum_gap_gap_evaluation_stage
  have hVacReconStage : Nonempty (YMVacuumGapReconstructionConstructionStage RD) :=
    Nonempty.intro P.vacuum_gap_reconstruction_stage
  have hVacAtom : Nonempty (YMVacuumGapChosenSiteLawAtoms RD) :=
    Nonempty.intro P.vacuum_gap_law_atoms
  have hEndOp : Nonempty (YMEndpointOperatorPrimitives RE) :=
    Nonempty.intro P.endpoint_operator_primitives
  have hEndObjs : Nonempty (YMEndpointNativeTheoremObjects RE) :=
    Nonempty.intro P.endpoint_objects
  have hEndCert : Nonempty (YMEndpointOperatorApplicationCertificates RE) :=
    Nonempty.intro P.endpoint_operator_certificates
  have hEndPrim : Nonempty (YMEndpointPrimitiveConstructions RE) :=
    Nonempty.intro P.endpoint_primitive_constructions
  have hEndReconCarrier : Nonempty (YMEndpointReconstructionCarrierConstructionStage RE) :=
    Nonempty.intro P.endpoint_reconstruction_carrier_stage
  have hEndReconOps : Nonempty (YMEndpointReconstructionOperationsConstructionStage RE) :=
    Nonempty.intro P.endpoint_reconstruction_operations_stage
  have hEndTrace : Nonempty (YMEndpointChosenSiteExecutionTrace RE) :=
    Nonempty.intro P.endpoint_execution_trace
  have hEndSmearStage : Nonempty (YMEndpointSmearingConstructionStage RE) :=
    Nonempty.intro P.endpoint_smearing_stage
  have hEndCorrStage : Nonempty (YMEndpointCorrelationConstructionStage RE) :=
    Nonempty.intro P.endpoint_correlation_stage
  have hEndAtom : Nonempty (YMEndpointChosenSiteLawAtoms RE) :=
    Nonempty.intro P.endpoint_law_atoms
  have hO5 : RE.endpoint_object.exact_local_net_endpoint :=
    B.endpoint_objects.chosen_site_object.exact_endpoint_witness
  exact
    And.intro (Nonempty.intro P) <|
      And.intro P.faithful_assembly.public_scope_witness <|
        And.intro P.partC_statement <|
          And.intro P.partD_statement <|
            And.intro P.endpoint_statement <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl <|
                    And.intro rfl <|
                    And.intro rfl <|
                      And.intro rfl <|
                        And.intro rfl <|
                          And.intro rfl <|
                              And.intro rfl <|
                                And.intro rfl <|
                                  And.intro
                                    hConObjs <|
                                    And.intro
                                    hVacObjs <|
                                    And.intro
                                    hEndObjs <|
                                    And.intro
                                    hConOp <|
                                    And.intro
                                    hConCert <|
                                    And.intro
                                    hConTrace <|
                                    And.intro
                                    hConPrim <|
                                    And.intro
                                    hConFiniteCap <|
                                    And.intro
                                    hConBoundedState <|
                                    And.intro
                                    hConInductiveUnion <|
                                    And.intro
                                    hConSharpLocal <|
                                    And.intro
                                  hConAtom <|
                                  And.intro
                                  (Nonempty.intro P.constructive_proof_homes) <|
                                  And.intro
                                    hVacOp <|
                                    And.intro
                                    hVacCert <|
                                    And.intro
                                    hVacTrace <|
                                    And.intro
                                    hVacPrimitive <|
                                    And.intro
                                    hVacTransportStage <|
                                    And.intro
                                    hVacOSStage <|
                                    And.intro
                                    hVacGapEvalStage <|
                                    And.intro
                                    hVacReconStage <|
                                    And.intro
                                    hVacAtom <|
                                    And.intro
                                    (Nonempty.intro P.vacuum_gap_proof_homes) <|
                                    And.intro
                                      hEndOp <|
                                      And.intro
                                      hEndCert <|
                                      And.intro
                                      hEndPrim <|
                                      And.intro
                                      hEndReconCarrier <|
                                      And.intro
                                      hEndReconOps <|
                                      And.intro
                                      hEndTrace <|
                                      And.intro
                                      hEndSmearStage <|
                                      And.intro
                                      hEndCorrStage <|
                                      And.intro
                                      hEndAtom <|
                                      And.intro
                                      (Nonempty.intro P.endpoint_proof_homes) <|
                                      And.intro
                                      P.constructive_objects.chosen_site_object.bounded_base_witness <|
                                        And.intro hTruncWindow <|
                                          And.intro hFiniteExt <|
                                            And.intro hPositiveBridge <|
                                              And.intro hBoundedCompat <|
                                                And.intro hInductiveUnion <|
                                                  And.intro hTransport <|
                                                    And.intro hOSTransport <|
                                                      And.intro hPositiveGap <|
                                                        And.intro hLatticeInput <|
                                                          And.intro hReconReady <|
                                                            And.intro hSectorReady <|
                                                              And.intro hM5 <|
                                                                And.intro hOrigin <|
                                                                  And.intro hEndpointRecon <|
                                                                    And.intro hEndpointFields <|
                                                                  And.intro hEndpointVacuum <|
                                                                    And.intro hEndpointSmearing <|
                                                                      And.intro hEndpointCorr <|
                                                                        And.intro
                                                                          P.endpoint_reconstruction_carrier_stage.dossier_origin <|
                                                                          And.intro
                                                                            P.endpoint_reconstruction_carrier_stage.hilbert_construction <|
                                                                            And.intro
                                                                              P.endpoint_reconstruction_carrier_stage.field_construction <|
                                                                              And.intro
                                                                                P.endpoint_reconstruction_carrier_stage.vacuum_construction <|
                                                                                And.intro
                                                                                  P.endpoint_reconstruction_operations_stage.test_function_construction <|
                                                                                  And.intro
                                                                                    P.endpoint_reconstruction_operations_stage.smeared_operator_construction <|
                                                                                    And.intro
                                                                                      P.endpoint_reconstruction_operations_stage.correlation_family_construction <|
                                                                                      And.intro
                                                                                        P.endpoint_reconstruction_operations_stage.smearing_defined_certificate <|
                                                                                        And.intro
                                                                                          P.endpoint_reconstruction_operations_stage.vacuum_correlations_defined_certificate <|
                                                                            And.intro
                                                                              P.constructive_operator_certificates.extension_application <|
                                                                              And.intro
                                                                              P.constructive_law_atoms.extension_relation <|
                                                                              And.intro
                                                                                P.constructive_bounded_state_stage.bounded_state_assembly <|
                                                                                And.intro
                                                                                P.constructive_inductive_union_stage.inductive_union_ready_certificate <|
                                                                                And.intro
                                                                                P.constructive_inductive_union_stage.sharp_local_extension_witness <|
                                                                                And.intro
                                                                                P.vacuum_gap_operator_certificates.transport_application <|
                                                                                And.intro
                                                                                P.vacuum_gap_law_atoms.transport_relation <|
                                                                                And.intro
                                                                                  P.vacuum_gap_primitive_constructions.os_sector_construction <|
                                                                                  And.intro
                                                                                  P.vacuum_gap_os_sector_stage.os_sector_construction <|
                                                                                  And.intro
                                                                                  P.vacuum_gap_primitive_constructions.gap_evaluation_construction <|
                                                                                  And.intro
                                                                                  P.vacuum_gap_gap_evaluation_stage.gap_evaluation_construction <|
                                                                                  And.intro
                                                                                  P.endpoint_operator_certificates.correlation_application <|
                                                                                  And.intro
                                                                                    P.endpoint_law_atoms.smearing_relation <|
                                                                                    And.intro
                                                                                      P.endpoint_smearing_stage.smearing_construction <|
                                                                                      And.intro
                                                                                        P.endpoint_correlation_stage.correlation_construction
                                                                                        hO5

end MaleyLean
