import MaleyLean.Papers.YangMills.Kernel.NamedManuscriptTheoremFamilies

namespace MaleyLean

/--
Named-theorem reflection for the core paper itself. This records the named core
theorem entries, their owners and source anchors, together with the repaired
direct core theorem content.
-/
def ym_core_named_theorem_reflection
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) : Prop :=
  ym_verbatim_theorem_owner .compactSimpleA1UltravioletGate =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .publicGroupScopeExport =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .oneShotEntranceAtBoundedPhysicalScale =
      .ultravioletGateAndRoute1 /\
    ym_verbatim_theorem_owner .tunedFullFixedLatticeOSGap =
      .ultravioletGateAndRoute1 /\
    ym_source_labels .compactSimpleA1UltravioletGate = ["N.20"] /\
    ym_source_labels .publicGroupScopeExport = ["N.21"] /\
    ym_source_labels .oneShotEntranceAtBoundedPhysicalScale =
      ["F.3", "F.317", "F.318"] /\
    ym_source_labels .tunedFullFixedLatticeOSGap = ["F.4", "F.308"] /\
    ym_core_manuscript_theorem_statement S RC RD RE

structure YMNamedCoreTheoremReflection
    (S : YMLoadBearingSpine)
    (RC : YMConstructiveRoute)
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  core_reflection : ym_core_named_theorem_reflection S RC RD RE

def YangMillsNamedCoreTheoremReflectionData
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  YMNamedCoreTheoremReflection S RC RD RE := by
  have hcore :=
    (YangMillsNamedManuscriptTheoremFamiliesData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP).core_statement
  exact
    { core_reflection :=
        And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <|
          And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl
            hcore }

theorem YangMillsNamedCoreTheoremReflectionExportStatement
  (S : YMLoadBearingSpine)
  (RC : YMConstructiveRoute)
  (RD : YMVacuumGapRoute)
  (RE : YMEndpointCore)
  (hp1 : S.packet1_uv_gate)
  (hp2 : S.packet2_entrance)
  (hAroute : ym_public_scope_route S)
  (htrunc : RC.finite_truncation_ready)
  (hext : RC.finite_cap_extension_ready)
  (hcompat : RC.bounded_state_compatibility_ready)
  (hunion : RC.inductive_union_ready)
  (hww : RD.weak_window_certificate_ready)
  (hE : RE.euclidean_dossier_ready)
  (hP : RE.endpoint_packet_ready) :
  Nonempty (YMNamedCoreTheoremReflection S RC RD RE) /\
  ym_core_named_theorem_reflection S RC RD RE := by
  let A :=
    YangMillsNamedCoreTheoremReflectionData
      S RC RD RE hp1 hp2 hAroute htrunc hext hcompat hunion hww hE hP
  exact And.intro ⟨A⟩ A.core_reflection

end MaleyLean
