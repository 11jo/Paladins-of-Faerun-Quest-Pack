BEGIN ~XGMAGT~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 3
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN 0.1
  SAY @34 /* ~What do you have for me ?~ */
IF ~PartyHasItem("XGGLAVE")~ THEN REPLY @20 /*~J'ai une épée longue récupérer dans mes combat avec les paladins de Féérune.~*/ GOTO 1
IF ~PartyHasItem("SW1H04")~ THEN REPLY @21 /*~J'ai une épée longue normale.~*/ GOTO 10
// To create +2
IF ~PartyHasItem("XGGLAV7")~ THEN REPLY @22 /*~J'ai une épée longue de feu +1 de votre création.~*/ DO ~SetGlobal("XGGLAV7","GLOBAL",1)~ GOTO 20
IF ~PartyHasItem("XGGLAV8")~ THEN REPLY @23 /*~J'ai une épée longue de glace +1 de votre création.~*/ DO ~SetGlobal("XGGLAV8","GLOBAL",1)~ GOTO 20
IF ~PartyHasItem("XGGLAV9")~ THEN REPLY @24 /*~J'ai une épée longue acide +1 de votre création.~*/ DO ~SetGlobal("XGGLAV9","GLOBAL",1)~ GOTO 20
IF ~PartyHasItem("XGLAV10")~ THEN REPLY @25 /*~J'ai une épée longue empoisonnée +1 de votre création.~*/ DO ~SetGlobal("XGLAV10","GLOBAL",1)~ GOTO 20
// To create +3
IF ~PartyHasItem("XGGLAV17") GlobalGT("Chapter","GLOBAL","%bg2_chapter_4%")~ THEN REPLY @26 /*~J'ai une épée longue de feu +2 de votre création.~*/ DO ~SetGlobal("XGGLAV17","GLOBAL",1)~ GOTO 30
IF ~PartyHasItem("XGGLAV18") GlobalGT("Chapter","GLOBAL","%bg2_chapter_4%")~ THEN REPLY @27 /*~J'ai une épée longue de glace +2 de votre création.~*/ DO ~SetGlobal("XGGLAV18","GLOBAL",1)~ GOTO 30
IF ~PartyHasItem("XGGLAV19") GlobalGT("Chapter","GLOBAL","%bg2_chapter_4%")~ THEN REPLY @28 /*~J'ai une épée longue acide +2 de votre création.~*/ DO ~SetGlobal("XGGLAV19","GLOBAL",1)~ GOTO 30
IF ~PartyHasItem("XGLAV11") GlobalGT("Chapter","GLOBAL","%bg2_chapter_4%")~ THEN REPLY @29 /*~J'ai une épée longue empoisonnée +2 de votre création.~*/ DO ~SetGlobal("XGLAV11","GLOBAL",1)~ GOTO 30
// To create special combinaison +1
IF ~PartyHasItem("XGGLAV7") PartyHasItem("XGGLAV8") PartyHasItem("XGGLAV9") PartyHasItem("XGLAV10")~ THEN REPLY @35 /*~J'ai un set complet de vos épées longue +1.~*/ GOTO 100
// To create special combinaison +2
IF ~PartyHasItem("XGGLAV17") PartyHasItem("XGGLAV18") PartyHasItem("XGGLAV19") PartyHasItem("XGLAV11")~ THEN REPLY @36 /*~J'ai un set complet de vos épées longue +2.~*/ GOTO 100
// To create special combinaison +3
IF ~PartyHasItem("XGGLAV27") PartyHasItem("XGGLAV28") PartyHasItem("XGGLAV29") PartyHasItem("XGLAV21")~ THEN REPLY @37 /*~J'ai un set complet de vos épées longue +3.~*/ GOTO 100
// To create special combinaison special
IF ~PartyGoldGT(50000) GlobalGT("Chapter","GLOBAL","%bg2_chapter_7%") PartyHasItem("XGGLAV30") PartyHasItem("XGGLAV31") PartyHasItem("XGGLAV32")~ THEN REPLY @43 /*~J'ai réuni vos trois épées magiques spéciales.~*/ GOTO 200
IF ~~ THEN REPLY @8 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~PartyGoldGT(2000)~ THEN REPLY @4 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGGLAV7",Player1,0,0,0) DestroyItem("XGGLAVE")
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @5 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGGLAV8",Player1,0,0,0) DestroyItem("XGGLAVE")
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @6 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGGLAV9",Player1,0,0,0) DestroyItem("XGGLAVE")
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2500)~ THEN REPLY @7 DO ~TakePartyItem("XGGLAVE")
GiveItemCreate("XGLAV10",Player1,0,0,0) DestroyItem("XGGLAVE")
TakePartyGold(2500)
~ EXIT
  IF ~~ THEN REPLY @8 EXIT
END

