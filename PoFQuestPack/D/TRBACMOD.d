BEGIN ~TRBACMOD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN DO ~EscapeArea()
StartDialogueNoSet("CLC1MOD")~ EXIT
END
