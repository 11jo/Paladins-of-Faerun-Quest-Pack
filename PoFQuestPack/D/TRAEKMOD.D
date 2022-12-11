BEGIN ~XGTRAEK~

IF ~Global("s#XGTRAEK","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN REPLY @7 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~~ THEN REPLY @9 DO ~ReputationInc(-1)
SetGlobal("s#XGTRAEK","GLOBAL",1)~ UNSOLVED_JOURNAL @10 EXIT
  IF ~~ THEN REPLY @11 DO ~SetGlobal("s#XGTRAEK","GLOBAL",2)~ EXIT
END

IF ~PartyHasItem("XGSAK")~ THEN BEGIN 5
  SAY @12
  IF ~~ THEN REPLY @13 DO ~EraseJournalEntry(@10)
TakePartyItem("XGSAK")
AddXPObject(Player1,4500)
AddXPObject(Player2,4500)
AddXPObject(Player3,4500)
AddXPObject(Player4,4500)
AddXPObject(Player5,4500)
AddXPObject(Player6,4500)
GiveItemCreate("SCRL1X",Player1,0,0,0)
GiveItemCreate("SCRL8O",Player1,0,0,0)
GiveItemCreate("SCRL8N",Player1,0,0,0)
GiveItemCreate("SCRL8Z",Player1,0,0,0)
GiveItemCreate("SCRL5Z",Player1,0,0,0)
GiveItemCreate("SCRL7S",Player1,0,0,0)
SetGlobal("s#XGTRAEK","GLOBAL",3)~ SOLVED_JOURNAL @14 EXIT
END
