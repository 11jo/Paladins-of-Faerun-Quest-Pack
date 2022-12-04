BEGIN ~XGTYRL~ 2

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN DO ~StartStore("XGTYRL",LastTalkedToBy(Myself))
SetNumTimesTalkedTo(0)
~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)
~ EXIT
END
