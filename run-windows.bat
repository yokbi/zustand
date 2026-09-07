@echo off
REM run-windows.bat - zustand fork'unu Windows'ta kurar, test eder ve derler.
REM
REM DIKKAT: Bu bir KUTUPHANE deposudur, calistirilacak bir uygulama degil.
REM Zustand'i kendi projenizde kullanmak icin bu depoya IHTIYACINIZ YOK:
REM     npm install zustand
REM Bkz. DEPO-DURUMU.md

setlocal
cd /d "%~dp0"

echo zustand - pmndrs/zustand fork'u ^(bu depoda size ait kod yok^)
echo.

where node >nul 2>&1
if errorlevel 1 (
  echo HATA: Node.js bulunamadi. Node 20+ kurun: https://nodejs.org
  pause
  exit /b 1
)
node -v

where pnpm >nul 2>&1
if errorlevel 1 (
  echo ==^> pnpm bulunamadi, corepack ile etkinlestiriliyor...
  call corepack enable
)
call pnpm -v

echo ==^> Bagimliliklar kuruluyor ^(pnpm install^)...
call pnpm install || goto hata

echo ==^> Testler ^(pnpm test^)
call pnpm test || goto hata

echo ==^> Derleme ^(pnpm build^)
call pnpm build || goto hata

echo.
echo Tamam. Testler gecti ve kutuphane derlendi.
echo Not: Burada calistirilacak bir "uygulama" yok - bu bir kutuphane.
pause
exit /b 0

:hata
echo.
echo HATA olustu. Yukaridaki ciktiya bakin.
pause
exit /b 1
