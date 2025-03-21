SELECT "username" FROM "users" WHERE "id" = (
WITH "pop_user" AS (
SELECT "to_user_id", COUNT("to_user_id") AS "count" FROM "messages"
GROUP BY "to_user_id" ORDER BY "count" DESC LIMIT 1
)
SELECT "to_user_id" FROM "pop_user"
);