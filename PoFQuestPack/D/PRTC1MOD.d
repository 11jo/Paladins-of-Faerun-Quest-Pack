BEGIN ~PRTC1MOD~

IF ~See(Player1) Global("s#PRTC1MOD","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetGlobal("s#PRTC1MOD","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~SetGlobal("s#PRTC1MOD","GLOBAL",2)~ UNSOLVED_JOURNAL @7 EXIT
END

IF ~Global("s#PRTC1MOD","GLOBAL",1)~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @1 EXIT
END

IF ~Global("s#PRTC1MOD","GLOBAL",2)
Dead("XGprac")~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 6
END

IF ~Global("s#PRTC1MOD","GLOBAL",2)
!Dead("XGprac")~ THEN BEGIN 5
  SAY @9
  IF ~~ THEN REPLY @11 EXIT
END

IF ~~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN DO ~GiveItemCreate("XGIK07",Player1,0,0,0)
ReputationInc(2)
EraseJournalEntry(@13)
EraseJournalEntry(@14)
EraseJournalEntry(@15)
EraseJournalEntry(@16)
EraseJournalEntry(@17)
EraseJournalEntry(@18)
EraseJournalEntry(@19)
EscapeArea()~ SOLVED_JOURNAL @20 EXIT
END
