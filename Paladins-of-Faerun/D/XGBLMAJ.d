BEGIN ~XGMAYW~

IF ~True()~ THEN BEGIN XGMAYW0
  SAY #5773 
  IF ~~ THEN EXIT
END

BEGIN ~XGMAYB~

IF ~True()~ THEN BEGIN XGMAYB0
  SAY #2008 
  IF ~~ THEN EXIT
END

BEGIN ~XGBGON~


// See XG0150.TRA

BEGIN ~XGBAN1A~

IF ~OR(2)
		Global("XGBAN1A_GUILDE_ON","GLOBAL",0)
		Global("XGBAN1A_GUILDE_OFF","GLOBAL",1)
		Dead("XGCRU")~ THEN BEGIN XGBAN1A0
  SAY ~ What will happen to our guild? ~
  IF ~~ THEN REPLY ~ I will appoint you a new guild leader, but if you ever fall under my feet again, you will end up in the same place as your predecessor. ~ DO ~SetGlobal("XGBAN1A_GUILDE_OFF","GLOBAL",1)~ GOTO XGBAN1A1
  IF ~Global("s#XGBLMAJ","GLOBAL",6)~ THEN REPLY ~Cette histoire n'est pas terminée...~ EXIT // GOTO XGBAN1_XGBGON1
  IF ~~ THEN REPLY ~Heu...~ EXIT // SetGlobal("XGBAN1A_GUILDE_ON","GLOBAL",1)
END


IF ~Global("XGBAN1A_GUILDE_OFF","GLOBAL",1)~ THEN BEGIN XGBAN1A1
  SAY ~ Thank you. You deserve our respect, none of our guilds will be in your way. ~
  IF ~~ THEN EXIT
  IF ~Global("s#XGBLMAJ","GLOBAL",6)~ THEN REPLY ~Cette histoire n'est pas terminée...~ EXIT // GOTO XGBAN1_XGBGON1
END

/*
IF ~~ THEN BEGIN XGBAN1_XGBGON1
  SAY ~~
  IF ~~ THEN EXIT
  //IF ~Global("s#XGBLMAJ","GLOBAL",6)~ THEN REPLY ~~ GOTO xxxx
END
*/

BEGIN ~XGBLMAJ~

