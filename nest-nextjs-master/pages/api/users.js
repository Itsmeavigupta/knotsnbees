
import { connectToDatabase } from '../../util/db';

export default async function handler(req, res) {
  try {
    const db = await connectToDatabase();

    const [rows] = await db.execute('SELECT * FROM tbl_users' );

    res.status(200).json(rows);
  } catch (error) {
    res.status(500).json({ message: 'Internal Server Error', error: error.message });
  }
}
