import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite

namespace MaleyLean

/--
Manuscript-specific vacuum-gap choices over an already chosen vacuum-gap route
and weak-window witness.

This is the exact authoring site for the remaining vacuum-gap manuscript terms:
the QE3 transport object, bounded cylinder observable, reconstructed sector,
OS correlation family, spectral-gap functional, and the chosen gap witness.
-/
structure YMVacuumGapManuscriptChoices
    (RD : YMVacuumGapRoute)
    (hww : RD.weak_window_certificate_ready) where
  transport :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).transport_map
  H :
    (YangMillsVacuumGapSemanticBundleData
      RD hww).lattice_observable_family
  Hloc :
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
        ((YangMillsVacuumGapSemanticBundleData
          RD hww).realize_os_sector Hloc corr)

def YangMillsVacuumGapManuscriptChoicesData
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (transport :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).transport_map)
    (H :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).lattice_observable_family)
    (Hloc :
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
          ((YangMillsVacuumGapSemanticBundleData
            RD hww).realize_os_sector Hloc corr)) :
  YMVacuumGapManuscriptChoices RD hww :=
  { transport := transport
    H := H
    Hloc := Hloc
    corr := corr
    gapf := gapf
    hgap := hgap }

def ym_vacuum_transport_of
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  (YangMillsVacuumGapSemanticBundleData RD hww).transport_map :=
  C.transport

def ym_vacuum_H_of
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  (YangMillsVacuumGapSemanticBundleData RD hww).lattice_observable_family :=
  C.H

def ym_vacuum_Hloc_of
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  (YangMillsVacuumGapSemanticBundleData RD hww).reconstructed_sector :=
  C.Hloc

def ym_vacuum_corr_of
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  (YangMillsVacuumGapSemanticBundleData RD hww).os_correlation_family :=
  C.corr

def ym_vacuum_gapf_of
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  (YangMillsVacuumGapSemanticBundleData RD hww).minkowski_gap_functional :=
  C.gapf

def ym_vacuum_hgap_of
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  (YangMillsVacuumGapSemanticBundleData
    RD hww).evaluate_minkowski_gap
      C.gapf
      ((YangMillsVacuumGapSemanticBundleData
        RD hww).realize_os_sector C.Hloc C.corr) :=
  C.hgap

def YangMillsVacuumGapChosenSiteDataOfChoices
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C : YMVacuumGapManuscriptChoices O.RD W.hww) :
  YMVacuumGapChosenSiteData
    ({ objects := O, witnesses := W } : YMClosedManuscriptBlueprint) :=
  { tm := C.transport
    obs := C.H
    rsec := C.Hloc
    corr := C.corr
    gapf := C.gapf
    hgap := C.hgap }

theorem YangMillsVacuumGapChoicesStatement
  {O : YMManuscriptConcreteObjects}
  (W : YMManuscriptReadinessWitnesses O)
  (C : YMVacuumGapManuscriptChoices O.RD W.hww) :
  let K := YangMillsVacuumGapChosenSiteDataOfChoices W C
  K.tm = C.transport /\
  K.obs = C.H /\
  K.rsec = C.Hloc /\
  K.corr = C.corr /\
  K.gapf = C.gapf /\
  K.hgap = C.hgap := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl rfl

theorem YangMillsVacuumGapManuscriptChoicesBuilderStatement
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (transport :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).transport_map)
    (H :
      (YangMillsVacuumGapSemanticBundleData
        RD hww).lattice_observable_family)
    (Hloc :
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
          ((YangMillsVacuumGapSemanticBundleData
            RD hww).realize_os_sector Hloc corr)) :
  let C := YangMillsVacuumGapManuscriptChoicesData transport H Hloc corr gapf hgap
  C.transport = transport /\
  C.H = H /\
  C.Hloc = Hloc /\
  C.corr = corr /\
  C.gapf = gapf /\
  C.hgap = hgap := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl rfl

theorem YangMillsVacuumGapChosenInhabitantsStatement
    {RD : YMVacuumGapRoute}
    {hww : RD.weak_window_certificate_ready}
    (C : YMVacuumGapManuscriptChoices RD hww) :
  ym_vacuum_transport_of C = C.transport /\
  ym_vacuum_H_of C = C.H /\
  ym_vacuum_Hloc_of C = C.Hloc /\
  ym_vacuum_corr_of C = C.corr /\
  ym_vacuum_gapf_of C = C.gapf /\
  ym_vacuum_hgap_of C = C.hgap := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl rfl

end MaleyLean
