SELECT "players"."first_name", "players"."last_name", "salaries"."salary", "salaries"."year", "performances"."HR" FROM "players"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    JOIN "performances" ON "performances"."player_id" = "players"."id" AND "salaries"."year" = "performances"."year"
    ORDER BY "players"."id", "salaries"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC;
