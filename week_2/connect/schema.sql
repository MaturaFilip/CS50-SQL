-- Comment
CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "title" TEXT,
    "school_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("school_id") REFERENCES "school"("id")
);


CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "founded_year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "from" TEXT NOT NULL,
    "to" TEXT NOT NULL,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "company_id" INTEGER,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
