BEGIN ~XGLOVCT~

IF ~NumTimesTalkedTo(0)
See(Player1)~ THEN BEGIN 0
  SAY @0
  IF ~PartyGoldGT(5000)~ THEN REPLY @1 DO ~TakePartyGold(5000)
SetNumTimesTalkeDTo(1)
ActionOverride(Player2,LeaveAreaLUA("XG0069","",[3765.2507],0))
ActionOverride(Player1,LeaveAreaLUA("XG0069","",[3728.2502],0))
ActionOverride(Player3,LeaveAreaLUA("XG0069","",[3768.2560],0))
ActionOverride(Player4,LeaveAreaLUA("XG0069","",[3723.2576],0))
ActionOverride(Player5,LeaveAreaLUA("XG0069","",[3765.2626],0))
ActionOverride(Player6,LeaveAreaLUA("XG0069","",[3687.2502],0))~ EXIT
  IF ~!PartyGoldGT(5000)~ THEN REPLY @2 DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~ActionOverride(Player2,LeaveAreaLUA("XG0069","",[3765.2507],0))
ActionOverride(Player1,LeaveAreaLUA("XG0069","",[3728.2502],0))
ActionOverride(Player3,LeaveAreaLUA("XG0069","",[3768.2560],0))
ActionOverride(Player4,LeaveAreaLUA("XG0069","",[3723.2576],0))
ActionOverride(Player5,LeaveAreaLUA("XG0069","",[3765.2626],0))
ActionOverride(Player6,LeaveAreaLUA("XG0069","",[3687.2502],0))
SetNumTimesTalkeDTo(1)~ EXIT
  IF ~~ THEN REPLY @5 DO ~SetNumTimesTalkeDTo(1)~ EXIT
END
