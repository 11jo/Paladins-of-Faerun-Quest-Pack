BEGIN ~XGdrb1~

IF ~Global("s#XGdrb1","GLOBAL",0)
!Dead("XGdre1")
!Dead("XGdre2")
!Dead("XGdre3")
!Dead("XGdre4")~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 2
END

IF ~NumTimesTalkedTo(0)
Dead("XGdre1")
Dead("XGdre2")
Dead("XGdre3")
Dead("XGdre4")~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 5
  IF ~~ THEN REPLY @4 GOTO 6
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 DO ~EscapeArea()
ActionOverride(Player2,LeaveAreaLUA("XGb180","",[479.313],8))
ActionOverride(Player1,LeaveAreaLUA("XGb180","",[429.318],8))
ActionOverride(Player3,LeaveAreaLUA("XGb180","",[542.330],8))
ActionOverride(Player4,LeaveAreaLUA("XGb180","",[356.381],8))
ActionOverride(Player5,LeaveAreaLUA("XGb180","",[626.398],8))
ActionOverride(Player6,LeaveAreaLUA("XGb180","",[520.555],8))~ UNSOLVED_JOURNAL @11 EXIT
END

IF ~~ THEN BEGIN 5
  SAY @12
  IF ~~ THEN DO ~SetGlobal("s#XGdrb1","GLOBAL",1)~ UNSOLVED_JOURNAL @13 EXIT
END

IF ~~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN DO ~ReputationInc(-1) EscapeArea()~ SOLVED_JOURNAL @15 EXIT
END

IF ~Global("s#XGdrb1","GLOBAL",1)
Dead("XGdrg")~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @6 GOTO 3
END

IF ~Global("s#XGdrb1","GLOBAL",1)
!Dead("XGdrg")~ THEN BEGIN 8
  SAY @17
  IF ~~ THEN EXIT
END
