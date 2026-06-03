import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpine

namespace MaleyLean

/--
Dedicated abstract core for the load-bearing Part~D vacuum-gap route.

This isolates the shortest theorem-facing mass-gap chain:
UV/public-scope gate, entrance, fixed-lattice gap, weak-window certificate,
QE3 transport, reconstruction, and endpoint packet.
-/
structure YMTransportPackage where
  transport_state : Type
  lattice_observable_family : Type
  transport_map : Type
  transport_observable :
    transport_map -> lattice_observable_family -> transport_state
  lattice_gap_input : Prop
  os_transport_ready : Prop
  positive_gap_exhibited : Prop

structure YMVacuumReconstructionPackage where
  reconstructed_sector : Type
  os_sector : Type
  minkowski_gap_functional : Type
  os_correlation_family : Type
  realize_os_sector :
    reconstructed_sector -> os_correlation_family -> os_sector
  evaluate_minkowski_gap :
    minkowski_gap_functional -> os_sector -> Prop
  os_sector_ready : Prop
  minkowski_gap_ready : Prop
  obtained_from_transport : Prop

structure YMVacuumGapRoute where
  ultraviolet_scope_ready : Prop
  entrance_ready : Prop
  fixed_lattice_gap_ready : Prop
  weak_window_certificate_ready : Prop
  continuum_gap_transport_ready : Prop
  reconstruction_ready : Prop
  endpoint_ready : Prop
  vacuum_gap_part : Prop
  transport_package : YMTransportPackage
  reconstruction_package : YMVacuumReconstructionPackage
  build_vacuum_gap_part :
    ultraviolet_scope_ready ->
    entrance_ready ->
    fixed_lattice_gap_ready ->
    weak_window_certificate_ready ->
    continuum_gap_transport_ready ->
    reconstruction_ready ->
    endpoint_ready ->
    vacuum_gap_part
  weak_window_yields_transport :
    weak_window_certificate_ready -> continuum_gap_transport_ready
  transport_exhibits_os_transport :
    continuum_gap_transport_ready -> transport_package.os_transport_ready
  transport_exhibits_positive_gap :
    continuum_gap_transport_ready -> transport_package.positive_gap_exhibited
  transport_comes_from_lattice_gap :
    continuum_gap_transport_ready -> transport_package.lattice_gap_input
  transport_feeds_reconstruction :
    continuum_gap_transport_ready -> reconstruction_ready
  reconstruction_exhibits_os_sector :
    reconstruction_ready -> reconstruction_package.os_sector_ready
  reconstruction_exhibits_minkowski_gap :
    reconstruction_ready -> reconstruction_package.minkowski_gap_ready
  reconstruction_records_transport_origin :
    reconstruction_ready -> reconstruction_package.obtained_from_transport

/-- Abstract statement that QE3 transport really carries the lattice gap into the OS sector. -/
def ym_qe3_transport_core (R : YMVacuumGapRoute) : Prop :=
  R.continuum_gap_transport_ready -> R.vacuum_gap_part

/-- Abstract statement that the weak-window certificate is used only as a gate into QE3. -/
def ym_weak_window_gate_core (R : YMVacuumGapRoute) : Prop :=
  R.weak_window_certificate_ready -> R.continuum_gap_transport_ready -> R.vacuum_gap_part

/-- Abstract statement that the full short Route~1 chain closes Part D. -/
def ym_route1_vacuum_gap_core (R : YMVacuumGapRoute) : Prop :=
  R.ultraviolet_scope_ready ->
  R.entrance_ready ->
  R.fixed_lattice_gap_ready ->
  R.weak_window_certificate_ready ->
  R.continuum_gap_transport_ready ->
  R.reconstruction_ready ->
  R.endpoint_ready ->
  R.vacuum_gap_part

/--
Explicit paper-facing Route~1 / QE3 statement carried by the current vacuum-gap
core.

