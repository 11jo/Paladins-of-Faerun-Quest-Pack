BEGIN ~XGprc1~

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 2
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~
TakePartyItem("XGartk1")
CreateCreatureDoor("XGPR",[828.1472],10)
CreateCreatureDoor("XGPR",[757.1123],0)
CreateCreatureDoor("XGNIN",[982.1133],0)
CreateCreatureDoor("XGNIN",[1100.1244],4)
CreateCreatureDoor("XGNIN",[1191.1331],4)
CreateCreatureDoor("XGNIN",[1089.1439],0)
Enemy()
AddJournalEntry(@50706,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~TakePartyItem("XGartk1")
StartCutScene("XGBAT")
EscapeArea()~ EXIT
END
