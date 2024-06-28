BEGIN ~XGAMAG~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @9
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @10
  IF ~~ THEN REPLY @11 DO ~SetNumTimesTalkedTo(1) 
AddJournalEntry(@51202,QUEST)~ EXIT
  IF ~~ THEN REPLY @13 DO ~GiveItemCreate("XGMISC",Player1,0,0,0)
ActionOverride(Player2,LeaveAreaLUA("XG0053","",[2300.2250],0))
ActionOverride(Player1,LeaveAreaLUA("XG0053","",[1824.1854],0))
ActionOverride(Player3,LeaveAreaLUA("XG0053","",[2250.2350],0))
ActionOverride(Player4,LeaveAreaLUA("XG0053","",[2170.2400],0))
ActionOverride(Player5,LeaveAreaLUA("XG0053","",[2300.2400],0))
ActionOverride(Player6,LeaveAreaLUA("XG0053","",[2400.2280],0))~ EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN 7
  SAY @14
  IF ~~ THEN REPLY @13 DO ~GiveItemCreate("XGMISC",Player1,0,0,0) 
AddJournalEntry(@51202,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0053","",[2300.2250],0))
ActionOverride(Player1,LeaveAreaLUA("XG0053","",[1824.1854],0))
ActionOverride(Player3,LeaveAreaLUA("XG0053","",[2250.2350],0))
ActionOverride(Player4,LeaveAreaLUA("XG0053","",[2170.2400],0))
ActionOverride(Player5,LeaveAreaLUA("XG0053","",[2300.2400],0))
ActionOverride(Player6,LeaveAreaLUA("XG0053","",[2400.2280],0))~ EXIT
  IF ~~ THEN REPLY @15 DO ~SetNumTimesTalkedTo(1)~ EXIT
END
