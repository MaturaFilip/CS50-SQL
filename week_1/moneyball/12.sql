WITH "per_hit" AS (
    SELECT "players"."first_name", "players"."last_name", "salaries"."salary" / "performances"."H" AS "dollars_per_hit" FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
    WHERE "salaries"."year" = 2001 AND "performances"."H" > 0
    ORDER BY "dollars_per_hit" LIMIT 10
),
"per_rbi" AS (
    SELECT "players"."first_name", "players"."last_name", "salaries"."salary" / "performances"."RBI" AS "dollars_per_rbi" FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
    WHERE "salaries"."year" = 2001 AND "performances"."RBI" > 0
    ORDER BY "dollars_per_rbi" LIMIT 10
)
SELECT "per_hit"."first_name", "per_hit"."last_name" FROM "per_hit"
INTERSECT
SELECT "per_rbi"."first_name", "per_rbi"."last_name" FROM "per_rbi"
ORDER BY "last_name";