IF ~~ THEN BEGIN 10
  SAY @3
  IF ~PartyGoldGT(2000)~ THEN REPLY @4 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGGLAV7",Player1,0,0,0) DestroyItem("SW1H04")
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @5 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGGLAV8",Player1,0,0,0) DestroyItem("SW1H04")
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2000)~ THEN REPLY @6 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGGLAV9",Player1,0,0,0) DestroyItem("SW1H04")
TakePartyGold(2000)
~ EXIT
  IF ~PartyGoldGT(2500)~ THEN REPLY @7 DO ~TakePartyItem("SW1H04")
GiveItemCreate("XGLAV10",Player1,0,0,0) DestroyItem("SW1H04")
TakePartyGold(2500)
~ EXIT
  IF ~~ THEN REPLY @8 EXIT
END

IF ~~ THEN BEGIN 100
  SAY @38 /*~Great, that's it... Whaaaaat ?~*/
  IF ~PartyHasItem("XGGLAV7") PartyHasItem("XGGLAV8") PartyHasItem("XGGLAV9") PartyHasItem("XGLAV10")~ THEN REPLY @40 /*~J'ai un set complet de vos épées longue +1. Est-ce un problème ?.~*/ GOTO 101
  IF ~PartyHasItem("XGGLAV17") PartyHasItem("XGGLAV18") PartyHasItem("XGGLAV19") PartyHasItem("XGLAV11")~ THEN REPLY @41 /*~J'ai un set complet de vos épées longue +2. Est-ce un problème ?.~*/ GOTO 101
  IF ~PartyHasItem("XGGLAV27") PartyHasItem("XGGLAV28") PartyHasItem("XGGLAV29") PartyHasItem("XGLAV21")~ THEN REPLY @42 /*~J'ai un set complet de vos épées longue +3. Est-ce un problème ?.~*/ GOTO 101
  IF ~~ THEN REPLY @8 EXIT
END

IF ~!NumTimesTalkedTo(0)
!PartyHasItem("XGGLAVE")
!PartyHasItem("SW1H04")
!PartyHasItem("XGGLAV7")
!PartyHasItem("XGGLAV8")
!PartyHasItem("XGGLAV9")
!PartyHasItem("XGLAV10")
!PartyHasItem("XGGLAV17")
!PartyHasItem("XGGLAV18")
!PartyHasItem("XGGLAV19")
!PartyHasItem("XGLAV11")
!PartyHasItem("XGGLAV27")
!PartyHasItem("XGGLAV28")
!PartyHasItem("XGGLAV29")
!PartyHasItem("XGLAV21")~ THEN BEGIN 2
  SAY @9
  IF ~~ THEN REPLY @10 EXIT
END

IF ~~ THEN BEGIN 3
  SAY @11
  IF ~~ THEN EXIT
END

// To create +2
IF ~~ THEN BEGIN 20
  SAY @3
  IF ~PartyGoldGT(5000) Global("XGGLAV7","GLOBAL",1) PartyHasItem("XGGLAV7")~ THEN REPLY @12 DO ~SetGlobal("XGGLAV7","GLOBAL",0) TakePartyItem("XGGLAV7")
GiveItemCreate("XGGLAV17",Player1,0,0,0) DestroyItem("XGGLAV7")
TakePartyGold(5000)
~ EXIT
  IF ~PartyGoldGT(5000) Global("XGGLAV8","GLOBAL",1) PartyHasItem("XGGLAV8")~ THEN REPLY @13 DO ~SetGlobal("XGGLAV8","GLOBAL",0) TakePartyItem("XGGLAV8")
GiveItemCreate("XGGLAV18",Player1,0,0,0) DestroyItem("XGGLAV8")
TakePartyGold(5000) 
~ EXIT
  IF ~PartyGoldGT(5000) Global("XGGLAV9","GLOBAL",1) PartyHasItem("XGGLAV9")~ THEN REPLY @14 DO ~SetGlobal("XGGLAV9","GLOBAL",0) TakePartyItem("XGGLAV9")
GiveItemCreate("XGGLAV19",Player1,0,0,0) DestroyItem("XGGLAV9")
TakePartyGold(5000)
~ EXIT
  IF ~PartyGoldGT(6000) Global("XGLAV10","GLOBAL",1) PartyHasItem("XGLAV10")~ THEN REPLY @15 DO ~SetGlobal("XGLAV10","GLOBAL",0) TakePartyItem("XGLAV10")
GiveItemCreate("XGLAV11",Player1,0,0,0) DestroyItem("XGLAV10")
TakePartyGold(6000)
~ EXIT
  IF ~~ THEN REPLY @8 DO ~SetGlobal("XGGLAV7","GLOBAL",0) SetGlobal("XGGLAV8","GLOBAL",0) SetGlobal("XGGLAV9","GLOBAL",0) SetGlobal("XGLAV10","GLOBAL",0)~ EXIT
END

// To create +3
IF ~~ THEN BEGIN 30
  SAY @3
  IF ~PartyGoldGT(10000) Global("XGGLAV17","GLOBAL",1) PartyHasItem("XGGLAV17")~ THEN REPLY @16 DO ~TakePartyItem("XGGLAV17")
