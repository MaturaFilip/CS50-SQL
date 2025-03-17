SELECT "first_name", "last_name", "salary" FROM "players" AS "p"
    JOIN "salaries" ON "p"."id" = "salaries"."player_id"
    WHERE "salaries"."year" = 2001
    ORDER BY "salary", "first_name", "last_name", "p"."id"
    LIMIT 50;
