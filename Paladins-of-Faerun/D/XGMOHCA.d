BEGIN ~XGMOHCA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~Ally()~ EXIT
  IF ~~ THEN REPLY @3 DO ~EscapeArea()~ EXIT
END
