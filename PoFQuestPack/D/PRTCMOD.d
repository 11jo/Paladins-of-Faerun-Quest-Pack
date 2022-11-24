BEGIN ~PRTCMOD~

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 3
  IF ~~ THEN REPLY @6 GOTO 4
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 5
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("AR0020","",[906.373],0))
ActionOverride(Player1,LeaveAreaLUA("AR0020","",[876.353],0))
ActionOverride(Player3,LeaveAreaLUA("AR0020","",[916.287],0))
ActionOverride(Player4,LeaveAreaLUA("AR0020","",[1003.316],0))
ActionOverride(Player5,LeaveAreaLUA("AR0020","",[1018.240],0))
ActionOverride(Player6,LeaveAreaLUA("AR0020","",[962.269],0))
EscapeArea()~ SOLVED_JOURNAL @10 EXIT
END

IF ~~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("PFKAR1","",[659.363],14))
ActionOverride(Player1,LeaveAreaLUA("PFKAR1","",[438.436],14))
ActionOverride(Player3,LeaveAreaLUA("PFKAR1","",[682.642],14))
ActionOverride(Player4,LeaveAreaLUA("PFKAR1","",[881.569],14))
ActionOverride(Player5,LeaveAreaLUA("PFKAR1","",[927.807],14))
ActionOverride(Player6,LeaveAreaLUA("PFKAR1","",[1190.752],14))
EscapeArea()~ UNSOLVED_JOURNAL @12 EXIT
END
