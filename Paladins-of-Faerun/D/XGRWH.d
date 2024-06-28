BEGIN ~XGRWH~

IF ~See(Player1)
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~Enemy()
ActionOverride("XGRW2",Enemy())
ActionOverride("XGRW3",Enemy())
~ EXIT
  IF ~~ THEN REPLY @5 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN REPLY @7 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 4
  IF ~~ THEN REPLY @10 DO ~Enemy()
ActionOverride("XGRW2",Enemy())
ActionOverride("XGRW3",Enemy())~ EXIT
  IF ~~ THEN REPLY @18 GOTO 8
END

IF ~~ THEN BEGIN 4
  SAY @11
  IF ~~ THEN DO ~SetNumTimesTalkedTo(1)
~ UNSOLVED_JOURNAL @12 EXIT
END

IF ~NumTimesTalkedTo(1)
PartyGoldGT(4000)~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 7
  IF ~~ THEN REPLY @15 DO ~Enemy()
ActionOverride("XGRW2",Enemy())
ActionOverride("XGRW3",Enemy())~ SOLVED_JOURNAL @12 EXIT
  IF ~~ THEN REPLY @18 EXIT
  IF ~CheckStatGT(LastTalkedToBy,18,CHR)~ THEN REPLY @22 GOTO 9
  IF ~CheckStatGT(LastTalkedToBy,18,INT)~ THEN REPLY @22 GOTO 9
  IF ~CheckStatGT(LastTalkedToBy,19,STR)~ THEN REPLY @21 GOTO 10
  IF ~CheckStatGT(LastTalkedToBy,19,CON)~ THEN REPLY @21 GOTO 10
END

IF ~NumTimesTalkedTo(1)
!PartyGold(4000)~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @16 EXIT
  IF ~~ THEN REPLY @15 DO ~Enemy()
ActionOverride("XGRW2",Enemy())
ActionOverride("XGRW3",Enemy())~ SOLVED_JOURNAL @12 EXIT
  IF ~~ THEN REPLY @18 EXIT
END

IF ~~ THEN BEGIN 7
  SAY @17
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("XG0261","",[836.338],0))
ActionOverride(Player2,LeaveAreaLUA("XG0261","",[896.324],0))
ActionOverride(Player3,LeaveAreaLUA("XG0261","",[792.321],0))
ActionOverride(Player4,LeaveAreaLUA("XG0261","",[793.270],0))
ActionOverride(Player5,LeaveAreaLUA("XG0261","",[855.254],0))
ActionOverride(Player6,LeaveAreaLUA("XG0261","",[923.294],0))
~ SOLVED_JOURNAL @12 EXIT
END

IF ~~ THEN BEGIN 8
  SAY @19
  IF ~~ THEN DO ~SetNumTimesTalkedTo(1)
~ UNSOLVED_JOURNAL @12 EXIT
END

IF ~~ THEN BEGIN 9
  SAY @20
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("XG0261","",[836.338],0))
ActionOverride(Player2,LeaveAreaLUA("XG0261","",[896.324],0))
ActionOverride(Player3,LeaveAreaLUA("XG0261","",[792.321],0))
ActionOverride(Player4,LeaveAreaLUA("XG0261","",[793.270],0))
ActionOverride(Player5,LeaveAreaLUA("XG0261","",[855.254],0))
ActionOverride(Player6,LeaveAreaLUA("XG0261","",[923.294],0))
~ SOLVED_JOURNAL @12 EXIT
END

IF ~~ THEN BEGIN 10
  SAY @23
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("XG0261","",[836.338],0))
ActionOverride(Player2,LeaveAreaLUA("XG0261","",[896.324],0))
ActionOverride(Player3,LeaveAreaLUA("XG0261","",[792.321],0))
ActionOverride(Player4,LeaveAreaLUA("XG0261","",[793.270],0))
ActionOverride(Player5,LeaveAreaLUA("XG0261","",[855.254],0))
ActionOverride(Player6,LeaveAreaLUA("XG0261","",[923.294],0))
~ SOLVED_JOURNAL @12 EXIT
END
