import MaleyLean.Papers.YangMills.Kernel.LoadBearingSpineManuscriptObject
import MaleyLean.Papers.YangMills.Kernel.ConstructiveManuscriptObject
import MaleyLean.Papers.YangMills.Kernel.VacuumGapManuscriptObject
import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptObject
import MaleyLean.Papers.YangMills.Kernel.ManuscriptChoicePackage

namespace MaleyLean

def YangMillsManuscriptChoicePackageOfObjects
  (SO : YMLoadBearingSpineManuscriptObject)
  (CO : YMConstructiveManuscriptObject)
  (VO : YMVacuumGapManuscriptObject)
  (EO : YMEndpointManuscriptObject) :
  YMManuscriptChoicePackage := by
  refine
    { objects :=
        { S := SO.toSpine
          RC := CO.toConstructiveRoute
          RD := VO.toVacuumGapRoute
          RE := EO.toEndpointCore }
      witnesses :=
        { hp1 := SO.hp1
          hp2 := SO.hp2
          hAroute := SO.hAroute
          htrunc := CO.htrunc
          hext := CO.hext
          hcompat := CO.hcompat
          hunion := CO.hunion
          hww := VO.hww
          hE := EO.hE
          hP := EO.hP }
      constructive_choices := ?_
      vacuum_gap_choices := ?_
      endpoint_choices := ?_ }
  · exact CO.toChoices
  · exact VO.toChoices
  · exact EO.toChoices

theorem YangMillsManuscriptChoicePackageOfObjectsStatement
  (SO : YMLoadBearingSpineManuscriptObject)
  (CO : YMConstructiveManuscriptObject)
  (VO : YMVacuumGapManuscriptObject)
  (EO : YMEndpointManuscriptObject) :
  let P := YangMillsManuscriptChoicePackageOfObjects SO CO VO EO
  P.objects.S = SO.toSpine /\
  P.objects.RC = CO.toConstructiveRoute /\
  P.objects.RD = VO.toVacuumGapRoute /\
  P.objects.RE = EO.toEndpointCore /\
  P.witnesses.hp1 = SO.hp1 /\
  P.witnesses.hp2 = SO.hp2 /\
  P.witnesses.hAroute = SO.hAroute /\
  P.witnesses.htrunc = CO.htrunc /\
  P.witnesses.hext = CO.hext /\
  P.witnesses.hcompat = CO.hcompat /\
  P.witnesses.hunion = CO.hunion /\
  P.witnesses.hww = VO.hww /\
  P.witnesses.hE = EO.hE /\
  P.witnesses.hP = EO.hP /\
  ym_constructive_DeltaMax_of P.constructive_choices = CO.DeltaMax /\
  ym_vacuum_transport_of P.vacuum_gap_choices = VO.transport /\
  ym_endpoint_Omega_loc_of P.endpoint_choices = EO.Omega_loc := by
  dsimp [YangMillsManuscriptChoicePackageOfObjects]
  exact
    And.intro rfl <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl <|
                    And.intro rfl <|
                      And.intro rfl <|
                        And.intro rfl <|
                          And.intro rfl <|
                            And.intro rfl <|
                              And.intro rfl <|
                                And.intro rfl <|
                                  And.intro rfl rfl

end MaleyLean
