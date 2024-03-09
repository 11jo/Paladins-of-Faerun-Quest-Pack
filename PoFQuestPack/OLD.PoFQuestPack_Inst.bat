
@ECHO OFF

copy PoFQuestPack\tools\tisunpack.exe .\override

copy PoFQuestPack\OLD.tiz .\override

cd .\override

tisunpack -s *.tiz

del tisunpack.exe

del *.tiz

cd..

@echo.
@echo PoFQuestPack Installation complete.
@echo.


