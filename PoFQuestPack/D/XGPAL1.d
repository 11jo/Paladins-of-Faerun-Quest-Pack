BEGIN ~XGPAL1~

IF ~See(Player1) NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~RevealAreaOnMap("XG0801")
AddJournalEntry(@50502,QUEST)
EscapeArea()~ EXIT
  IF ~~ THEN REPLY @7 DO ~AddJournalEntry(@50505,QUEST_DONE) EscapeArea()~ EXIT
END
