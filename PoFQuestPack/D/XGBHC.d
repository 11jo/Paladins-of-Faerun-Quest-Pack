BEGIN ~XGBHC~

IF ~NumTimesTalkedTo(0)
See(Player1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 DO ~AddJournalEntry(@50708,QUEST_DONE) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN DO ~RevealAreaOnMap("XG0072")
AddJournalEntry(@50702,QUEST)
EscapeArea()~ EXIT
END
