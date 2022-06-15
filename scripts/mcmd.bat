@echo off
set executecounter=0
:loop
magick convert -quality 25 %executecounter%.jpg %executecounter%.jpg
set /a executecounter=%executecounter%+1
if "%executecounter%"=="552" goto done
goto loop
:done
echo Complete!
pause