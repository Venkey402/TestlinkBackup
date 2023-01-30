EM [at] echo off

for /f "tokens=1" %%i in ('date /t') do set DATE_DOW=%%i

for /f "tokens=2" %%i in ('date /t') do set DATE_DAY=%%i
for /f %%i in ('echo %date_day:/=-%') do set DATE_DAY=%%i
for /f %%i in ('time /t') do set DATE_TIME=%%i
for /f %%i in ('echo %date_time::=-%') do set DATE_TIME=%%i

"D:\Testlink\mariadb\bin\mysqldump" --user=root --password=root --databases bitnami_testlink >"D:\Testlink_DailyBackup\%DATE_DAY%_%DATE_TIME%_backupTestLink.sql"