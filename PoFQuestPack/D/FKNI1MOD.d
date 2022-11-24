BEGIN ~FKNI1MOD~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~~ THEN REPLY @10 DO ~ClearAllActions()
CreateCreature("knwizmod",[2536.538],0)
ClearAllActions()
Wait(1)
DisplayString("FKNI1MOD",@9)
Wait(1)
ForceSpell("FKNI1MOD",DRYAD_TELEPORT)
ForceSpell("knwizmod",DRYAD_TELEPORT)
Wait(1)
CreateCreature("AJANMODB",[582.2006],0)
~ EXIT
END
