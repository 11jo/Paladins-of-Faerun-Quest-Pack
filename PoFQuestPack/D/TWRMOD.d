BEGIN ~TWRMOD~

IF ~True()
NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~GiveItemCreate("PLET1MOD",Player1,0,0,0)~ EXIT
  IF ~~ THEN REPLY @2 DO ~ActionOverride(Player2,LeaveAreaLUA("PF0177","",[1845.1244],0))
ActionOverride(Player1,LeaveAreaLUA("PF0177","",[1872.1278],0))
ActionOverride(Player3,LeaveAreaLUA("PF0177","",[1914.1248],0))
ActionOverride(Player4,LeaveAreaLUA("PF0177","",[1849.1205],0))
ActionOverride(Player5,LeaveAreaLUA("PF0177","",[1900.1186],0))
ActionOverride(Player6,LeaveAreaLUA("PF0177","",[1952.1227],0))~ EXIT
END
