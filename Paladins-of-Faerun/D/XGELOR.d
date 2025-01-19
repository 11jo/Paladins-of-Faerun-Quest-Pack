BEGIN ~XGELOR~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetGlobal("s#XGELOR","MYAREA",1)~ GOTO 1
  IF ~PartyHasItem("XGZAT1")~ THEN REPLY @26 GOTO 12
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
  IF ~~ THEN REPLY @7 EXIT
  IF ~~ THEN REPLY @8 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @15
  IF ~~ THEN REPLY @7 DO ~SetGlobal("s#XGELOR","MYAREA",2)~ EXIT
  IF ~~ THEN REPLY @16 DO ~
ClearAllActions()
StartCutSceneMode()
HideGUI()
FadeToColor([50.0],0)
Wait(3)
RevealAreaOnMap("XG0052")
SetGlobal("s#XGELOR","MYAREA",3)
AddJournalEntry(@52101,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0052","",[683.1902],0))
ActionOverride(Player1,LeaveAreaLUA("XG0052","",[777.1912],0))
ActionOverride(Player3,LeaveAreaLUA("XG0052","",[665.1979],0))
ActionOverride(Player4,LeaveAreaLUA("XG0052","",[683.2059],0))
ActionOverride(Player5,LeaveAreaLUA("XG0052","",[798.2015],0))
ActionOverride(Player6,LeaveAreaLUA("XG0052","",[801.1962],0))
EndCutSceneMode()~ EXIT
END

IF ~!NumTimesTalkedTo(0) Global("s#XGELOR","MYAREA",0)~ THEN BEGIN 15
  SAY @25
  IF ~~ THEN REPLY @1 DO ~SetGlobal("s#XGELOR","MYAREA",1)~ GOTO 1
END

IF ~!NumTimesTalkedTo(0) 
!Global("s#XGELOR","MYAREA",0)
GlobalLT("s#XGELOR","MYAREA",3)~ THEN BEGIN 8
  SAY @18
  IF ~Global("s#XGELOR","MYAREA",1)~ THEN REPLY @19 GOTO 4
  IF ~PartyHasItem("XGZAT1")~ THEN REPLY @26 GOTO 12
  IF ~~ THEN REPLY @7 EXIT
  IF ~Global("s#XGELOR","MYAREA",2)~ THEN REPLY @16 DO ~
ClearAllActions()
StartCutSceneMode()
HideGUI()
FadeToColor([50.0],0)
Wait(3)
RevealAreaOnMap("XG0052")
SetGlobal("s#XGELOR","MYAREA",3)
AddJournalEntry(@52101,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0052","",[683.1902],0))
ActionOverride(Player1,LeaveAreaLUA("XG0052","",[777.1912],0))
ActionOverride(Player3,LeaveAreaLUA("XG0052","",[665.1979],0))
ActionOverride(Player4,LeaveAreaLUA("XG0052","",[683.2059],0))
ActionOverride(Player5,LeaveAreaLUA("XG0052","",[798.2015],0))
ActionOverride(Player6,LeaveAreaLUA("XG0052","",[801.1962],0))
EndCutSceneMode()~ EXIT
END

IF ~Global("s#XGELOR","MYAREA",3)~ THEN BEGIN 9
  SAY @20
  IF ~PartyHasItem("XGMB")~ THEN REPLY @21 GOTO 10
  IF ~PartyHasItem("XGZAT1")~ THEN REPLY @26 GOTO 12
  IF ~!Global("s#XGELOR_XGARJUN","GLOBAL",0) !PartyHasItem("XGMB") !Global("s#XGELOR_XGZAT1","MYAREA",0)~ THEN REPLY @30 GOTO XGELORXGARJUN
  IF ~~ THEN REPLY @7 EXIT
END

IF ~~ THEN BEGIN XGELORXGARJUN
  SAY @31
  IF ~~ THEN DO ~ReputationInc(-1) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 10
  SAY @22
  IF ~~ THEN REPLY @23 DO ~EraseJournalEntry(@52101)
HideAreaOnMap("XG0052")
TakePartyItem("XGMB")
AddexperienceParty(10000)
SetGlobal("s#XGELOR","MYAREA",4)
AddJournalEntry(@52102,QUEST_DONE)
GiveItemCreate("XGSWO20",Player1,0,0,0)
~ EXIT
END

IF ~Global("s#XGELOR","MYAREA",4)
Global("s#XGELOR_XGZAT1","MYAREA",1)~ THEN BEGIN 11
  SAY @29
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12
  SAY @27
  IF ~~ THEN REPLY @28 GOTO 13
END

IF ~~ THEN BEGIN 13
  SAY @29
  IF ~~ THEN DO ~TakePartyItem("XGZAT1")
GiveItemCreate("XGZAT2",Player1,0,0,0)
SetGlobal("s#XGELOR_XGZAT1","MYAREA",1)
~ EXIT
END

IF ~Global("s#XGELOR","MYAREA",4)
Global("s#XGELOR_XGZAT1","MYAREA",0)
!PartyHasItem("XGZAT1")~ THEN BEGIN 14
  SAY @23
  IF ~~ THEN EXIT
END

IF ~Global("s#XGELOR","MYAREA",4)
PartyHasItem("XGZAT1")~ THEN BEGIN 14
  SAY @25
  IF ~~ THEN REPLY @26 GOTO 12
  IF ~~ THEN REPLY @7 EXIT
END

