SELECT "salary" FROM "salaries"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    WHERE "salaries"."year" = 2001
    ORDER BY "performances"."H" DESC LIMIT 1;
