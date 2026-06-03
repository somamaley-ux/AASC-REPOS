import MaleyLean.Papers.YangMills.Kernel.StandardSharpLocalBackground
import MaleyLean.Papers.YangMills.Kernel.ConstructiveSemanticDefinitions

namespace MaleyLean

/--
The current route-level sharp-local outputs are projections from the
constructive route once compatibility and inductive-union readiness are given.
-/
theorem YangMillsSharpLocalCurrentRoot
    (RC : YMConstructiveRoute)
    (hcompat : RC.bounded_state_compatibility_ready)
    (hunion : RC.inductive_union_ready) :
    RC.sharp_local_package.bounded_state_compatibility_ready /\
    RC.sharp_local_package.inductive_union_ready /\
    RC.sharp_local_package.sharp_local_state.extends_bounded_base := by
  exact YangMillsSharpLocalPackageStatement RC hcompat hunion

/--
The current carrier-level inductive-union shadow unfolds only to presence of
the selected assembled sharp-local state.
-/
theorem YangMillsSharpLocalInductiveUnionCarrierShadowUnfolds
    (B : YMConstructiveManuscriptCarrierBase) :
    YMConstructiveSharpLocalInductiveUnionReady B <->
      Exists fun s : YMSharpLocalState =>
        s =
          B.assemble_sharp_local_state
            B.bounded_base_one
            B.omega_bd
            B.omega_sharp := by
  rfl

#print axioms YangMillsSharpLocalCurrentRoot
#print axioms YangMillsSharpLocalInductiveUnionCarrierShadowUnfolds
#print axioms Papers.YangMills.YMSharpLocalConstructionPayload.closed
#print axioms YMSharpLocalConstructionPayloadBridge.closed
#print axioms YMStandardSharpLocalConstructionImport.payload_nonempty
#print axioms YMStandardSharpLocalConstructionImport.payload_bridge_nonempty
#print axioms YMStandardSharpLocalConstructionImport.standard_transfer_nonempty
#print axioms ymSharpLocalConstructionPayload_nonempty_of_standard_import
#print axioms ymSharpLocalConstructionPayloadBridge_nonempty_of_standard_import
#print axioms ymStandardSharpLocalConstructionTransfer_nonempty_of_standard_import
#print axioms YMSharpLocalHypothesisMap.completeTransferHypotheses
#print axioms YMRouteSharpLocalConstructionImport.dischargeSharpLocalOutputs
#print axioms YMRouteSharpLocalConstructionImport.fromHypothesisMap
#print axioms ym_constructive_sharp_local_state_present_holds
#print axioms ym_constructive_sharp_local_inductive_union_ready_holds

end MaleyLean
