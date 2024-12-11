BEGIN ~XGELVW0A~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 2
  IF ~Dead("XGYARCO1")~ THEN REPLY @8 GOTO 6
END

IF ~~ THEN BEGIN 2
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN EXIT
END

IF ~!NumTimesTalkedTo(0) Global("DeadXGYARCO1","XG0017",0)~ THEN BEGIN 5
  SAY @9
  IF ~~ THEN EXIT
END

IF ~Global("DeadXGYARCO1","XG0017",1)~ THEN BEGIN 6
  SAY @10
  IF ~~ THEN DO ~SetGlobal("DeadXGYARCO1","XG0017",2) MoveToPoint([947.3261])~ EXIT
END

IF ~Global("DeadXGYARCO1","XG0017",2)~ THEN BEGIN 7
  SAY @11
  IF ~~ THEN EXIT
END


/*
OpenState("DOOR04",TRUE)
CloseDoor("DOOR02")
OpenDoor("DOOR02")

Nous pouvons emprunter le passsage, j'attendrais prêt du pont levis que vous enclenchier son mécanisme.*/