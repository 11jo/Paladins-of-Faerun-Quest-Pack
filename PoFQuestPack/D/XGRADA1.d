BEGIN ~XGRADA1~

IF ~See(Player1)
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN DO ~Enemy()
Wait(10)
CreateCreature("XGJAR",[2755.1558],6)
CreateCreature("XGDRW1",[2754.1516],0)
CreateCreature("XGDRW2",[2707.1518],0)
DisplayStringHead("XGJAR",@2)
Wait(4)
DisplayStringHead("XGRADA1",@3)
Wait(3)
ForceSpell("XGRADA1",DRYAD_TELEPORT)
ForceSpell("XGJAR",DRYAD_TELEPORT)
~ EXIT
END
