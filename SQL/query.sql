drop view if EXISTS PHxAL;
CREATE VIEW if not EXISTS PHxAL as
select u.userId as userId,
    u.realName as realName,
    al.title as title,
    count(ph.albumId) as photosAL
from users u
    INNER JOIN albums al on u.userId = al.userId
    INNER JOIN photos ph on al.albumId = ph.albumId
    AND ph.title like '%etu%'
GROUP BY al.albumId;
/**/
drop view if EXISTS POSTxUSER;
CREATE VIEW if not EXISTS POSTxUSER as
select u.userId as userId,
    count(po.userId) as postU
from users u
    INNER JOIN posts po on po.userId = u.userId
    AND po.title like '%etu%'
GROUP BY u.userId;
/**/
drop VIEW if EXISTS TODOxUSER;
CREATE VIEW if not EXISTS TODOxUSER as
select u.userId as userId,
    count(tod.userId) as todoU
from users u
    INNER JOIN todos tod on tod.userId = u.userId
    AND tod.title like '%etu%'
GROUP BY u.userId;
/**/
SELECT ph.userId,
    ph.realName,
    ph.title,
    ph.photosAl,
    pu.postU,
    tu.todou
from PHxAL ph,
    POSTxUSER pu,
    TODOxUSER tu
WHERE (
        ph.userId = pu.userId
        AND ph.userId = tu.userId
    )
    or (
        ph.userId = pu.userId
        or ph.userId = tu.userId
    )
GROUP by ph.userId;