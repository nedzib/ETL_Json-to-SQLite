@echo off
.\sqlite3.exe ./DATA/Migrated_Data.db .databases ".read ./SQL/migration.sql" .exit
echo --------
echo Datos migrados a Migrated_Data
echo --------
pause