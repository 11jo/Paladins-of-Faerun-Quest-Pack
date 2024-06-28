BEGIN ~XGfirq1~

IF ~See(Player1)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~Enemy()
~ EXIT
  IF ~~ THEN REPLY @5 DO ~Enemy()
~ EXIT
  IF ~~ THEN REPLY @6 GOTO 2
  IF ~~ THEN REPLY @7 DO ~Enemy()
~ EXIT
  IF ~~ THEN REPLY @8 DO ~Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @9
  IF ~~ THEN DO ~AddexperienceParty(5550)
ActionOverride(Player2,LeaveAreaLUA("XG0384","",[1093.1629],0))
ActionOverride(Player1,LeaveAreaLUA("XG0384","",[1072.1590],0))
ActionOverride(Player3,LeaveAreaLUA("XG0384","",[1112.1583],0))
ActionOverride(Player4,LeaveAreaLUA("XG0384","",[1073.1538],0))
ActionOverride(Player5,LeaveAreaLUA("XG0384","",[1069.1501],0))
ActionOverride(Player6,LeaveAreaLUA("XG0384","",[1116.1493],0))
EscapeArea()
~ EXIT
END
