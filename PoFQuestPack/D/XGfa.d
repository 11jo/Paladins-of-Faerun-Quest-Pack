BEGIN ~XGfa~

IF ~See(Player1) Global("s#XGfa","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN REPLY @7 DO ~SetGlobal("s#XGfa","GLOBAL",2)
RevealAreaOnMap("XG0079")~ UNSOLVED_JOURNAL @8 EXIT
  IF ~~ THEN REPLY @9 DO ~SetGlobal("s#XGfa","GLOBAL",1)~ EXIT
END

IF ~Global("s#XGfa","GLOBAL",1)~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 3
END

IF ~Global("s#XGfa","GLOBAL",2)
!PartyHasItem("XGspb")~ THEN BEGIN 5
  SAY @12
  IF ~~ THEN REPLY @13 EXIT
  IF ~~ THEN REPLY @14 DO ~ReputationInc(-2)
SetGlobal("s#XGfa","GLOBAL",4)
EscapeArea()~ SOLVED_JOURNAL @15 EXIT
END

IF ~Global("s#XGfa","GLOBAL",2)
PartyHasItem("XGspb")~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN REPLY @16 DO ~TakePartyItem("XGspb")
SetGlobal("s#XGfa","GLOBAL",3)
AddexperienceParty(5000)
EraseJournalEntry(@8)
EscapeArea()~ SOLVED_JOURNAL @17 EXIT
END
