BEGIN ~GFALCON3~

IF ~PartyHasItem("QI1MOD")
PartyHasItem("QI2MOD")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~RevealAreaOnMap("PF0028")
EscapeArea()
ActionOverride(Player2,LeaveAreaLUA("PF0028","",[554.1805],8))
ActionOverride(Player1,LeaveAreaLUA("PF0028","",[612.1835],8))
ActionOverride(Player3,LeaveAreaLUA("PF0028","",[499.1848],8))
ActionOverride(Player4,LeaveAreaLUA("PF0028","",[484.1890],8))
ActionOverride(Player5,LeaveAreaLUA("PF0028","",[564.1897],8))
ActionOverride(Player6,LeaveAreaLUA("PF0028","",[650.1897],8))
~ EXIT
END
