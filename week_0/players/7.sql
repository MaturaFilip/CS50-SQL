SELECT COUNT(*) FROM "players"
WHERE ("bats" = 'R' AND "throws" IS NULL) OR ("bats" IS NULL AND "throws" = 'R'); 
