BEGIN ~XGINNKW~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("XGINNKW",LastTalkedToBy(Myself))
SetNumTimesTalkedTo(0)
~ EXIT
  IF ~~ THEN REPLY @3 DO ~SetNumTimesTalkedTo(0)
~ EXIT
END
