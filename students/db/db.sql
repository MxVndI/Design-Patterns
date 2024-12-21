CREATE TABLE IF NOT EXISTS student (
    id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    lastname VARCHAR(50),
    birth_date DATE,
    telegram VARCHAR(50),
    mail VARCHAR(100),
    phone varchar(20),
    git VARCHAR(100)
);