@echo off
chdir .. 
timeout 2

:loop
echo - Gettting new images/videos...
echo -
adb pull sdcard/DCIM/Camera

echo - Removing fetched images/videos from device... 
echo - 
adb shell rm -rf sdcard/DCIM/Camera
echo Yezz! Fetched and cleaned!

choice /m Again
if not errorlevel 2 goto :loop

echo -------------------------------
echo Thanks for using Marty's script.
timeout 3
