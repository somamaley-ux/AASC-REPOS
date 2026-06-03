import Mathlib.Data.Real.Basic

namespace MaleyLean
namespace Papers
namespace YangMills

universe u

/--
The order-theoretic core of a spectral-gap predicate.

This version is polymorphic in the ordered scalar type, so the elementary gap
logic can be audited independently of any particular construction of the real
numbers.
-/
def HasOrderedSpectralGap {Scalar : Type u}
    [Preorder Scalar] [Zero Scalar]
    (spectrum : Set Scalar) (m : Scalar) : Prop :=
  0 < m /\
    spectrum 0 /\
      forall lam : Scalar, spectrum lam -> lam = 0 \/ m <= lam

namespace HasOrderedSpectralGap

theorem gap_pos {Scalar : Type u}
    [Preorder Scalar] [Zero Scalar]
    {spectrum : Set Scalar} {m : Scalar}
    (h : HasOrderedSpectralGap spectrum m) :
    0 < m := by
  exact h.1

theorem vacuum_mem {Scalar : Type u}
    [Preorder Scalar] [Zero Scalar]
    {spectrum : Set Scalar} {m : Scalar}
    (h : HasOrderedSpectralGap spectrum m) :
    spectrum 0 := by
  exact h.2.1

theorem zero_or_gap_le {Scalar : Type u}
    [Preorder Scalar] [Zero Scalar]
    {spectrum : Set Scalar} {m lam : Scalar}
    (h : HasOrderedSpectralGap spectrum m)
    (hlam : spectrum lam) :
    lam = 0 \/ m <= lam := by
  exact h.2.2 lam hlam

theorem no_spectrum_in_open_gap {Scalar : Type u}
    [Preorder Scalar] [Zero Scalar]
    {spectrum : Set Scalar} {m lam : Scalar}
    (h : HasOrderedSpectralGap spectrum m)
    (hlam : spectrum lam)
    (hpos : 0 < lam)
    (hlt : lam < m) :
    False := by
  rcases h.zero_or_gap_le hlam with hzero | hgap
  · rw [hzero] at hpos
    exact (lt_irrefl (0 : Scalar)) hpos
  · exact (not_le_of_gt hlt) hgap

theorem not_mem_open_gap {Scalar : Type u}
    [Preorder Scalar] [Zero Scalar]
    {spectrum : Set Scalar} {m lam : Scalar}
    (h : HasOrderedSpectralGap spectrum m)
    (hlam : spectrum lam) :
    Not (0 < lam /\ lam < m) := by
  intro hopen
  exact h.no_spectrum_in_open_gap hlam hopen.1 hopen.2

theorem of_subset {Scalar : Type u}
    [Preorder Scalar] [Zero Scalar]
    {spectrum smaller : Set Scalar} {m : Scalar}
    (h : HasOrderedSpectralGap spectrum m)
    (hzero : smaller 0)
    (hsub : forall lam : Scalar, smaller lam -> spectrum lam) :
    HasOrderedSpectralGap smaller m := by
  refine ⟨h.gap_pos, hzero, ?_⟩
  intro lam hlam
  exact h.zero_or_gap_le (hsub lam hlam)

end HasOrderedSpectralGap

/--
An abstract real spectral-gap predicate.

`HasRealSpectralGap spectrum m` says that the spectrum has a vacuum point at
`0`, that `m` is positive, and that every non-vacuum spectral value is at
least `m`.
-/
abbrev HasRealSpectralGap (spectrum : Set Real) (m : Real) : Prop :=
  HasOrderedSpectralGap spectrum m

namespace HasRealSpectralGap

theorem gap_pos {spectrum : Set Real} {m : Real}
    (h : HasRealSpectralGap spectrum m) :
    0 < m := by
  exact HasOrderedSpectralGap.gap_pos h

theorem vacuum_mem {spectrum : Set Real} {m : Real}
    (h : HasRealSpectralGap spectrum m) :
    spectrum 0 := by
  exact HasOrderedSpectralGap.vacuum_mem h

theorem zero_or_gap_le {spectrum : Set Real} {m lam : Real}
    (h : HasRealSpectralGap spectrum m)
    (hlam : spectrum lam) :
    lam = 0 \/ m <= lam := by
  exact HasOrderedSpectralGap.zero_or_gap_le h hlam

theorem no_spectrum_in_open_gap {spectrum : Set Real} {m lam : Real}
    (h : HasRealSpectralGap spectrum m)
    (hlam : spectrum lam)
    (hpos : 0 < lam)
    (hlt : lam < m) :
    False := by
  exact HasOrderedSpectralGap.no_spectrum_in_open_gap h hlam hpos hlt

