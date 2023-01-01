BEGIN ~XGTARO1~

IF ~Global("s#XGTARO1","GLOBAL",0)
Global("s#XGorcki","GLOBAL",0)
!dead("XGorcki")~ THEN BEGIN 1
  SAY @0
  IF ~~ THEN REPLY @1 EXIT
END

IF ~Global("s#XGTARO1","GLOBAL",0)
Global("s#XGorcki","GLOBAL",0)
Dead("XGorcki")~ THEN BEGIN 2
  SAY @0
  IF ~~ THEN REPLY @2 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @3
  IF ~~ THEN REPLY @4 DO ~GivePartyGold(5000)~ GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @5
  IF ~~ THEN REPLY @6 DO ~SetGlobal("s#XGTARO1","GLOBAL",1)
ActionOverride(Player2,LeaveAreaLUA("XG0245","",[218.263],0))
ActionOverride(Player1,LeaveAreaLUA("XG0245","",[203.306],0))
ActionOverride(Player3,LeaveAreaLUA("XG0245","",[184.356],0))
ActionOverride(Player4,LeaveAreaLUA("XG0245","",[246.389],0))
ActionOverride(Player5,LeaveAreaLUA("XG0245","",[279.360],0))
ActionOverride(Player6,LeaveAreaLUA("XG0245","",[313.323],0))~ 
UNSOLVED_JOURNAL @7 EXIT
END

IF ~Global("s#XGTARO1","GLOBAL",0)
Global("s#XGorcki","GLOBAL",1)~ THEN BEGIN 5
  SAY @0
  IF ~~ THEN REPLY @8 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @9
  IF ~~ THEN REPLY @4 DO ~GivePartyGold(1000)~ GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @5
  IF ~~ THEN REPLY @6 DO ~SetGlobal("s#XGTARO1","GLOBAL",1)
ActionOverride(Player2,LeaveAreaLUA("XG0345","",[218.263],0))
ActionOverride(Player1,LeaveAreaLUA("XG0345","",[203.306],0))
ActionOverride(Player3,LeaveAreaLUA("XG0345","",[184.356],0))
ActionOverride(Player4,LeaveAreaLUA("XG0345","",[246.389],0))
ActionOverride(Player5,LeaveAreaLUA("XG0345","",[279.360],0))
ActionOverride(Player6,LeaveAreaLUA("XG0345","",[313.323],0))~ 
UNSOLVED_JOURNAL @7 EXIT
END

IF ~Global("s#XGTARO1","GLOBAL",1)
PArtyHasItem("XGLWLET")~ THEN BEGIN 8
  SAY @10
  IF ~~ THEN REPLY @11 DO ~TakePartyItem("XGLWLET")~ GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @12
  IF ~~ THEN REPLY @13 DO ~GivePartyGold(5000)~ GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @16
  IF ~~ THEN REPLY @17 GOTO 12
  IF ~~ THEN REPLY @18 DO ~SetGlobal("s#XGTARO1","GLOBAL",2)
//RevealAreaOnMap("XG0067")
ActionOverride(Player2,LeaveAreaLUA("XG0067","",[170.1080],0))
ActionOverride(Player1,LeaveAreaLUA("XG0067","",[250.1120],0))
ActionOverride(Player3,LeaveAreaLUA("XG0067","",[100.1100],0))
ActionOverride(Player4,LeaveAreaLUA("XG0067","",[130.1180],0))
ActionOverride(Player5,LeaveAreaLUA("XG0067","",[80.1180],0))
ActionOverride(Player6,LeaveAreaLUA("XG0067","",[30.1180],0))~ 
UNSOLVED_JOURNAL @19 EXIT
END

IF ~~ THEN BEGIN 12
  SAY @20
  IF ~~ THEN REPLY @21 
SOLVED_JOURNAL @22 GOTO 18
END

IF ~Global("s#XGTARO1","GLOBAL",1)
Dead("XGLWSE")~ THEN BEGIN 13
  SAY @10
  IF ~~ THEN REPLY @23 GOTO 14
END

IF ~~ THEN BEGIN 14
  SAY @24
  IF ~~ THEN REPLY @13 GOTO 10
END

IF ~Global("s#XGTARO1","GLOBAL",2)
!Partyhasitem("XGTGBOD")~ THEN BEGIN 15
  SAY @0
  IF ~~ THEN REPLY @1 EXIT
END

IF ~Global("s#XGTARO1","GLOBAL",2)
Partyhasitem("XGTGBOD")~ THEN BEGIN 16
  SAY @25
  IF ~~ THEN REPLY @26 DO ~TakePartyitem("XGTGBOD")~ GOTO 17
END

IF ~~ THEN BEGIN 17
  SAY @27
  IF ~~ THEN REPLY @21 
SOLVED_JOURNAL @22 GOTO 18
END

IF ~~ THEN BEGIN 18
  SAY @28
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("XG0124","",[582.230],0))
ActionOverride(Player1,LeaveAreaLUA("XG0124","",[631.326],0))
ActionOverride(Player3,LeaveAreaLUA("XG0124","",[696.337],0))
ActionOverride(Player4,LeaveAreaLUA("XG0124","",[691.386],0))
ActionOverride(Player5,LeaveAreaLUA("XG0124","",[625.392],0))
ActionOverride(Player6,LeaveAreaLUA("XG0124","",[568.396],0))
DestroySelf()~ EXIT
END

