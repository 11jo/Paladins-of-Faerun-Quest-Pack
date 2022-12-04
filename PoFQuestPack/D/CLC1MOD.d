BEGIN ~XGclc1~

IF ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 
DO ~GiveItemCreate("LSMOD",Player1,0,0,0)
ActionOverride(Player2,LeaveAreaLUA("PF0064","",[716.2359],12))
ActionOverride(Player1,LeaveAreaLUA("PF0064","",[675.2334],12))
ActionOverride(Player3,LeaveAreaLUA("PF0064","",[691.2405],12))
ActionOverride(Player4,LeaveAreaLUA("PF0064","",[634.2383],12))
ActionOverride(Player5,LeaveAreaLUA("PF0064","",[697.2451],12))
ActionOverride(Player6,LeaveAreaLUA("PF0064","",[639.2455],12))
ReputationInc(-2)
AddExperienceParty(10000)~ UNSOLVED_JOURNAL @5 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN DO ~Enemy()
ReputationInc(1)
AddExperienceParty(10000)~ 
UNSOLVED_JOURNAL @7 EXIT
END
