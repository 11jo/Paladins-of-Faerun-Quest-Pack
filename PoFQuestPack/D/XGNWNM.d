BEGIN ~XGNWNM~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @5 DO ~GiveItemCreate("MISC07",Player1,1000,0,0)
SetGlobal("XGNWNM","XG0462",1)
~ JOURNAL @4 EXIT
  IF ~~ THEN REPLY @6 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN REPLY @8 DO ~GiveItemCreate("MISC07",Player1,1000,0,0)
SetGlobal("XGNWNM","XG0462",1)
~ JOURNAL @4 EXIT
  IF ~~ THEN REPLY @9 DO ~SetGlobal("XGNWNM","XG0462",11)
~ EXIT
END

IF ~  OR(2)
!PartyHasItem("POTN37")
!PartyHasItem("POTN08")
Global("XGNWNM","XG0462",1)
~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("POTN37")
PartyHasItem("POTN08")
Global("XGNWNM","XG0462",1)~ THEN BEGIN 4
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN DO ~TakePartyItem("POTN37")
TakePartyItem("POTN08")
DestroySelf()
CreateCreature("XGNWNM1",[426.316],0)
SetGlobal("XGNWNM","XG0462",2)
ActionOverride(Player1,LeaveAreaLUA("XG0762","",[761.655],6))
ActionOverride(Player2,LeaveAreaLUA("XG0762","",[736.696],6))
ActionOverride(Player3,LeaveAreaLUA("XG0762","",[837.639],6))
ActionOverride(Player4,LeaveAreaLUA("XG0762","",[895.694],6))
ActionOverride(Player5,LeaveAreaLUA("XG0762","",[867.732],6))
ActionOverride(Player6,LeaveAreaLUA("XG0762","",[817.754],6))
~ EXIT
END
