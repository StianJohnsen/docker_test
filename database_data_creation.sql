USE android_app_database;

-- Insert data into the 'user' table
INSERT INTO user (username, email, password, car_fuel)
VALUES
    ('Alice', 'alice@example.com', 'password1', 100),
    ('Bob', 'bob@example.com', 'password2', 80),
    ('Charlie', 'charlie@example.com', 'password3', 120),
    ('David', 'david@example.com', 'password4', 95);

-- Insert data into the 'friend_relation' table
INSERT INTO friend_relation (user_id)
VALUES
    (1),
    (2),
    (3),
    (4);

-- Insert data into the 'friend' table to create diverse friendships
INSERT INTO friend (friend_relation_id)
VALUES
    (1), -- Alice and Bob are friends
    (2), -- Bob and Charlie are friends
    (3), -- Charlie and David are friends
    (4), -- David and Alice are friends
    (1), -- Alice and Bob are friends
    (3); -- Charlie and David are friends

-- Insert data into the 'group' table
INSERT INTO `group` (group_name)
VALUES
    ('Family'),
    ('Friends'),
    ('Work'),
    ('Study');

-- Insert data into the 'group_user' table
INSERT INTO group_user (group_id, user_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 1);

-- Insert data into the 'message' table
INSERT INTO message (message, user_id, group_id)
VALUES
    ('Hello, Family!', 1, 1),
    ('Hi Friends!', 2, 2),
    ('Work meeting at 3 PM', 3, 3),
    ('Study group session tomorrow', 4, 4),
    ('Group chat test', 1, 2),
    ('Lunch plans?', 2, 3),
    ('Assignment deadline', 3, 4),
    ('Message from Alice', 4, 1);

-- Insert data into the 'trip' table
INSERT INTO trip (user_id, description, driving_date, driving_pattern, driving_condition)
VALUES
    (1, 'Commute to work', '2023-09-10 08:00:00', 1, 1),
    (2, 'Weekend road trip', '2023-09-11 10:00:00', 2, 2),
    (3, 'Daily commute', '2023-09-12 07:30:00', 3, 3),
    (4, 'Study group meeting', '2023-09-13 18:00:00', 4, 4);

-- Insert data into the 'geo_point' table
INSERT INTO geo_point (trip_id, latitude, longitude, step_num)
VALUES
    (1, 40.7128, -74.0060, 1),
    (1, 40.7129, -74.0061, 2),
    (2, 34.0522, -118.2437, 1),
    (2, 34.0523, -118.2438, 2),
    (3, 51.5074, -0.1278, 1),
    (3, 51.5075, -0.1279, 2),
    (4, 35.682839, 139.759455, 1),
    (4, 35.674228, 139.761174, 2);

-- Insert data into the 'hotspot' table
INSERT INTO hotspot (latitude, longitude, user_id)
VALUES
    (40.7128, -74.0060, 1),
    (34.0522, -118.2437, 2),
    (51.5074, -0.1278, 3),
    (35.682839, 139.759455, 4);

-- Insert data into the 'heatmap' table
INSERT INTO heatmap (latitude, longitude, user_id)
VALUES
    (40.7128, -74.0060, 1),
    (34.0522, -118.2437, 2),
    (51.5074, -0.1278, 3),
    (35.682839, 139.759455, 4);
