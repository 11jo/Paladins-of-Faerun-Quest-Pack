BEGIN ~XGYARPN~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~
ClearAllActions()
StartCutSceneMode()
CreateCreature("XGELM2",[794.1277],0)
EndCutSceneMode()
EscapeArea()
~ EXIT
END
