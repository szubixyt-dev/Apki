@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion
call :center "Ładowanie..."
title Apki Build 3.2
set "APPDIR=%APPDATA%\Bridge Studios\Apki"
set "PACKAGES=%APPDIR%\packages"
set "SETTINGS=%APPDIR%\settings"
if not exist "%APPDIR%" mkdir "%APPDIR%"
if not exist "%PACKAGES%" mkdir "%PACKAGES%"
if not exist "%SETTINGS%" mkdir "%SETTINGS%"
if not exist "%SETTINGS%\color.cfg" echo 1F>"%SETTINGS%\color.cfg"
set /p COLORCFG=<"%SETTINGS%\color.cfg"
color %COLORCFG%

call :center "Wyszukiwanie potencjalnych aktualizacji..."
set "wersja=9"

if not exist "%APPDIR%\settings\noupdates" (

    powershell -NoProfile -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/szubixyt-dev/Apki/main/version.txt' -UseBasicParsing -OutFile '%TEMP%\version.txt'"

    set /p onlinever=<"%TEMP%\version.txt"

    call :center "Online: [!onlinever!]"
    call :center "Lokalna: [!wersja!]"

    if not "!onlinever!"=="!wersja!" (
        msg * Znaleziono aktualizacje! Aktualizowanie programu...
		copy "%APPDIR%\uninstaller\updater.bat" "%TEMP%"
        start "" "%TEMP%\updater.bat"
        exit
    )
)

:menu
color %COLORCFG%
cls
echo.
call :center "=================================================="
call :center "APKI"
call :center "BUILD 3.2"
call :center "=================================================="
echo.
echo                                                      1. Pakiety
echo                                                      2. Ustawienia
echo                                                      3. Informacje
echo                                                      4. Instrukcja
echo                                                      5. Instalator
echo                                                      6. Odinstalator
echo                                                      7. Wyjście
echo.	
set /p wybor="ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ Wybierz opcje: " 

if "%wybor%"=="1" goto packages
if "%wybor%"=="2" goto settings
if "%wybor%"=="3" goto info
if "%wybor%"=="4" goto instrukcja
if "%wybor%"=="5" goto install
if "%wybor%"=="6" goto uninstall
if "%wybor%"=="7" exit

goto menu

:install
color %COLORCFG%
cls
:: Instalator Programow

call :center "=========================================="
call :center "INSTALATOR"
call :center "=========================================="
echo.
call :center "Przyklady:"
call :center "Google.Chrome"
call :center "(firma).(program)"
echo.
call :center "Wpisz program do instalacji."
call :center "Wpisz 0 aby wrocic."
echo.

set /p "input=> "

if "%input%"=="0" goto menu

winget install "%input%"

echo.
call :center "Kliknij dowolny przycisk by kontynuować"
pause >nul
goto install

:packages
cls
call :center "=========================================="
call :center "PAKIETY"
call :center "=========================================="
echo.
if not exist "C:\Users\%username%\AppData\Roaming\Bridge Studios\Apki\packages\*" (
    goto packages_install
)
call :center "Witamy w instalatorze pakietów"
echo.
call :center "Wybierz dowolny pakiet, by zobaczyć zawartość"

set "FOLDER=%AppData%\Bridge Studios\Apki\packages"
set /a i=0

for %%F in ("%FOLDER%\*") do (
    if exist "%%~fF" (
        set /a i+=1
        set "FILE[!i!]=%%~nF"
        echo                                                     !i!. %%~nF
    )
)

echo.
set /p wybor="ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤWybierz opcje: " 

if defined FILE[%wybor%] (
    set "APP=!FILE[%wybor%]!"
) else (
    exit /b 1
)
cls
call :center "=========================================="
call :center "%APP%"
call :center "=========================================="
echo.
set "INPUT=%AppData%\Bridge Studios\Apki\packages\%APP%.txt"

if not exist "!INPUT!" exit /b 1

set /a i=0

for /f "usebackq eol=# delims=" %%A in ("!INPUT!") do (
    set "APP=%%A"
    if not "!APP!"=="" (
        set /a i+=1
        set "PROGRAM[!i!]=!APP!"
        echo                                                     !i!. !APP!
    )
)

if !i! equ 0 exit /b 1

echo.
set /p CONFIRM="ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ Czy chcesz zainstalowac te programy? (T/N): " 

if /i not "!CONFIRM!"=="T" goto menu

echo.

for /l %%N in (1,1,!i!) do (
    echo Instalowanie !PROGRAM[%%N]!...
    winget install --id "!PROGRAM[%%N]!" --exact --accept-package-agreements --accept-source-agreements
)

goto menu
:packages_install





