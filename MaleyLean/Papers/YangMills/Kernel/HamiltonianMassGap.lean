import MaleyLean.Papers.YangMills.Kernel.FixedLatticeSpectralGap

namespace MaleyLean
namespace Papers
namespace YangMills

universe u v w

/--
Abstract Hamiltonian mass-gap data over an ordered energy scalar.

The spectral part is factored through `HasOrderedSpectralGap`; the kernel part
records that the zero-energy states are exactly the vacuum sector.
-/
structure YMHamiltonianOrderedMassGap
    (Energy : Type u) [Preorder Energy] [Zero Energy] where
  HilbertSpace : Type v
  Hamiltonian : Type w
  vacuumSector : HilbertSpace -> Prop
  zeroEnergyState : HilbertSpace -> Prop
  spectrum : Set Energy
  gap : Energy
  spectral_gap : HasOrderedSpectralGap spectrum gap
  zero_energy_iff_vacuum :
    forall psi : HilbertSpace, zeroEnergyState psi <-> vacuumSector psi

namespace YMHamiltonianOrderedMassGap

theorem positive_gap {Energy : Type u}
    [Preorder Energy] [Zero Energy]
    (G : YMHamiltonianOrderedMassGap Energy) :
    0 < G.gap := by
  exact G.spectral_gap.gap_pos

theorem vacuum_energy_in_spectrum {Energy : Type u}
    [Preorder Energy] [Zero Energy]
    (G : YMHamiltonianOrderedMassGap Energy) :
    G.spectrum 0 := by
  exact G.spectral_gap.vacuum_mem

theorem no_subgap_spectrum {Energy : Type u}
    [Preorder Energy] [Zero Energy]
    (G : YMHamiltonianOrderedMassGap Energy)
    {energy : Energy}
    (henergy : G.spectrum energy)
    (hpos : 0 < energy)
    (hlt : energy < G.gap) :
    False := by
  exact G.spectral_gap.no_spectrum_in_open_gap henergy hpos hlt

theorem spectral_values_are_vacuum_or_above_gap {Energy : Type u}
    [Preorder Energy] [Zero Energy]
    (G : YMHamiltonianOrderedMassGap Energy)
    {energy : Energy}
    (henergy : G.spectrum energy) :
    energy = 0 \/ G.gap <= energy := by
  exact G.spectral_gap.zero_or_gap_le henergy

theorem zero_energy_is_vacuum {Energy : Type u}
    [Preorder Energy] [Zero Energy]
    (G : YMHamiltonianOrderedMassGap Energy)
    {psi : G.HilbertSpace}
    (hpsi : G.zeroEnergyState psi) :
    G.vacuumSector psi := by
  exact (G.zero_energy_iff_vacuum psi).mp hpsi

theorem vacuum_is_zero_energy {Energy : Type u}
    [Preorder Energy] [Zero Energy]
    (G : YMHamiltonianOrderedMassGap Energy)
    {psi : G.HilbertSpace}
    (hpsi : G.vacuumSector psi) :
    G.zeroEnergyState psi := by
  exact (G.zero_energy_iff_vacuum psi).mpr hpsi

end YMHamiltonianOrderedMassGap

/-- Real-energy Hamiltonian mass-gap data. -/
structure YMHamiltonianRealMassGap where
  HilbertSpace : Type
  Hamiltonian : Type
  vacuumSector : HilbertSpace -> Prop
  zeroEnergyState : HilbertSpace -> Prop
  spectrum : Set Real
  gap : Real
  spectral_gap : HasRealSpectralGap spectrum gap
  zero_energy_iff_vacuum :
    forall psi : HilbertSpace, zeroEnergyState psi <-> vacuumSector psi

namespace YMHamiltonianRealMassGap

theorem positive_gap (G : YMHamiltonianRealMassGap) :
    0 < G.gap := by
  exact G.spectral_gap.gap_pos

theorem vacuum_energy_in_spectrum (G : YMHamiltonianRealMassGap) :
    G.spectrum 0 := by
  exact G.spectral_gap.vacuum_mem

theorem no_subgap_spectrum
    (G : YMHamiltonianRealMassGap)
    {energy : Real}
    (henergy : G.spectrum energy)
    (hpos : 0 < energy)
    (hlt : energy < G.gap) :
    False := by
  exact G.spectral_gap.no_spectrum_in_open_gap henergy hpos hlt

theorem spectral_values_are_vacuum_or_above_gap
    (G : YMHamiltonianRealMassGap)
    {energy : Real}
    (henergy : G.spectrum energy) :
    energy = 0 \/ G.gap <= energy := by
  exact G.spectral_gap.spectrum_value_zero_or_above_gap henergy

theorem zero_energy_is_vacuum
    (G : YMHamiltonianRealMassGap)
    {psi : G.HilbertSpace}
    (hpsi : G.zeroEnergyState psi) :
    G.vacuumSector psi := by
  exact (G.zero_energy_iff_vacuum psi).mp hpsi

theorem vacuum_is_zero_energy
    (G : YMHamiltonianRealMassGap)
    {psi : G.HilbertSpace}
    (hpsi : G.vacuumSector psi) :
    G.zeroEnergyState psi := by
  exact (G.zero_energy_iff_vacuum psi).mpr hpsi

end YMHamiltonianRealMassGap

end YangMills
end Papers
end MaleyLean
