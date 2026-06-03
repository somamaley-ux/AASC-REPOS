import MaleyLean.Papers.YangMills.Kernel.ClosedManuscriptBlueprint
import MaleyLean.Papers.YangMills.Kernel.ConstructiveExtendAssembleLawPackage
import MaleyLean.Papers.YangMills.Kernel.VacuumGapTransportRealizeLawPackage
import MaleyLean.Papers.YangMills.Kernel.EndpointCorrelationLawPackage

namespace MaleyLean

/--
Concrete chosen-site data needed to instantiate the constructive-side chosen
relational site and its law package.
-/
structure YMConstructiveChosenSiteData (B : YMClosedManuscriptBlueprint) where
  win :
    (YangMillsConstructiveSemanticBundleData
      B.objects.RC
      B.witnesses.htrunc
      B.witnesses.hext
      B.witnesses.hcompat
      B.witnesses.hunion).finite_cap_window
  bridge :
    (YangMillsConstructiveSemanticBundleData
      B.objects.RC
      B.witnesses.htrunc
      B.witnesses.hext
      B.witnesses.hcompat
      B.witnesses.hunion).positive_bridge_map
  base :
    (YangMillsConstructiveSemanticBundleData
      B.objects.RC
      B.witnesses.htrunc
      B.witnesses.hext
      B.witnesses.hcompat
      B.witnesses.hunion).bounded_base_carrier
  state :
    (YangMillsConstructiveSemanticBundleData
      B.objects.RC
      B.witnesses.htrunc
      B.witnesses.hext
      B.witnesses.hcompat
      B.witnesses.hunion).bounded_state_data
  unionData :
    (YangMillsConstructiveSemanticBundleData
      B.objects.RC
      B.witnesses.htrunc
      B.witnesses.hext
      B.witnesses.hcompat
      B.witnesses.hunion).inductive_union_data

/--
Concrete chosen-site data needed to instantiate the vacuum-gap-side chosen
transport / reconstruction site and its law package.
-/
structure YMVacuumGapChosenSiteData (B : YMClosedManuscriptBlueprint) where
  tm :
    (YangMillsVacuumGapSemanticBundleData
      B.objects.RD
      B.witnesses.hww).transport_map
  obs :
    (YangMillsVacuumGapSemanticBundleData
      B.objects.RD
      B.witnesses.hww).lattice_observable_family
  rsec :
    (YangMillsVacuumGapSemanticBundleData
      B.objects.RD
      B.witnesses.hww).reconstructed_sector
  corr :
    (YangMillsVacuumGapSemanticBundleData
      B.objects.RD
      B.witnesses.hww).os_correlation_family
  gapf :
    (YangMillsVacuumGapSemanticBundleData
      B.objects.RD
      B.witnesses.hww).minkowski_gap_functional
  hgap :
    (YangMillsVacuumGapSemanticBundleData
      B.objects.RD
      B.witnesses.hww).evaluate_minkowski_gap
        gapf
        ((YangMillsVacuumGapSemanticBundleData
          B.objects.RD
          B.witnesses.hww).realize_os_sector rsec corr)

/--
Concrete chosen-site data needed to instantiate the endpoint-side chosen
smear/correlation site and its law package.
-/
structure YMEndpointChosenSiteData (B : YMClosedManuscriptBlueprint) where
  vac :
    (YangMillsEndpointSemanticBundleData
      B.objects.RE
      B.witnesses.hE
      B.witnesses.hP).vacuum_vector
  testFn :
    (YangMillsEndpointSemanticBundleData
      B.objects.RE
      B.witnesses.hE
      B.witnesses.hP).test_function_space
  field :
    (YangMillsEndpointSemanticBundleData
      B.objects.RE
      B.witnesses.hE
      B.witnesses.hP).field_family

/--
All concrete chosen-site values still needed to turn a closed manuscript
blueprint into fully instantiated chosen-site law packages.
-/
structure YMChosenSiteBlueprint (B : YMClosedManuscriptBlueprint) where
  constructive : YMConstructiveChosenSiteData B
  vacuum_gap : YMVacuumGapChosenSiteData B
  endpoint : YMEndpointChosenSiteData B

theorem YangMillsChosenSiteBlueprintExportStatement
  (B : YMClosedManuscriptBlueprint)
  (C : YMChosenSiteBlueprint B) :
  let M := B.toFormalizedManuscript
  Nonempty (YMConstructiveRelationalInterface M.RC) /\
  Nonempty (YMConstructiveExtendAssembleLawPackage M.RC) /\
  Nonempty (YMVacuumGapRelationalInterface M.RD) /\
  Nonempty (YMVacuumGapTransportRealizeLawPackage M.RD) /\
  Nonempty (YMEndpointRelationalInterface M.RE) /\
  Nonempty (YMEndpointCorrelationLawPackage M.RE) := by
  let M := B.toFormalizedManuscript
  have hconstructiveRel :
      Nonempty (YMConstructiveRelationalInterface M.RC) :=
    YangMillsConstructiveRelationalInterfaceExistsStatement
      M.RC
      M.htrunc
      M.hext
      M.hcompat
      M.hunion
      C.constructive.win
      C.constructive.bridge
      C.constructive.base
      C.constructive.state
      C.constructive.unionData
  have hconstructiveLaw :
      Nonempty (YMConstructiveExtendAssembleLawPackage M.RC) :=
    YangMillsConstructiveExtendAssembleLawPackageExistsStatement
      M.RC
      M.htrunc
      M.hext
      M.hcompat
      M.hunion
      C.constructive.win
      C.constructive.bridge
      C.constructive.base
      C.constructive.state
      C.constructive.unionData
  have hvacuumRel :
      Nonempty (YMVacuumGapRelationalInterface M.RD) :=
    YangMillsVacuumGapRelationalInterfaceExistsStatement
      M.RD
      M.hww
      C.vacuum_gap.tm
      C.vacuum_gap.obs
      C.vacuum_gap.rsec
      C.vacuum_gap.corr
      C.vacuum_gap.gapf
      C.vacuum_gap.hgap
  have hvacuumLaw :
      Nonempty (YMVacuumGapTransportRealizeLawPackage M.RD) :=
    YangMillsVacuumGapTransportRealizeLawPackageExistsStatement
      M.RD
      M.hww
      C.vacuum_gap.tm
      C.vacuum_gap.obs
      C.vacuum_gap.rsec
      C.vacuum_gap.corr
      C.vacuum_gap.gapf
      C.vacuum_gap.hgap
  have hendpointRel :
      Nonempty (YMEndpointRelationalInterface M.RE) :=
    YangMillsEndpointRelationalInterfaceExistsStatement
      M.RE
      M.hE
      M.hP
      C.endpoint.vac
      C.endpoint.testFn
      C.endpoint.field
  have hendpointLaw :
      Nonempty (YMEndpointCorrelationLawPackage M.RE) :=
    YangMillsEndpointCorrelationLawPackageExistsStatement
      M.RE
      M.hE
      M.hP
      C.endpoint.vac
      C.endpoint.testFn
      C.endpoint.field
  exact
    And.intro hconstructiveRel <|
      And.intro hconstructiveLaw <|
        And.intro hvacuumRel <|
          And.intro hvacuumLaw <|
            And.intro hendpointRel hendpointLaw

end MaleyLean
