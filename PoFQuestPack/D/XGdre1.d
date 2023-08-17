BEGIN ~XGdre1~

IF ~True()
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~Enemy()
ActionOverride("XGdre2",Enemy()) 
ActionOverride("XGdre3",Enemy())
ActionOverride("XGdre4",Enemy())~ EXIT
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~CreateCreature("XGdrlq",[5004.2175],0)
SetNumTimesTalkedTo(1)~ EXIT
END

IF ~NumTimesTalkedTo(1)
Dead("XGdrlq")~ THEN BEGIN 5
  SAY @6
  IF ~~ THEN DO ~ActionOverride("XGdre2",EscapeArea())
ActionOverride("XGdre3",EscapeArea())
ActionOverride("XGdre4",EscapeArea())
ActionOverride("XGdwq",StartDialogue("XGdwq",Player1))
EscapeArea()~ EXIT
END
