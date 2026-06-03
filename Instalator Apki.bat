@echo off
chcp 65001 >nul
title Instalator Apki

set "APPDIR=%APPDATA%\Bridge Studios\Apki"

:inst
cls
echo Witamy w instalatorze Apki
echo.
echo Zacznijmy instalowac Apki
echo.
echo [1] Instalacja Ekspresowa
echo [2] Instalacja Zaawansowana
echo.

set /p wybor=Wybierz opcje: 

if "%wybor%"=="1" goto express
if "%wybor%"=="2" goto advanced

echo Nieprawidlowy wybor.
pause
goto inst

:express
echo Tworzenie folderow...

mkdir "%APPDATA%\Bridge Studios" 2>nul
mkdir "%APPDIR%" 2>nul

echo Pobieranie plikow...

:: Tutaj wstaw bezposredni link do pliku ZIP
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/szubixyt-dev/Apki/main/Apki.zip' -OutFile '%TEMP%\apki.zip'"

echo Wypakowywanie...

powershell -Command "Expand-Archive -Path '%TEMP%\apki.zip' -DestinationPath '%APPDIR%' -Force"

echo Instalacja zakonczona.
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

choice /M "Wlaczyc automatyczna instalacje dodatkowych pakietow"

if errorlevel 2 goto express
if errorlevel 1 goto advanced_install

:advanced_install
cls
echo Tworzenie folderow...

mkdir "%APPDATA%\Bridge Studios" 2>nul
mkdir "%APPDIR%" 2>nul

echo Pobieranie plikow...

:: Tutaj wstaw bezposredni link do pliku ZIP
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/szubixyt-dev/Apki/main/Apki.zip' -OutFile '%TEMP%\apki.zip'"

echo Wypakowywanie...

powershell -Command "Expand-Archive -Path '%TEMP%\apki.zip' -DestinationPath '%APPDIR%' -Force"

echo Instalacja dodatkowych pakietow...
:: powershell -Command "Invoke-WebRequest -Uri 'https://download1650.mediafire.com/eyktzxjku6zg_wel0T1ykPQiCRYXl8bY-cKi6_5TqaXrXB_GM1dzyWv2AnPkIEANF4-m_WRHrcIs7rtPDnZJM4NFFAM9-e1_0Bf5lgxenMo16-tFnDLiJB2NICUjVgaTtgPpfmA88_UYnrrMQ9wrMcVUhtJmTuH3sFFg_DtB6OkHSJqk/ydc8zi3kb3qnt2s/apki.zip' -OutFile '%TEMP%'"
echo Instalacja zakonczona.
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