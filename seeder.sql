USE adlister_db;

INSERT INTO users (username, email, password, money, role, phone_number, image)
VALUES
       ('brett', 'brettcrawford123@gmail.com', 'encrypted_password', 50000, 'Hunter', '210-987-6543', 'localblahblah'),
       ('shanshan', 'shanshan123@gmail.com', 'encrypted_password', 50000, 'Healer', '210-876-5432', 'localblahblah2'),
       ('alex', 'alex123@gmail.com', 'encrypted_password', 50000, 'Mage', '210-765-4321', 'localblahblah3'),
       ('manni', 'manni123@gmail.com', 'encrypted_password', 50000, 'Assassin', '210-654-3210', 'localblahblah4');

INSERT INTO categories (category)
VALUES	('items'),
          ('materials'),
          ('animals'),
          ('weapons');

INSERT INTO images (image)
VALUES	('dummy_url'),
          ('dummy_url2'),
          ('dummy_url3'),
          ('dummy_url4');

INSERT INTO ads (user_id, title, price, rarity, description)
VALUES
       (1, 'Legendary Cup for Sale', 3500, 'Legendary', 'This legendary cup is legendary. It can hold anything'),
       (2, 'Selling Common Sword', 500, 'Common', 'Found this sword on the side of the road. Just looking for some money'),
       (3, 'Somebody come get this dragon!', 23500, 'Unique', 'Adolescent blue dragon. Rebellious. Experienced dragon owners only'),
       (4, 'White Carbon Soot', 1500, 'Uncommon', 'Smithing material. Excellent for crafting armor pieces.');

INSERT INTO ad_image (ad_id, image_id)
VALUES 	(1, 1),
          (2, 2),
          (3, 3),
          (4, 4);

INSERT INTO ad_category (ad_id, category_id)
VALUES	(1, 1),
          (2, 2),
          (3, 3),
          (4, 4);