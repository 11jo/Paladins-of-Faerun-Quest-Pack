// Générique DLG for générique pnj


//  WRITE_ASCII 0x2cc ~JODLGHN~ (8) // DLG

/*
// Homme standard

#4900  = ~Ma femme m'a chauffé les oreilles.~ [MTOWN04]
#11086  = ~Parlez plus fort, plus fort !~ [GENMG09]
#11091  = ~Euh... Vous avez quelque chose en tête ?~ [GENMG11]
#11092  = ~Ouais, cop' ?~ [GENMG12]
#11094  = ~Ciao.~ [GENMG14]
#11095 = ~Salut, toi !~ [GENMG15]
#11081  = ~Vous avez besoin de quelque chose ?~ [GENMG04]
#11084  = ~Vous disiez ?~ [GENMG07]
#11077  = ~Oui ?~ [GENMG01]
#11079  = ~Hein ?~ [GENMG03]
#11231  = ~Hé, hé ! Hors de mon chemin, espèce de vieux bûcheron desséché ! Ha ha !~ [MTOWN01] ~Hé, hé ! Hors de mon chemin, espèce de vieille bûcheronne desséchée ! Ha ha !~ [MTOWN01]
#11078  = ~Que désirez-vous ?~ [GENMG02]
#11082  = ~Bonjour la compagnie.~ [GENMG05]
#11083  = ~Salut, camarade.~ [GENMG06]
#11085  = ~Salut.~ [GENMG08]


// Homme ennemi

#11096  = ~Toutes mes excuses, mais je crains d'avoir à vous tuer.~ [GENMT01]
#11097  = ~Vous l'aurez bien cherché, cop'. Attendez voir...~ [GENMT02]
#11098  = ~J'ai une lame avec votre nom dessus.~ [GENMT03]
#11099  = ~Votre fin est proche, on parie ?~ [GENMT04]
#11101  = ~Mes excuses, mais vous avez rendez-vous avec la mort.~ [GENMT05]
#11102  = ~Je vais vous écrabouiller la tête ! Vous allez voir, je vais vous faire votre affaire !~ [GENMT06]
#11103  = ~Je préférerais qu'on arrête les bavardages et qu'on passe au carnage.~ [GENMT07]
#11104  = ~À votre place, je prendrais la poudre d'escampette.~ [GENMT08]
#11105  = ~Craignez mon courroux, car il est grand en effet !~ [GENMT09]
#11106  = ~Allez, dégainez vos épées et vos sorts et passons aux choses sérieuses, hein !~ [GENMT10]
*/

BEGIN ~JODLGHN~  // Man neutral

IF ~RandomNum(15,1)~ THEN BEGIN 0
  SAY #4900 /* Ma femme m'a chauffé les oreilles.~ [MTOWN04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,2)~ THEN BEGIN 1
  SAY #11086 /* Parlez plus fort, plus fort !~ [GENMG09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,3)~ THEN BEGIN 2
  SAY #11091 /* Euh... Vous avez quelque chose en tête ?~ [GENMG11] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,4)~ THEN BEGIN 3
  SAY #11092 /* Ouais, cop' ?~ [GENMG12] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,5)~ THEN BEGIN 4
  SAY #11094 /* Ciao.~ [GENMG14] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,6)~ THEN BEGIN 5
  SAY #11095 /* Salut, toi !~ [GENMG15] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,7)~ THEN BEGIN 6
  SAY #11081 /* Vous avez besoin de quelque chose ?~ [GENMG04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,8)~ THEN BEGIN 7
  SAY #11084 /* Vous disiez ?~ [GENMG07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,9)~ THEN BEGIN 8
  SAY #11077 /* Oui ?~ [GENMG01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,10)~ THEN BEGIN 9
  SAY #11079 /* Hein ?~ [GENMG03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,11)~ THEN BEGIN 10
  SAY #11231 /* Hé, hé ! Hors de mon chemin, espèce de vieux bûcheron desséché ! Ha ha !~ [MTOWN01] ~Hé, hé ! Hors de mon chemin, espèce de vieille bûcheronne desséchée ! Ha ha !~ [MTOWN01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,12)~ THEN BEGIN 11
  SAY #11078 /* Que désirez-vous ?~ [GENMG02] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,13)~ THEN BEGIN 12
  SAY #11082 /* Bonjour la compagnie.~ [GENMG05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,14)~ THEN BEGIN 13
  SAY #11083 /* Salut, camarade.~ [GENMG06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(15,15)~ THEN BEGIN 14
  SAY #11085 /* Salut.~ [GENMG08] */
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGHH~   // Man hostile

