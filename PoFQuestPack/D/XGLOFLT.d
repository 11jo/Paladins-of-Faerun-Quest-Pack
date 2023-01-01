BEGIN ~XGLOFLT~

IF ~See(Player1)
Global("s#XGLOFLT","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 DO ~Enemy()~ 
UNSOLVED_JOURNAL @4 EXIT
  IF ~~ THEN REPLY @5 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN DO ~GiveItemCreate("MISC07",Player1,15000,0,0)
GiveItemCreate("XGSWO18",Player1,0,0,0)
ActionOverride(Player2,LeaveAreaLUA("XG0014","",[491.986],0))
ActionOverride(Player1,LeaveAreaLUA("XG0014","",[542.955],0))
ActionOverride(Player3,LeaveAreaLUA("XG0014","",[495.923],0))
ActionOverride(Player4,LeaveAreaLUA("XG0014","",[439.955],0))
ActionOverride(Player5,LeaveAreaLUA("XG0014","",[469.1022],0))
ActionOverride(Player6,LeaveAreaLUA("XG0014","",[528.1016],0))
SetGlobal("s#XGLOFLT","GLOBAL",1)
EscapeArea()~ 
SOLVED_JOURNAL @7 EXIT
END
