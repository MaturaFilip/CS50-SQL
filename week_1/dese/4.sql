SELECT "city", COUNT("city") AS "counter" FROM "schools" WHERE "type" = 'Public School'
    GROUP BY "city" ORDER BY "counter" DESC, "city" LIMIT 10;