Unlike `vacuum_gap_part`, this names the concrete transport and reconstruction
outputs that the current vacuum-gap route exposes.
-/
def ym_route1_explicit_statement (R : YMVacuumGapRoute) : Prop :=
  R.continuum_gap_transport_ready /\
  R.transport_package.os_transport_ready /\
  R.transport_package.positive_gap_exhibited /\
  R.transport_package.lattice_gap_input /\
  R.reconstruction_ready /\
  R.reconstruction_package.os_sector_ready /\
  R.reconstruction_package.minkowski_gap_ready /\
  R.reconstruction_package.obtained_from_transport

theorem YangMillsQE3TransportCoreStatement
  (R : YMVacuumGapRoute)
  (h : ym_qe3_transport_core R)
  (hgap : R.continuum_gap_transport_ready) :
  R.vacuum_gap_part := by
  exact h hgap

theorem YangMillsWeakWindowGateCoreStatement
  (R : YMVacuumGapRoute)
  (h : ym_weak_window_gate_core R)
  (hww : R.weak_window_certificate_ready)
  (hgap : R.continuum_gap_transport_ready) :
  R.vacuum_gap_part := by
  exact h hww hgap

theorem YangMillsRoute1VacuumGapCoreStatement
  (R : YMVacuumGapRoute)
  (h : ym_route1_vacuum_gap_core R)
  (huv : R.ultraviolet_scope_ready)
  (hent : R.entrance_ready)
  (hlat : R.fixed_lattice_gap_ready)
  (hww : R.weak_window_certificate_ready)
  (hgap : R.continuum_gap_transport_ready)
  (hrec : R.reconstruction_ready)
  (hend : R.endpoint_ready) :
  R.vacuum_gap_part := by
  exact h huv hent hlat hww hgap hrec hend

theorem YangMillsVacuumGapRouteBuildStatement
  (R : YMVacuumGapRoute)
  (huv : R.ultraviolet_scope_ready)
  (hent : R.entrance_ready)
  (hlat : R.fixed_lattice_gap_ready)
  (hww : R.weak_window_certificate_ready)
  (hgap : R.continuum_gap_transport_ready)
  (hrec : R.reconstruction_ready)
  (hend : R.endpoint_ready) :
  R.vacuum_gap_part := by
  exact R.build_vacuum_gap_part huv hent hlat hww hgap hrec hend

theorem YangMillsWeakWindowYieldsTransportStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  R.continuum_gap_transport_ready := by
  exact R.weak_window_yields_transport hww

theorem YangMillsTransportPackageStatement
  (R : YMVacuumGapRoute)
  (hgap : R.continuum_gap_transport_ready) :
  R.transport_package.os_transport_ready /\
  R.transport_package.positive_gap_exhibited /\
  R.transport_package.lattice_gap_input := by
  exact And.intro
    (R.transport_exhibits_os_transport hgap)
    (And.intro
      (R.transport_exhibits_positive_gap hgap)
      (R.transport_comes_from_lattice_gap hgap))

theorem YangMillsTransportFeedsReconstructionStatement
  (R : YMVacuumGapRoute)
  (hgap : R.continuum_gap_transport_ready) :
  R.reconstruction_ready := by
  exact R.transport_feeds_reconstruction hgap

theorem YangMillsVacuumReconstructionPackageStatement
  (R : YMVacuumGapRoute)
  (hrec : R.reconstruction_ready) :
  R.reconstruction_package.os_sector_ready /\
  R.reconstruction_package.minkowski_gap_ready /\
  R.reconstruction_package.obtained_from_transport := by
  exact And.intro
    (R.reconstruction_exhibits_os_sector hrec)
    (And.intro
      (R.reconstruction_exhibits_minkowski_gap hrec)
      (R.reconstruction_records_transport_origin hrec))

