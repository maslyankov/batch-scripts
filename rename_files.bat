:: You need a separate file suffixes.txt with suffixes separated by new line.
@echo off
setlocal EnableDelayedExpansion
echo Renaming images...

echo.

set /p base_name="Enter Base name (gosho_10.jpg <- gosho is Base): "
IF DEFINED base_name (SET base_name=%base_name%_)
echo Base name= %base_name%

echo.

set /p ext="Enter file type (gosho_10.jpg <- jpg is ext and default): "
IF NOT DEFINED ext (SET ext=jpg)
echo EXT= %ext%

echo.

echo Ran at %DATE% %TIME% >> log.txt
echo.
echo. >> log.txt

echo What is the file order
echo 1. Ascending (Low to High)
ECHO 2. Descending (High to Low)
choice /T 10 /C 12 /D 2
IF ERRORLEVEL == 2 GOTO desc
IF ERRORLEVEL == 1 GOTO asc

:: After a lot of testing, turns out this sorting part is inconsistent for unknown reasons
:desc
	:: Should be Ascending but it is fucked up for some reason
	set order-arg=O:D
	echo Descending
	echo Descending >> log.txt
	echo. >> log.txt
GOTO cont

:asc
	:: Should be Descending but it is fucked up for some reason
	set order-arg=O:-D
	echo Ascending
	echo Ascending >> log.txt
	echo. >> log.txt
GOTO cont

:cont
echo order is %order-arg% >> log.txt
echo.
echo. >> log.txt
pause


dir /b /%order-arg% *.%ext%

< suffixes.txt (
   echo dir /b /%order-arg% *.%ext% >> log.txt
   echo. >> log.txt
   for /F "delims=" %%a in ('dir /b /%order-arg% *.%ext%') do (
      set /P suffix=
      ren "%%~Na%%~Xa" "%base_name%!suffix!%%~Xa"
	    :: echo ren "%%~Na%%~Xa" "%base_name%!suffix!%%~Xa" >> log.txt
      echo Renamed %%~Na%%~Xa to %base_name%!suffix!%%~Xa!
      echo Renamed %%~Na%%~Xa to %base_name%!suffix!%%~Xa! >> log.txt
	  echo. >> log.txt
   )
)

timeout 2 /nobreak

echo Done!

echo. >> log.txt
echo Done >> log.txt
echo. >> log.txt
echo. >> log.txt
echo ------------------------------- >> log.txt

echo -------------------------------
echo Thanks for using Marty's script.
timeout 15
