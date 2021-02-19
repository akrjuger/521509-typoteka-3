-- Временно задокументирован пользователь
--TRUNCATE articles_categories, comments, articles, users, categories RESTART IDENTITY;
TRUNCATE articles_categories, comments, articles, categories RESTART IDENTITY;

--  наполняем категории (id добавляем, чтобы потом добавить по ним связи)
INSERT INTO categories (title)
  VALUES
    ('Деревья'),
    ('За жизнь'),
    ('Без рамки'),
    ('Разное'),
    ('IT');

-- Добавляем пользователей (id добавляем, чтобы потом добавить по ним связи)
--INSERT INTO users (id, avatar, first_name, last_name, email, password, is_author)
--  VALUES
--    (1, 'avatar-1.jpg', 'Инокентий', 'Ивонов', 'ghjkl@gmail.com', 'Aa111111',  true),
--    (2, 'avatar-2.jpg', 'Дарья', 'Коротких', 'zxcvbn@ya.ru', 'Aa111111', false),
--    (3, 'avatar-3.jpg', 'Егор', 'Ефремов', 'asd@mail.ru', 'Cc111111',false);

-- Добавляем статьи (id добавляем, чтобы потом добавить по ним связи)
--INSERT INTO articles (id, title, announce, text, image, published_at, user_id)
INSERT INTO articles (id, title, announce, text, image, published_at)
  VALUES
    (1, 'Как перестать беспокоиться и начать жить', 'Собрать камни бесконечности легко, если вы прирожденный герой.', NULL,'sea@1x.jpg', '2021-02-10T05:49:24.497Z'),
    (2, 'Обзор новейшего смартфона', 'Этот смартфон — настоящая находка.', 'Этот смартфон — настоящая находка. Большой и яркий экран, мощнейший процессор — всё это в небольшом гаджете.', NULL, '2021-02-12T05:49:24.497Z'),
    (3, 'Учим HTML и CSS', 'Освоить вёрстку несложно.', 'Освоить вёрстку несложно. Возьмите книгу новую книгу и закрепите все упражнения на практике.', 'forest@1x.jpg', '2021-02-15T05:49:24.497Z');

-- Добавляем комментарии
--INSERT INTO comments (text, article_id, user_id)
INSERT INTO comments (text, article_id)
  VALUES
    ('Согласен с автором!', 1),
    ('Мне кажется или я уже читал это где-то?', 1),
    ('Давно не пользуюсь стационарными компьютерами. Ноутбуки победили.', 2),
    ('Планируете записать видосик на эту тему?', 2),
    ('Мне кажется или я уже читал это где-то?', 2),
    ('Совсем немного...', 3),
    ('Мне не нравится ваш стиль. Ощущение, что вы меня поучаете.', 3);

-- Добавляем связи - категории-статьи
INSERT INTO articles_categories (article_id, category_id)
  VALUES
    (1, 1),
    (1, 2),
    (2, 5),
    (3, 4),
    (3, 5);
