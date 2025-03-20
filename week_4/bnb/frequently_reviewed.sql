CREATE VIEW "frequently_reviewed" AS
SELECT a."id" AS "id", 
       a."property_type", 
       a."host_name", 
       COUNT("comments") AS "reviews"
FROM "listings" a
INNER JOIN "reviews" AS b ON b."listing_id" = a."id"
GROUP BY "listing_id"
ORDER BY "reviews" DESC, "property_type", "host_name";


