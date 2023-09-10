-- SHOWING ALL FRIENDS OF A USER
SELECT * FROM user WHERE user_id IN (
    SELECT user_id FROM friend_relation INNER JOIN friend ON friend_relation.friend_relation_id = friend.friend_relation_id WHERE friend.user_id = 1
    