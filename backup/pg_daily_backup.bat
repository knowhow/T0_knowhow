@echo off
echo ===========================================================================
echo Ovaj batch file backupira postgresql DB  na lokaciju c:\knowhowERP\backup
echo ver: 0.1.0  23.12.2011
echo bjasko@bring.out.ba   
echo ===========================================================================
set hostname=localhost
set pgusername=admin
set PGPASSWORD=admin
set pgdbname=f18_empty
set orgname=rudnik1
ping -n 4 8.8.8.8
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
 )
set datestr=%year%%month%%day%

echo datestr is %datestr%
    
set backup_file=%orgname%_%pgdbname%_%datestr%.backup
echo backup je  %backup_file%
echo on
pg_dump -i -h %hostname%  -p 5432 -U %pgusername% -F c -b -v -f %backup_file%  %pgdbname%
echo gzipujem max kompresija 
gzip -cN9 %backup_file%  > %backup_file%.gz
gzip  -tv  %backup_file%.gz
if errorlevel 1 goto ERR
if errorlevel 0 goto OK 

:OK   
del %backup_file%
exit

:ERR
cls
color 4f
echo.
echo. 
echo.
echo.
echo BACKUP NEUSPJESAN !!!!!!!!!!!!!!!!!!!
echo KONTAKTIRATI BRING.OUT SERVIS
echo.
echo.
echo.
echo. 
pause 


