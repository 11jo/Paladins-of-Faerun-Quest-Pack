BEGIN ~KDMOD~

IF ~NumTimesTalkedto(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~ActionOverride("KDMOD",escapearea())
TakePartyitem("HQMOD")
ActionOverride(Player2,LeaveAreaLUA("AR0300","",[1273.3131],0))
ActionOverride(Player1,LeaveAreaLUA("AR0300","",[1337.3176],0))
ActionOverride(Player3,LeaveAreaLUA("AR0300","",[1253.3194],0))
ActionOverride(Player4,LeaveAreaLUA("AR0300","",[1184.3176],0))
ActionOverride(Player5,LeaveAreaLUA("AR0300","",[1261.3272],0))
ActionOverride(Player6,LeaveAreaLUA("AR0300","",[1409.3242],0))~ EXIT
END
