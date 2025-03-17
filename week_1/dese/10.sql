SELECT "name", "per_pupil_expenditure" FROM "districts" AS "dis"
    JOIN "expenditures" ON "dis"."id" = "expenditures"."district_id"
    WHERE "dis"."type" = 'Public School District'
    ORDER BY "per_pupil_expenditure" DESC LIMIT 10;
