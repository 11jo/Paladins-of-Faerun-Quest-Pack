BEGIN ~XGNWNB~ 4

IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 2
  IF ~~ THEN REPLY @3 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~StartStore("XGNWNB",LastTalkedToBy(Myself))
~ EXIT
END
