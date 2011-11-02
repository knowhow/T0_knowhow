rem This file is part of the knowhow ERP, a free and open source
rem Enterprise Resource Planning software suite,
rem Copyright (c) 2010-2011 by bring.out doo Sarajevo.
rem It is licensed to you under the Common Public Attribution License
rem version 1.0, the full text of which (including knowhow-specific Exhibits)
rem is available in the file LICENSE_CPAL_bring.out_knowhow.md located at the
rem root directory of this source code archive.
rem By using this software, you agree to be bound by its terms.

@echo off
rem provjeri da li je conf backupiran
if not exist c:\tops\FP_Server.bak   goto :copy_conf

:kill
taskkill /F /IM FP_Server.exe /T
tasklist /FI "IMAGENAME eq FP_Server.exe" 2>NUL | find /I /N "FP_Server.exe">NUL
if "%ERRORLEVEL%"=="0" goto kill 

:start
echo "Startam FP Server" 
cd "c:\tops" 
copy /Y  FP_Server.bak "%USERPROFILE%\Application Data\Tremol\FP_Server.config" 
cd "%PROGRAMFILES%\OPOS\Tremol\Tools\
start FP_Server.exe
exit

:copy_conf
copy  "%USERPROFILE%\Application Data\Tremol\FP_Server.config"  c:\tops\FP_Server.bak
goto start 
