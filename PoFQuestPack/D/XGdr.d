BEGIN ~XGdr~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 DO ~
AddJournalEntry(@50313,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 2
  IF ~~ THEN REPLY @6 DO ~
AddJournalEntry(@50313,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @9
  IF ~~ THEN DO ~RevealAreaOnMap("XG0076")
AddJournalEntry(@50300,QUEST)
EscapeArea()~ EXIT
END
