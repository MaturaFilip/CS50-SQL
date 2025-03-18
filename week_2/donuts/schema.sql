-- Comment
CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" INTEGER,
    "ingredient" TEXT NOT NULL,
    "price_per_gram" INTEGER NOT NULL,
    PRIMARY KEY("id")
);


CREATE TABLE IF NOT EXISTS "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER NOT NULL,
    "price" TEXT NOT NULL,
    "ingredients_list" TEXT NOT NULL,
    "ingredients_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id")
);

CREATE TABLE IF NOT EXISTS "orders" (
    "id" INTEGER
    "order_num" INTEGER NOT NULL UNIQUE,
    "donut_id" INTEGER,
    "amount" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE IF NOT EXISTS "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "customer_history" (
    "customer_id" INTEGER,
    "order_id" INTEGER,
    PRIMARY KEY ("customer_id", "order_id"),
	FOREIGN KEY ("customer_id") REFERENCES "customers" ("id"),
	FOREIGN KEY ("order_id")    REFERENCES "orders" ("id")
);
