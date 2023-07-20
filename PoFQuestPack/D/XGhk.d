BEGIN ~XGhk~

IF ~NumTimesTalkedTo(0)
PartyHasItem("XGku")~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 DO ~GiveItemCreate("MISC07",Player1,500,0,0)
TakePartyItem("XGku")
EscapeArea()
EraseJournalEntry(79104)~ SOLVED_JOURNAL @5 EXIT
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN DO ~GiveItemCreate("MISC07",Player1,700,0,0)
TakePartyItem("XGku")
EscapeArea()
EraseJournalEntry(@8)~ SOLVED_JOURNAL @9 EXIT
END

IF ~~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN DO ~EraseJournalEntry(@8)
ReputationInc(-1)
Enemy()~ SOLVED_JOURNAL @11 EXIT
END
