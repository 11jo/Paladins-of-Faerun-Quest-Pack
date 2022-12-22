BEGIN ~XGskwr4~

IF ~PartyHasItem("XGsk")
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~ActionOverride(Player2,LeaveAreaLUA("PF0101","",[610.1841],8))
ActionOverride(Player1,LeaveAreaLUA("PF0101","",[641.1792],8))
ActionOverride(Player3,LeaveAreaLUA("PF0101","",[682.1840],8))
ActionOverride(Player4,LeaveAreaLUA("PF0101","",[629.1862],8))
ActionOverride(Player5,LeaveAreaLUA("PF0101","",[704.1874],8))
ActionOverride(Player6,LeaveAreaLUA("PF0101","",[651.1924],8))
ActionOverride("XGskwr3",EscapeArea())
EscapeArea()
TakePartyItem("XGsk")~ UNSOLVED_JOURNAL @2 EXIT
END
