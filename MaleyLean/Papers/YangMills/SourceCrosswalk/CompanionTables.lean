import MaleyLean.Papers.YangMills.SourceCrosswalk.Register

namespace MaleyLean

/--
Companion-local proof-home crosswalk tables extracted from the hardened
Yang--Mills companion papers.
-/
inductive YMCompanionCrosswalkRow
  | companion1_III3
  | companion1_IV1
  | companion1_IV2
  | companion1_IV4
  | companion1_VI1
  | companion1_VI2
  | companion1_VI4
  | companion1_VI5
  | companion1_VI7
  | companion1_VI8
  | companion2_51
  | companion2_52
  | companion2_VISeam
  | companion2_53
  | companion2_54
  | companion2_55
  | companion2_56
  | companion2_57
  | companion2_58
  | companion2_59
  | companion2_VISeamBridge
  | companion2_510
  | companion2_VISeamCompatibility
  | companion2_511
  | companion2_513
  | companion3_VII1
  | companion3_VII2
  | companion3_VII3
  | companion3_VII4
  | companion3_VII5
  | companion3_VII7
  | companion3_VII8
  | companion3_VII9
  | companion3_VII10
  deriving DecidableEq, Repr

def ym_companion_crosswalk_core_label (r : YMCompanionCrosswalkRow) : String :=
  match r with
  | .companion1_III3 => "III.3"
  | .companion1_IV1 => "IV.1"
  | .companion1_IV2 => "IV.2"
  | .companion1_IV4 => "IV.4"
  | .companion1_VI1 => "VI.1"
  | .companion1_VI2 => "VI.2"
  | .companion1_VI4 => "VI.4"
  | .companion1_VI5 => "VI.5"
  | .companion1_VI7 => "VI.7"
  | .companion1_VI8 => "VI.8"
  | .companion2_51 => "5.1"
  | .companion2_52 => "5.2"
  | .companion2_VISeam => "VI seam"
  | .companion2_53 => "5.3"
  | .companion2_54 => "5.4"
  | .companion2_55 => "5.5"
  | .companion2_56 => "5.6"
  | .companion2_57 => "5.7"
  | .companion2_58 => "5.8"
  | .companion2_59 => "5.9"
  | .companion2_VISeamBridge => "VI seam bridge"
  | .companion2_510 => "5.10"
  | .companion2_VISeamCompatibility => "VI seam compatibility"
  | .companion2_511 => "5.11"
  | .companion2_513 => "5.13"
  | .companion3_VII1 => "VII.1"
  | .companion3_VII2 => "VII.2"
  | .companion3_VII3 => "VII.3"
  | .companion3_VII4 => "VII.4"
  | .companion3_VII5 => "VII.5"
  | .companion3_VII7 => "VII.7"
  | .companion3_VII8 => "VII.8"
  | .companion3_VII9 => "VII.9"
  | .companion3_VII10 => "VII.10"

def ym_companion_crosswalk_source_labels (r : YMCompanionCrosswalkRow) : List String :=
  match r with
  | .companion1_III3 => ["F.317", "F.318"]
  | .companion1_IV1 => ["F.308"]
  | .companion1_IV2 => ["III.18"]
  | .companion1_IV4 => ["F.298"]
  | .companion1_VI1 => ["F.211"]
  | .companion1_VI2 => ["F.212"]
  | .companion1_VI4 => ["F.213"]
  | .companion1_VI5 => ["F.214"]
  | .companion1_VI7 => ["F.216"]
  | .companion1_VI8 => ["F.5"]
  | .companion2_51 => ["4.92", "4.93"]
  | .companion2_52 => ["4.94"]
  | .companion2_VISeam => ["4.95"]
  | .companion2_53 => ["L.8"]
  | .companion2_54 => ["L.11"]
  | .companion2_55 => ["5.39"]
  | .companion2_56 => ["5.69"]
  | .companion2_57 => ["F.245"]
  | .companion2_58 => ["F.330A"]
  | .companion2_59 => ["F.331"]
  | .companion2_VISeamBridge => ["5.74A"]
  | .companion2_510 => ["5.74"]
  | .companion2_VISeamCompatibility => ["5.75"]
  | .companion2_511 => ["5.76"]
  | .companion2_513 => ["5.77"]
  | .companion3_VII1 => ["M.1"]
  | .companion3_VII2 => ["M.3"]
  | .companion3_VII3 => ["M.4"]
  | .companion3_VII4 => ["M.5"]
  | .companion3_VII5 => ["M.6"]
  | .companion3_VII7 => ["O.3"]
  | .companion3_VII8 => ["O.4"]
  | .companion3_VII9 => ["O.5"]
  | .companion3_VII10 => ["O.7"]

