ATTACH './DATA/tempDB.db' AS tempDB;

/*Insert para city*/
insert into city select * from tempDB.city;

/*Insert para company*/
insert into company select * from tempDB.company;

/*Insert para users*/
insert into users select * from tempDB.users;

/*Insert para posts*/
insert into posts select * from tempDB.posts;

/*Insert para todos*/
insert into todos select * from tempDB.todos;

/*Insert para albums*/
insert into albums select * from tempDB.albums;

/*Insert para photos*/
insert into photos select * from tempDB.photos;

/*Insert para comments*/
insert into comments select * from tempDB.comments;