import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptCarrierDeclarations
import MaleyLean.Papers.YangMills.Kernel.VacuumSemanticDefinitions
import MaleyLean.Papers.YangMills.Kernel.ManuscriptDeclarations
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptWitnessData

namespace MaleyLean

abbrev ym_vacuum_III1_ultraviolet_gate_statement : Prop :=
  YMVacuumUltravioletScopeReady ym_vacuum_gap_manuscript_carrier_base

abbrev ym_vacuum_III2_public_scope_export_statement : Prop :=
  ym_vacuum_III1_ultraviolet_gate_statement

abbrev ym_vacuum_III3_entrance_statement : Prop :=
  YMVacuumEntranceReady ym_vacuum_gap_manuscript_carrier_base

abbrev ym_vacuum_IV1_fixed_lattice_gap_statement : Prop :=
  YMVacuumLatticeGapInputReady ym_vacuum_gap_manuscript_carrier_base

abbrev ym_vacuum_IV4_weak_window_statement : Prop :=
  YMVacuumWeakWindowCertificateReady ym_vacuum_gap_manuscript_carrier_base

abbrev ym_vacuum_F298_weak_window_certificate_statement : Prop :=
  ym_vacuum_IV4_weak_window_statement

abbrev ym_vacuum_F216_transport_statement : Prop :=
  YMVacuumOSTransportReady ym_vacuum_gap_manuscript_carrier_base /\
  YMVacuumPositiveGapExhibited ym_vacuum_gap_manuscript_carrier_base

abbrev ym_vacuum_F5_continuum_gap_statement : Prop :=
  ym_vacuum_F216_transport_statement

abbrev ym_vacuum_M5_gap_transfer_statement : Prop :=
  ym_vacuum_F216_transport_statement

abbrev ym_vacuum_decl_ultraviolet_scope_ready : Prop :=
  ym_vacuum_III1_ultraviolet_gate_statement
abbrev ym_vacuum_decl_entrance_ready : Prop :=
  ym_vacuum_III3_entrance_statement
abbrev ym_vacuum_decl_fixed_lattice_gap_ready : Prop :=
  ym_vacuum_IV1_fixed_lattice_gap_statement
abbrev ym_vacuum_decl_weak_window_certificate_ready : Prop :=
  ym_vacuum_IV4_weak_window_statement
abbrev ym_vacuum_decl_continuum_gap_transport_ready : Prop :=
  ym_vacuum_F216_transport_statement
abbrev ym_vacuum_decl_reconstruction_ready : Prop :=
  ym_vacuum_decl_continuum_gap_transport_ready
abbrev ym_vacuum_decl_endpoint_ready : Prop :=
  ym_vacuum_decl_continuum_gap_transport_ready
abbrev ym_vacuum_decl_vacuum_gap_part : Prop :=
  ym_vacuum_decl_ultraviolet_scope_ready /\
  ym_vacuum_decl_entrance_ready /\
  ym_vacuum_decl_fixed_lattice_gap_ready /\
  ym_vacuum_decl_weak_window_certificate_ready /\
  ym_vacuum_decl_continuum_gap_transport_ready /\
  ym_vacuum_decl_reconstruction_ready /\
  ym_vacuum_decl_endpoint_ready
abbrev ym_vacuum_decl_lattice_gap_input : Prop :=
  YMVacuumLatticeGapInputReady ym_vacuum_gap_manuscript_carrier_base
abbrev ym_vacuum_decl_os_transport_ready : Prop :=
  YMVacuumOSTransportReady ym_vacuum_gap_manuscript_carrier_base
abbrev ym_vacuum_decl_positive_gap_exhibited : Prop :=
  YMVacuumPositiveGapExhibited ym_vacuum_gap_manuscript_carrier_base
abbrev ym_vacuum_decl_os_sector_ready : Prop :=
  YMVacuumOSSectorReady ym_vacuum_gap_manuscript_carrier_base
abbrev ym_vacuum_decl_minkowski_gap_ready : Prop :=
  YMVacuumMinkowskiGapReady ym_vacuum_gap_manuscript_carrier_base
abbrev ym_vacuum_decl_obtained_from_transport : Prop :=
  YMVacuumObtainedFromTransport ym_vacuum_gap_manuscript_carrier_base

