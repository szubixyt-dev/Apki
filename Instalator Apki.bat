@echo off
chcp 65001 >nul
title Instalator Apki

set "APPDIR=%APPDATA%\Bridge Studios\Apki"
for /f "tokens=3" %i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild ^| find "CurrentBuild"') do @if %i GEQ 22000 (goto inst) else (goto inst10)
:inst
cls
echo Witamy w instalatorze Apki
echo.
echo Zacznijmy instalować Apki
echo.
echo [1] Instalacja Ekspresowa
echo [2] Instalacja Zaawansowana
echo.

set /p wybor=Wybierz opcję: 

if "%wybor%"=="1" goto express
if "%wybor%"=="2" goto advanced

echo Nieprawidłowy wybór.
pause
goto inst

:express
echo Tworzenie folderów...

mkdir "%APPDATA%\Bridge Studios" 2>nul
mkdir "%APPDIR%" 2>nul

echo Pobieranie plików...

:: pobieranie
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/szubixyt-dev/Apki/main/Apki.zip' -OutFile '%TEMP%\apkiwin10.zip'"

echo Wypakowywanie...

powershell -Command "Expand-Archive -Path '%TEMP%\apki.zip' -DestinationPath '%APPDIR%' -Force"

echo Instalacja zakończona.
powershell -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\Apki.lnk'); ^
$s.TargetPath='%APPDATA%\Bridge Studios\Apki\s.bat'; ^
$s.IconLocation='%APPDATA%\Bridge Studios\Apki\i.ico'; ^
$s.Save()"
powershell -Command "Start-Process cmd -Verb runAs -ArgumentList '/c powershell -NoProfile -Command \"$s=New-Object -COM WScript.Shell; $l=$s.CreateShortcut(''C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Apki.lnk''); $l.TargetPath=$env:APPDATA + ''\Bridge Studios\Apki\s.bat''; $l.IconLocation=$env:APPDATA + ''\Bridge Studios\Apki\i.ico''; $l.Save()\"'"
echo Skróty utworzone
del /q "%TEMP%\apki.zip"
echo.
echo Kliknij dowolny przycisk aby wyjść
pause >nul
exit

:advanced
echo Instalacja zaawansowana
echo.

choice /C YN /M "Włączyć automatyczną instalację dodatkowych pakietów"

if errorlevel 2 goto express
if errorlevel 1 goto advanced_install

:advanced_install
cls
echo Tworzenie folderów...

mkdir "%APPDATA%\Bridge Studios" 2>nul
mkdir "%APPDIR%" 2>nul

echo Pobieranie plików...

:: pobieranie
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/szubixyt-dev/Apki/main/Apkiwin10.zip' -OutFile '%TEMP%\apki.zip'"

echo Wypakowywanie...

powershell -Command "Expand-Archive -Path '%TEMP%\apki.zip' -DestinationPath '%APPDIR%' -Force"

echo Instalacja dodatkowych pakietów...
:: tu narazie nic | Wkrótce
echo Instalacja zakończona.
powershell -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\Apki.lnk'); ^
$s.TargetPath='%APPDATA%\Bridge Studios\Apki\s.bat'; ^
$s.IconLocation='%APPDATA%\Bridge Studios\Apki\i.ico'; ^
$s.Save()"
powershell -Command "Start-Process cmd -Verb runAs -ArgumentList '/c powershell -NoProfile -Command \"$s=New-Object -COM WScript.Shell; $l=$s.CreateShortcut(''C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Apki.lnk''); $l.TargetPath=$env:APPDATA + ''\Bridge Studios\Apki\s.bat''; $l.IconLocation=$env:APPDATA + ''\Bridge Studios\Apki\i.ico''; $l.Save()\"'"
echo Skróty utworzone
del /q "%TEMP%\apki.zip"
echo.
echo Kliknij dowolny przycisk aby wyjść
pause >nul
exit

:inst10
cls
echo Witamy w instalatorze Apki (Dla wersji Windows 10)
echo.
echo Zacznijmy instalować Apki
echo.
echo [1] Instalacja Ekspresowa
echo [2] Instalacja Zaawansowana
echo.

set /p wybor=Wybierz opcję: 

if "%wybor%"=="1" goto express10
if "%wybor%"=="2" goto advanced10

echo Nieprawidłowy wybór.
pause
goto inst

:express10
echo Tworzenie folderów...

mkdir "%APPDATA%\Bridge Studios" 2>nul
mkdir "%APPDIR%" 2>nul

echo Pobieranie plików...

:: pobieranie
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/szubixyt-dev/Apki/main/Apki.zip' -OutFile '%TEMP%\apki.zip'"

echo Wypakowywanie...

powershell -Command "Expand-Archive -Path '%TEMP%\apki.zip' -DestinationPath '%APPDIR%' -Force"

echo Instalacja zakończona.
powershell -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\Apki.lnk'); ^
$s.TargetPath='%APPDATA%\Bridge Studios\Apki\s.bat'; ^
$s.IconLocation='%APPDATA%\Bridge Studios\Apki\i.ico'; ^
$s.Save()"
powershell -Command "Start-Process cmd -Verb runAs -ArgumentList '/c powershell -NoProfile -Command \"$s=New-Object -COM WScript.Shell; $l=$s.CreateShortcut(''C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Apki.lnk''); $l.TargetPath=$env:APPDATA + ''\Bridge Studios\Apki\s.bat''; $l.IconLocation=$env:APPDATA + ''\Bridge Studios\Apki\i.ico''; $l.Save()\"'"
echo Skróty utworzone
del /q "%TEMP%\apki.zip"
echo.
echo Kliknij dowolny przycisk aby wyjść
pause >nul
exit

:advanced10
echo Instalacja zaawansowana
echo.

choice /C YN /M "Włączyć automatyczną instalację dodatkowych pakietów"

if errorlevel 2 goto express10
if errorlevel 1 goto advanced_install10

:advanced_install10
cls
echo Tworzenie folderów...

mkdir "%APPDATA%\Bridge Studios" 2>nul
mkdir "%APPDIR%" 2>nul

echo Pobieranie plików...

:: pobieranie
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/szubixyt-dev/Apki/main/Apki.zip' -OutFile '%TEMP%\apki.zip'"

echo Wypakowywanie...

powershell -Command "Expand-Archive -Path '%TEMP%\apki.zip' -DestinationPath '%APPDIR%' -Force"

echo Instalacja dodatkowych pakietów...
:: tu narazie nic | Wkrótce
echo Instalacja zakończona.
powershell -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\Apki.lnk'); ^
$s.TargetPath='%APPDATA%\Bridge Studios\Apki\s.bat'; ^
$s.IconLocation='%APPDATA%\Bridge Studios\Apki\i.ico'; ^
$s.Save()"
powershell -Command "Start-Process cmd -Verb runAs -ArgumentList '/c powershell -NoProfile -Command \"$s=New-Object -COM WScript.Shell; $l=$s.CreateShortcut(''C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Apki.lnk''); $l.TargetPath=$env:APPDATA + ''\Bridge Studios\Apki\s.bat''; $l.IconLocation=$env:APPDATA + ''\Bridge Studios\Apki\i.ico''; $l.Save()\"'"
echo Skróty utworzone
del /q "%TEMP%\apki.zip"
echo.
echo Kliknij dowolny przycisk aby wyjść
pause >nul
exit
