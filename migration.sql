USE adlister_db;

DROP TABLE IF EXISTS ad_image;
DROP TABLE IF EXISTS ad_category;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS images;


CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL UNIQUE,
    email VARCHAR(240) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    money INT UNSIGNED,
    class VARCHAR(30),
    phone_number VARCHAR(20),
    image VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE images (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    image VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    image_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    value INT UNSIGNED NOT NULL,
    rarity VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE ad_category (
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

CREATE TABLE ad_image (
     ad_id INT UNSIGNED NOT NULL,
     image_id INT UNSIGNED NOT NULL,
     FOREIGN KEY (ad_id) REFERENCES ads(id)
         ON DELETE CASCADE,
     FOREIGN KEY (image_id) REFERENCES images(id)
         ON DELETE CASCADE
);