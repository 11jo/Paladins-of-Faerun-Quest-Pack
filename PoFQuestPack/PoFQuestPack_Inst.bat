
@ECHO OFF

copy PoFQuestPack\audio .\override

cd .\override

oggdec *.ogg

del oggdec.exe

del *.ogg

cd..

@echo.
@echo PoFQuestPack Installation complete.
@echo.


