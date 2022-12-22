BEGIN ~XGYARHM~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
Wait(4)
CreateCreature("XGUNPAL",[1814.200],0)
CreateCreature("XGUNPAL",[1957.250],0)
EndCutSceneMode()
Enemy()
~ EXIT
END
