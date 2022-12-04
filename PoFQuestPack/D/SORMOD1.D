BEGIN ~XGsor1~

IF ~NumTimesTalkedTo(0)
Global("s#XGTRAEK","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1 
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~ActionOverride(Player1,LeaveAreaLUA("PF0000","",[890.790],9))
ActionOverride(Player2,LeaveAreaLUA("PF0000","",[610.780],0))
ActionOverride(Player3,LeaveAreaLUA("PF0000","",[680.830],0))
ActionOverride(Player4,LeaveAreaLUA("PF0000","",[750.880],0))
ActionOverride(Player5,LeaveAreaLUA("PF0000","",[570.840],0))
ActionOverride(Player6,LeaveAreaLUA("PF0000","",[640.900],0))
~ EXIT
  IF ~~ THEN REPLY @4 DO ~SetNumTimesTalkedTo(1)~ EXIT
END

IF ~NumTimesTalkedTo(1)
Global("s#XGTRAEK","GLOBAL",0)~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @3 DO ~ActionOverride(Player1,LeaveAreaLUA("PF0000","",[890.790],9))
ActionOverride(Player2,LeaveAreaLUA("PF0000","",[610.780],0))
ActionOverride(Player3,LeaveAreaLUA("PF0000","",[680.830],0))
ActionOverride(Player4,LeaveAreaLUA("PF0000","",[750.880],0))
ActionOverride(Player5,LeaveAreaLUA("PF0000","",[570.840],0))
ActionOverride(Player6,LeaveAreaLUA("PF0000","",[640.900],0))
~ EXIT
  IF ~~ THEN REPLY @4 DO ~SetNumTimesTalkedTo(1)~ EXIT
END

IF ~Global("s#XGTRAEK","GLOBAL",1)
  !PartyHasItem("SAKMOD")~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN REPLY @7 EXIT
END

IF ~Global("s#XGTRAEK","GLOBAL",1)
  PartyHasItem("SAKMOD")~ THEN BEGIN 4
  SAY @8
  IF ~~ THEN REPLY @9 DO ~ActionOverride(Player1,LeaveAreaLUA("PF0000","",[890.790],9))
ActionOverride(Player2,LeaveAreaLUA("PF0000","",[610.780],0))
ActionOverride(Player3,LeaveAreaLUA("PF0000","",[680.830],0))
ActionOverride(Player4,LeaveAreaLUA("PF0000","",[750.880],0))
ActionOverride(Player5,LeaveAreaLUA("PF0000","",[570.840],0))
ActionOverride(Player6,LeaveAreaLUA("PF0000","",[640.900],0))
~ EXIT
  IF ~~ THEN REPLY @10 EXIT
END

IF ~Global("s#XGTRAEK","GLOBAL",2)~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN REPLY @12 EXIT
END







