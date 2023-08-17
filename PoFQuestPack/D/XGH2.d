BEGIN ~XGH2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~EraseJournalEntry(@7)
EraseJournalEntry(@8)
EraseJournalEntry(@9)
RevealAreaOnMap("XG0047")
GiveGoldForce(4000)
AddexperienceParty(10000)
GiveItemCreate("XGNINJ1",Player1,0,0,0)
EscapeArea()~ SOLVED_JOURNAL @10 EXIT
END
