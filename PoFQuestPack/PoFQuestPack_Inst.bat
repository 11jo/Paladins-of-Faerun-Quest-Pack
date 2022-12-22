
@ECHO OFF

copy PoFQuestPack\audio .\override

cd .\override

oggdec XG*.ogg

del oggdec.exe

del XG*.ogg

cd..

@echo.
@echo PoFQuestPack Installation complete.
@echo.


