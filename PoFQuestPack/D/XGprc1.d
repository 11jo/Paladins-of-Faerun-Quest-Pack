BEGIN ~XGprc1~

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 2
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~FadeToColor([5.0],0)
TakePartyItem("XGartk1")
Wait(2)
CreateCreature("XGPR",[828.1472],10)
CreateCreature("XGPR",[757.1123],0)
CreateCreature("XGNIN",[982.1133],0)
CreateCreature("XGNIN",[1100.1244],4)
CreateCreature("XGNIN",[1191.1331],4)
CreateCreature("XGNIN",[1089.1439],0)
Enemy()~ UNSOLVED_JOURNAL @4 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~TakePartyItem("XGartk1")
StartCutScene("XGBAT")
EscapeArea()~ EXIT
END
