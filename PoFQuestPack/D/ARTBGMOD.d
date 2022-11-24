BEGIN ~ARTBGMOD~

IF ~See(Player1)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 DO ~EscapeArea()
~ GOTO 4
  IF ~~ THEN REPLY @10 DO ~Enemy()
TakePartyItem("Zat4mod")
~ UNSOLVED_JOURNAL @9 EXIT
END

IF ~~ THEN BEGIN 4
  SAY @11
  IF ~~ THEN DO ~EscapeArea()
TakePartyItem("ZAT4MOD")
GiveItemCreate("ZAT6MOD",Player1,0,0,0)
ActionOverride(Player2,LeaveAreaLUA("PF0020","",[282.1732],0))
ActionOverride(Player1,LeaveAreaLUA("PF0020","",[248.1687],0))
ActionOverride(Player3,LeaveAreaLUA("PF0020","",[279.1645],0))
ActionOverride(Player4,LeaveAreaLUA("PF0020","",[361.1670],0))
ActionOverride(Player5,LeaveAreaLUA("PF0020","",[431.1723],0))
ActionOverride(Player6,LeaveAreaLUA("PF0020","",[499.1689],0))
~ UNSOLVED_JOURNAL @12 EXIT
END
