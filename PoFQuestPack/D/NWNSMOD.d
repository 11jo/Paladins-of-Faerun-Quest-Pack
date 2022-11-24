BEGIN ~NWNSMOD~ 2

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 DO ~StartStore("NWNSMOD",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~StartStore("NWNSMOD",LastTalkedToBy(Myself))
~ EXIT
  IF ~~ THEN REPLY @7 GOTO 1
END
