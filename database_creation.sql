USE android_app_database;

-- Drop tables with no foreign key dependencies first
DROP TABLE IF EXISTS geo_point;
DROP TABLE IF EXISTS hotspot;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS group_user;
DROP TABLE IF EXISTS friend;
DROP TABLE IF EXISTS friend_relation;
DROP TABLE IF EXISTS trip;

-- Finally, drop the remaining tables
DROP TABLE IF EXISTS heatmap;
DROP TABLE IF EXISTS `group`; -- Drop "group" again after other dependent tables are removed
DROP TABLE IF EXISTS user;

-- Create user table
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255), -- Adjusted data type for password
    car_fuel INT
);

-- Create friend_relation table
CREATE TABLE friend_relation (
    friend_relation_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Create friend table
CREATE TABLE friend (
    friend_id INT PRIMARY KEY AUTO_INCREMENT,
    friend_relation_id INT NOT NULL,
    FOREIGN KEY (friend_relation_id) REFERENCES friend_relation(friend_relation_id)
);

-- Create group table (note the backticks around "group")
CREATE TABLE `group` (
    group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(255)
);

-- Create group_user table
CREATE TABLE group_user (
    group_user_id INT PRIMARY KEY AUTO_INCREMENT,
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Create message table
CREATE TABLE message (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    group_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id)
);

-- Create trip table
CREATE TABLE trip (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    description VARCHAR(255),
    driving_date DATETIME,
    driving_pattern INT,
    driving_condition INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Create geo_point table
CREATE TABLE geo_point (
    geo_point_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT NOT NULL,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    step_num INT,
    FOREIGN KEY (trip_id) REFERENCES trip(trip_id)
);

-- Create hotspot table
CREATE TABLE hotspot (
    hotspot_id INT PRIMARY KEY AUTO_INCREMENT,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Create heatmap table
CREATE TABLE heatmap (
    heatmap_id INT PRIMARY KEY AUTO_INCREMENT,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
