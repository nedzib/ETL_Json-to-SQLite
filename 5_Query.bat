@echo off
cls
echo --------
echo Ejecutando Query
echo --------
.\sqlite3.exe ./DATA/Migrated_Data.db .databases ".read ./SQL/query.sql" .exit
pause