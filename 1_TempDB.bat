@echo off
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/tempDB.sql" .exit
echo --------
echo Tablas creadas
echo --------
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/tempAlbums.sql" .exit
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/tempPhotos.sql" .exit
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/tempTodos.sql" .exit
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/tempUsers.sql" .exit
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/tempCity.sql" .exit
.\sqlite3.exe ./DATA/tempDB.db .databases ".read ./SQL/tempCompany.sql" .exit
.\sqlite3.exe ./DATA/tempDB.db .databases ".mode csv" ".import ./SQL/tempPosts.csv tempPosts" .exit
.\sqlite3.exe ./DATA/tempDB.db .databases ".mode csv" ".import ./SQL/tempComments.csv tempComments" .exit
echo --------
echo Datos brutos insertados
echo --------
pause