:settings
cls
call :center "=========================================="
call :center "USTAWIENIA"
call :center "=========================================="
echo.
call :center "Wybierz kolor tla:"
echo.
echo                                                      0. Bialy
echo                                                      1. Czarny
echo                                                      2. Niebieski
echo                                                      3. Zielony
echo                                                      4. Aqua
echo                                                      5. Czerwony
echo                                                      6. Fioletowy
echo                                                      7. Zolty
echo                                                      8. Szary
echo                                                      9. Jasno niebieski
echo                                                      10. Jasno zielony
echo                                                      11. Jasny Aqua
echo                                                      12. Jasno czerwony
echo                                                      13. Jasno fioletowy
echo                                                      14. Bezowy
echo.

set /p input="ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ⠀⠀Wybierz: "

if "%input%"=="0" set NEWCOLOR=F0
if "%input%"=="1" set NEWCOLOR=0F
if "%input%"=="2" set NEWCOLOR=1F
if "%input%"=="3" set NEWCOLOR=2F
if "%input%"=="4" set NEWCOLOR=3F
if "%input%"=="5" set NEWCOLOR=4F
if "%input%"=="6" set NEWCOLOR=5F
if "%input%"=="7" set NEWCOLOR=6F
if "%input%"=="8" set NEWCOLOR=8F
if "%input%"=="9" set NEWCOLOR=9F
if "%input%"=="10" set NEWCOLOR=AF
if "%input%"=="11" set NEWCOLOR=B0
if "%input%"=="12" set NEWCOLOR=CF
if "%input%"=="13" set NEWCOLOR=DF
if "%input%"=="14" set NEWCOLOR=E0

if not defined NEWCOLOR goto m

echo %NEWCOLOR%>"%SETTINGS%\color.cfg"

set /p COLORCFG=<"%SETTINGS%\color.cfg"
color %COLORCFG%

goto menu

:info
cls
call :center "=========================================="
call :center "INFORMACJE"
call :center "=========================================="
echo.
call :center "Nazwa: Apki"
call :center "Wersja: Reprogram Build 3.2"
echo.
call :center "Folder programu:"
call :center "%APPDIR%"
echo.
call :center "Kliknij dowolny przycisk by kontynuować"
pause >nul
goto menu

:instrukcja
cls
call :center "=========================================="
call :center "INSTRUKCJA OBSŁUGI"
call :center "=========================================="
echo.
call :center "1. Masz do wyboru kilkanaście obcji"
echo.
call :center "2. Odinstalowanie"
call :center "- Odinstaluj programy na swoim komputerze"
echo.
call :center "3. Instalowanie"
call :center "- Zainstaluj programy wpisując ich Package ID (można spróbować (firma).(program))"
echo.
call :center "4. Pakiety"
call :center "- Pakiety są po to by rzeczy ktorych nie da sie zainstalować przez obecny instalator"
call :center "będzie można ale tylko po zainstalowaniu pakietów"
echo.
call :center "Kliknij dowolny przycisk by kontynuować"
pause >nul
goto menu

:uninstall
color %COLORCFG%
cls
:: Odinstalator Programow

call :center "=========================================="
call :center "ODINSTALATOR"
call :center "=========================================="
echo.
call :center "Ładowanie..."
winget list
echo.
call :center "Wpisz nazwę programu do usunięcia, np. Apki"
call :center "Wpisz 0 aby wrócić do menu."
echo.
set /p "input=> "

if "%input%"=="Apki" goto odinstalujprogram
if "%input%"=="0" goto menu

winget uninstall "%input%"

echo.
call :center "Kliknij dowolny przycisk by kontynuować"
pause >nul
goto uninstall

:odinstalujprogram
cls
call :center "=========================================="
call :center "ODINSTALATOR"
call :center "=========================================="
echo.
choice /M "Czy jestes pewny?"

if errorlevel 2 goto menu
if errorlevel 1 goto protokolodinstalowania

:protokolodinstalowania
cls
call :center "Przygotowywanie zasobów"
rmdir /s /q "%TEMP%\uninstall"
mkdir "%TEMP%\uninstall"
copy "C:\Users\%username%\AppData\Roaming\Bridge Studios\Apki\uninstaller\uninstall.bat" "%TEMP%\uninstall"
echo.
call :center "Startowanie odinstalatora"
start "" "%TEMP%\uninstall\uninstall.bat"
exit

:center
set "text=%~1"

:: długość tekstu
set "tmp=%text%"
set /a len=0

:lenloop
if defined tmp (
    set "tmp=!tmp:~1!"
    set /a len+=1
    goto lenloop
)

:: szerokość okna
for /f "tokens=2 delims=:" %%a in ('mode con ^| findstr Columns') do set cols=%%a
set cols=%cols: =%

set /a pad=(cols-len)/2

set "spaces="
for /l %%i in (1,1,%pad%) do set "spaces=!spaces! "

echo(!spaces!!text!
goto :eof