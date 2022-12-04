BEGIN ~XGRWH~

IF ~See(Player1)
NumTimesTAlkedTo(0)~ THEN BEGIN 0
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
ActionOverride("XGRW3",Enemy())
~ EXIT
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
ActionOverride("XGRW3",Enemy())
~ EXIT
END

IF ~NumTimesTalkedTo(1)
!PartyGold(4000)~ THEN BEGIN 6
  SAY @13
  IF ~~ THEN REPLY @16 EXIT
  IF ~~ THEN REPLY @15 DO ~Enemy()
ActionOverride("XGRW2",Enemy())
ActionOverride("XGRW3",Enemy())
~ EXIT
END

IF ~~ THEN BEGIN 7
  SAY @17
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("PF0261","",[836.338],0))
ActionOverride(Player2,LeaveAreaLUA("PF0261","",[896.324],0))
ActionOverride(Player3,LeaveAreaLUA("PF0261","",[792.321],0))
ActionOverride(Player4,LeaveAreaLUA("PF0261","",[793.270],0))
ActionOverride(Player5,LeaveAreaLUA("PF0261","",[855.254],0))
ActionOverride(Player6,LeaveAreaLUA("PF0261","",[923.294],0))
~ EXIT
END
