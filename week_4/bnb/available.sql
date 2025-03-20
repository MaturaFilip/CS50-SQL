CREATE VIEW "available" AS
SELECT a."id" AS "id", 
       a."property_type", 
       a."host_name", 
       b."date"
FROM "listings" a
INNER JOIN "availabilities" AS b ON b."listing_id" = a."id"
WHERE b."available" = 'TRUE'; 

