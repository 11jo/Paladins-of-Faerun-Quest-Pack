BEGIN ~SHOPEMOD~ 2

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("SHOPEMOD",LastTalkedToBy(Myself))
~ EXIT
  IF ~~ THEN REPLY @3 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)
~ EXIT
END
