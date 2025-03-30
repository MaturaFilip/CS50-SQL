-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- show all games in database
SELECT * FROM `games`;

-- show only names of games in database
SELECT `name` FROM `games`;

-- show games released between year 2003 - 2004
SELECT * FROM `games`
    WHERE `release_date` >= '2003-01-01' AND `release_date` <= '2004-12-31';

-- show top 10 most reviewed games
SELECT `name`, COUNT(`game_id`) AS `total_reviews` FROM `games`
    JOIN `reviews` ON `games`.`id` = `reviews`.`game_id`
    GROUP BY `name`
    ORDER BY 'total_reviews' DESC
    LIMIT 10;

-- show top 10 highest rated games
SELECT `name`, ROUND(AVG(`review`), 2) AS `avg_reviews` FROM `games`
    JOIN `reviews` ON `games`.`id` = `reviews`.`game_id`
    GROUP BY `name`
    ORDER BY 'avg_reviews' DESC
    LIMIT 10;

-- show most active player (based on reviews)
SELECT `username`, COUNT(`player_id`) AS `total_reviews` FROM `players`
    JOIN `reviews` ON `reviews`.`player_id` = `players`.`id`
    GROUP BY `username`
    ORDER BY 'total_reviews' DESC
    LIMIT 1;

-- show games with rating above or equal to 7, order by highest rating to lowest
WITH `above_seven` AS (
    SELECT `name`, ROUND(AVG(`review`), 2) AS `avg_reviews` FROM `games`
        JOIN `reviews` ON `games`.`id` = `reviews`.`game_id`
        GROUP BY `name`
)
    SELECT `name` FROM `above_seven`
    WHERE `avg_reviews` >= 7
    ORDER BY `avg_reviews`;

-- insert new game to games tables
INSERT INTO games (`name`, `release_date`, `development_time`, `platform_id`, `genre_id`, `publisher_id`, `developer_studio_id`)
VALUES ('Jumper', '2025-03-25', '30', '2', '2', '2', '2');

-- insert new player
INSERT INTO `players` (`first_name`, `last_name`, `username`, `gender`, `location`)
    VALUES ('Filip', 'Sloth', 'SlothTheAnimal', 'Male', 'Humpolec');

-- changing username 
UPDATE `players` SET `username` = 'ybbob'
    WHERE `id` = 2 AND `last_name` = 'Johnson';

-- deleting connection between developer studio and publisher
DELETE FROM `dev_pub`
    WHERE `developer_studio` = '1' AND `publisher` = '1';
