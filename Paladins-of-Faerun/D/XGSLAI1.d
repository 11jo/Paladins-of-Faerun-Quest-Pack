BEGIN ~XGSLAI1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @7 DO ~RevealAreaOnMap("XG0028")
AddJournalEntry(@51222,QUEST)
AddexperienceParty(30000)
JoinParty()~ EXIT
  IF ~~ THEN REPLY @9 DO ~RevealAreaOnMap("XG0028")
AddJournalEntry(@51223,QUEST)
AddexperienceParty(30000)~ EXIT
END
