BEGIN ~XGclc2~

IF ~See(Player1) Global("s#XGclc2","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN DO ~GiveItemCreate("XGHAM3",Player1,0,0,0)
SetGlobal("s#XGclc2","GLOBAL",1)
ReputationInc(-1)
AddexperienceParty(4000)
AddJournalEntry(@50417,QUEST)~ EXIT
END

IF ~Global("s#XGclc2","GLOBAL",1)~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 EXIT
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 DO ~SetGlobal("s#XGclc2","GLOBAL",2)
RevealAreaOnMap("XG8300")
AddJournalEntry(@50418,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG8200","",[258.2193],0))
ActionOverride(Player1,LeaveAreaLUA("XG8200","",[331.2240],0))
ActionOverride(Player3,LeaveAreaLUA("XG8200","",[267.2265],0))
ActionOverride(Player4,LeaveAreaLUA("XG8200","",[185.2186],0))
ActionOverride(Player5,LeaveAreaLUA("XG8200","",[143.2142],0))
ActionOverride(Player6,LeaveAreaLUA("XG8200","",[214.2097],0))
~ EXIT
END

IF ~Global("s#XGclc2","GLOBAL",2)
!Dead("XGhsr")~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 DO ~
ActionOverride(Player2,LeaveAreaLUA("XG8200","",[258.2193],0))
ActionOverride(Player1,LeaveAreaLUA("XG8200","",[331.2240],0))
ActionOverride(Player3,LeaveAreaLUA("XG8200","",[267.2265],0))
ActionOverride(Player4,LeaveAreaLUA("XG8200","",[185.2186],0))
ActionOverride(Player5,LeaveAreaLUA("XG8200","",[143.2142],0))
ActionOverride(Player6,LeaveAreaLUA("XG8200","",[214.2097],0))
~ EXIT
END

IF ~Global("s#XGclc2","GLOBAL",2)~ THEN BEGIN 4
  SAY @10
  IF ~Dead("XGhsr")~ THEN REPLY @12 GOTO 5
  IF ~Dead("XGhsr")
Dead("XGd1")
Dead("XGd2")
Dead("XGd3")
Dead("XGd4")~ THEN REPLY @14 GOTO 7
END

IF ~~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN DO ~
ActionOverride(Player2,LeaveAreaLUA("XG8200","",[258.2193],0))
ActionOverride(Player1,LeaveAreaLUA("XG8200","",[331.2240],0))
ActionOverride(Player3,LeaveAreaLUA("XG8200","",[267.2265],0))
ActionOverride(Player4,LeaveAreaLUA("XG8200","",[185.2186],0))
ActionOverride(Player5,LeaveAreaLUA("XG8200","",[143.2142],0))
ActionOverride(Player6,LeaveAreaLUA("XG8200","",[214.2097],0))
~ EXIT
END

IF ~~ THEN BEGIN 7
  SAY @15
  IF ~~ THEN REPLY @16 DO ~GiveItemCreate("MISC07",Player1,3000,0,0)
AddJournalEntry(@50419,QUEST)
HideAreaOnMap("XG8300")  // (PoF)  Montagnes du Couchant
HideAreaOnMap("XG8200")  // (PoF)  Montagnes du Couchant~ GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @18
  IF ~~ THEN REPLY @19 DO ~GiveItemCreate("XGleths",Player1,0,0,0)
SetGlobal("s#XGclc2","GLOBAL",3)
AddJournalEntry(@50420,QUEST)~ EXIT
END

IF ~Global("s#XGclc2","GLOBAL",3)
!Dead("XGptec")~ THEN BEGIN 9
  SAY @21
  IF ~~ THEN REPLY @22 EXIT
END

IF ~Global("s#XGclc2","GLOBAL",3)
Dead("XGptec")~ THEN BEGIN 10
  SAY @21
  IF ~~ THEN REPLY @23 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @24
  IF ~~ THEN REPLY @25 DO ~GiveItemCreate("MISC07",Player1,5000,0,0)
ReputationInc(-1)
AddexperienceParty(5000)
EraseJournalEntry(@50415)
EraseJournalEntry(@50411)
EraseJournalEntry(@50417)
EraseJournalEntry(@50418)
EraseJournalEntry(@50421)
EraseJournalEntry(@50422)
EraseJournalEntry(@50420)
EraseJournalEntry(@50419)
AddJournalEntry(@50423,QUEST)
EscapeArea()~ EXIT
END