GiveItemCreate("XGGLAV27",Player1,0,0,0) DestroyItem("XGGLAV17")
TakePartyGold(10000) SetGlobal("XGGLAV17","GLOBAL",0)
~ EXIT
  IF ~PartyGoldGT(10000) Global("XGGLAV18","GLOBAL",1) PartyHasItem("XGGLAV18")~ THEN REPLY @17 DO ~TakePartyItem("XGGLAV18")
GiveItemCreate("XGGLAV28",Player1,0,0,0) DestroyItem("XGGLAV18")
TakePartyGold(10000) SetGlobal("XGGLAV18","GLOBAL",0)
~ EXIT
  IF ~PartyGoldGT(10000) Global("XGGLAV19","GLOBAL",1) PartyHasItem("XGGLAV19")~ THEN REPLY @18 DO ~TakePartyItem("XGGLAV19")
GiveItemCreate("XGGLAV29",Player1,0,0,0) DestroyItem("XGGLAV19")
TakePartyGold(10000) SetGlobal("XGGLAV19","GLOBAL",0)
~ EXIT
  IF ~PartyGoldGT(11000) Global("XGLAV11","GLOBAL",1) PartyHasItem("XGLAV11")~ THEN REPLY @19 DO ~TakePartyItem("XGLAV11")
GiveItemCreate("XGLAV21",Player1,0,0,0) DestroyItem("XGLAV11")
TakePartyGold(11000) SetGlobal("XGLAV11","GLOBAL",0)
~ EXIT
  IF ~~ THEN REPLY @8 DO ~SetGlobal("XGGLAV17","GLOBAL",0) SetGlobal("XGGLAV18","GLOBAL",0) SetGlobal("XGGLAV19","GLOBAL",0) SetGlobal("XGLAV11","GLOBAL",0)~ EXIT
END


// To create special combinaison
IF ~~ THEN BEGIN 101
  SAY @39 /*~Non, je n'ai jamais vu quelqu'un aussi passionné par mon travail, vous méritez bien une « petite » récompense... Mais ne vous blessez pas avec !~*/
  IF ~PartyHasItem("XGGLAV7") PartyHasItem("XGGLAV8") PartyHasItem("XGGLAV9") PartyHasItem("XGLAV10")~ THEN DO ~TakePartyItem("XGGLAV7") TakePartyItem("XGGLAV8") TakePartyItem("XGGLAV9") TakePartyItem("XGLAV10")
GiveItemCreate("XGGLAV30",Player1,0,0,0) DestroyItem("XGGLAV7") DestroyItem("XGGLAV8") DestroyItem("XGGLAV9") DestroyItem("XGLAV10")
~ EXIT
  IF ~PartyHasItem("XGGLAV17") PartyHasItem("XGGLAV18") PartyHasItem("XGGLAV19") PartyHasItem("XGLAV11")~ THEN DO ~TakePartyItem("XGGLAV17") TakePartyItem("XGGLAV18") TakePartyItem("XGGLAV19") TakePartyItem("XGLAV11")
GiveItemCreate("XGGLAV31",Player1,0,0,0) DestroyItem("XGGLAV17") DestroyItem("XGGLAV18") DestroyItem("XGGLAV19") DestroyItem("XGLAV11")
~ EXIT
  IF ~PartyHasItem("XGGLAV27") PartyHasItem("XGGLAV28") PartyHasItem("XGGLAV29") PartyHasItem("XGLAV21")~ THEN DO ~TakePartyItem("XGGLAV27") TakePartyItem("XGGLAV28") TakePartyItem("XGGLAV29") TakePartyItem("XGLAV21")
GiveItemCreate("XGGLAV32",Player1,0,0,0) DestroyItem("XGGLAV27") DestroyItem("XGGLAV28") DestroyItem("XGGLAV29") DestroyItem("XGLAV21")
~ EXIT
END

// To create special special special combinaison
IF ~~ THEN BEGIN 200
  SAY @44 /*~Je dois avoir la berlue... Mais comment ?~*/
  IF ~PartyGoldGT(50000) PartyHasItem("XGGLAV30") PartyHasItem("XGGLAV31") PartyHasItem("XGGLAV32")~ THEN REPLY @45 /*~L'argent, l'aventure et un marchand de de bric et de broque magique !~*/ GOTO 201
  IF ~~ THEN REPLY @8 EXIT
END


IF ~~ THEN BEGIN 201
  SAY @46 /*~Hum, à ce niveau, je ne réponds plus de rien.~*/
  IF ~~ THEN DO ~TakePartyItem("XGGLAV30") TakePartyItem("XGGLAV31") TakePartyItem("XGGLAV32")
GiveItemCreate("XGGLAV40",Player1,0,0,0) DestroyItem("XGGLAV30") DestroyItem("XGGLAV31") DestroyItem("XGGLAV32") 
TakePartyGold(50000)
~ EXIT
END
