import MaleyLean.Papers.YangMills.Kernel.ManuscriptConstantDefinitionSite

namespace MaleyLean

/--
Manuscript-facing names directly on the final bundled manuscript input object.

This removes the last naming ambiguity before the closed manuscript constant is
defined: every manuscript symbol can now be read directly from
`YMClosedInstantiatedManuscriptInput`, without first constructing
`I : YMClosedInstantiatedManuscript`.
-/
def ym_input_DeltaMax
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsConstructiveSemanticBundleData
    M.RC M.htrunc M.hext M.hcompat M.hunion).finite_cap_window :=
  M.win

def ym_input_finite_cap_bridge
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsConstructiveSemanticBundleData
    M.RC M.htrunc M.hext M.hcompat M.hunion).positive_bridge_map :=
  M.bridge

def ym_input_bounded_base_one
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsConstructiveSemanticBundleData
    M.RC M.htrunc M.hext M.hcompat M.hunion).bounded_base_carrier :=
  M.base

def ym_input_omega_bd
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsConstructiveSemanticBundleData
    M.RC M.htrunc M.hext M.hcompat M.hunion).bounded_state_data :=
  M.state

def ym_input_omega_sharp
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsConstructiveSemanticBundleData
    M.RC M.htrunc M.hext M.hcompat M.hunion).inductive_union_data :=
  M.unionData

def ym_input_transport
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsVacuumGapSemanticBundleData
    M.RD M.hww).transport_map :=
  M.tm

def ym_input_H
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsVacuumGapSemanticBundleData
    M.RD M.hww).lattice_observable_family :=
  M.obs

def ym_input_Hloc
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsVacuumGapSemanticBundleData
    M.RD M.hww).reconstructed_sector :=
  M.rsec

def ym_input_corr
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsVacuumGapSemanticBundleData
    M.RD M.hww).os_correlation_family :=
  M.corr

def ym_input_gapf
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsVacuumGapSemanticBundleData
    M.RD M.hww).minkowski_gap_functional :=
  M.gapf

def ym_input_hgap_statement
  (M : YMClosedInstantiatedManuscriptInput) : Prop :=
  (YangMillsVacuumGapSemanticBundleData
    M.RD M.hww).evaluate_minkowski_gap
      (ym_input_gapf M)
      ((YangMillsVacuumGapSemanticBundleData
        M.RD M.hww).realize_os_sector
          (ym_input_Hloc M)
          (ym_input_corr M))

def ym_input_hgap
  (M : YMClosedInstantiatedManuscriptInput) :
  ym_input_hgap_statement M :=
  M.hgap

def ym_input_Omega_loc
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsEndpointSemanticBundleData
    M.RE M.hE M.hP).vacuum_vector :=
  M.vac

def ym_input_phi_star
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsEndpointSemanticBundleData
    M.RE M.hE M.hP).test_function_space :=
  M.testFn

def ym_input_E_ren
  (M : YMClosedInstantiatedManuscriptInput) :
  (YangMillsEndpointSemanticBundleData
    M.RE M.hE M.hP).field_family :=
  M.field

theorem YangMillsManuscriptInputNamedObjectsStatement
  (M : YMClosedInstantiatedManuscriptInput) :
  ym_input_DeltaMax M = M.win /\
  ym_input_finite_cap_bridge M = M.bridge /\
  ym_input_bounded_base_one M = M.base /\
  ym_input_omega_bd M = M.state /\
  ym_input_omega_sharp M = M.unionData /\
  ym_input_transport M = M.tm /\
  ym_input_H M = M.obs /\
  ym_input_Hloc M = M.rsec /\
  ym_input_corr M = M.corr /\
  ym_input_gapf M = M.gapf /\
  ym_input_hgap_statement M /\
  ym_input_Omega_loc M = M.vac /\
  ym_input_phi_star M = M.testFn /\
  ym_input_E_ren M = M.field := by
  exact And.intro rfl <|
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl <|
                    And.intro rfl <|
                      And.intro (ym_input_hgap M) <|
                        And.intro rfl <|
                          And.intro rfl rfl

end MaleyLean
