BEGIN ~XGksp~

IF ~NumTimesTalkedTo(0)
See(Player1)
PartyhasItem("XGKIIT")~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetNumTimesTalkedTo(0)~ EXIT
  IF ~~ THEN REPLY @2 DO ~TakePartyItem("XGKIIT")
SetNumTimesTalkedTo(1)
ActionOverride(Player1,LeaveAreaLUA("PF0040","",[636.170],0))
ActionOverride(Player2,LeaveAreaLUA("PF0040","",[629.220],0))
ActionOverride(Player3,LeaveAreaLUA("PF0040","",[697.142],0))
ActionOverride(Player4,LeaveAreaLUA("PF0040","",[559.143],0))
ActionOverride(Player5,LeaveAreaLUA("PF0040","",[590.96],0))
ActionOverride(Player6,LeaveAreaLUA("PF0040","",[667.111],0))~ EXIT
END
