SELECT "first_name", "last_name", "debut" FROM "players"
WHERE "birth_city" = 'Pittsburgh' OR "birth_city" = 'Pennsylvania' ORDER BY "debut" DESC, "first_name", "last_name";
