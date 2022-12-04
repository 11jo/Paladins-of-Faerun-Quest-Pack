BEGIN ~XGHAR~

IF ~PartyHasItem("ZAT4MOD")
See(Player1)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~PartyGoldGT(2000)~ THEN REPLY @6 GOTO 3
  IF ~!PartyGoldGT(2000)~ THEN REPLY @7 DO ~SetNumTimesTalkedTo(1)
~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("PF1120","",[951.209],0))
ActionOverride(Player1,LeaveAreaLUA("PF1120","",[984.195],0))
ActionOverride(Player3,LeaveAreaLUA("PF1120","",[1023.199],0))
ActionOverride(Player4,LeaveAreaLUA("PF1120","",[999.238],0))
ActionOverride(Player5,LeaveAreaLUA("PF1120","",[966.254],0))
ActionOverride(Player6,LeaveAreaLUA("PF1120","",[924.171],0))
EscapeArea()
~ EXIT
END

IF ~PartyGoldGT(2000)
NumTimesTalkedTo(1)~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @8
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("PF1120","",[951.209],0))
ActionOverride(Player1,LeaveAreaLUA("PF1120","",[984.195],0))
ActionOverride(Player3,LeaveAreaLUA("PF1120","",[1023.199],0))
ActionOverride(Player4,LeaveAreaLUA("PF1120","",[999.238],0))
ActionOverride(Player5,LeaveAreaLUA("PF1120","",[966.254],0))
ActionOverride(Player6,LeaveAreaLUA("PF1120","",[924.171],0))
EscapeArea()
~ EXIT
END
