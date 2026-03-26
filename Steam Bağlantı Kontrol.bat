@echo off
color 0b
title Steam Internet Anahtari

net session >nul 2>&1
if %errorLevel% neq 0 goto yetkiyok

:menu
cls
echo ========================================
echo        STEAM INTERNET KONTROLU
echo ========================================
echo [1] Steam'in Internetini KES
echo [2] Steam'in Internetini AC
echo ========================================
set /p islem="Islem Belirtin (1 veya 2): "

if "%islem%"=="1" goto kes
if "%islem%"=="2" goto ac

echo Hatali secim.
timeout /t 2 >nul
goto menu

:kes
netsh advfirewall firewall delete rule name="Steam_Anahtar" >nul 2>&1
netsh advfirewall firewall add rule name="Steam_Anahtar" dir=out action=block program="C:\Program Files (x86)\Steam\steam.exe" enable=yes >nul 2>&1
echo.
echo [BASARILI] Steam'in internet baglantisi kesildi!
goto bitis

:ac
netsh advfirewall firewall delete rule name="Steam_Anahtar" >nul 2>&1
echo.
echo [BASARILI] Steam'in interneti tekrar acildi (Kural silindi)!
goto bitis

:yetkiyok
echo.
echo YONETICI IZNI EKSIK!
echo Lutfen bu dosyayi yonetici olarak calistirin.
goto bitis

:bitis
echo.
pause
goto menu