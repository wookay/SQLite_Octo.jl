using SQLite_Octo

adapter = SQL.connect(db="test.db")

SQL.execute(adapter, """
DROP TABLE IF EXISTS users; """)

SQL.execute(adapter, """
CREATE TABLE users (
    id INT NOT NULL,
    name VARCHAR(20),
    PRIMARY KEY (id)
); """)

SQL.execute(adapter, "SELECT name FROM sqlite_master WHERE type='table';")

SQL.execute(adapter, "INSERT INTO users (id, name) VALUES (1, 'John');")

SQL.execute(adapter, "SELECT * FROM users;")
