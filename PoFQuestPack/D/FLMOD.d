BEGIN ~FLMOD~

IF ~See(Player1)
NumTimestalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 DO ~Enemy()
    HideAreaOnMap("PF0078")
    EraseJournalEntry(@3)  
    EraseJournalEntry(@4)  
    EraseJournalEntry(@5)  
    EraseJournalEntry(@6) ~ 
SOLVED_JOURNAL @7 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @8
  IF ~~ THEN REPLY @9 DO ~StartCutSceneMode()
BattleSong()
HideAreaOnMap("PF0076")
RevealAreaOnMap("PF0078")
CreateCreature("TMER7MOD",[1330.171],14)
CreateCreature("TMER8MOD",[1327.255],14)
CreateCreature("TMER9MOD",[1328.319],14)
CreateCreature("TASSMOD",[1357.268],14)
ActionOverride(Player1,MoveToPoint([1463.329]))
Wait(5)
DisplayStringHead("TASSMOD",@10)
EndCutSceneMode()~ 
UNSOLVED_JOURNAL @11 EXIT
END
