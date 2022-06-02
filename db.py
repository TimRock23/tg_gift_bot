import sqlite3

DB_NAME = 'gifts.db'


def db_connection(func):
    """
    Decorator for secure connection to sqlite using context manager.
    Creates connection to DB if not exist and returns it.
    """

    def wrapper(*args, **kwargs):
        with sqlite3.connect(DB_NAME) as conn:
            kwargs['conn'] = conn
            res = func(*args, **kwargs)
        return res

    return wrapper


@db_connection
def _init_db(conn: sqlite3.Connection, force: bool = False):
    cursor = conn.cursor()
    if force:
        cursor.execute('DROP TABLE IF EXISTS user_room')
        cursor.execute('DROP TABLE IF EXISTS category')
        cursor.execute('DROP TABLE IF EXISTS user')
        cursor.execute('DROP TABLE IF EXISTS gift')
        cursor.execute('DROP TABLE IF EXISTS room')

    with open('createdb.sql', 'r') as f:
        sql = f.read()
    cursor.executescript(sql)
    conn.commit()


if __name__ == '__main__':
    _init_db()
