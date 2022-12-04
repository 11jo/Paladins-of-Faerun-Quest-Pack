BEGIN ~XGRAL~

IF ~Global("s#XGRAL","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~PartyGoldGT(10000)~ THEN REPLY @3 GOTO 4
  IF ~!PartyGoldGT(10000)~ THEN REPLY @4 GOTO 2
  IF ~~ THEN REPLY @5  EXIT
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN REPLY @7 DO ~SetGlobal("s#XGRAL","GLOBAL",1)~ GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN DO ~ActionOverride(Player2,LeaveAreaLUA("PF0075","",[2844.1827],0))
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[2915.1818],0))
ActionOverride(Player3,LeaveAreaLUA("PF0075","",[2846.1881],0))
ActionOverride(Player4,LeaveAreaLUA("PF0075","",[2919.1918],0))
ActionOverride(Player5,LeaveAreaLUA("PF0075","",[2894.1962],0))
ActionOverride(Player6,LeaveAreaLUA("PF0075","",[2985.1967],0))~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 DO ~TakePartyGold(10000) Reputationinc(-2) SetGlobal("s#XGRAL","GLOBAL",2)~  GOTO 6
END

IF ~Global("s#XGRAL","GLOBAL",1)~ THEN BEGIN 5
  SAY @11
  IF ~PartyGoldGT(10000)~ THEN REPLY @12 GOTO 4
  IF ~!PartyGoldGT(10000)~ THEN REPLY @13  EXIT
  IF ~~ THEN REPLY @14  GOTO 2
END

IF ~~ THEN BEGIN 6
  SAY @15
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1313.1221],12))
CreateCreature("XGFIGG",[1767.1245],4)~ EXIT
END

IF ~Global("s#XGRAL","GLOBAL",2)
Dead("XGFIGG")~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN REPLY @17 DO ~GiveItemCreate("MISC07",Player1,500,0,0)~ GOTO 8
  IF ~~ THEN REPLY @18 EXIT
END

IF ~~ THEN BEGIN 8
  SAY @19
  IF ~~ THEN REPLY @20 DO ~SetGlobal("s#XGRAL","GLOBAL",3)
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1313.1221],12))
CreateCreature("XGBSMSE",[1767.1245],4)~ EXIT
END

IF ~Global("s#XGRAL","GLOBAL",3)
Dead("XGBSMSE")~ THEN BEGIN 9
  SAY @21
  IF ~~ THEN REPLY @17 DO ~GiveItemCreate("MISC07",Player1,1000,0,0)~ GOTO 10
  IF ~~ THEN REPLY @18 EXIT
END

IF ~~ THEN BEGIN 10
  SAY @22
  IF ~~ THEN DO ~SetGlobal("s#XGRAL","GLOBAL",4)
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1313.1221],12))
CreateCreature("XGMGG1",[1767.1245],4)~ EXIT
END

IF ~Global("s#XGRAL","GLOBAL",4)
Dead("XGMGG1")~ THEN BEGIN 11
  SAY @23
  IF ~~ THEN REPLY @24 DO ~GiveItemCreate("MISC07",Player1,2000,0,0)~ GOTO 12
  IF ~~ THEN REPLY @18 EXIT
END

IF ~~ THEN BEGIN 12
  SAY @25
  IF ~~ THEN DO ~SetGlobal("s#XGRAL","GLOBAL",5)
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1313.1221],12))
CreateCreature("XGRGG",[1767.1245],4)~ EXIT
END

IF ~Global("s#XGRAL","GLOBAL",5)
Dead("XGRGG")~ THEN BEGIN 13
  SAY @26
  IF ~~ THEN REPLY @27 DO ~GiveItemCreate("MISC07",Player1,4000,0,0)~ GOTO 14
  IF ~~ THEN REPLY @18 EXIT
END

IF ~~ THEN BEGIN 14
  SAY @28
  IF ~~ THEN DO ~SetGlobal("s#XGRAL","GLOBAL",6)
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1313.1221],12))
CreateCreature("XGDG",[1767.1245],4)~ EXIT
END

IF ~Global("s#XGRAL","GLOBAL",6)
Dead("XGDG")~ THEN BEGIN 15
  SAY @29
  IF ~~ THEN REPLY @30 DO ~GiveItemCreate("MISC07",Player1,6500,0,0)~ GOTO 16
  IF ~~ THEN REPLY @18 EXIT
END

IF ~~ THEN BEGIN 16
  SAY @31
  IF ~~ THEN DO ~SetGlobal("s#XGRAL","GLOBAL",7)
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1313.1221],12))
CreateCreature("XGBARGG",[1767.1245],4)~ EXIT
END

IF ~Global("s#XGRAL","GLOBAL",7)
Dead("XGBARGG")~ THEN BEGIN 17
  SAY @32
  IF ~~ THEN REPLY @30 DO ~SetGlobal("s#XGRAL","GLOBAL",8)
GiveItemCreate("MISC07",Player1,8000,0,0)
ActionOverride(Player1,LeaveAreaLUA("PF0075","",[1313.1221],12))
CreateCreature("XGCHG",[1767.1245],4)~ EXIT
  IF ~~ THEN REPLY @18 EXIT
END

IF ~Global("s#XGRAL","GLOBAL",8)
Dead("XGCHG")~ THEN BEGIN 18
  SAY @33
  IF ~~ THEN REPLY @34 DO ~GiveItemCreate("FALX07",Player1,0,0,0)
GiveItemCreate("PIKA05",Player1,0,0,0)
GiveItemCreate("SWORD05",Player1,0,0,0)
SetGlobal("s#XGRAL","GLOBAL",9)~ EXIT
END

IF ~Global("s#XGRAL","GLOBAL",9)~ THEN BEGIN 19
  SAY @35 
  IF ~~ THEN REPLY @36  EXIT
  IF ~~ THEN REPLY @37 GOTO 3
END
