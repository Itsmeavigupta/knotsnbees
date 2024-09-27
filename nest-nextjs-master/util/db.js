
import mysql from 'mysql2/promise';

let connection;

export async function connectToDatabase() {
  if (!connection) {
    connection = await mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'knotsnbees_db',
    });
  }
  return connection;
}
