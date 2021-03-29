@echo off
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/filters.sql" .exit
echo --------
echo Datos filtrados y migrados a tablas temporales filtradas no relacionadas
echo --------
pause