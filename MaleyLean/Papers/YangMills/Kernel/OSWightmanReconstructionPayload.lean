namespace MaleyLean
namespace Papers
namespace YangMills

/-- Osterwalder-Schrader reconstruction payload. -/
structure YMOSReconstructionPayload where
  EuclideanDossier : Type
  HilbertSpace : Type
  os_axioms_verified : Prop
  os_axioms_verified_holds : os_axioms_verified
  reconstruction_ready : Prop
  reconstruction_ready_holds : reconstruction_ready

def YMOSReconstructionPayload.closed
    (P : YMOSReconstructionPayload) :
    Prop :=
  P.os_axioms_verified /\ P.reconstruction_ready

theorem YMOSReconstructionPayload.closed_holds
    (P : YMOSReconstructionPayload) :
    P.closed := by
  exact And.intro
    P.os_axioms_verified_holds
    P.reconstruction_ready_holds

/-- Wightman-field payload obtained from reconstructed OS data. -/
structure YMWightmanFieldPayload where
  HilbertSpace : Type
  VacuumVector : Type
  WightmanField : Type
  TestFunction : Type
  SmearedField : Type
  VacuumCorrelation : Type
  vacuum_vector_present : Prop
  vacuum_vector_present_holds : vacuum_vector_present
  wightman_fields_present : Prop
  wightman_fields_present_holds : wightman_fields_present
  smearing_defined : Prop
  smearing_defined_holds : smearing_defined
  vacuum_correlations_defined : Prop
  vacuum_correlations_defined_holds : vacuum_correlations_defined

def YMWightmanFieldPayload.closed
    (P : YMWightmanFieldPayload) :
    Prop :=
  P.vacuum_vector_present /\
    P.wightman_fields_present /\
    P.smearing_defined /\
    P.vacuum_correlations_defined

theorem YMWightmanFieldPayload.closed_holds
    (P : YMWightmanFieldPayload) :
    P.closed := by
  exact
    And.intro
      P.vacuum_vector_present_holds
      (And.intro
        P.wightman_fields_present_holds
        (And.intro
          P.smearing_defined_holds
          P.vacuum_correlations_defined_holds))

/-- Full OS/Wightman reconstruction payload. -/
structure YMOSWightmanReconstructionPayload where
  os_reconstruction : YMOSReconstructionPayload
  wightman_fields : YMWightmanFieldPayload
  reconstruction_exhibits_wightman_fields :
    os_reconstruction.reconstruction_ready ->
      wightman_fields.wightman_fields_present
  reconstruction_exhibits_vacuum_vector :
    os_reconstruction.reconstruction_ready ->
      wightman_fields.vacuum_vector_present
  reconstruction_exhibits_smearing :
    os_reconstruction.reconstruction_ready ->
      wightman_fields.smearing_defined
  reconstruction_exhibits_vacuum_correlations :
    os_reconstruction.reconstruction_ready ->
      wightman_fields.vacuum_correlations_defined

namespace YMOSWightmanReconstructionPayload

theorem os_closed
    (P : YMOSWightmanReconstructionPayload) :
    P.os_reconstruction.closed := by
  exact P.os_reconstruction.closed_holds

theorem wightman_closed
    (P : YMOSWightmanReconstructionPayload) :
    P.wightman_fields.closed := by
  exact P.wightman_fields.closed_holds

theorem reconstruction_ready
    (P : YMOSWightmanReconstructionPayload) :
    P.os_reconstruction.reconstruction_ready := by
  exact P.os_reconstruction.reconstruction_ready_holds

theorem wightman_fields_present
    (P : YMOSWightmanReconstructionPayload) :
    P.wightman_fields.wightman_fields_present := by
  exact
    P.reconstruction_exhibits_wightman_fields
      P.os_reconstruction.reconstruction_ready_holds

theorem vacuum_vector_present
    (P : YMOSWightmanReconstructionPayload) :
    P.wightman_fields.vacuum_vector_present := by
  exact
    P.reconstruction_exhibits_vacuum_vector
      P.os_reconstruction.reconstruction_ready_holds

theorem smearing_defined
    (P : YMOSWightmanReconstructionPayload) :
    P.wightman_fields.smearing_defined := by
  exact
    P.reconstruction_exhibits_smearing
      P.os_reconstruction.reconstruction_ready_holds

theorem vacuum_correlations_defined
    (P : YMOSWightmanReconstructionPayload) :
    P.wightman_fields.vacuum_correlations_defined := by
  exact
    P.reconstruction_exhibits_vacuum_correlations
      P.os_reconstruction.reconstruction_ready_holds

theorem closed
    (P : YMOSWightmanReconstructionPayload) :
    P.os_reconstruction.reconstruction_ready /\
      P.wightman_fields.vacuum_vector_present /\
      P.wightman_fields.wightman_fields_present /\
      P.wightman_fields.smearing_defined /\
      P.wightman_fields.vacuum_correlations_defined := by
  exact
    And.intro
      P.reconstruction_ready
      (And.intro
        P.vacuum_vector_present
        (And.intro
          P.wightman_fields_present
          (And.intro
            P.smearing_defined
            P.vacuum_correlations_defined)))

end YMOSWightmanReconstructionPayload

end YangMills
end Papers
end MaleyLean
