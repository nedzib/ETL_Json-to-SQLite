/*-------------------------------------------------------------------------------
    Primeras Tablas
-------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS "users";
CREATE TABLE IF NOT EXISTS "users" (
    userId INTEGER,
    realName TEXT,
    userName TEXT,
    email TEXT,
    phone TEXT,
    website TEXT,
    cityId INTEGER,
    companyId INTEGER
);

DROP TABLE IF EXISTS "posts";
CREATE TABLE IF NOT EXISTS "posts" (
    userId INTEGER,
    postsId INTEGER,
    title TEXT,
    body TEXT
);

DROP TABLE IF EXISTS "comments";
CREATE TABLE IF NOT EXISTS "comments" (
    commentId INTEGER,
    postsId INTEGER,
    commentName TEXT,
    email TEXT,
    body TEXT
);

DROP TABLE IF EXISTS "todos";
CREATE TABLE IF NOT EXISTS "todos" (
    todosId INTEGER,
    userId INTEGER,
    title TEXT,
    completed TEXT
);

DROP TABLE IF EXISTS "albums";
CREATE TABLE IF NOT EXISTS "albums" (
    albumId INTEGER,
    userId INTEGER,
    title TEXT
);

DROP TABLE IF EXISTS "photos";
CREATE TABLE IF NOT EXISTS "photos" (
    albumId INTEGER,
    photoId INTEGER,
    title TEXT,
    urlDir TEXT,
    thumbnailUrl TEXT
);

DROP TABLE IF EXISTS "city";
CREATE TABLE IF NOT EXISTS "city" (
    cityId INTEGER,
    cityName TEXT,
    street TEXT,
    suite TEXT,
    zipCode TEXT,
    lat REAL,
    lng REAL
);

DROP TABLE IF EXISTS "company";
CREATE TABLE IF NOT EXISTS "company" (
    companyId INTEGER,
    companyName TEXT,
    catchPhrase TEXT,
    bs TEXT
);


/*-------------------------------------------------------------------------------
    Tablas Temporales
-------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS "tempUsers";
CREATE TABLE IF NOT EXISTS "tempUsers" (
    userId INTEGER,
    realName TEXT,
    userName TEXT,
    email TEXT,
    phone TEXT,
    website TEXT,
    cityId INTEGER,
    companyId INTEGER
);

DROP TABLE IF EXISTS "tempPosts";
CREATE TABLE IF NOT EXISTS "tempPosts" (
    userId INTEGER,
    postsId INTEGER,
    title TEXT,
    body TEXT
);

DROP TABLE IF EXISTS "tempComments";
CREATE TABLE IF NOT EXISTS "tempComments" (
    commentId INTEGER,
    postsId INTEGER,
    commentName TEXT,
    email TEXT,
    body TEXT
);

DROP TABLE IF EXISTS "tempTodos";
CREATE TABLE IF NOT EXISTS "tempTodos" (
    todosId INTEGER,
    userId INTEGER,
    title TEXT,
    completed TEXT
);

DROP TABLE IF EXISTS "tempAlbums";
CREATE TABLE IF NOT EXISTS "tempAlbums" (
    albumId INTEGER,
    userId INTEGER,
    title TEXT
);

DROP TABLE IF EXISTS "tempPhotos";
CREATE TABLE IF NOT EXISTS "tempPhotos" (
    albumId INTEGER,
    photoId INTEGER,
    title TEXT,
    urlDir TEXT,
    thumbnailUrl TEXT
);

DROP TABLE IF EXISTS "tempCity";
CREATE TABLE IF NOT EXISTS "tempCity" (
    cityId INTEGER,
    cityName TEXT,
    street TEXT,
    suite TEXT,
    zipCode TEXT,
    lat REAL,
    lng REAL
);

DROP TABLE IF EXISTS "tempCompany";
CREATE TABLE IF NOT EXISTS "tempCompany" (
    companyId INTEGER,
    companyName TEXT,
    catchPhrase TEXT,
    bs TEXT
);
