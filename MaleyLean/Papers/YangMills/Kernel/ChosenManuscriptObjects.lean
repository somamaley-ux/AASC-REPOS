import MaleyLean.Papers.YangMills.Kernel.FormalizedManuscriptReflection
import MaleyLean.Papers.YangMills.Kernel.ConstructiveSemanticBundle
import MaleyLean.Papers.YangMills.Kernel.VacuumGapSemanticBundle
import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticBundle

namespace MaleyLean

/--
Chosen constructive object carried by the current formalized manuscript.
-/
structure YMChosenConstructiveObject (M : YMFormalizedManuscript) where
  route : YMConstructiveRoute
  semantic_bundle : YMConstructiveSemanticBundle route
  route_eq : route = M.RC

/--
Chosen vacuum-gap object carried by the current formalized manuscript.
-/
structure YMChosenVacuumGapObject (M : YMFormalizedManuscript) where
  route : YMVacuumGapRoute
  semantic_bundle : YMVacuumGapSemanticBundle route
  route_eq : route = M.RD

/--
Chosen endpoint object carried by the current formalized manuscript.
-/
structure YMChosenEndpointObject (M : YMFormalizedManuscript) where
  route : YMEndpointCore
  semantic_bundle : YMEndpointSemanticBundle route
  route_eq : route = M.RE

/--
Chosen spine object carried by the current formalized manuscript.
-/
structure YMChosenSpineObject (M : YMFormalizedManuscript) where
  spine : YMLoadBearingSpine
  theorem_parts : YMMainTheoremParts
  packet6 : YMPacket6Interface
  packet8 : YMPacket8Interface
  packet9 : YMPacket9Interface
  partC_route : YMPartCRouteInterface
  partD_route : YMPartDRouteInterface
  endpoint_route : YMEndpointRouteInterface
  spine_eq : spine = M.S
  theorem_parts_eq : theorem_parts = M.S.theorem_parts
  packet6_eq : packet6 = M.S.packet6_finite_cap_closure
  packet8_eq : packet8 = M.S.packet8_qe3_transport
  packet9_eq : packet9 = M.S.packet9_reconstruction
  partC_route_eq : partC_route = M.S.partC_route
  partD_route_eq : partD_route = M.S.partD_route
  endpoint_route_eq : endpoint_route = M.S.endpoint_route

/--
Explicit chosen-object reflection of the current formalized manuscript.

This packages the actual selected constructive, vacuum-gap, endpoint, and spine
objects already present in a `YMFormalizedManuscript` as first-class Lean
records.
-/
structure YMChosenManuscriptObjects (M : YMFormalizedManuscript) where
  spine_object : YMChosenSpineObject M
  constructive_object : YMChosenConstructiveObject M
  vacuum_gap_object : YMChosenVacuumGapObject M
  endpoint_object : YMChosenEndpointObject M

def YangMillsChosenConstructiveObjectData
  (M : YMFormalizedManuscript) :
  YMChosenConstructiveObject M := by
  exact
    { route := M.RC
      semantic_bundle :=
        YangMillsConstructiveSemanticBundleData
          M.RC M.htrunc M.hext M.hcompat M.hunion
      route_eq := rfl }

def YangMillsChosenVacuumGapObjectData
  (M : YMFormalizedManuscript) :
  YMChosenVacuumGapObject M := by
  exact
    { route := M.RD
      semantic_bundle :=
        YangMillsVacuumGapSemanticBundleData
          M.RD M.hww
      route_eq := rfl }

def YangMillsChosenEndpointObjectData
  (M : YMFormalizedManuscript) :
  YMChosenEndpointObject M := by
  have hR : M.RE.reconstruction_ready :=
    YangMillsEndpointDossierFeedsReconstructionStatement M.RE M.hE
  exact
    { route := M.RE
      semantic_bundle :=
        YangMillsEndpointSemanticBundleData
          M.RE M.hE M.hP
      route_eq := rfl }

def YangMillsChosenSpineObjectData
  (M : YMFormalizedManuscript) :
  YMChosenSpineObject M := by
  exact
    { spine := M.S
      theorem_parts := M.S.theorem_parts
      packet6 := M.S.packet6_finite_cap_closure
      packet8 := M.S.packet8_qe3_transport
      packet9 := M.S.packet9_reconstruction
      partC_route := M.S.partC_route
      partD_route := M.S.partD_route
      endpoint_route := M.S.endpoint_route
      spine_eq := rfl
      theorem_parts_eq := rfl
      packet6_eq := rfl
      packet8_eq := rfl
      packet9_eq := rfl
      partC_route_eq := rfl
      partD_route_eq := rfl
      endpoint_route_eq := rfl }

def YangMillsChosenManuscriptObjectsData
  (M : YMFormalizedManuscript) :
  YMChosenManuscriptObjects M := by
  exact
    { spine_object := YangMillsChosenSpineObjectData M
      constructive_object := YangMillsChosenConstructiveObjectData M
      vacuum_gap_object := YangMillsChosenVacuumGapObjectData M
      endpoint_object := YangMillsChosenEndpointObjectData M }

theorem YangMillsChosenManuscriptObjectsExportStatement
  (M : YMFormalizedManuscript) :
  Nonempty (YMChosenManuscriptObjects M) /\
  Nonempty (YMChosenSpineObject M) /\
  Nonempty (YMChosenConstructiveObject M) /\
  Nonempty (YMChosenVacuumGapObject M) /\
  Nonempty (YMChosenEndpointObject M) := by
  let A := YangMillsChosenManuscriptObjectsData M
  exact
    And.intro ⟨A⟩ <|
      And.intro ⟨A.spine_object⟩ <|
        And.intro ⟨A.constructive_object⟩ <|
          And.intro ⟨A.vacuum_gap_object⟩ ⟨A.endpoint_object⟩

end MaleyLean
