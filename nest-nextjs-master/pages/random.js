
import { connectToDatabase } from '../util/db'; 

export async function getServerSideProps() {
  let users = [];

  try {
    const db = await connectToDatabase();

    const [rows] = await db.execute(
      'SELECT user_fname, user_lname, user_email, created_at, updated_at FROM tbl_users'
    );


    users = rows.map(user => ({
      ...user,
      created_at: user.created_at.toISOString(),
      updated_at: user.updated_at.toISOString(),
    }));
  } catch (error) {
    console.error('Failed to fetch users:', error.message);
  }

  return {
    props: {
      users,
    },
  };
}

export default function Users({ users }) {
  return (
    <div>
      <h1>User List</h1>
      <ul>
        {users.map((user) => (
          <li key={user.user_email}>
            {user.user_fname} {user.user_lname} - {user.user_email} <br />
            Created At: {new Date(user.created_at).toLocaleString()} <br />
            Updated At: {new Date(user.updated_at).toLocaleString()}
          </li>
        ))}
      </ul>
    </div>
  );
}
