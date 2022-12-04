BEGIN ~XGNASHR~

IF ~Global("s#XGNASHR","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN  GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @9
  IF ~~ THEN REPLY @10 DO ~SetGlobal("s#XGNASHR","GLOBAL",1)~ UNSOLVED_JOURNAL @11 EXIT
END

IF ~Global("s#XGNASHR","GLOBAL",1)
Dead("XGLUSC")~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN DO ~AddexperienceParty(10000)
SetGlobal("s#XGNASHR","GLOBAL",2)~ UNSOLVED_JOURNAL @13 EXIT
END

IF ~Global("s#XGNASHR","GLOBAL",1)
!Dead("XGLUSC")~ THEN BEGIN 7
  SAY @14
  IF ~~ THEN EXIT
END

IF ~Global("s#XGNASHR","GLOBAL",2)
Dead("XGluswz")~ THEN BEGIN 8
  SAY @15
  IF ~~ THEN DO ~AddexperienceParty(10000)
GiveItemCreate("FALX06",Player1,1,0,0)
SetGlobal("s#XGNASHR","GLOBAL",3)
TakePartyItem("LUSWQMOD")
ActionOverride(Player1,LeaveAreaLUA("PF0148","",[530.420],13))
ActionOverride(Player2,LeaveAreaLUA("PF0148","",[470.470],12))
ActionOverride(Player3,LeaveAreaLUA("PF0148","",[510.550],12))
ActionOverride(Player4,LeaveAreaLUA("PF0148","",[425.510],12))
ActionOverride(Player5,LeaveAreaLUA("PF0148","",[455.600],12))
ActionOverride(Player6,LeaveAreaLUA("PF0148","",[380.570],12))~ UNSOLVED_JOURNAL @16 EXIT
END

IF ~Global("s#XGNASHR","GLOBAL",2)
!Dead("XGluswz")~ THEN BEGIN 9
  SAY @17
  IF ~~ THEN EXIT
END

IF ~Global("s#XGNASHR","GLOBAL",3)
Dead("XGARDES")~ THEN BEGIN 10
  SAY @18
  IF ~~ THEN REPLY @19 DO ~AddexperienceParty(10000)
    GivePartyGold(3000)
SetGlobal("s#XGNASHR","GLOBAL",4)~ UNSOLVED_JOURNAL @20 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @21
  IF ~~ THEN DO ~GiveItemCreate("Letlmod",Player1,0,0,0)~ EXIT
END

IF ~Global("s#XGNASHR","GLOBAL",4)
!Dead("XGLUSGC")~ THEN BEGIN 12
  SAY @22
  IF ~~ THEN EXIT
END

IF ~Global("s#XGNASHR","GLOBAL",4)
Dead("XGLUSGC")~ THEN BEGIN 13
  SAY @23
  IF ~~ THEN REPLY @24  DO ~AddexperienceParty(12000)
    GivePartyGold(5000)
SetGlobal("s#XGNASHR","GLOBAL",5) 
EraseJournalEntry(@11)
EraseJournalEntry(@13)
EraseJournalEntry(@16)
EraseJournalEntry(@20)~ 
SOLVED_JOURNAL @25 GOTO 14

END

IF ~~ THEN BEGIN 14
  SAY @26
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("AR0020","",[160.860],9))
ActionOverride(Player2,LeaveAreaLUA("AR0020","",[270.860],0))
ActionOverride(Player3,LeaveAreaLUA("AR0020","",[400.860],0))
ActionOverride(Player4,LeaveAreaLUA("AR0020","",[150.810],0))
ActionOverride(Player5,LeaveAreaLUA("AR0020","",[260.810],0))
ActionOverride(Player6,LeaveAreaLUA("AR0020","",[390.810],0))~ EXIT
END











