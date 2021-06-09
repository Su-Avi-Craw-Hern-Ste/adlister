USE adlister_db;

INSERT INTO users (username, email, password, money, role, phone_number, image)
VALUES
       ('brett', 'brettcrawford123@gmail.com', 'encrypted_password', 50000, 'Hunter', '210-987-6543', 'localblahblah'),
       ('shanshan', 'shanshan123@gmail.com', 'encrypted_password', 50000, 'Healer', '210-876-5432', 'localblahblah2'),
       ('alex', 'alex123@gmail.com', 'encrypted_password', 50000, 'Mage', '210-765-4321', 'localblahblah3'),
       ('manni', 'manni123@gmail.com', 'encrypted_password', 50000, 'Assassin', '210-654-3210', 'localblahblah4');

INSERT INTO categories (category)
VALUES ('Armor'),
       ('Weapons'),
       ('Animals'),
       ('Materials'),
       ('Consumables'),
       ('Tools'),
       ('Treasures'),
       ('Misc (anything not in above categories)');

INSERT INTO images (image)
VALUES ('https://cdn.filestackcontent.com/S8ty7CAQ6yw5sCTgdRw0'),
       ('https://cdn.filestackcontent.com/9xkUBQBiSQyqt8XJNcVT'),
       ('https://cdn.filestackcontent.com/iZZnLrGwTfGMmT25MRa1'),
       ('https://cdn.filestackcontent.com/5JEEGt7Tymi5IyVG2kfp'),
       ('https://cdn.filestackcontent.com/VYeuuh84R6urAgpQYngA'),
       ('https://cdn.filestackcontent.com/aXNEEZLxQLaFJoiCmBEJ'),
       ('https://cdn.filestackcontent.com/xR6VUjYxQHqkqjTMM9x0'),
       ('https://cdn.filestackcontent.com/oIwgUouT2ekFGsK6mSdW'),
       ('https://cdn.filestackcontent.com/wzyW1GK6R5GDPsqQg7MI'),
       ('https://cdn.filestackcontent.com/vfc3PoHFSbveQKM8KBhg'),
       ('https://cdn.filestackcontent.com/P67kbRiwSAqHIvgAx8Ih'),
       ('https://cdn.filestackcontent.com/5jglWsvR5iWKoI5R6y9I'),
       ('https://cdn.filestackcontent.com/pGhTX6xhT76otcNxadxW'),
       ('https://cdn.filestackcontent.com/UaPwVPkbRMiTJ7SDCJAf'),
       ('https://cdn.filestackcontent.com/lYlp24skRFpY8eigTwTQ'),
       ('https://cdn.filestackcontent.com/abkimx4TiKrKEPktXrqY'),
       ('https://cdn.filestackcontent.com/jS9N75a1RHq7bkpY5ovX'),
       ('https://cdn.filestackcontent.com/O4eQsurS8mDrn3R39LJN');

INSERT INTO ads (user_id, title, price, rarity, description)
VALUES
       (1, 'Legendary Cup for Sale', 3500, 'Legendary', 'This legendary cup is legendary. It can hold anything'),
       (2, 'Selling Common Sword', 500, 'Common', 'Found this sword on the side of the road. Just looking for some money'),
       (3, 'Somebody come get this dragon!', 23500, 'Unique', 'Adolescent blue dragon. Rebellious. Experienced dragon owners only'),
       (4, 'White Carbon Soot', 1500, 'Uncommon', 'Smithing material. Excellent for crafting armor pieces.');

INSERT INTO ad_image (ad_id, image_id)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (3, 3),
       (4, 4),
       (4, 5),
       (4, 6);

INSERT INTO ad_category (ad_id, category_id)
VALUES (1, 1),
       (2, 2),
       (2, 7),
       (3, 3),
       (4, 4);