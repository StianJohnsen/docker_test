USE android_app_database;

-- Insert test data into the `user` table
INSERT INTO `user` (username, email, password, car_fuel)
VALUES
    ('User1', 'user1@example.com', 'password1', 100),
    ('User2', 'user2@example.com', 'password2', 75),
    ('User3', 'user3@example.com', 'password3', 50);

-- Insert test data into the `friend` table
INSERT INTO friend (user_id_link_1, user_id_link_2)
VALUES
    (1, 2),
    (1, 3),
    (2, 3);

-- Insert test data into the `group` table
INSERT INTO `group` (group_name)
VALUES
    ('Group1'),
    ('Group2');

-- Insert test data into the `group_user` table
INSERT INTO group_user (group_id, user_id, joined)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (2, 1, 1),
    (2, 3, 1);

-- Insert test data into the `message` table
INSERT INTO message (message, user_id, group_id)
VALUES
    ('Hello, Group1!', 1, 1),
    ('Hi there!', 2, 1),
    ('Group2 message', 3, 2);

-- Insert test data into the `trip` table
INSERT INTO trip (user_id, name, start_date, driving_pattern, road_condition, distance, duration)
VALUES
    (1, 'Trip1', '2023-09-15 12:00:00', 1, 2, 50.5, 3600),
    (2, 'Trip2', '2023-09-16 14:00:00', 2, 3, 75.2, 4500);

-- Insert test data into the `geo_point` table
INSERT INTO geo_point (trip_id, latitude, longitude, step_num)
VALUES
    (1, 40.1234, -74.5678, 1),
    (1, 40.2345, -74.6789, 2),
    (2, 35.6789, -82.3456, 1);

-- Insert test data into the `point_of_interest` table (Optional)
INSERT INTO point_of_interest (latitude, longitude, user_id, time_visited)
VALUES
    (40.1111, -74.1111, 1, 1631689200),
    (35.2222, -82.2222, 2, 1631692800);

-- Insert test data into the `heatmap` table
INSERT INTO heatmap (latitude, longitude, user_id)
VALUES
    (40.1234, -74.5678, 1),
    (40.2345, -74.6789, 1),
    (35.6789, -82.3456, 2);
