CREATE TABLE IF NOT EXISTS "meteorites_temp" (    
    "name" TEXT,
    "id" INTEGER,
    "nametype" INTEGER,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "meteorites" (    
    "id" INTEGER,    
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id")
);

.import --csv meteorites.csv --skip 1 meteorites_temp

-- mass, lat, long -> ROUND values to 2 -> 70.4777 -> 70.48
-- SELECT ROUND("mass", 2)
UPDATE "meteorites_temp"
SET "long" = round("long", 2),
    "mass" = round("mass", 2),
    "lat" = round("lat", 2);

-- "nametype" = 'Relict' NOT included in the meteorites table!
DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

-- convert to meteorites table
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", NULLIF("mass", ''), "discovery", NULLIF("year", ''), NULLIF("lat", ''), NULLIF("long", '') 
FROM "meteorites_temp"
ORDER BY "year" DESC, "name";

DROP TABLE "meteorites_temp";