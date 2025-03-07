
EXTEND_BOTTOM XGELWI XG04191
  IF ~Global("EvilRaelis","GLOBAL",1)
Kit(Player1,ADULC)
~ THEN REPLY #50288 DO ~SetGlobal("EvilRaelis","GLOBAL",2)~ EXTERN ~RAELIS~ 79

APPEND XGELWI

CHAIN IF ~Global("RevealAreaXG0419","XG0419",1)~ THEN XGELWI XG04191
@25
== XGELWI @26 /*~Il semble qu'un portail menant directement à Athkatla se trouve à proximité. Mais ~*/
== XGELWI @27 /*~pour une telle expédition un moyen de transport pourrait être utile.Un équipage d'elfes est à votre disposition pour utiliser le navire de Gradak, il vous permettra d'atteindre différentes destinations comme les Dix-Cités, cela fait de vous un capitaine ~ ~Un équipage d'elfes est à votre disposition pour utiliser le navire de Gradak, il vous permettra d'atteindre différentes destinations comme les Dix-Cités, cela fait de vous une capitaine ~*/
== XGELWI @28 /*~Un prêtre a été dépêché pour essayer de ramener à la vie Elenar et ses compagnons d'infortune...~*/
== XGELWI @29 /*~Il ne tient qu'à vous de l'aider dans sa tâche.~*/
END
		++ @30 /*~Très bien, je ferais mon possible.~*/ + XG04192
		++ @31 /*~Oui, oui, il est temps de partir à présent~*/ EXIT


CHAIN IF ~~ THEN XGELWI XG04192
@32 /*~Merci, nous n'abandonnons jamais ceux ou celles qui peuvent être sauvés.~*/
== XGELWI @33 /*~Vous avez fort à faire, bonne chance mon ami.~ ~Vous avez fort à faire, bonne chance mon amie...~*/
== XGELWI @34 /*~Et bon vent, capitaine <CHARNAME> !~*/
END
		++ @35 /*~Au revoir Elwin.~*/ EXIT


	END
