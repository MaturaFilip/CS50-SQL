CREATE TABLE IF NOT EXISTS `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);


CREATE TABLE IF NOT EXISTS `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name`  VARCHAR(32) NOT NULL,
    `type`  ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location`  VARCHAR(32) NOT NULL,
    `year_founded` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(32),
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `connections_users` (
    `user_a_id` INT NOT NULL,
    `user_b_id` INT NOT NULL,
    PRIMARY KEY (`user_a_id`, `user_b_id`),
    FOREIGN KEY (`user_a_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`user_b_id`) REFERENCES `users` (`id`)
);

CREATE TABLE IF NOT EXISTS `connections_school` (
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `start` DATE,
    `end` DATE,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
);

CREATE TABLE IF NOT EXISTS `connections_company` (
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start` DATE,
    `end` DATE,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
);
