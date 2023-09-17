BEGIN ~XGhsr2~

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~RevealAreaOnMap("XG8300")
AddJournalEntry(@50421,QUEST)~ GOTO 2
END


IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~Enemy()
ReputationInc(-1)
AddJournalEntry(@50422,QUEST)~ EXIT
END
