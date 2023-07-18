
@ECHO OFF

copy PoFQuestPack\tisunpack.exe .\override

copy PoFQuestPack\tiz .\override

cd .\override

tisunpack -s *.tiz

del tisunpack.exe

del *.tiz

cd..




copy PoFQuestPack\audio .\override

cd .\override

oggdec *.ogg

del oggdec.exe

del *.ogg

cd..

@echo.
@echo PoFQuestPack Installation complete.
@echo.


