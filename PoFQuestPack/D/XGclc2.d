BEGIN ~XGclc2~

IF ~See(Player1) Global("s#XGclc2","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN DO ~GiveItemCreate("XGHAM3",Player1,0,0,0)
SetGlobal("s#XGclc2","GLOBAL",1)
ReputationInc(-1)
AddexperienceParty(4000)~ UNSOLVED_JOURNAL @1 EXIT
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
RevealAreaOnMap("XG8200")~ UNSOLVED_JOURNAL @9 EXIT
END

IF ~Global("s#XGclc2","GLOBAL",2)
!Dead("XGhsr")~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 EXIT
END

IF ~Global("s#XGclc2","GLOBAL",2)
Dead("XGhsr")~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @12 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN  EXIT
END

IF ~Global("s#XGclc2","GLOBAL",2)
Dead("XGd1")
Dead("XGd2")
Dead("XGd3")
Dead("XGd4")~ THEN BEGIN 6
  SAY @10
  IF ~~ THEN REPLY @14 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @15
  IF ~~ THEN REPLY @16 DO ~GiveItemCreate("MISC07",Player1,3000,0,0)~
UNSOLVED_JOURNAL @17 GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @18
  IF ~~ THEN REPLY @19 DO ~GiveItemCreate("XGleths",Player1,0,0,0)
SetGlobal("s#XGclc2","GLOBAL",3)~ UNSOLVED_JOURNAL @20 EXIT
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
EraseJournalEntry(@26)
EraseJournalEntry(@27)
EraseJournalEntry(@1)
EraseJournalEntry(@9)
EraseJournalEntry(@28)
EraseJournalEntry(@29)
EraseJournalEntry(@20)
EraseJournalEntry(@17)
EscapeArea()~ 
SOLVED_JOURNAL @30 EXIT
END