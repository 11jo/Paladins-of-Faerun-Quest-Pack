BEGIN ~XGBG1~ 4

IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("XGBG1",LastTalkedToBy(Myself))
~ EXIT
  IF ~~ THEN REPLY @3 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("ZATMOD")~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 DO ~SetNumTimesTalkedTo(1)
~ EXIT
END
