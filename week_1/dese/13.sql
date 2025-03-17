SELECT "name", "pupils", "per_pupil_expenditure" FROM "districts"
    JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
        ORDER BY "pupils" DESC, "per_pupil_expenditure" DESC;
