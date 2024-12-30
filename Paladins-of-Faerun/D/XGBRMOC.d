BEGIN ~XGBRMOC~

IF ~Global("EnteredXG1020","XG1020",2)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~
RevealAreaOnMap("XG0018")
SetGlobal("EnteredXG1020","XG1020",3)
//Wait(2)
//ForceSpell(Player2,DRYAD_TELEPORT)
//ForceSpell(Player3,DRYAD_TELEPORT)
//ForceSpell(Player4,DRYAD_TELEPORT)
//ForceSpell(Player5,DRYAD_TELEPORT)
//ForceSpell(Player6,DRYAD_TELEPORT)
//ActionOverride(Player2,LeaveAreaLUA("XG1020","",[2837.172],0))
//ActionOverride(Player3,LeaveAreaLUA("XG1020","",[2902.173],0))
//ActionOverride(Player4,LeaveAreaLUA("XG1020","",[2986.195],0))
//ActionOverride(Player5,LeaveAreaLUA("XG1020","",[3050.231],0))
//ActionOverride(Player6,LeaveAreaLUA("XG1020","",[3095.280],0))
//Wait(1)
//ActionOverride(Player2,FaceObject(Player1))
//ActionOverride(Player3,ForceSpell(Player1))
//ActionOverride(Player4,ForceSpell(Player1))
//ActionOverride(Player5,ForceSpell(Player1))
//ActionOverride(Player6,ForceSpell(Player1))
//Wait(2)
//ActionOverride(Player2,ForceSpell(Player2,HOLD_PARTY))  // SPIN863.SPL (No such index)
//ActionOverride(Player3,ForceSpell(Player3,HOLD_PARTY))  // SPIN863.SPL (No such index)
//ActionOverride(Player4,ForceSpell(Player4,HOLD_PARTY))  // SPIN863.SPL (No such index)
//ActionOverride(Player5,ForceSpell(Player5,HOLD_PARTY))  // SPIN863.SPL (No such index)
//ActionOverride(Player6,ForceSpell(Player6,HOLD_PARTY))  // SPIN863.SPL (No such index)
//Wait(2)~ GOTO 2
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
  IF ~~ THEN DO ~
AddJournalEntry(@51205,QUEST)
Enemy()~ EXIT
END

IF ~Global("EnteredXG1020","XG1020",1)~ THEN BEGIN 5
  SAY @10
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @13
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @14
  IF ~~ THEN DO ~SetGlobal("XGBRMOC_XG1020","XG1020",1)~ EXIT
END
