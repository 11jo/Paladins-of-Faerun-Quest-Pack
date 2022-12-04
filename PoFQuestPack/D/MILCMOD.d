BEGIN ~XGMILC~

IF ~NumTimesTalkeDto(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~SetNumTimesTalkedTo(0)
~ EXIT
  IF ~~ THEN REPLY @3 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN REPLY @5 DO ~SetNumTimesTalkedTo(0)
~ EXIT
  IF ~~ THEN REPLY @6 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @9
  IF ~~ THEN REPLY @11 DO ~GiveItemCreate("SW1H09",Player1,0,0,0)
GiveItemCreate("PLAT02",Player1,0,0,0)
GiveItemCreate("ZATMOD",Player1,0,0,0)
~ UNSOLVED_JOURNAL @10 EXIT
END

IF ~PartyHasItem("ZAT5MOD")~ THEN BEGIN 4
  SAY @12
  IF ~~ THEN REPLY @13 GOTO 6
END

IF ~PartyHasItem("ZAT6MOD")~ THEN BEGIN 5
  SAY @12
  IF ~~ THEN REPLY @14 GOTO 7
END

IF ~~ THEN BEGIN 6
  SAY @15
  IF ~~ THEN REPLY @21 DO ~SetNumTimesTalkedTo(2)
TakePartyItem("ZAT5MOD")
EraseJournalEntry(@10)
EraseJournalEntry(@17)
EraseJournalEntry(@18)
EraseJournalEntry(@19)
EraseJournalEntry(@20)
GiveItemCreate("MISC07",Player1,5000,0,0)
~ SOLVED_JOURNAL @16 EXIT
  IF ~~ THEN REPLY @22 DO ~GiveItemCreate("MISC07",Player1,5000,0,0)
~ GOTO 8
END

IF ~~ THEN BEGIN 7
  SAY @23
  IF ~~ THEN REPLY @21 DO ~SetNumTimesTalkedTo(2)
EraseJournalEntry(@10)
EraseJournalEntry(@17)
EraseJournalEntry(@18)
EraseJournalEntry(@19)
EraseJournalEntry(@20)
TakePartyItem("ZAT6MOD")
GiveItemCreate("MISC07",Player1,5000,0,0)
~ SOLVED_JOURNAL @24 EXIT
  IF ~~ THEN REPLY @22 GOTO 9
END

IF ~~ THEN BEGIN 8
  SAY @25
  IF ~~ THEN REPLY @27 DO ~RevealAreaOnMap("PF0070")
SetNumTimesTalkedTo(3)
~ UNSOLVED_JOURNAL @26 EXIT
END

IF ~~ THEN BEGIN 9
  SAY @25
  IF ~~ THEN REPLY @27 DO ~RevealAreaOnMap("PF0070")
SetNumTimesTalkedTo(3)
~ UNSOLVED_JOURNAL @26 EXIT
END

IF ~NumTimesTAlkedTo(2)~ THEN BEGIN 10
  SAY @28
  IF ~~ THEN REPLY @29 DO ~SetNumTimesTalkedTo(2)
~ EXIT
  IF ~~ THEN REPLY @22 GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @25
  IF ~~ THEN REPLY @27 DO ~RevealAreaOnMap("PF0070")
SetNumTimesTalkedTo(3)
~ UNSOLVED_JOURNAL @26 EXIT
END

IF ~NumTimesTalkedTo(3)~ THEN BEGIN 12
  SAY @30
  IF ~~ THEN DO ~SetNumTimesTalkedTo(3)
~ EXIT
END
