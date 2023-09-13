USE android_app_database;

-- Drop dependent tables first
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS group_user;
DROP TABLE IF EXISTS friend;
DROP TABLE IF EXISTS geo_point;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS heatmap;

-- Drop the remaining tables
DROP TABLE IF EXISTS point_of_interest; -- Optional
DROP TABLE IF EXISTS `group`;
DROP TABLE IF EXISTS `user`;


-- Create user table
CREATE TABLE `user` (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255), -- Adjusted data type for password
    car_fuel INT
);

-- Create friend table
CREATE TABLE friend (
    friendship_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id_link_1 INT NOT NULL,
    user_id_link_2 INT NOT NULL,
    FOREIGN KEY (user_id_link_1) REFERENCES `user`(user_id),
    FOREIGN KEY (user_id_link_2) REFERENCES `user`(user_id)
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
    joined Boolean NULL,
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (user_id) REFERENCES `user`(user_id)
);

-- Create message table
CREATE TABLE message (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    group_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id)
);

-- Create trip table
CREATE TABLE trip (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    name VARCHAR(255),
    start_date DATETIME,
    driving_pattern INT,
    road_condition INT,
    distance DOUBLE NOT NULL,
    duration INT NOT NULL, -- Seconds
    FOREIGN KEY (user_id) REFERENCES `user`(user_id)
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

-- Create hotspot table (Optional)
CREATE TABLE point_of_interest (
    hotspot_id INT PRIMARY KEY AUTO_INCREMENT,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    user_id INT NOT NULL,
    time_visited INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id)
);

-- Create heatmap table
CREATE TABLE heatmap (
    heatmap_id INT PRIMARY KEY AUTO_INCREMENT,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id)
);

CREATE INDEX idx_user1 ON friend (user_id_link_1);
CREATE INDEX idx_user2 ON friend (user_id_link_2);
