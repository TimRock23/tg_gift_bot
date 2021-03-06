CREATE TABLE IF NOT EXISTS user(
    id INTEGER PRIMARY KEY NOT NULL,
    username VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS room(
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    owner INTEGER NOT NULL,
    FOREIGN KEY(owner) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS category(
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    room VARCHAR(255) NOT NULL,
    FOREIGN KEY(room) REFERENCES room(id)
);
--
CREATE TABLE IF NOT EXISTS gift(
    id VARCHAR(255) PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(category) REFERENCES category(id),
    FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS user_room(
    id VARCHAR (255) PRIMARY KEY NOT NULL,
    user_id INTEGER NOT NULL,
    room VARCHAR(255) NOT NULL,
    is_owner BOOLEAN NOT NULL CHECK (is_owner IN (0, 1)),
    FOREIGN KEY(room) REFERENCES room(id),
    FOREIGN KEY(user_id) REFERENCES user(id)
);