theorem ym_vacuum_decl_build_vacuum_gap_part :
  ym_vacuum_decl_ultraviolet_scope_ready ->
  ym_vacuum_decl_entrance_ready ->
  ym_vacuum_decl_fixed_lattice_gap_ready ->
  ym_vacuum_decl_weak_window_certificate_ready ->
  ym_vacuum_decl_continuum_gap_transport_ready ->
  ym_vacuum_decl_reconstruction_ready ->
  ym_vacuum_decl_endpoint_ready ->
  ym_vacuum_decl_vacuum_gap_part := by
  intro hUV hEnt hGap hWW hTransport hRecon hEnd
  exact
    And.intro hUV <|
      And.intro hEnt <|
        And.intro hGap <|
          And.intro hWW <|
            And.intro hTransport <|
              And.intro hRecon hEnd

theorem ym_vacuum_decl_huv : ym_vacuum_decl_ultraviolet_scope_ready := by
  exact ym_vacuum_decl_bundle.hIII1

theorem ym_vacuum_decl_hent : ym_vacuum_decl_entrance_ready := by
  exact ym_vacuum_decl_bundle.hIII3

theorem ym_vacuum_decl_hww : ym_vacuum_decl_weak_window_certificate_ready := by
  exact ym_vacuum_decl_bundle.hIV4

theorem ym_vacuum_III1 : ym_vacuum_III1_ultraviolet_gate_statement := by
  exact ym_vacuum_decl_bundle.hIII1

theorem ym_vacuum_III2 : ym_vacuum_III2_public_scope_export_statement := by
  exact ym_vacuum_III1

theorem ym_vacuum_III3 : ym_vacuum_III3_entrance_statement := by
  exact ym_vacuum_decl_bundle.hIII3

theorem ym_vacuum_IV1 : ym_vacuum_IV1_fixed_lattice_gap_statement := by
  exact ym_vacuum_decl_bundle.hIV1

theorem ym_vacuum_IV4 : ym_vacuum_IV4_weak_window_statement := by
  exact ym_vacuum_decl_bundle.hIV4

theorem ym_vacuum_F298 : ym_vacuum_F298_weak_window_certificate_statement := by
  exact ym_vacuum_IV4

theorem ym_vacuum_F216 : ym_vacuum_F216_transport_statement := by
  exact ym_vacuum_decl_bundle.hF216

theorem ym_vacuum_F5 : ym_vacuum_F5_continuum_gap_statement := by
  exact ym_vacuum_F216

theorem ym_vacuum_M5 : ym_vacuum_M5_gap_transfer_statement := by
  exact ym_vacuum_F5

theorem ym_vacuum_decl_weak_window_yields_transport :
  ym_vacuum_decl_weak_window_certificate_ready ->
  ym_vacuum_decl_continuum_gap_transport_ready := by
  intro _
  exact ym_vacuum_decl_bundle.hF216

theorem ym_vacuum_decl_transport_exhibits_os_transport :
  ym_vacuum_decl_continuum_gap_transport_ready ->
  ym_vacuum_decl_os_transport_ready := by
  intro _
  exact ym_vacuum_os_transport_ready_holds ym_vacuum_gap_manuscript_carrier_base

theorem ym_vacuum_decl_transport_exhibits_positive_gap :
  ym_vacuum_decl_continuum_gap_transport_ready ->
  ym_vacuum_decl_positive_gap_exhibited := by
  intro _
  exact ym_vacuum_positive_gap_exhibited_holds ym_vacuum_gap_manuscript_carrier_base

theorem ym_vacuum_decl_transport_comes_from_lattice_gap :
  ym_vacuum_decl_continuum_gap_transport_ready ->
  ym_vacuum_decl_lattice_gap_input := by
  intro _
  exact ym_vacuum_lattice_gap_input_ready_holds ym_vacuum_gap_manuscript_carrier_base

theorem ym_vacuum_decl_transport_feeds_reconstruction :
  ym_vacuum_decl_continuum_gap_transport_ready ->
  ym_vacuum_decl_reconstruction_ready := by
  intro hTransport
  exact hTransport

