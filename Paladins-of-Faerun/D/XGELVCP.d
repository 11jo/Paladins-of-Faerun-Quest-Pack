BEGIN ~XGELVCP~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @3 DO ~AddJournalEntry(@51211,QUEST)
Ally()~ EXIT
END
