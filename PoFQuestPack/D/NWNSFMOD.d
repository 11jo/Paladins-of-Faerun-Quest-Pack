BEGIN ~XGNWNSF~ 4

IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("SHSFMOD",LastTalkedToBy(Myself))
~ EXIT
  IF ~~ THEN REPLY @3 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN EXIT
END
