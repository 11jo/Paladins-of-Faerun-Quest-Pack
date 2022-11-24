BEGIN ~FIRQMOD~

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
  IF ~~ THEN REPLY @6 DO ~Enemy()
~ EXIT
  IF ~~ THEN REPLY @7 GOTO 2
  IF ~~ THEN REPLY @8 DO ~Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @9
  IF ~~ THEN DO ~AddexperienceParty(5550)
ActionOverride(Player2,LeaveAreaLUA("PF0384","",[2725.1056],0))
ActionOverride(Player1,LeaveAreaLUA("PF0384","",[2688.1031],0))
ActionOverride(Player3,LeaveAreaLUA("PF0384","",[2678.995],0))
ActionOverride(Player4,LeaveAreaLUA("PF0384","",[2642.1067],0))
ActionOverride(Player5,LeaveAreaLUA("PF0384","",[2836.1029],0))
ActionOverride(Player6,LeaveAreaLUA("PF0384","",[2824.1077],0))
EscapeArea()
~ EXIT
END
