BEGIN ~NORPAMOD~

IF ~NumTimesTalkedTo(0)
Dead("HQEVMOD")~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~GivePartyGold(5000)
GiveItemCreate("HAL02",Player1,0,0,0)
CreateCreature("KDMOD",[578.810],0)
Wait(3)
ActionOverride("KDMOD",StartDialogue("KDMOD",Player1))~ UNSOLVED_JOURNAL @4 EXIT
END
