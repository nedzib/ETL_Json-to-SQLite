@echo off
.\sqlite3.exe ./DATA/Migrated_Data.db .databases ".read ./SQL/relationalDB.sql" .exit
echo --------
echo Tablas relacionadas creadas
echo --------
pause