IF ~RandomNum(10,1)~ THEN BEGIN 0
  SAY #11096 /* Toutes mes excuses, mais je crains d'avoir à vous tuer.~ [GENMT01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,2)~ THEN BEGIN 1
  SAY #11097 /* Vous l'aurez bien cherché, cop'. Attendez voir...~ [GENMT02] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,3)~ THEN BEGIN 2
  SAY #11098 /* J'ai une lame avec votre nom dessus.~ [GENMT03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,4)~ THEN BEGIN 3
  SAY #11099 /* Votre fin est proche, on parie ?~ [GENMT04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,5)~ THEN BEGIN 4
  SAY #11101 /* Mes excuses, mais vous avez rendez-vous avec la mort.~ [GENMT05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,6)~ THEN BEGIN 5
  SAY #11102 /* Je vais vous écrabouiller la tête ! Vous allez voir, je vais vous faire votre affaire !~ [GENMT06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,7)~ THEN BEGIN 6
  SAY #11103 /* Je préférerais qu'on arrête les bavardages et qu'on passe au carnage.~ [GENMT07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,8)~ THEN BEGIN 7
  SAY #11104 /* À votre place, je prendrais la poudre d'escampette.~ [GENMT08] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,9)~ THEN BEGIN 8
  SAY #11105 /* Craignez mon courroux, car il est grand en effet !~ [GENMT09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,10)~ THEN BEGIN 9
  SAY #11106 /* Allez, dégainez vos épées et vos sorts et passons aux choses sérieuses, hein !~ [GENMT10] */
  IF ~~ THEN EXIT
END

/*
// Femme standard

#11110  = ~Ciao.~ [GENFG03]
#11111  = ~Hé là, camarade.~ [GENFG04]
#11112  = ~Oui, camarade ?~ [GENFG05]
#11113  = ~Puis-je vous aider ?~ [GENFG06]
#11114  = ~Besoin de quelque chose ?~ [GENFG07]
#11115  = ~Bienvenue.~ [GENFG08]
#11116  = ~Enchantée de faire votre connaissance.~ [GENFG09]
#11117  = ~Salutations.~ [GENFG10]
#11118  = ~Oui ?~ [GENFG11]
#11119  = ~Bonjour la compagnie.~ [GENFG12]
#11120  = ~Comment ça va ?~ [GENFG13]
#11121  = ~Qu'est-ce que vous avez à raconter ?~ [GENFG14]
#11122  = ~Quoi ?~ [GENFG15]

// Femme ennemi

#11123  = ~Ça peut paraître indigne d'une dame mais je vais vous égorger ! Vous allez voir ça !~ [GENFT01]
#11124  = ~On dirait bien que je vais vous achever sur place, et tout et tout.~ [GENFT02]
#11125  = ~'Feriez mieux de faire la paix avec vos démons, avant que j'vous envoie les rejoindre.~ [GENFT03]
#11126  = ~Vot' fin sera rapide, si vous vous laissez faire...~ [GENFT04]
#11127  = ~J'suis d'avis que vous mangerez les pissenlits par la racine avant la fin de la nuit.~ [GENFT05]
#11128  = ~Vot' vie n'a aucun intérêt pour moi.~ [GENFT06]
#11129  = ~Vos cris seront doux à mes oreilles.~ [GENFT07]
#11130  = ~Vous s'rez plus de ce monde quand j'en aurai fini avec vous !~ [GENFT08]
#11131  = ~J'vais vous écraser !~ [GENFT09]
#11132  = ~Z'allez crever ! J'vais m'en assurer !~ [GENFT10]
*/

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGWN~  // Woman neutral

