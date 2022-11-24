BEGIN ~NOM1MOD~

IF ~NumTimesTAlkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~ActionOverride(Player2,LeaveAreaLUA("PF0075","",[1072.811],0))
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1095.778],0))
ActionOverride(Player3,LeaveAreaLUA("PF0075","",[1027.835],0))
ActionOverride(Player4,LeaveAreaLUA("PF0075","",[980.786],0))
ActionOverride(Player5,LeaveAreaLUA("PF0075","",[1015.742],0))
ActionOverride(Player6,LeaveAreaLUA("PF0075","",[1079.706],0))
~ EXIT
  IF ~!NumTimesTalkedTo(0)~ THEN REPLY @3 EXIT
END
