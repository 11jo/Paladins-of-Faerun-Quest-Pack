BEGIN ~XGBOY~

IF ~NumTimesTalkedTo(0)
See(Player1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~AddJournalEntry(@50118,QUEST_DONE) EscapeArea()~ EXIT
  IF ~~ THEN REPLY @7 DO ~AddJournalEntry(@50114,QUEST) RevealAreaOnMap("XG0033") EscapeArea()~ EXIT
END
