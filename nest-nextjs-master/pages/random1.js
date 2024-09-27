
export async function getStaticProps() {
    let users = [];
  
    try {
      const response = await fetch('http://localhost:3000/api/users1', {
        method: 'GET',
        headers: {
          'x-api-key': 'key0123456789', 
        },
      });
  
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
  
      users = await response.json();
    } catch (error) {
      console.error('Failed to fetch users:', error.message);
    }
  
    return {
      props: {
        users,
      },
      revalidate: 60, 
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
  