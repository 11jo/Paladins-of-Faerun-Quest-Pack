BEGIN ~XGRWHM~

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
  IF ~~ THEN REPLY @8 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @16 DO ~GiveItemCreate("QI2MOD",Player1,0,0,0)
AddexperienceParty(6000)
CreateCreature("XGDW1",[3329.874],8)
CreateCreature("XGDW2",[3346.856],8)
CreateCreature("XGDW3",[3375.914],8)
ClearAllActions()
DisplayString("XGDW1",@14)
Wait(4)
DisplayString("XGRWHMN",@15)
Wait(1)
ActionOverride("XGDW1",Attack("XGRWHMN"))
ActionOverride("XGDW2",Attack("XGRW3"))
ActionOverride("XGDW3",Attack(Player1))
ActionOverride("XGRWHMN",ForceSpell("XGDW1",WIZARD_DISINTEGRATE_IGNORE_RESISTANCE))
Wait(1)
~ EXIT
END
