import { useState } from 'react';
import './App.css';

function AboutPage() {
  const [likes, setLikes] = useState(0);
  const [showDetails, setShowDetails] = useState(false);

  return (
    <div>
      <nav className="navbar">
        <a href="/">Home</a>
        <a href="/react-build/pages/index.html">About</a>
        <a href="/services">Services</a>
        <a href="/react-build/index.html">React App</a>
      </nav>

      <div className="container">
        <h1>About This Project</h1>
        <div className="card">
          <h2>React + ColdFusion Integration</h2>
          <p>
            This project demonstrates the integration of a React app with a ColdFusion backend. By embedding React components directly into ColdFusion pages, we achieve a seamless and fluid navigation experience.
          </p>
          <button onClick={() => setShowDetails(!showDetails)}>
            {showDetails ? 'Hide Details' : 'Show Details'}
          </button>
          {showDetails && (
            <div className="details">
              <p>
                React is a powerful JavaScript library for building user interfaces, and ColdFusion is a robust server-side technology. Together, they enable the creation of dynamic and scalable web applications.
              </p>
              <ul>
                <li>Dynamic Content Loading</li>
                <li>Component-Based Architecture</li>
                <li>State Management</li>
                <li>Efficient and Scalable Development</li>
              </ul>
            </div>
          )}
        </div>

        <div className="container">
          <h2>React Feature Showcase</h2>
          <div className="card">
            <h3>Like Button</h3>
            <button onClick={() => setLikes(likes + 1)}>
              {likes} {likes === 1 ? 'Like' : 'Likes'}
            </button>
          </div>

          <div className="card">
            <h3>Conditional Rendering</h3>
            <p>
              Click the button above to show or hide additional details about the project.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default AboutPage;
