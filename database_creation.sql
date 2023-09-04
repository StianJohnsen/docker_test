USE android_app_database;


DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);


INSERT INTO Users(email, bio, country) 
VALUES(
    'hello@world.com',
    'i love strangers!',
    'US'
);