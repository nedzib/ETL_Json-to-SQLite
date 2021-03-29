BEGIN TRANSACTION;

DROP TABLE IF EXISTS "company";
CREATE TABLE IF NOT EXISTS "company" (
    companyId INTEGER NOT NULL,
    companyName TEXT NOT NULL,
    catchPhrase TEXT NOT NULL,
    bs TEXT NOT NULL,
    PRIMARY KEY(companyId)
);

DROP TABLE IF EXISTS "posts";
CREATE TABLE IF NOT EXISTS "posts" (
    postsId INTEGER NOT NULL,
    userId INTEGER NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    PRIMARY KEY(postsId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);

DROP TABLE IF EXISTS "todos";
CREATE TABLE IF NOT EXISTS "todos" (
    todosId INTEGER NOT NULL,
    userId INTEGER NOT NULL,
    title TEXT NOT NULL,
    completed TEXT NOT NULL,
    PRIMARY KEY(todosId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);

DROP TABLE IF EXISTS "albums";
CREATE TABLE IF NOT EXISTS "albums" (
    albumId INTEGER NOT NULL,
    userId INTEGER NOT NULL,
    title TEXT NOT NULL,
    PRIMARY KEY(albumId),
    FOREIGN KEY(userId) REFERENCES users(userId)
);

DROP TABLE IF EXISTS "photos";
CREATE TABLE IF NOT EXISTS "photos" (
    photoId INTEGER NOT NULL,
    albumId INTEGER NOT NULL,
    title TEXT NOT NULL,
    urlDir TEXT NOT NULL,
    thumbnailUrl TEXT NOT NULL,
    PRIMARY KEY(photoId),
    FOREIGN KEY(albumId) REFERENCES albums(albumId)
);

DROP TABLE IF EXISTS "city";
CREATE TABLE IF NOT EXISTS "city" (
    cityId INTEGER NOT NULL,
    cityName TEXT NOT NULL,
    street TEXT NOT NULL,
    suite TEXT NOT NULL,
    zipCode TEXT NOT NULL,
    lat REAL NOT NULL,
    lng REAL NOT NULL,
    PRIMARY KEY(cityId)
);

DROP TABLE IF EXISTS "users";
CREATE TABLE IF NOT EXISTS "users" (
    userId INTEGER NOT NULL,
    realName TEXT NOT NULL,
    userName TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    website TEXT NOT NULL,
    cityId INTEGER NOT NULL,
    companyId INTEGER NOT NULL,
    PRIMARY KEY(userId),
    FOREIGN KEY(companyId) REFERENCES company(companyId),
    FOREIGN KEY(cityId) REFERENCES city(cityId)
);

DROP TABLE IF EXISTS "comments";
CREATE TABLE IF NOT EXISTS "comments" (
    commentId INTEGER NOT NULL,
    postsId INTEGER NOT NULL,
    commentName TEXT NOT NULL,
    email TEXT NOT NULL,
    body TEXT NOT NULL,
    PRIMARY KEY(commentId),
    FOREIGN KEY(postsId) REFERENCES posts(postsId)
);

COMMIT;