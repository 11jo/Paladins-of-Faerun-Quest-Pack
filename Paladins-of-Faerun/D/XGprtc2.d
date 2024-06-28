BEGIN ~XGprtc2~

IF ~Global("s#XGprtc2","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~SetGlobal("s#XGprtc2","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 DO ~RevealAreaOnMap("XG0084") 
SetGlobal("s#XGprtc2","GLOBAL",2)
GiveItemCreate("XGprt",Player1,0,0,0)
AddJournalEntry(@50433,QUEST)~ EXIT
END

IF ~Global("s#XGprtc2","GLOBAL",1)~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 2
  IF ~~ THEN REPLY @12 EXIT
END

IF ~Global("s#XGprtc2","GLOBAL",2)
!PartyHasItem("XGqit")~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN REPLY @14 EXIT
END

IF ~Global("s#XGprtc2","GLOBAL",2)
PartyHasItem("XGqit")~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @15 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @17 DO ~GiveItemCreate("XGIK06",Player1,0,0,0)
AddexperienceParty(5000)
TakePartyItem("XGqit")
EraseJournalEntry(@50433)
EraseJournalEntry(@50434)
GiveItemCreate("BOOK03",Player1,0,0,0)
EraseJournalEntry(@50404)
EraseJournalEntry(@50403)
EraseJournalEntry(@50430)
EraseJournalEntry(@50414)
EraseJournalEntry(@50413)
EraseJournalEntry(@50427)
EraseJournalEntry(@50412)
EraseJournalEntry(@50428)
AddJournalEntry(@50435,QUEST_DONE)
EscapeArea()
~ EXIT
  IF ~~ THEN REPLY @20 DO ~GiveItemCreate("XGIK06",Player1,0,0,0)
AddexperienceParty(5000)
TakePartyItem("XGqit")
EraseJournalEntry(@50433)
EraseJournalEntry(@50434)
GiveItemCreate("BOOK06",Player1,0,0,0)
EraseJournalEntry(@50404)
EraseJournalEntry(@50403)
EraseJournalEntry(@50430)
EraseJournalEntry(@50414)
EraseJournalEntry(@50413)
EraseJournalEntry(@50427)
EraseJournalEntry(@50412)
EraseJournalEntry(@50428)
AddJournalEntry(@50435,QUEST_DONE)
EscapeArea()
~ EXIT
  IF ~~ THEN REPLY @21 DO ~GiveItemCreate("XGIK06",Player1,0,0,0)
AddexperienceParty(5000)
TakePartyItem("XGqit")
EraseJournalEntry(@50433)
EraseJournalEntry(@50434)
GiveItemCreate("BOOK08",Player1,0,0,0)
EraseJournalEntry(@50404)
EraseJournalEntry(@50403)
EraseJournalEntry(@50430)
EraseJournalEntry(@50414)
EraseJournalEntry(@50413)
EraseJournalEntry(@50427)
EraseJournalEntry(@50412)
EraseJournalEntry(@50428)
AddJournalEntry(@50435,QUEST_DONE)
EscapeArea()
~ EXIT
END
