BEGIN ~XGESSP~

IF ~See(Player1)
NumTimesTalkeDTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~See(Player1)
NumTimesTalkeDTo(1)~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN DO ~SetNumTimesTalkedTo(2)
~ EXIT
END

IF ~See(Player1)
NumTimesTalkeDTo(2)~ THEN BEGIN 2
  SAY @3
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)
~ EXIT
END
