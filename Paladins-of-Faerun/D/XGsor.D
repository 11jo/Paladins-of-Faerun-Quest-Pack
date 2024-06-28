BEGIN ~XGsor~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetNumTimesTalkedTo(1)~ EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @1 EXIT
END
