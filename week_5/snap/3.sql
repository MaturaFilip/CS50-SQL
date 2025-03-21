WITH "best_names" AS (
SELECT "to_user_id", COUNT("to_user_id") AS "count" FROM "messages" WHERE "from_user_id" = (
SELECT "id" FROM "users" WHERE "username" = 'creativewisdom377'
)
GROUP BY "to_user_id" ORDER BY "count" DESC
)
    SELECT "to_user_id" FROM "best_names" LIMIT 3;