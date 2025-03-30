-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Database schema for video games. Including games information and player reviews 

CREATE TABLE IF NOT EXISTS `games` (
    `id` INT AUTO_INCREMENT,
    `name`  VARCHAR(255) NOT NULL,
    `release_date`  DATE,
    `development_time` TINYINT UNSIGNED NOT NULL,
    `platform_id` INT,
    `genre_id` INT,
    `publisher_id` INT,
    `developer_studio_id` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`),
    FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
    FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
    FOREIGN KEY (`developer_studio_id`) REFERENCES `developer_studios` (`id`)

);

CREATE TABLE IF NOT EXISTS `genres` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `platforms` (
    `id` INT AUTO_INCREMENT,
    `type` ENUM('Multiplatform', 'PlayStation', 'PC', 'Xbox', 'Other') NOT NULL,
    `description` TEXT,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `players` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL UNIQUE,
    `last_name` VARCHAR(255) NOT NULL UNIQUE,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `gender` ENUM('Male', 'Female', 'Other'),    
    `location` VARCHAR(255),
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `reviews` (
    `review` INT,
    `comment` VARCHAR(255),
    `game_id` INT,
    `player_id` INT,
    PRIMARY KEY(`game_id`, `player_id`),
    FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
    FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
);


CREATE TABLE IF NOT EXISTS `developer_studios` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `founded_year` YEAR,
    `location` VARCHAR(255),
    `website` VARCHAR(255),
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `publishers` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `founded_year` YEAR,
    `location` VARCHAR(255),
    `website` VARCHAR(255),
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `dev_pub` (
    `developer_studio` INT,
    `publisher` INT,
    PRIMARY KEY(`developer_studio`, `publisher`),
    FOREIGN KEY (`developer_studio`) REFERENCES `developer_studios` (`id`),
    FOREIGN KEY (`publisher`) REFERENCES `publishers` (`id`)
);

-- views
-- show game name and average rating
CREATE VIEW `games_rating` AS
SELECT `name`, ROUND(AVG(`review`), 2) AS `avg_reviews` FROM `games`
    JOIN `reviews` ON `games`.`id` = `reviews`.`game_id`
    GROUP BY `name`
    ORDER BY 'avg_reviews' DESC;

-- show genre and how many games exist with this genre
CREATE VIEW `genre_games_count` AS
SELECT `genres`.`name`, COUNT(`genre_id`) AS `genre_count` FROM `genres`
    JOIN `games` ON `games`.`genre_id` = `genres`.`id`
    GROUP BY `genres`.`name`
    ORDER BY `genre_count` DESC;

-- indexes
-- index on name in games table
CREATE INDEX `game_names`
ON `games` (`name`);

-- index on review and comment in reviews table
CREATE INDEX `reviews_comment`
ON `reviews` (`review`, `comment`);