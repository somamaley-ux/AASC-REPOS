namespace MaleyLean
namespace Papers
namespace YangMills

/--
Abstract endpoint sector-exclusion data.

`ExtendedSupportSector` represents possible endpoint sector data living beyond
the local-net endpoint.  The classification says every admissible such sector
is already vacuum/local-net sector data.
-/
structure YMEndpointSectorExclusion where
  LocalNetEndpoint : Type
  ExtendedSupportSector : Type
  VacuumSector : ExtendedSupportSector -> Prop
  AdmissibleExtendedSupport : ExtendedSupportSector -> Prop
  endpoint_exact : Prop
  endpoint_exact_holds : endpoint_exact
  vacuum_vector_present : Prop
  vacuum_vector_present_holds : vacuum_vector_present
  every_admissible_extended_support_is_vacuum :
    forall sector : ExtendedSupportSector,
      AdmissibleExtendedSupport sector -> VacuumSector sector

namespace YMEndpointSectorExclusion

theorem no_nonvacuum_admissible_extended_support
    (E : YMEndpointSectorExclusion) :
    forall sector : E.ExtendedSupportSector,
      E.AdmissibleExtendedSupport sector ->
        Not (Not (E.VacuumSector sector)) := by
  intro sector hadmissible hnonvac
  exact hnonvac (E.every_admissible_extended_support_is_vacuum sector hadmissible)

theorem exact_endpoint (E : YMEndpointSectorExclusion) :
    E.endpoint_exact := by
  exact E.endpoint_exact_holds

theorem vacuum_present (E : YMEndpointSectorExclusion) :
    E.vacuum_vector_present := by
  exact E.vacuum_vector_present_holds

end YMEndpointSectorExclusion

/--
The fully local-net endpoint exactness payload used by the A+ endpoint
obligation.

This packages exactness, vacuum presence, and the exclusion theorem as one
object before it is identified with the route-facing endpoint socket.
-/
structure YMEndpointExactnessPayload where
  sector_exclusion : YMEndpointSectorExclusion
  no_extended_support_sector_data : Prop
  no_extended_support_from_classification :
    (forall sector : sector_exclusion.ExtendedSupportSector,
      sector_exclusion.AdmissibleExtendedSupport sector ->
        sector_exclusion.VacuumSector sector) ->
      no_extended_support_sector_data

namespace YMEndpointExactnessPayload

theorem exact_local_net_endpoint
    (P : YMEndpointExactnessPayload) :
    P.sector_exclusion.endpoint_exact := by
  exact P.sector_exclusion.exact_endpoint

theorem vacuum_vector_present
    (P : YMEndpointExactnessPayload) :
    P.sector_exclusion.vacuum_vector_present := by
  exact P.sector_exclusion.vacuum_present

theorem no_extended_support
    (P : YMEndpointExactnessPayload) :
    P.no_extended_support_sector_data := by
  exact
    P.no_extended_support_from_classification
      P.sector_exclusion.every_admissible_extended_support_is_vacuum

theorem closed
    (P : YMEndpointExactnessPayload) :
    P.sector_exclusion.endpoint_exact /\
      P.sector_exclusion.vacuum_vector_present /\
      P.no_extended_support_sector_data := by
  exact
    And.intro
      P.exact_local_net_endpoint
      (And.intro P.vacuum_vector_present P.no_extended_support)

end YMEndpointExactnessPayload

end YangMills
end Papers
end MaleyLean
