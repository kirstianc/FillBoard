use fillboard;

show tables;

select * from fillboard_user;

INSERT INTO fillboard_user (username, email, password)VALUES ( 'moritz', 'moritz@test.com', 'test');

SELECT * FROM fillboard_user WHERE username = 'ian';

delete from fillboard_user where username = 'test';

select * from event;

select * from category;

INSERT INTO category (category_name) VALUES ('Hiking');

INSERT INTO event (event_name, description, begin_date, end_date, location, category_id) VALUES ('test event', 'bla bla bla', '12/10/2023', '13/10/2023', 'USA', 1);

SELECT * FROM posts;

INSERT INTO posts (heading, post_text, event_id) VALUES ('first post', 'was so nice', 3);

SELECT * FROM posts;



