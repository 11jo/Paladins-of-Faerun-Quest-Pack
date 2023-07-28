BEGIN ~XGATKI~

IF ~Global("s#XGATKI","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN REPLY @9 GOTO 6
  IF ~~ THEN REPLY @10 GOTO 5 
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN DO ~ SetGlobal("s#XGATKI","GLOBAL",1) AddJournalEntry(@50005,QUEST_DONE) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @14 DO ~GiveItemCreate("XGKIIT",Player1,0,0,0)
SetGlobal("s#XGATKI","GLOBAL",2)
RevealAreaOnMap("XG0040") AddJournalEntry(@50000,QUEST)~ EXIT
END

IF ~Global("s#XGATKI","GLOBAL",2)
PartyHasItem("XGhq")~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @17 DO ~TakePartyItem("XGhq")~ GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @18
  IF ~~ THEN REPLY @19 GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @20
  IF ~~ THEN REPLY @21 DO ~EraseJournalEntry(@49001)
EraseJournalEntry(@50000)
EraseJournalEntry(@50001)
EraseJournalEntry(@50006)
EraseJournalEntry(@50007)
RevealAreaOnMap("XG0080")
GiveItemCreate("MISC07",Player1,2000,0,0)
AddJournalEntry(@50008,QUEST_DONE)~ EXIT
END

IF ~Global("s#XGATKI","GLOBAL",2)
Dead("XGhqmi")
!PartyHasItem("XGhq")~ THEN BEGIN 10
  SAY @27
  IF ~~ THEN REPLY @28 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @29
  IF ~~ THEN REPLY @30 GOTO 12
END

IF ~~ THEN BEGIN 12
  SAY @31
  IF ~~ THEN DO ~EraseJournalEntry(@49001)
EraseJournalEntry(@50000)
EraseJournalEntry( @50001)
EraseJournalEntry(@50006)
EraseJournalEntry(@50007)
RevealAreaOnMap("XG0080")
ReputationInc(-2)
AddJournalEntry(@50009,QUEST_DONE)~ EXIT
END
