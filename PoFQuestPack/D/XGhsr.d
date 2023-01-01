BEGIN ~XGhsr~

IF ~See(Player1)~ THEN BEGIN 0
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
  IF ~~ THEN DO ~GiveItemCreate("XGhsr",Player1,0,0,0)
ActionOverride(Player2,LeaveAreaLUA("XG0082","",[2029.2013],0))
ActionOverride(Player1,LeaveAreaLUA("XG0082","",[2092.2015],0))
ActionOverride(Player3,LeaveAreaLUA("XG0082","",[2016.1957],0))
ActionOverride(Player4,LeaveAreaLUA("XG0082","",[2155.1993],0))
ActionOverride(Player5,LeaveAreaLUA("XG0082","",[2016.1922],0))
ActionOverride(Player6,LeaveAreaLUA("XG0082","",[1965.1893],0))
EscapeArea()~ UNSOLVED_JOURNAL @7 EXIT
END
