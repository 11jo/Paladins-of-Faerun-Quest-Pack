BEGIN ~XGthf~

IF ~See(Player1) Global("s#XGthf","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN REPLY @5 DO ~SetGlobal("s#XGthf","GLOBAL",1)~ 
UNSOLVED_JOURNAL @6 EXIT
  IF ~~ THEN REPLY @7 DO ~EscapeArea()~ 
SOLVED_JOURNAL @8 EXIT
END

IF ~ Global("s#XGthf","GLOBAL",1)
PartyHasItem("BRAC1")~ THEN BEGIN 3
  SAY @9
  IF ~~ THEN REPLY @10 DO ~GiveItemCreate("MISC07",Player1,10000,0,0)
TakePartyItem("BRAC1")~ EXIT
  IF ~~ THEN REPLY @11 EXIT
END

IF ~ Global("s#XGthf","GLOBAL",1)
PartyHasItem("BOOT4")~ THEN BEGIN 4
  SAY @12
  IF ~~ THEN REPLY @10 DO ~GiveItemCreate("MISC07",Player1,10000,0,0)
TakePartyItem("BOOT4")~ EXIT
  IF ~~ THEN REPLY @11 EXIT
END

IF ~ Global("s#XGthf","GLOBAL",1)
PartyHasItem("SWORD02")~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN REPLY @10 DO ~GiveItemCreate("MISC07",Player1,10000,0,0)
TakePartyItem("SWORD02")~ EXIT
  IF ~~ THEN REPLY @11 EXIT
END

IF ~ Global("s#XGthf","GLOBAL",1)
OR(3) !PartyHasItem("BRAC1")
      !PartyHasItem("BOOT4")
      !PartyHasItem("SWORD02")~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN REPLY @15 EXIT
END


