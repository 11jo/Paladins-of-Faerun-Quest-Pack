BEGIN ~XGHAR~

IF ~Global("XGHAR_XG0720","GLOBAL",1)~ THEN BEGIN 0
  SAY @11
  IF ~~ THEN DO ~
ClearAllActions()
SetGlobal("XGHAR_XG0720","GLOBAL",2)
StartCutSceneMode()
HideGUI()
FadeToColor([50.0],0)
Wait(3)
ActionOverride(Player2,LeaveAreaLUA("XG1120","",[951.209],0))
ActionOverride(Player1,LeaveAreaLUA("XG1120","",[984.195],0))
ActionOverride(Player3,LeaveAreaLUA("XG1120","",[1023.199],0))
ActionOverride(Player4,LeaveAreaLUA("XG1120","",[999.238],0))
ActionOverride(Player5,LeaveAreaLUA("XG1120","",[966.254],0))
ActionOverride(Player6,LeaveAreaLUA("XG1120","",[924.171],0))
EndCutSceneMode()
EscapeArea()
~ EXIT
END

IF ~AreaCheck("XG1120")
OR(2)
	Global("XGHAR_XG0720","GLOBAL",2)
	Global("XGHAR_XG0720","GLOBAL",3)~ THEN BEGIN 0
  SAY #11106
  IF ~~ THEN DO ~SetGlobal("XGHAR_XG0720","GLOBAL",4) Enemy()~ EXIT
END

IF ~PartyHasItem("XGZAT4")
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~!NumTimesTalkedTo(0) PartyHasItem("XGZAT4")~ THEN BEGIN 2
  SAY @5
  IF ~PartyGoldGT(1999)~ THEN REPLY @6 GOTO 3
  IF ~~ THEN REPLY @7 EXIT
END

IF ~~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN DO ~
ClearAllActions()
StartCutSceneMode()
HideGUI()
FadeToColor([50.0],0)
Wait(3)
ActionOverride(Player2,LeaveAreaLUA("XG1120","",[951.209],0))
ActionOverride(Player1,LeaveAreaLUA("XG1120","",[984.195],0))
ActionOverride(Player3,LeaveAreaLUA("XG1120","",[1023.199],0))
ActionOverride(Player4,LeaveAreaLUA("XG1120","",[999.238],0))
ActionOverride(Player5,LeaveAreaLUA("XG1120","",[966.254],0))
ActionOverride(Player6,LeaveAreaLUA("XG1120","",[924.171],0))
EndCutSceneMode()
EscapeArea()
~ EXIT
END

/*
IF ~PartyGoldGT(1999)
NumTimesTalkedTo(1)~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @8
  IF ~~ THEN DO ~
ClearAllActions()
StartCutSceneMode()
HideGUI()
FadeToColor([50.0],0)
Wait(3)
ActionOverride(Player2,LeaveAreaLUA("XG1120","",[951.209],0))
ActionOverride(Player1,LeaveAreaLUA("XG1120","",[984.195],0))
ActionOverride(Player3,LeaveAreaLUA("XG1120","",[1023.199],0))
ActionOverride(Player4,LeaveAreaLUA("XG1120","",[999.238],0))
ActionOverride(Player5,LeaveAreaLUA("XG1120","",[966.254],0))
ActionOverride(Player6,LeaveAreaLUA("XG1120","",[924.171],0))
EscapeArea()
EndCutSceneMode()
~ EXIT
END
*/

IF ~!PartyHasItem("XGZAT4")~ THEN BEGIN 5
  SAY #29945
  IF ~~ THEN EXIT
END
