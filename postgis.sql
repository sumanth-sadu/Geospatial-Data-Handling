CREATE EXTENSION postgis;

-- -- SQL CommandsCREATE EXTENSION postgis;-- table creation
CREATE TABLE points(
    gid serial PRIMARY KEY,
    label varchar(100),
    geom geometry(POINT)
);

-- -- insert coordinates into points table
INSERT INTO points VALUES
(0,'Home', ST_SetSRID(ST_MakePoint(-118.28969845610989,34.032082186578506), 4326)),
(1,'PulliasCenter', ST_SetSRID(ST_MakePoint(-118.28408887678357,34.02198691174533), 4326)),
(2,'Arts', ST_SetSRID(ST_MakePoint(-118.28377646446016,34.02183144068405), 4326)),
(3,'EarthScience', ST_SetSRID(ST_MakePoint(-118.28410315989271,34.02174159119446), 4326)),
(4,'MilitaryScience', ST_SetSRID(ST_MakePoint(-118.28493641745949,34.02068096579834), 4326)),
(5,'Communication', ST_SetSRID(ST_MakePoint(-118.28563003506714,34.02218831553493), 4326)),
(6,'Journalism', ST_SetSRID(ST_MakePoint(-118.28485037575152,34.02167760449282), 4326)),
(7,'Electrical', ST_SetSRID(ST_MakePoint(-118.28992992170694,34.020221019615896), 4326)),
(8,'Computers', ST_SetSRID(ST_MakePoint(-118.2891089660523,34.0194714460153), 4326)),
(9,'Accounting', ST_SetSRID(ST_MakePoint(-118.28612864265556,34.01904844628693), 4326)),
(10,'Operations', ST_SetSRID(ST_MakePoint(-118.28593781718199,34.01938627354335), 4326)),
(11,'RealEstate', ST_SetSRID(ST_MakePoint(-118.28300785307381,34.019458993642914), 4326)),
(12,'Philanthropy', ST_SetSRID(ST_MakePoint(-118.28323552432671,34.01899666843321), 4326));

-- -- Convex Hull Query
SELECT st_astext(ST_ConvexHull(ST_Collect(geom)))
FROM points;


-- -- 4 Nearest neighbours query
SELECT label, st_astext(geom) as coordinates
FROM points
Where label <> 'Home'
ORDER BY geom <-> st_setsrid(st_makepoint(-118.28969845610989,34.032082186578506),4326)
LIMIT 4;
































