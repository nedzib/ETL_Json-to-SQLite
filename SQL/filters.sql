/*Filtro para albums*/
insert into albums (albumId,userId,title)
select *
from tempAlbums
where (userId is not null)
and (albumId is not null)
and (title is not null);

/*Filtro para comments*/
insert into comments (postsId,commentId,commentName, email, body)
select *
from tempComments
where (postsId is not null)
and (commentId is not null)
and (commentName is not null)
and (body is not null)
and (email like '%@%.%');

/*Filtro para photos*/
insert into photos (photoId,albumId,title,urlDir,thumbnailUrl)
select *
from tempPhotos
where (albumId is not null)
and (photoId is not null)
and (title is not null)
and (urlDir is not null)
and (thumbnailUrl is not null);

/*Filtros para Posts*/
insert into posts (postsId,userId,title,body)
select *
from tempPosts
where (userId is not null)
and (postsId is not null)
and (title is not null)
and (body is not null);

/*Filtros para Todos*/
insert into todos (todosId,userId,title,completed)
select *
from tempTodos
where (userId is not null)
and (todosId is not null)
and (title is not null)
and (completed = "false")
or (completed = "true");

/*Filtros para City*/
insert into city (cityId, cityName, street, suite, zipCode, lat, lng)
select *
from tempCity
where (cityId is not null)
and (cityName is not null)
and (street is not null)
and (suite is not null)
and (zipCode is not null)
and (lat is not null)
and (lng is not null);


/*Filtro para company*/
insert into company (companyId, companyName, catchPhrase, bs)
select *
from tempCompany
where (companyId is not null)
and (companyName is not null)
and (catchPhrase is not null)
and (bs is not null);

/*Filtro para users*/
insert into users (userId, realName, userName, email, phone, website, cityId, companyId)
select *
from tempUsers
where (userId is not null)
and (realName is not null)
and (userName is not null)
and (email like '%@%.%')
and (phone is not null)
and (website is not null)
and (cityId is not null)
and (companyId is not null);