IF ~NumberOfTimesTalkedTo(0) Global("s#XGBLMAJ","GLOBAL",0)~ THEN BEGIN 0
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
  IF ~~ THEN REPLY @30 DO ~SetGlobal("s#XGBLMAJ_Margul","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN REPLY @13 DO ~SetGlobal("s#XGBLMAJ","GLOBAL",1)
AddJournalEntry(@51204,QUEST)
ActionOverride(Player2,LeaveAreaLUA("XG0420","",[463.410],8))
ActionOverride(Player1,LeaveAreaLUA("XG0420","",[440.438],8))
ActionOverride(Player3,LeaveAreaLUA("XG0420","",[508.462],8))
ActionOverride(Player4,LeaveAreaLUA("XG0420","",[499.492],8))
ActionOverride(Player5,LeaveAreaLUA("XG0420","",[569.473],8))
ActionOverride(Player6,LeaveAreaLUA("XG0420","",[614.435],8))~ EXIT
END


IF ~Global("s#XGBLMAJ_Margul","LOCALS",1) !Global("s#XGBLMAJ","GLOBAL",1)~ THEN BEGIN XGBLMAJMargul
  SAY @31
  IF ~~ THEN REPLY @11 DO ~SetGlobal("s#XGBLMAJ_Margul","LOCALS",2)~ GOTO 6
  IF ~~ THEN REPLY @30 EXIT
END

IF ~Global("s#XGBLMAJ","GLOBAL",1)~ THEN BEGIN 7
  SAY @15
  IF ~PartyHasItem("XGMRBO")~ THEN REPLY @16 DO ~SetGlobal("s#XGBLMAJ","GLOBAL",2)~ GOTO 9.1
  IF ~!PartyHasItem("XGMRBO")~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @17
  IF ~Global("XGPoFXGFLAM10","GLOBAL",1)~ THEN REPLY @11 GOTO 8.1
  IF ~!Global("XGPoFXGFLAM10","GLOBAL",1)~ THEN REPLY @11 GOTO 8.2
END

IF ~~ THEN BEGIN 8.1
  SAY @27
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 8.2
  SAY @12
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 9.1
  SAY @28
  IF ~~ THEN GOTO 9.2
END

IF ~~ THEN BEGIN 9.2
  SAY @29
  IF ~~ THEN DO ~TakePartyItem("XGMRBO")
GiveGoldForce(2000)~ GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @18 
  IF ~~ THEN REPLY @19 GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @20
  IF ~~ THEN REPLY @21 GOTO 11
  IF ~~ THEN REPLY @22 GOTO 12
END

IF ~~ THEN BEGIN 11
  SAY @23
  IF ~~ THEN REPLY @24 DO ~SetGlobal("s#XGBLMAJ","GLOBAL",3)
GiveItemCreate("XGBGSD",Player1,0,0,0)
GiveItemCreate("MISC07",Player1,5000,0,0)
AddJournalEntry(@50801,QUEST)
FadeToColor([20.0],0)
Wait(2)
ActionOverride(Player2,LeaveAreaLUA("XG1220","",[680.1318],0))
ActionOverride(Player1,LeaveAreaLUA("XG1220","",[727.1309],0))
ActionOverride(Player3,LeaveAreaLUA("XG1220","",[665.1288],0))
ActionOverride(Player4,LeaveAreaLUA("XG1220","",[699.1256],0))
ActionOverride(Player5,LeaveAreaLUA("XG1220","",[755.1246],0))
ActionOverride(Player6,LeaveAreaLUA("XG1220","",[770.1300],0))
~ EXIT
END

IF ~~ THEN BEGIN 12
  SAY @26
  IF ~~ THEN DO ~SetGlobal("s#XGBLMAJ","GLOBAL",4)
EscapeArea()~ EXIT
END

IF ~Global("s#XGBLMAJ","GLOBAL",3) !InMyArea("XGMAYB") !InMyArea("XGMAYW")~ THEN BEGIN 20
  SAY @33 /*~Avez-vous retrouvé ma famille ?~*/
  IF ~~ THEN REPLY @33 /*~Je ne suis pas votre domestique, trouvez-vous un autre pigeon pour régler vos problèmes familiaux.~*/ GOTO 21
  IF ~~ THEN REPLY @34 /*~Non pas encore, l'enquête continue, je fais tout mon possible.~*/ EXIT
END

IF ~~ THEN BEGIN 21
  SAY @35 /*~Honte à vous !~*/
  IF ~~ THEN DO ~SetGlobal("s#XGBLMAJ","GLOBAL",4)
TakePartyItem("XGBGSD")
TakePartyGold(5000)
HideAreaOnMap("XG0050")
ReputationInc(-1)
EscapeArea()~ EXIT
END

IF ~GlobalGT("s#XGBLMAJ","GLOBAL",4)~ THEN BEGIN 22
  SAY @36 /*~Le héros de la porte de Baldur en personne, que puis je pour vous ?~ ~L’héroïne de la porte de Baldur en personne, que puis je pour vous ?~*/
  IF ~Global("s#XGBLMAJ","GLOBAL",5) Dead("XGCRU")~ THEN REPLY @37 /*~Je crois devoir vous prévenir que le commanditaire de cet enlèvement est l'un de vos proches conseillers, le délégué au commerce.~*/ GOTO XGBLMAJ_XGMAY2
  IF ~~ THEN REPLY @38 /*~Rien merci.~*/ EXIT
  // IF ~Global("s#XGBLMAJ","GLOBAL",6)~ THEN REPLY @39 /*~Vous vouliez des preuves ?~*/ GOTO XGBLMAJ_DELEG1
END

CHAIN IF ~Global("s#XGBLMAJ","GLOBAL",3) InMyArea("XGMAYB")InMyArea("XGMAYW")~ THEN XGBLMAJ XGBLMAJ_XGMAY1
@40 /*~Vous... Vous êtes de retour !~*/
== XGMAYB @41 /*~Oui !!!~*/
== XGBLMAJ @42 /*~Mon petit, tu n'es pas blessé ?~*/
== XGMAYB @43 /*~Non, mais je mangerais bien quelque chose.~*/
== XGMAYW @44 /*~Il a été très courageux !~*/
== XGMAYB @45 /*~C'est bien mon fils... Et toi comment te sens tu ? Il ne vous ont pas fait de mal ?~*/
== XGMAYW @46 /*~Non, mais ces voyous nous ont laissé dans une cellule des plus crasseuse. J'ai besoin d'un bon bain... Et d'un verre de vin.~*/
== XGBLMAJ @47 /*~Milady, vos désires sont des ordres.~*/
== XGBLMAJ @48 /*~Laissez moi juste le temps de remercier notre bienfaiteur...~*/
== XGBLMAJ @49 /*~<CHARNAME> ! Je suis votre débiteur, merci d'avoir ramené ma famille saine et sauve.~*/
END
		++ @50 /*~Pas de problème.~*/ DO ~
	SetGlobal("s#XGBLMAJ","GLOBAL",5)
    EraseJournalEntry(@50801)  
    EraseJournalEntry(@50802)  
    EraseJournalEntry(@50803) 
    EraseJournalEntry(@50804)  
    EraseJournalEntry(@50805)  
	AddJournalEntry(@50806,QUEST_DONE)
	AddexperienceParty(5000)~ EXIT
		+ ~Dead("XGCRU")~ + @51 /*~Vous serez surpris d'apprendre que le commanditaire de cet enlèvement est l'un de vos proches conseillers, le délégué au commerce.~*/ DO ~
	SetGlobal("s#XGBLMAJ","GLOBAL",5)
    EraseJournalEntry(@50801)  
    EraseJournalEntry(@50802)  
    EraseJournalEntry(@50803) 
    EraseJournalEntry(@50804)  
    EraseJournalEntry(@50805)  
	AddJournalEntry(@50806,QUEST_DONE)
	AddexperienceParty(5000)~ + XGBLMAJ_XGMAY2

CHAIN IF ~~ THEN XGBLMAJ XGBLMAJ_XGMAY2
@52 /*~Mon délégué au commerce ? C'est une sérieuse accusation.~*/
== XGBGON @53 /*~Infamie !~*/
== XGBLMAJ @54 /*~Silence !~*/
== XGBLMAJ @55 /*~<CHARNAME>, avez vous des preuves pour étayer ces accusations ?~*/
END
		++ @56 /*~Pas la moindre.~*/ + XGBLMAJ_XGMAY3
		++ @57 /*~Je l'ai vu rencontrer le maître chanteur. J'ose espérer que mon témoignage sera suffisant.~*/ + XGBLMAJ_XGMAY3

CHAIN IF ~~ THEN XGBLMAJ XGBLMAJ_XGMAY3
@58 /*~Je vois... Il en faudra plus pour décrédibiliser une figure aussi importante de notre gouvernement.~*/
== XGBGON @59 /*~Merci pour votre confiance grand duc...~*/
== XGBLMAJ @54 /*~Silence !~*/
== XGBLMAJ @60 /*~<CHARNAME>, sans preuve formelle de l'implication du délégué aucune procédure ne pourra être entamée à son encontre.~*/
END
		++ @61 /*~Très bien, cette histoire n'est pas terminée...~*/ DO ~SetGlobal("s#XGBLMAJ","GLOBAL",6)~ EXIT



