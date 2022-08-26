@echo off
set executecounter=0
:loop
magick convert -trim %executecounter%.png %executecounter%.png
set /a executecounter=%executecounter%+1
if "%executecounter%"=="552" goto done
goto loop
:done
echo Complete!
pause