IF ~RandomNum(13,1)~ THEN BEGIN 0
  SAY #11110 /* ~Ciao.~ [GENFG03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,2)~ THEN BEGIN 1
  SAY #11111 /* ~Hé là, camarade.~ [GENFG04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,3)~ THEN BEGIN 2
  SAY #11112 /* ~Oui, camarade ?~ [GENFG05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,4)~ THEN BEGIN 3
  SAY #11113 /* ~Puis-je vous aider ?~ [GENFG06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,5)~ THEN BEGIN 4
  SAY #11114 /* ~Besoin de quelque chose ?~ [GENFG07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,6)~ THEN BEGIN 5
  SAY #11115 /* ~Bienvenue.~ [GENFG08] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,7)~ THEN BEGIN 6
  SAY #11116 /* ~Enchantée de faire votre connaissance.~ [GENFG09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,8)~ THEN BEGIN 7
  SAY #11117 /* ~Salutations.~ [GENFG10] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,9)~ THEN BEGIN 8
  SAY #11118 /* ~Oui ?~ [GENFG11] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,10)~ THEN BEGIN 9
  SAY #11119 /* ~Bonjour la compagnie.~ [GENFG12] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,11)~ THEN BEGIN 10
  SAY #11120 /* ~Comment ça va ?~ [GENFG13] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,12)~ THEN BEGIN 11
  SAY #11121 /* ~Qu'est-ce que vous avez à raconter ?~ [GENFG14] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(13,13)~ THEN BEGIN 12
  SAY #11122 /* ~Quoi ?~ [GENFG15] */
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////

BEGIN ~JODLGWH~   // Woman hostile

IF ~RandomNum(10,1)~ THEN BEGIN 0
  SAY #11123 /* ~Ça peut paraître indigne d'une dame mais je vais vous égorger ! Vous allez voir ça !~ [GENFT01] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,2)~ THEN BEGIN 1
  SAY #11124 /* ~On dirait bien que je vais vous achever sur place, et tout et tout.~ [GENFT02] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,3)~ THEN BEGIN 2
  SAY #11125 /* ~'Feriez mieux de faire la paix avec vos démons, avant que j'vous envoie les rejoindre.~ [GENFT03] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,4)~ THEN BEGIN 3
  SAY #11126 /* ~Vot' fin sera rapide, si vous vous laissez faire...~ [GENFT04] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,5)~ THEN BEGIN 4
  SAY #11127 /* ~J'suis d'avis que vous mangerez les pissenlits par la racine avant la fin de la nuit.~ [GENFT05] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,6)~ THEN BEGIN 5
  SAY #11128 /* ~Vot' vie n'a aucun intérêt pour moi.~ [GENFT06] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,7)~ THEN BEGIN 6
  SAY #11129 /* ~Vos cris seront doux à mes oreilles.~ [GENFT07] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,8)~ THEN BEGIN 7
  SAY #11130 /* ~Vous s'rez plus de ce monde quand j'en aurai fini avec vous !~ [GENFT08] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,9)~ THEN BEGIN 8
  SAY #11131 /* ~J'vais vous écraser !~ [GENFT09] */
  IF ~~ THEN EXIT
END

IF ~RandomNum(10,10)~ THEN BEGIN 9
  SAY #11132 /* ~Z'allez crever ! J'vais m'en assurer !~ [GENFT10] */
  IF ~~ THEN EXIT
END
