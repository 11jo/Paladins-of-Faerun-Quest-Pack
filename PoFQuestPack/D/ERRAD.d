BEGIN ~ERRAD~

IF WEIGHT #0 ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN UNSOLVED_JOURNAL @6 EXIT
END

IF WEIGHT #2 ~!PartyHasItem("erkeymod")~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 EXIT
END

IF WEIGHT #1 ~PartyHasItem("erkeymod")~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN REPLY @9 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @10
  IF ~~ THEN REPLY @12 DO ~EraseJournalEntry(@6)
AddexperienceParty(6000)
TakePartyItem("erkeymod")
EscapeArea()
~ SOLVED_JOURNAL @11 EXIT
END
