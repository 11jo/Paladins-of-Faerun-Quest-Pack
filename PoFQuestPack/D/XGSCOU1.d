BEGIN ~XGSCOU1~

IF ~NumTimesTalkedTO(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~CreateCreature("XGELVWR",[4630.3091],0)
CreateCreature("XGELVWR",[4610.3091],0)
CreateCreature("XGELVWR",[4590.3091],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[2423.1765],0)
CreateCreature("XGELVWR",[1326.3226],0)
CreateCreature("XGELVWR",[4230.3091],0)
CreateCreature("XGELVWR",[4210.3091],0)
CreateCreature("XGELVWR",[4190.3091],0)
CreateCreature("XGSUELF",[4650.2990],0)
CreateCreature("XGSUELF",[4630.2990],0)
CreateCreature("XGSUELF",[2457.1638],0)
CreateCreature("XGSUELF",[2437.1638],0)
CreateCreature("XGSUELF",[2380.1638],0)
CreateCreature("XGSUELF",[2370.1638],0)
CreateCreature("XGSUELF",[2360.1638],0)
CreateCreature("XGSUELF",[1384.3216],0)
Enemy()
ClearAllActions()
StartCutSceneMode()
Wait(2)
EndCutSceneMode()
//TextScreen("SCEN1MOD")
~ EXIT
END
