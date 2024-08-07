import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [count, setCount] = useState(0);
  const [names, setNames] = useState([]);
  const [name, setName] = useState('');

  useEffect(() => {
    fetchNames();
  }, []);

  const fetchNames = async () => {
    try {
      const response = await axios.get('/api/names.cfm', { params: { action: 'get' } });
      console.log('Fetched names:', response.data); // Debugging log
      if (response.data.status === 'success') {
        setNames(response.data.names);
      } else {
        console.error('Error fetching names:', response.data.message); // Error log
      }
    } catch (error) {
      console.error('Error fetching names:', error);
    }
  };

  const addName = async (e) => {
    e.preventDefault();
    if (!name) return;

    try {
      const response = await axios.post('/api/names.cfm', new URLSearchParams({ action: 'add', name }));
      console.log('Add name response:', response.data); // Debugging log
      if (response.data.status === 'success') {
        fetchNames(); // Refresh the list of names
        setName(''); // Clear the input
      } else {
        console.error('Error adding name:', response.data.message); // Error log
      }
    } catch (error) {
      console.error('Error adding name:', error);
    }
  };

  const deleteName = async (id) => {
    try {
      const response = await axios.post('/api/names.cfm', new URLSearchParams({ action: 'delete', id }));
      console.log('Delete name response:', response.data); // Debugging log
      if (response.data.status === 'success') {
        fetchNames(); // Refresh the list of names
      } else {
        console.error('Error deleting name:', response.data.message); // Error log
      }
    } catch (error) {
      console.error('Error deleting name:', error);
    }
  };

  return (
    <div>
      <nav className="navbar">
        <a href="/">Home</a>
        <a href="/react-build/pages/index.html">About</a>
        <a href="/docs.cfm">Documentation</a>
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
        <h2>Add Name</h2>
        <form onSubmit={addName}>
          <input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="Enter a name"
            required
          />
          <button type="submit">Add Name</button>
        </form>

        <h2>Names List</h2>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {names.map((name) => (
              <tr key={name.id}>
                <td>{name.name}</td>
                <td>
                  <button onClick={() => deleteName(name.id)}>Delete</button>
                </td>
              </tr>
            ))}
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
