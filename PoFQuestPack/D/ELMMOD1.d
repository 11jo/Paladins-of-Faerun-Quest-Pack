BEGIN ~ELMMOD1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END
