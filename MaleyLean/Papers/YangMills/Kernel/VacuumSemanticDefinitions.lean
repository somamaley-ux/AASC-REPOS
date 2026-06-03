import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptCarrierBase

namespace MaleyLean

/--
Carrier-level semantic shadow for the Route 1 entrance packet selecting the
transported observable family at bounded physical scale.
-/
def YMVacuumEntranceReady
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  Exists fun obs : B.TransportState =>
    obs = B.transport_observable B.transport B.H

/--
Carrier-level semantic shadow for the public-scope ultraviolet gate in the
Route 1 manuscript spine.
-/
def YMVacuumUltravioletScopeReady
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  YMVacuumEntranceReady B

/--
Carrier-level semantic shadow for the fixed-lattice gap input used by the
Route 1 transport package.
-/
def YMVacuumLatticeGapInputReady
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  Exists fun obs : B.TransportState =>
    obs = B.transport_observable B.transport B.H

/--
Carrier-level semantic shadow for the repaired weak-window certificate used on
the public Route 1 spine.
-/
def YMVacuumWeakWindowCertificateReady
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  YMVacuumEntranceReady B

/--
Carrier-level semantic shadow for the OS transport output of the chosen Route 1
transport data.
-/
def YMVacuumOSTransportReady
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  YMVacuumLatticeGapInputReady B

/--
Carrier-level semantic shadow for the positive-gap witness transported to the
continuum side.
-/
def YMVacuumPositiveGapExhibited
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  YMVacuumLatticeGapInputReady B

/--
Carrier-level semantic shadow for the reconstructed OS sector determined by the
chosen reconstructed Hilbert carrier and OS correlations.
-/
def YMVacuumOSSectorReady
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  Exists fun os : B.OSSector => os = B.realize_os_sector B.Hloc B.corr

/--
Carrier-level semantic shadow for the Minkowski gap functional on the chosen OS
sector.
-/
def YMVacuumMinkowskiGapReady
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  Exists fun gap : Prop =>
    gap =
      B.evaluate_minkowski_gap
        B.gapf
        (B.realize_os_sector B.Hloc B.corr)

/--
Carrier-level semantic shadow recording that the reconstructed gap statement is
fed by the chosen transport data.
-/
def YMVacuumObtainedFromTransport
    (B : YMVacuumGapManuscriptCarrierBase) : Prop :=
  YMVacuumLatticeGapInputReady B /\ YMVacuumOSSectorReady B

theorem ym_vacuum_entrance_ready_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumEntranceReady B := by
  exact Exists.intro (B.transport_observable B.transport B.H) rfl

theorem ym_vacuum_ultraviolet_scope_ready_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumUltravioletScopeReady B := by
  exact ym_vacuum_entrance_ready_holds B

theorem ym_vacuum_lattice_gap_input_ready_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumLatticeGapInputReady B := by
  exact Exists.intro (B.transport_observable B.transport B.H) rfl

theorem ym_vacuum_weak_window_certificate_ready_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumWeakWindowCertificateReady B := by
  exact ym_vacuum_entrance_ready_holds B

theorem ym_vacuum_os_transport_ready_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumOSTransportReady B := by
  exact ym_vacuum_lattice_gap_input_ready_holds B

theorem ym_vacuum_os_transport_ready_iff_lattice_gap_input_ready
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumOSTransportReady B ↔ YMVacuumLatticeGapInputReady B := by
  rfl

theorem ym_vacuum_positive_gap_exhibited_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumPositiveGapExhibited B := by
  exact ym_vacuum_lattice_gap_input_ready_holds B

theorem ym_vacuum_os_sector_ready_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumOSSectorReady B := by
  exact Exists.intro (B.realize_os_sector B.Hloc B.corr) rfl

theorem ym_vacuum_minkowski_gap_ready_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumMinkowskiGapReady B := by
  exact Exists.intro
    (B.evaluate_minkowski_gap B.gapf (B.realize_os_sector B.Hloc B.corr))
    rfl

theorem ym_vacuum_obtained_from_transport_holds
    (B : YMVacuumGapManuscriptCarrierBase) :
    YMVacuumObtainedFromTransport B := by
  exact And.intro (ym_vacuum_lattice_gap_input_ready_holds B) (ym_vacuum_os_sector_ready_holds B)

end MaleyLean