def ym_companion_crosswalk_owner (r : YMCompanionCrosswalkRow) : YMCompanion :=
  match r with
  | .companion1_III3 => .ultravioletGateAndRoute1
  | .companion1_IV1 => .ultravioletGateAndRoute1
  | .companion1_IV2 => .ultravioletGateAndRoute1
  | .companion1_IV4 => .ultravioletGateAndRoute1
  | .companion1_VI1 => .ultravioletGateAndRoute1
  | .companion1_VI2 => .ultravioletGateAndRoute1
  | .companion1_VI4 => .ultravioletGateAndRoute1
  | .companion1_VI5 => .ultravioletGateAndRoute1
  | .companion1_VI7 => .ultravioletGateAndRoute1
  | .companion1_VI8 => .ultravioletGateAndRoute1
  | .companion2_51 => .laneASharpLocalConstruction
  | .companion2_52 => .laneASharpLocalConstruction
  | .companion2_VISeam => .laneASharpLocalConstruction
  | .companion2_53 => .laneASharpLocalConstruction
  | .companion2_54 => .laneASharpLocalConstruction
  | .companion2_55 => .laneASharpLocalConstruction
  | .companion2_56 => .laneASharpLocalConstruction
  | .companion2_57 => .laneASharpLocalConstruction
  | .companion2_58 => .laneASharpLocalConstruction
  | .companion2_59 => .laneASharpLocalConstruction
  | .companion2_VISeamBridge => .laneASharpLocalConstruction
  | .companion2_510 => .laneASharpLocalConstruction
  | .companion2_VISeamCompatibility => .laneASharpLocalConstruction
  | .companion2_511 => .laneASharpLocalConstruction
  | .companion2_513 => .laneASharpLocalConstruction
  | .companion3_VII1 => .reconstructionAndUniversality
  | .companion3_VII2 => .reconstructionAndUniversality
  | .companion3_VII3 => .reconstructionAndUniversality
  | .companion3_VII4 => .reconstructionAndUniversality
  | .companion3_VII5 => .reconstructionAndUniversality
  | .companion3_VII7 => .reconstructionAndUniversality
  | .companion3_VII8 => .reconstructionAndUniversality
  | .companion3_VII9 => .reconstructionAndUniversality
  | .companion3_VII10 => .reconstructionAndUniversality

theorem YangMillsCompanion1CrosswalkExamplesStatement :
  ym_companion_crosswalk_core_label .companion1_VI1 = "VI.1" /\
  ym_companion_crosswalk_source_labels .companion1_VI1 = ["F.211"] /\
  ym_companion_crosswalk_source_labels .companion1_IV4 = ["F.298"] /\
  ym_companion_crosswalk_owner .companion1_VI7 = .ultravioletGateAndRoute1 := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsCompanion2CrosswalkExamplesStatement :
  ym_companion_crosswalk_core_label .companion2_51 = "5.1" /\
  ym_companion_crosswalk_source_labels .companion2_51 = ["4.92", "4.93"] /\
  ym_companion_crosswalk_source_labels .companion2_59 = ["F.331"] /\
  ym_companion_crosswalk_source_labels .companion2_VISeamBridge = ["5.74A"] /\
  ym_companion_crosswalk_source_labels .companion2_513 = ["5.77"] /\
  ym_companion_crosswalk_owner .companion2_510 = .laneASharpLocalConstruction := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsCompanion3CrosswalkExamplesStatement :
  ym_companion_crosswalk_core_label .companion3_VII1 = "VII.1" /\
  ym_companion_crosswalk_source_labels .companion3_VII1 = ["M.1"] /\
  ym_companion_crosswalk_source_labels .companion3_VII7 = ["O.3"] /\
  ym_companion_crosswalk_source_labels .companion3_VII9 = ["O.5"] /\
  ym_companion_crosswalk_owner .companion3_VII10 = .reconstructionAndUniversality := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl <| And.intro rfl rfl

theorem YangMillsCompanionCrosswalkAgreesWithSourceRegisterStatement :
  ym_companion_crosswalk_source_labels .companion1_VI7 = ym_source_labels .continuumVacuumGapTransport /\
  ym_companion_crosswalk_source_labels .companion2_59 = ym_source_labels .firstMixedCorrelatorClosureAtFiniteCap /\
  ym_companion_crosswalk_source_labels .companion3_VII2 = ym_source_labels .wightmanHaagKastlerReconstruction /\
  ym_companion_crosswalk_source_labels .companion3_VII9 = ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData := by
  exact And.intro rfl <| And.intro rfl <| And.intro rfl rfl

end MaleyLean
