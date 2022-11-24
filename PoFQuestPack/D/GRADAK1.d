BEGIN ~GRADAK1~

IF ~See(Player1)
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN DO ~Enemy()
Wait(10)
CreateCreature("JARMOD",[2755.1558],6)
CreateCreature("Drw1mod",[2754.1516],0)
CreateCreature("Drw2mod",[2707.1518],0)
DisplayStringHead("JARMOD",@2)
Wait(4)
DisplayStringHead("GRADAK1",@3)
Wait(3)
ForceSpell("GRADAK1",DRYAD_TELEPORT)
ForceSpell("JARMOD",DRYAD_TELEPORT)
~ EXIT
END
