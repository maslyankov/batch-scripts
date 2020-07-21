@echo off

:loop
echo . . .
adb devices
timeout 5
goto :loop
