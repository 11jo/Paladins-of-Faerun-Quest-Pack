BEGIN ~XGBRMOC~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~RevealAreaOnMap("PF0018")
Wait(2)
ForceSpell(Player2,DRYAD_TELEPORT)
ForceSpell(Player3,DRYAD_TELEPORT)
ForceSpell(Player4,DRYAD_TELEPORT)
ForceSpell(Player5,DRYAD_TELEPORT)
ForceSpell(Player6,DRYAD_TELEPORT)
ActionOverride(Player2,LeaveAreaLUA("PF0720","",[1034.643],0))
ActionOverride(Player3,LeaveAreaLUA("PF0720","",[1144.720],0))
ActionOverride(Player4,LeaveAreaLUA("PF0720","",[956.718],0))
ActionOverride(Player5,LeaveAreaLUA("PF0720","",[1054.796],0))
ActionOverride(Player6,LeaveAreaLUA("PF0720","",[1048.737],0))
Wait(2)
~ GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN REPLY @7 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~~ THEN DO ~Enemy()
~ UNSOLVED_JOURNAL @9 EXIT
END
