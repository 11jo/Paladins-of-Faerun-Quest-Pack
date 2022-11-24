BEGIN ~LOVTMOD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END
