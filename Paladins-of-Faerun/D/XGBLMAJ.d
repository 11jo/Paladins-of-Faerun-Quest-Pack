BEGIN ~XGBLMAJ~

IF ~Global("s#XGBLMAJ","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN REPLY @7 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN REPLY @13 DO ~SetGlobal("s#XGBLMAJ","GLOBAL",1)
AddJournalEntry(@51204,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0420","",[463.410],8))
ActionOverride(Player1,LeaveAreaLUA("XG0420","",[440.438],8))
ActionOverride(Player3,LeaveAreaLUA("XG0420","",[508.462],8))
ActionOverride(Player4,LeaveAreaLUA("XG0420","",[499.492],8))
ActionOverride(Player5,LeaveAreaLUA("XG0420","",[569.473],8))
ActionOverride(Player6,LeaveAreaLUA("XG0420","",[614.435],8))~ EXIT
END

IF ~Global("s#XGBLMAJ","GLOBAL",1)
PartyHasItem("XGMRBO")~ THEN BEGIN 7
  SAY @15
  IF ~~ THEN REPLY @16 DO ~SetGlobal("s#XGBLMAJ","GLOBAL",2)~ GOTO 9
END

IF ~Global("s#XGBLMAJ","GLOBAL",1)
!PartyHasItem("XGMRBO")~ THEN BEGIN 8
  SAY @17
  IF ~~ THEN EXIT
END

IF ~Global("s#XGBLMAJ","GLOBAL",2)~ THEN BEGIN 9
  SAY @18 
  IF ~~ THEN REPLY @19 GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @20
  IF ~~ THEN REPLY @21 GOTO 11
  IF ~~ THEN REPLY @22 GOTO 12
END

IF ~~ THEN BEGIN 11
  SAY @23
  IF ~~ THEN REPLY @24 DO ~SetGlobal("s#XGBLMAJ","GLOBAL",3)
GiveItemCreate("XGBGSD",Player1,0,0,0)
TakePartyItem("XGMRBO")
GiveItemCreate("MISC07",Player1,5000,0,0)
AddJournalEntry(@50801,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG1220","",[680.1318],0))
ActionOverride(Player1,LeaveAreaLUA("XG1220","",[727.1309],0))
ActionOverride(Player3,LeaveAreaLUA("XG1220","",[665.1288],0))
ActionOverride(Player4,LeaveAreaLUA("XG1220","",[699.1256],0))
ActionOverride(Player5,LeaveAreaLUA("XG1220","",[755.1246],0))
ActionOverride(Player6,LeaveAreaLUA("XG1220","",[770.1300],0))
~ EXIT
END

IF ~~ THEN BEGIN 12
  SAY @26
  IF ~~ THEN DO ~TakePartyItem("XGMRBO")
SetGlobal("s#XGBLMAJ","GLOBAL",4)
EscapeArea()~ EXIT
END











