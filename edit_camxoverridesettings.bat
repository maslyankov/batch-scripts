@echo off
chdir ..
echo -- Edit Camxoverridesettings --

adb pull /vendor/etc/camera/camxoverridesettings.txt
echo - Opening in editor (rooting device meanwhile)...
start notepad++ camxoverridesettings.txt

adb root
adb remount

echo Pushing modifications to device?
pause

adb push camxoverridesettings.txt /vendor/etc/camera/
echo - 
echo - New camxoverridesettings.txt content:
adb shell cat /vendor/etc/camera/camxoverridesettings.txt

echo - 

choice /m Reboot
if not errorlevel 2 adb reboot

echo -------------------------------
echo Thanks for using Marty's script.
timeout 3
