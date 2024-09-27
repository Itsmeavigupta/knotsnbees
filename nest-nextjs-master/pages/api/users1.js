
import { connectToDatabase } from '../../util/db';
import { verifyApiKey } from '../../util/middleware';
export default async function handler(req, res) {
  verifyApiKey(req, res, async () => {
    try {
      const db = await connectToDatabase();

      const [rows] = await db.execute(
        'SELECT user_fname, user_lname, user_email, created_at, updated_at FROM tbl_users'
      );
      const users = rows.map(user => ({
        ...user,
        created_at: user.created_at.toISOString(),
        updated_at: user.updated_at.toISOString(),
      }));
      res.status(200).json(users);
    } catch (error) {
      res.status(500).json({ message: 'Internal Server Error', error: error.message });
    }
  });
}
