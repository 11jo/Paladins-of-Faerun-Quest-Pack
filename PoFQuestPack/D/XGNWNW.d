BEGIN ~XGNWNW~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 DO ~EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN DO ~ReputationInc(1)
EscapeArea()~ UNSOLVED_JOURNAL @5 EXIT
END
