BEGIN ~ATKIMOD~

IF ~Global("s#ATKIMOD","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN DO ~ SetGlobal("s#ATKIMOD","GLOBAL",1)
EscapeArea()~ SOLVED_JOURNAL @12 EXIT
END

IF ~~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @14 DO ~GiveItemCreate("kiitmod",Player1,0,0,0)
SetGlobal("s#ATKIMOD","GLOBAL",2)
RevealAreaOnMap("PF0040")~ UNSOLVED_JOURNAL @15 EXIT
END

IF ~Global("s#ATKIMOD","GLOBAL",2)
PartyHasItem("HQMOD")~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @17 DO ~TakePartyItem("HQMOD")~ GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @18
  IF ~~ THEN REPLY @19 GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @20
  IF ~~ THEN REPLY @21 DO ~EraseJournalEntry(@22)
EraseJournalEntry(@15)
EraseJournalEntry( @23)
EraseJournalEntry(@24)
EraseJournalEntry(@25)
RevealAreaOnMap("PF0080")
GiveItemCreate("MISC07",Player1,2000,0,0)
~ SOLVED_JOURNAL @26 EXIT
END

IF ~Global("s#ATKIMOD","GLOBAL",2)
Dead("HQMIMOD")
!PartyHasItem("HQMOD")~ THEN BEGIN 10
  SAY @27
  IF ~~ THEN REPLY @28 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @29
  IF ~~ THEN REPLY @30 GOTO 12
END

IF ~~ THEN BEGIN 12
  SAY @31
  IF ~~ THEN DO ~EraseJournalEntry(@22)
EraseJournalEntry(@15)
EraseJournalEntry( @23)
EraseJournalEntry(@32)
EraseJournalEntry(@25)
RevealAreaOnMap("PF0080")
ReputationInc(-2)~ SOLVED_JOURNAL @33 EXIT
END