theorem ym_vacuum_decl_reconstruction_exhibits_os_sector :
  ym_vacuum_decl_reconstruction_ready ->
  ym_vacuum_decl_os_sector_ready := by
  intro _
  exact ym_vacuum_os_sector_ready_holds ym_vacuum_gap_manuscript_carrier_base

theorem ym_vacuum_decl_reconstruction_exhibits_minkowski_gap :
  ym_vacuum_decl_reconstruction_ready ->
  ym_vacuum_decl_minkowski_gap_ready := by
  intro _
  exact ym_vacuum_minkowski_gap_ready_holds ym_vacuum_gap_manuscript_carrier_base

theorem ym_vacuum_decl_reconstruction_records_transport_origin :
  ym_vacuum_decl_reconstruction_ready ->
  ym_vacuum_decl_obtained_from_transport := by
  intro _
  exact ym_vacuum_obtained_from_transport_holds ym_vacuum_gap_manuscript_carrier_base

noncomputable def ym_vacuum_gap_manuscript_witness_data :
  YMVacuumGapManuscriptWitnessData ym_vacuum_gap_manuscript_carrier_base :=
  { ultraviolet_scope_ready := ym_vacuum_decl_ultraviolet_scope_ready
    entrance_ready := ym_vacuum_decl_entrance_ready
    fixed_lattice_gap_ready := ym_vacuum_decl_fixed_lattice_gap_ready
    weak_window_certificate_ready := ym_vacuum_decl_weak_window_certificate_ready
    continuum_gap_transport_ready := ym_vacuum_decl_continuum_gap_transport_ready
    reconstruction_ready := ym_vacuum_decl_reconstruction_ready
    endpoint_ready := ym_vacuum_decl_endpoint_ready
    hww := ym_vacuum_decl_hww
    vacuum_gap_part := ym_vacuum_decl_vacuum_gap_part
    lattice_gap_input := ym_vacuum_decl_lattice_gap_input
    os_transport_ready := ym_vacuum_decl_os_transport_ready
    positive_gap_exhibited := ym_vacuum_decl_positive_gap_exhibited
    os_sector_ready := ym_vacuum_decl_os_sector_ready
    minkowski_gap_ready := ym_vacuum_decl_minkowski_gap_ready
    obtained_from_transport := ym_vacuum_decl_obtained_from_transport
    build_vacuum_gap_part := ym_vacuum_decl_build_vacuum_gap_part
    weak_window_yields_transport := ym_vacuum_decl_weak_window_yields_transport
    transport_exhibits_os_transport := ym_vacuum_decl_transport_exhibits_os_transport
    transport_exhibits_positive_gap := ym_vacuum_decl_transport_exhibits_positive_gap
    transport_comes_from_lattice_gap := ym_vacuum_decl_transport_comes_from_lattice_gap
    transport_feeds_reconstruction := ym_vacuum_decl_transport_feeds_reconstruction
    reconstruction_exhibits_os_sector := ym_vacuum_decl_reconstruction_exhibits_os_sector
    reconstruction_exhibits_minkowski_gap :=
      ym_vacuum_decl_reconstruction_exhibits_minkowski_gap
    reconstruction_records_transport_origin :=
      ym_vacuum_decl_reconstruction_records_transport_origin }

noncomputable def ym_vacuum_gap_manuscript_object :
  YMVacuumGapManuscriptObject :=
  ym_vacuum_gap_manuscript_witness_data.toVacuumGapManuscriptObject

theorem ym_vacuum_gap_manuscript_object_named_inhabitants :
  ym_vacuum_gap_manuscript_object.transport = vacuum_transport /\
  ym_vacuum_gap_manuscript_object.H = vacuum_H /\
  ym_vacuum_gap_manuscript_object.Hloc = vacuum_Hloc /\
  ym_vacuum_gap_manuscript_object.corr = vacuum_corr /\
  ym_vacuum_gap_manuscript_object.gapf = vacuum_gapf /\
  ym_vacuum_gap_manuscript_object.hgap = vacuum_hgap := by
  simpa [ym_vacuum_gap_manuscript_object] using
    YangMillsVacuumGapManuscriptWitnessDataStatement ym_vacuum_gap_manuscript_witness_data

end MaleyLean
