BEGIN ~DRE1MOD~

IF ~True()
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~Enemy()
ActionOverride("DRE2MOD",Enemy()) 
ActionOverride("DRE3MOD",Enemy())
ActionOverride("DRE4MOD",Enemy())~ EXIT
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~CreateCreature("DRLQMOD",[5004.2175],0)
SetNumTimesTalkedTo(1)~ EXIT
END

IF ~NumTimesTalkedTo(1)
Dead("DRLQMOD")~ THEN BEGIN 5
  SAY @6
  IF ~~ THEN DO ~EscapeArea()
ActionOverride("DRE2MOD",EscapeArea())
ActionOverride("DRE3MOD",EscapeArea())
ActionOverride("DRE4MOD",EscapeArea())
ActionOverride("DWQMOD",StartDialogue("DWQMOD",Player1))~ EXIT
END
