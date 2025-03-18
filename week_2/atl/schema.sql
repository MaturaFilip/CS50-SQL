-- Comment
CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "check_in_id" INTEGER,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("check_in_id") REFERENCES "check_ins"("id")
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);


CREATE TABLE "check_ins" (
    "id" INTEGER
    "check_in_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_num" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "departure_code" TEXT NOT NULL,
    "arrival_code" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);