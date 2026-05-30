import MaleyLean.Papers.RiemannHypothesis.ClassicalZeta

namespace MaleyLean
namespace Papers
namespace RiemannHypothesis

open Complex

noncomputable section

/-!
The zeta-specific bridge workbench.

This file does not prove RH.  It isolates the exact selector-fixedness theorem
that would construct `ClassicalRiemannZetaBridgeObligations` for the canonical
standing-as-zerohood interface.
-/

/--
Canonical off-line horizontal selector: a point is selected exactly when it is
a nontrivial analytic zeta zero and is not on the critical line.
-/
def canonicalOffLineHorizontalSelector (s : ℂ) : Prop :=
  classicalZetaZerohoodStanding s /\ s.re ≠ 1 / 2

/--
Canonical invariant-fixed status for the horizontal selector: the real part is
fixed at the critical-line value.
-/
def canonicalCriticalLineFixedByInvariantBundle (s : ℂ) : Prop :=
  s.re = 1 / 2

theorem canonical_selector_not_invariant_fixed :
    forall s : ℂ,
      canonicalOffLineHorizontalSelector s ->
      Not (canonicalCriticalLineFixedByInvariantBundle s) := by
  intro s hsel hfixed
  exact hsel.2 hfixed

/--
The exact hard zeta-specific sub-obligation: a standing-bearing selected
nontrivial zero must already be invariant-fixed.

With the canonical selector above, this is RH-strength.  It is the point where
a genuine proof must enter; generic AASC machinery alone cannot synthesize it.
-/
def CanonicalSelectorFixednessSubobligation : Prop :=
  forall s : ℂ,
    classicalZetaZerohoodStanding s ->
    canonicalOffLineHorizontalSelector s ->
    canonicalCriticalLineFixedByInvariantBundle s

/--
The canonical selector-fixedness sub-obligation is equivalent to mathlib's
formal `RiemannHypothesis`.
-/
theorem canonical_selector_fixedness_iff_mathlib_riemannHypothesis :
    CanonicalSelectorFixednessSubobligation <-> RiemannHypothesis := by
  constructor
  · intro hfixed s hz hnotTrivial hpole
    have hstanding : classicalZetaZerohoodStanding s :=
      ⟨⟨hnotTrivial, hpole⟩, hz⟩
    by_cases hline : s.re = 1 / 2
    · exact hline
    · exact hfixed s hstanding ⟨hstanding, hline⟩
  · intro hRH s hstanding _hselector
    exact hRH s hstanding.2 hstanding.1.1 hstanding.1.2

/--
Package the canonical selector-fixedness sub-obligation into the full
`ClassicalRiemannZetaBridgeObligations` object.
-/
def classicalZetaBridgeObligations_from_canonical_selector_fixedness
    (hfixed : CanonicalSelectorFixednessSubobligation) :
    ClassicalRiemannZetaBridgeObligations where
  Standing := classicalZetaZerohoodStanding
  horizontalSelector := canonicalOffLineHorizontalSelector
  fixedByInvariantBundle := canonicalCriticalLineFixedByInvariantBundle
  selectorKernel := by
    refine
      { standing_selector_must_be_invariant_fixed := ?_
        selector_not_fixed := ?_ }
    · intro s hstanding hselector
      exact hfixed s hstanding hselector
    · exact canonical_selector_not_invariant_fixed
  analytic_zerohood_has_standing := by
    intro s hnotTrivial hpole hzero
    exact ⟨⟨hnotTrivial, hpole⟩, hzero⟩
  off_line_support_requires_selector := by
    intro s hzero hoff
    exact ⟨hzero, hoff⟩

theorem remaining_clay_object_from_canonical_selector_fixedness
    (hfixed : CanonicalSelectorFixednessSubobligation) :
    RemainingClayLevelProofObject := by
  exact ⟨classicalZetaBridgeObligations_from_canonical_selector_fixedness hfixed⟩

end

end RiemannHypothesis
end Papers
end MaleyLean
