
-- *** The Lost Letter ***
SELECT * FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "contents" LIKE '%congratulatory%' AND "action" = 'Drop' AND "address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '2 Finnigan Street'
    )
);

-- *** The Devious Delivery ***
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;

SELECT * FROM "addresses" WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "from_address_id" IS NULL
);

SELECT * FROM "scans" WHERE "package_id" = 5098;
SELECT * FROM "addresses" WHERE "id" = 348;

-- *** The Forgotten Gift ***
SELECT "from_address_id", "to_address_id" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
);



SELECT * FROM "packages" WHERE "to_address_id" = 4983;
SELECT * FROM "scans" WHERE "package_id" = 9523;
SELECT * FROM "addresses" WHERE "address" = 7432;
SELECT * FROM "drivers" WHERE "id" = 17;