theorem not_mem_open_gap {spectrum : Set Real} {m lam : Real}
    (h : HasRealSpectralGap spectrum m)
    (hlam : spectrum lam) :
    Not (0 < lam /\ lam < m) := by
  intro hopen
  exact h.no_spectrum_in_open_gap hlam hopen.1 hopen.2

theorem spectrum_value_zero_or_above_gap {spectrum : Set Real} {m lam : Real}
    (h : HasRealSpectralGap spectrum m)
    (hlam : spectrum lam) :
    lam = 0 \/ m <= lam := by
  exact h.zero_or_gap_le hlam

theorem of_subset {spectrum smaller : Set Real} {m : Real}
    (h : HasRealSpectralGap spectrum m)
    (hzero : smaller 0)
    (hsub : forall lam : Real, smaller lam -> spectrum lam) :
    HasRealSpectralGap smaller m := by
  exact HasOrderedSpectralGap.of_subset h hzero hsub

end HasRealSpectralGap

/--
A fixed-lattice spectral certificate at the level of real spectral data.

This is not yet the Yang--Mills finite-lattice estimate itself; it is the
formal target that such an estimate must instantiate.
-/
structure YMFixedLatticeRealSpectralGap where
  spectrum : Set Real
  gap : Real
  has_gap : HasRealSpectralGap spectrum gap

namespace YMFixedLatticeRealSpectralGap

theorem positive_gap (C : YMFixedLatticeRealSpectralGap) :
    0 < C.gap := by
  exact C.has_gap.gap_pos

theorem vacuum_in_spectrum (C : YMFixedLatticeRealSpectralGap) :
    C.spectrum 0 := by
  exact C.has_gap.vacuum_mem

theorem no_subgap_spectrum (C : YMFixedLatticeRealSpectralGap)
    {lam : Real}
    (hlam : C.spectrum lam)
    (hpos : 0 < lam)
    (hlt : lam < C.gap) :
    False := by
  exact C.has_gap.no_spectrum_in_open_gap hlam hpos hlt

theorem spectral_values_are_vacuum_or_above_gap
    (C : YMFixedLatticeRealSpectralGap)
    {lam : Real}
    (hlam : C.spectrum lam) :
    lam = 0 \/ C.gap <= lam := by
  exact C.has_gap.spectrum_value_zero_or_above_gap hlam

end YMFixedLatticeRealSpectralGap

/--
Uniform fixed-lattice spectral data over a family of finite lattice volumes.

The same positive `gap` is required for every volume in the family. This is
the Lean target corresponding to the finite-volume uniformity needed before
continuum transport.
-/
structure YMUniformFixedLatticeRealSpectralGap where
  Volume : Type
  spectrum : Volume -> Set Real
  gap : Real
  has_gap : forall V : Volume, HasRealSpectralGap (spectrum V) gap

namespace YMUniformFixedLatticeRealSpectralGap

theorem positive_gap (C : YMUniformFixedLatticeRealSpectralGap)
    (V : C.Volume) :
    0 < C.gap := by
  exact (C.has_gap V).gap_pos

theorem vacuum_in_each_spectrum
    (C : YMUniformFixedLatticeRealSpectralGap)
    (V : C.Volume) :
    C.spectrum V 0 := by
  exact (C.has_gap V).vacuum_mem

theorem no_subgap_spectrum
    (C : YMUniformFixedLatticeRealSpectralGap)
    (V : C.Volume)
    {lam : Real}
    (hlam : C.spectrum V lam)
    (hpos : 0 < lam)
    (hlt : lam < C.gap) :
    False := by
  exact (C.has_gap V).no_spectrum_in_open_gap hlam hpos hlt

theorem spectral_values_are_vacuum_or_above_gap
    (C : YMUniformFixedLatticeRealSpectralGap)
    (V : C.Volume)
    {lam : Real}
    (hlam : C.spectrum V lam) :
    lam = 0 \/ C.gap <= lam := by
  exact (C.has_gap V).spectrum_value_zero_or_above_gap hlam

def fixed_volume_certificate
    (C : YMUniformFixedLatticeRealSpectralGap)
    (V : C.Volume) :
    YMFixedLatticeRealSpectralGap where
  spectrum := C.spectrum V
  gap := C.gap
  has_gap := C.has_gap V

end YMUniformFixedLatticeRealSpectralGap

end YangMills
end Papers
end MaleyLean
