
BEGIN ~XGPRISON~

IF ~GlobalGT("XG_PoF_GetMarco","GLOBAL",0) !GlobalGT("XG_PoF_GetMarco","GLOBAL",2)~ THEN BEGIN XGPRISONG
  SAY @1629 /* ~Halte ! Qui va là ?~ */
  IF ~Global("XG_PoF_GetMarco","GLOBAL",1)~ THEN REPLY @1630 /*~Je viens interroger un prisonnier au nom de la milice d'Eauprofonde.~*/ GOTO XGPRISONG1
  IF ~Global("XG_PoF_GetMarco","GLOBAL",2)~ THEN REPLY @1631 /*~Nous devons escorter le prisonnier Marco jusqu'à Eauprofonde.~*/  DO ~SetGlobal("XG_PoF_GetMarco","GLOBAL",3)~  EXIT
  IF ~RandomNum(3,1)~ THEN REPLY @1632 /*~Mêlez-vous de vos affaires !~*/ GOTO XGPRISONG3
  IF ~RandomNum(3,2)~ THEN REPLY @1632 /*~Mêlez-vous de vos affaires !~*/ GOTO XGPRISONG4
  IF ~RandomNum(3,3)~ THEN REPLY @1632 /*~Mêlez-vous de vos affaires !~*/ GOTO XGPRISONG5
END

IF ~GlobalGT("XG_PoF_GetMarco","GLOBAL",2)~ THEN BEGIN XGPRISONG6
  SAY ~~ /* ~Mon astreinte est terminé, bonne journée.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN XGPRISONG1
  SAY ~~ /* ~Ah ! En effet je vous attendez. Vous le trouverez dans la cellule centrale sur votre gauche.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN XGPRISONG3
  SAY #29750
  IF ~~ THEN EXIT
  END

IF ~~ THEN BEGIN XGPRISONG4
  SAY #29752
  IF ~~ THEN EXIT
  END

IF ~~ THEN BEGIN XGPRISONG5
  SAY #29753
  IF ~~ THEN EXIT
  END
  
  
// Extend other guards

EXTEND_BOTTOM PRISONG1 0 1 2
  IF ~Global("XG_PoF_GetMarco","GLOBAL",1)~ THEN REPLY @1630 /*~Je viens interroger un prisonnier au nom de la milice d'Eauprofonde.~*/ GOTO XGPRISONG1
  IF ~Global("XG_PoF_GetMarco","GLOBAL",2)~ THEN REPLY @1631 /*~Nous devons escorter le prisonnier Marco jusqu'à Eauprofonde.~*/ GOTO XGPRISONG2
END

APPEND PRISONG1
  IF ~~ THEN BEGIN XGPRISONG1
    SAY @1633 /*~Nous avons été mis au courant, vous pouvez passer.~*/
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN XGPRISONG2
    SAY @1634 /*~Allez voir l'agent de liaison dans le hall principal, c'est lui qui s'occupe des transferts de prisonniers.~*/
    IF ~~ THEN EXIT
  END
END
