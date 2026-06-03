import MaleyLean.Papers.YangMills.SourceCrosswalk.Register

namespace MaleyLean

/--
Kernel-facing reading order for the hardened Yang--Mills manuscript.

This file records the compressed expert-reading routes stated explicitly in the
proof kernel: the short mass-gap route, the Lane~A constructive route, and the
three first-pass attack locations.
-/
inductive YMReadingTrack
  | shortMassGapCompression
  | constructiveLaneA
  | firstPassAttack
  deriving DecidableEq, Repr

inductive YMAttackPoint
  | ultravioletPublicScopeGate
  | finiteCapToInductiveUnionSeam
  | qe3TransportSeam
  deriving DecidableEq, Repr

def ym_reading_track_packets (r : YMReadingTrack) : List YMPacket :=
  match r with
  | .shortMassGapCompression =>
      [ .packet1UVGate
      , .packet2Entrance
      , .packet3FixedLatticeGap
      , .packet8QE3Transport
      , .packet9Reconstruction
      , .packet10Endpoint
      ]
  | .constructiveLaneA =>
      [ .packet4FlowedState
      , .packet5FiniteTruncation
      , .packet6FiniteCapClosure
      , .packet7Cyclicity
      ]
  | .firstPassAttack =>
      [ .packet1UVGate
      , .packet6FiniteCapClosure
      , .packet8QE3Transport
      ]

def ym_attack_point_title (a : YMAttackPoint) : String :=
  match a with
  | .ultravioletPublicScopeGate =>
      "Ultraviolet/public-scope gate"
  | .finiteCapToInductiveUnionSeam =>
      "Finite-cap to inductive-union Lane A seam"
  | .qe3TransportSeam =>
      "QE3 transport seam"

def ym_attack_point_packets (a : YMAttackPoint) : List YMPacket :=
  match a with
  | .ultravioletPublicScopeGate =>
      [ .packet1UVGate
      , .packet2Entrance
      , .packet3FixedLatticeGap
      ]
  | .finiteCapToInductiveUnionSeam =>
      [ .packet6FiniteCapClosure
      , .packet7Cyclicity
      ]
  | .qe3TransportSeam =>
      [ .packet8QE3Transport ]

def ym_attack_point_seams (a : YMAttackPoint) : List YMSeamNode :=
  match a with
  | .ultravioletPublicScopeGate =>
      [ .weakWindowCertificateNode ]
  | .finiteCapToInductiveUnionSeam =>
      [ .mixedCorrelatorClosureNode
      , .finiteCapPositiveUnitalBridge
      , .finiteCapSharpLocalOSNode
      , .boundedStateRestrictionCompatibilityNode
      , .inductiveUnionPassageNode
      , .boundedBaseCyclicityNode
      ]
  | .qe3TransportSeam =>
      [ .graphCoreHandoffNode
      , .continuumGapTransportNode
      ]

theorem YangMillsKernelReadingOrderStatement :
  ym_reading_track_packets .shortMassGapCompression =
    [ .packet1UVGate
    , .packet2Entrance
    , .packet3FixedLatticeGap
    , .packet8QE3Transport
    , .packet9Reconstruction
    , .packet10Endpoint
    ] /\
  ym_reading_track_packets .constructiveLaneA =
    [ .packet4FlowedState
    , .packet5FiniteTruncation
    , .packet6FiniteCapClosure
    , .packet7Cyclicity
    ] /\
  ym_reading_track_packets .firstPassAttack =
    [ .packet1UVGate
    , .packet6FiniteCapClosure
    , .packet8QE3Transport
    ] := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsAttackPointPacketStatement :
  ym_attack_point_packets .ultravioletPublicScopeGate =
    [ .packet1UVGate, .packet2Entrance, .packet3FixedLatticeGap ] /\
  ym_attack_point_packets .finiteCapToInductiveUnionSeam =
    [ .packet6FiniteCapClosure, .packet7Cyclicity ] /\
  ym_attack_point_packets .qe3TransportSeam =
    [ .packet8QE3Transport ] := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsAttackPointSeamStatement :
  ym_attack_point_seams .ultravioletPublicScopeGate =
    [ .weakWindowCertificateNode ] /\
  ym_attack_point_seams .finiteCapToInductiveUnionSeam =
    [ .mixedCorrelatorClosureNode
    , .finiteCapPositiveUnitalBridge
    , .finiteCapSharpLocalOSNode
    , .boundedStateRestrictionCompatibilityNode
    , .inductiveUnionPassageNode
    , .boundedBaseCyclicityNode
    ] /\
  ym_attack_point_seams .qe3TransportSeam =
    [ .graphCoreHandoffNode
    , .continuumGapTransportNode
    ] := by
  exact And.intro rfl <| And.intro rfl rfl

theorem YangMillsReadingOrderCrosswalkStatement :
  ym_packet_source_labels .packet8QE3Transport =
      ["III.18", "F.211", "F.212", "F.213", "F.214", "F.216", "F.5"] /\
  ym_seam_source_label? .continuumGapTransportNode = some "F.216" /\
  ym_seam_source_label? .weakWindowCertificateNode = some "F.298" := by
  exact And.intro rfl <| And.intro rfl rfl

end MaleyLean
