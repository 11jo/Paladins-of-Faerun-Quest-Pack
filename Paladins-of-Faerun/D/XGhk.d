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
EraseJournalEntry(@51104)
AddJournalEntry(@51101,QUEST_DONE)
EscapeArea()~ EXIT
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN DO ~GiveItemCreate("MISC07",Player1,700,0,0)
TakePartyItem("XGku")
EraseJournalEntry(@51104)
AddJournalEntry(@51102,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN DO ~EraseJournalEntry(@51104)
ReputationInc(-1)
AddJournalEntry(@51103,QUEST_DONE)
Enemy()~ EXIT
END
