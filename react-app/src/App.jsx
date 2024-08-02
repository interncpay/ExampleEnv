import { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <nav className="navbar">
        <a href="/">Home</a>
        <a href="/react-build/pages/index.html">About</a>
        <a href="/services">Services</a>
        <a href="/react-build/index.html">React App</a>
      </nav>

      <div className="container">
        <h1>Profile Page</h1>
        <div className="card">
          <h2>Welcome, User!</h2>
          <p>Here you can manage your profile and view your activity.</p>
        </div>

        <h2>Activity</h2>
        <table>
          <thead>
            <tr>
              <th>Activity</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Logged in</td>
              <td>2024-07-31</td>
            </tr>
            <tr>
              <td>Updated Profile</td>
              <td>2024-07-30</td>
            </tr>
            {/* Add more rows as needed */}
          </tbody>
        </table>
      </div>

      <div className="container">
        <h2>Counter Example</h2>
        <button onClick={() => setCount((count) => count + 1)}>
          Count is {count}
        </button>
      </div>
    </div>
  );
}

export default App;
