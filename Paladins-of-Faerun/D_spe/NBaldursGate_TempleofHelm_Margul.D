EXTEND_BOTTOM PRIHEL 0
  IF ~Global("XGPoFinBG","GLOBAL",1) !Global("s#XGBLMAJ","GLOBAL",0) AreaCheck("%NBaldursGate_TempleofHelm%")~ THEN REPLY @1604 /* Je suis en service commandé pour le Duc Opas. Permettez-moi d’accéder aux catacombes. */ GOTO XGPoFinBGPRIHEL0
END

APPEND PRIHEL
  IF ~~ THEN BEGIN XGPoFinBGPRIHEL0
    SAY @1605 /* Très bien, veuillez me suivre. */
    IF ~~ THEN DO ~
ActionOverride(Player2,LeaveAreaLUA("XG0420","",[463.410],8))
ActionOverride(Player1,LeaveAreaLUA("XG0420","",[440.438],8))
ActionOverride(Player3,LeaveAreaLUA("XG0420","",[508.462],8))
ActionOverride(Player4,LeaveAreaLUA("XG0420","",[499.492],8))
ActionOverride(Player5,LeaveAreaLUA("XG0420","",[569.473],8))
ActionOverride(Player6,LeaveAreaLUA("XG0420","",[614.435],8))~EXIT
  END
END