theorem YangMillsLoadBearingSpineFeedsVacuumGapCoreStatement
  (S : YMLoadBearingSpine)
  (R : YMVacuumGapRoute)
  (huv : S.packet1_uv_gate)
  (hent : S.packet2_entrance)
  (hlat : S.packet3_fixed_lattice_gap)
  (hww : S.auxiliary_weak_window_certificate)
  (hend : S.packet10_endpoint)
  (huvR : R.ultraviolet_scope_ready)
  (hentR : R.entrance_ready)
  (hlatR : R.fixed_lattice_gap_ready)
  (hwwR : R.weak_window_certificate_ready)
  (hgapR : R.continuum_gap_transport_ready)
  (hrecR : R.reconstruction_ready)
  (hendR : R.endpoint_ready)
  (hbuild : ym_route1_vacuum_gap_core R) :
  S.packet1_uv_gate /\ S.packet2_entrance /\ S.packet3_fixed_lattice_gap /\
  S.auxiliary_weak_window_certificate /\ S.packet10_endpoint /\
  R.vacuum_gap_part := by
  have hpart := YangMillsRoute1VacuumGapCoreStatement R hbuild huvR hentR hlatR hwwR hgapR hrecR hendR
  exact And.intro huv <|
    And.intro hent <|
      And.intro hlat <|
        And.intro hww <|
    And.intro hend hpart

theorem YangMillsVacuumGapCoreExhibitsNamedOutputsStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  R.continuum_gap_transport_ready /\
  R.transport_package.os_transport_ready /\
  R.transport_package.positive_gap_exhibited /\
  R.transport_package.lattice_gap_input /\
  R.reconstruction_ready /\
  R.reconstruction_package.os_sector_ready /\
  R.reconstruction_package.minkowski_gap_ready /\
  R.reconstruction_package.obtained_from_transport := by
  have hgap := YangMillsWeakWindowYieldsTransportStatement R hww
  have hrec := YangMillsTransportFeedsReconstructionStatement R hgap
  have htransport := YangMillsTransportPackageStatement R hgap
  have hrecon := YangMillsVacuumReconstructionPackageStatement R hrec
  exact And.intro hgap <|
    And.intro htransport.1 <|
      And.intro htransport.2.1 <|
        And.intro htransport.2.2 <|
          And.intro hrec <|
            And.intro hrecon.1 <|
              And.intro hrecon.2.1 hrecon.2.2

theorem YangMillsRoute1ExplicitStatementFromWeakWindowStatement
  (R : YMVacuumGapRoute)
  (hww : R.weak_window_certificate_ready) :
  ym_route1_explicit_statement R := by
  exact YangMillsVacuumGapCoreExhibitsNamedOutputsStatement R hww

theorem YangMillsLoadBearingSpineFeedsRoute1ExplicitStatement
  (S : YMLoadBearingSpine)
  (R : YMVacuumGapRoute)
  (huv : S.packet1_uv_gate)
  (hent : S.packet2_entrance)
  (hlat : S.packet3_fixed_lattice_gap)
  (hww : S.auxiliary_weak_window_certificate)
  (hend : S.packet10_endpoint)
  (huvR : R.ultraviolet_scope_ready)
  (hentR : R.entrance_ready)
  (hlatR : R.fixed_lattice_gap_ready)
  (hwwR : R.weak_window_certificate_ready)
  (hgapR : R.continuum_gap_transport_ready)
  (hrecR : R.reconstruction_ready)
  (hendR : R.endpoint_ready)
  (hbuild : ym_route1_vacuum_gap_core R) :
  S.packet1_uv_gate /\ S.packet2_entrance /\ S.packet3_fixed_lattice_gap /\
  S.auxiliary_weak_window_certificate /\ S.packet10_endpoint /\
  ym_route1_explicit_statement R := by
  have hspine :=
    YangMillsLoadBearingSpineFeedsVacuumGapCoreStatement
      S R huv hent hlat hww hend
      huvR hentR hlatR hwwR hgapR hrecR hendR hbuild
  have hexplicit := YangMillsRoute1ExplicitStatementFromWeakWindowStatement R hwwR
  exact And.intro hspine.1 <|
    And.intro hspine.2.1 <|
      And.intro hspine.2.2.1 <|
        And.intro hspine.2.2.2.1 <|
          And.intro hspine.2.2.2.2.1 hexplicit

end MaleyLean
