CREATE VIEW "june_vacancies" AS
SELECT a."id" AS "id", 
       a."property_type", 
       a."host_name", 
       COUNT("available") AS "days_vacant"
FROM "listings" a
INNER JOIN "availabilities" AS b ON b."listing_id" = a."id"
WHERE b."date" >= '2023-06-01' AND b."date" <= '2023-06-31' AND "available" != 'FALSE'
GROUP BY "listing_id";


