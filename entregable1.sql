CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar(10) NOT NULL,
  "age" int NOT NULL,
  "courses_id" int NOT NULL,
  "roles_id" int NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "description" varchar NOT NULL,
  "levels_id" int NOT NULL,
  "teachers_id" int NOT NULL
);

CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(15)
);

CREATE TABLE "teachers" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "pivote_courses_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "courses_id" int NOT NULL,
  "courses_videos_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "pivote_courses_categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "courses_id" int NOT NULL,
  "categories_id" int NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20)
);

ALTER TABLE "users" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("levels_id") REFERENCES "levels" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teachers_id") REFERENCES "teachers" ("id");

ALTER TABLE "pivote_courses_videos" ADD FOREIGN KEY ("courses_videos_id") REFERENCES "courses_videos" ("id");

ALTER TABLE "pivote_courses_videos" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "pivote_courses_categories" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "pivote_courses_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

INSERT INTO roles (name) VALUES ('student'), ('teacher'), ('admin');

INSERT INTO categories (name) VALUES ('HTML'), ('CSS'), ('JS');

INSERT INTO levels (name) VALUES ('beginner'), ('intermediate'), ('advanced');

INSERT INTO teachers (name) VALUES ('Johnson'), ('Smith'), ('Wells');

INSERT INTO courses_videos (title, url) VALUES ('HTML Basics', 'url1'), ('CSS Basics', 'url2'), ('JS Basics', 'url3');

INSERT INTO courses (title, description, levels_id, teachers_id) VALUES ('Course 1', 'A brief introduction to Course 1', 1, 1), ('Course 2', 'A brief introduction to Course 2', 2, 1), ('Course 1', 'A brief introduction to Course 1', 1, 1), ('Course 3', 'A brief introduction to Course 3', 2, 2), ('Course 4', 'A brief introduction to Course 4', 3, 1), ('Course 5', 'A brief introduction to Course 5', 3, 3);

INSERT INTO users (name, email, password, age, courses_id, roles_id) VALUES ('Susan', 'susan2018@gmail.com', 'susan1234', 18, 1, 1), ('Mathew', 'mat20158@gmail.com', 'matheus56', 26, 3, 1),
('Lorena', 'lore2018@gmail.com', 'lor134', 56, 1, 2);

INSERT INTO pivote_courses_videos (courses_id, courses_videos_id) VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (3, 2), (3, 3), (4, 3);

INSERT INTO pivote_courses_categories (courses_id, categories_id) VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (3, 2), (3, 3), (4, 3);