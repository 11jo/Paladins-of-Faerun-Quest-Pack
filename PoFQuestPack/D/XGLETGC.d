BEGIN ~XGLETGC~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 DO ~SetNumTimesTalkedTo(0)
~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN REPLY @7 DO ~SetGlobal("XGLETGC","GLOBAL",1)
EraseJournalEntry(@6)
~ UNSOLVED_JOURNAL @5 EXIT
END

IF ~Global("XGLETGC","GLOBAL",1)
PartyHasItem("XGGD1")
PartyHasItem("XGGD3")
PartyHasItem("XGGD2")~ THEN BEGIN 2
  SAY @8
  IF ~~ THEN DO ~GiveItemCreate("MISC07",Player1,4000,0,0)
EraseJournalEntry(@5)
AddexperienceParty(5000)
SetGlobal("XGLETGC","GLOBAL",2)
TakePartyItem("XGGD1")
TakePartyItem("XGGD2")
TakePartyItem("XGGD3")
~ UNSOLVED_JOURNAL @9 EXIT
END

IF ~Global("XGLETGC","GLOBAL",1)
OR(3)
!PartyHasItem("XGGD1")
!PartyHasItem("XGGD3")
!PartyHasItem("XGGD2")
~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN EXIT
END

IF ~Global("XGLETGC","GLOBAL",2)
Dead("XGLUSGW")~ THEN BEGIN 4
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 6
END

IF ~Global("XGLETGC","GLOBAL",2)
!Dead("XGLUSGW")~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN REPLY @15 DO ~GiveItemCreate("POTN52",Player1,20,0,0)
EraseJournalEntry(@9)
AddexperienceParty(5000)
SetGlobal("XGLETGC","GLOBAL",3)
~ EXIT
END

IF ~Global("XGLETGC","GLOBAL",3)~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @17 DO ~SetGlobal("XGLETGC","GLOBAL",3)
~ EXIT
  IF ~~ THEN REPLY @18 DO ~ActionOverride(Player1,LeaveAreaLUA("XG0263","",[1295.905],0))
ActionOverride(Player2,LeaveAreaLUA("XG0263","",[1266.905],0))
ActionOverride(Player3,LeaveAreaLUA("XG0263","",[1336.905],0))
ActionOverride(Player4,LeaveAreaLUA("XG0263","",[1297.965],0))
ActionOverride(Player5,LeaveAreaLUA("XG0263","",[1247.930],0))
ActionOverride(Player6,LeaveAreaLUA("XG0263","",[1216.899],0))
SetGlobal("XGLETGC","GLOBAL",4)
~ EXIT
END

IF ~Global("XGLETGC","GLOBAL",4)~ THEN BEGIN 8
  SAY @19
  IF ~~ THEN EXIT
END
