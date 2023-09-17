BEGIN ~XGmyhs~

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
END

IF ~~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN REPLY @7 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN DO ~
		AddexperienceParty(5000)
		AddJournalEntry(@50428,QUEST)
		HideAreaOnMap("XG0083")  // (PoF)  Montagnes du Couchant
		HideAreaOnMap("XG0082")  // (PoF)  Montagnes du Couchant
		ActionOverride("XGprt",EscapeArea())
		Wait(2)
		ActionOverride(Player1,LeaveAreaLUA("XG0481","",[2102.2028],N))
		ActionOverride(Player2,LeaveAreaLUA("XG0481","",[2055.1966],N))
		ActionOverride(Player3,LeaveAreaLUA("XG0481","",[2050.2046],N))
		ActionOverride(Player4,LeaveAreaLUA("XG0481","",[2004.1986],N))
		ActionOverride(Player5,LeaveAreaLUA("XG0481","",[2225.2046],N))
		ActionOverride(Player6,LeaveAreaLUA("XG0481","",[2272.2099],N))
~ EXIT
END
