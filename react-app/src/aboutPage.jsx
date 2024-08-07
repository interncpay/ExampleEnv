import { useState } from 'react';
import './App.css';

function AboutPage() {
  const [likes, setLikes] = useState(0);
  const [showDetails, setShowDetails] = useState(false);
  const [showMoreInfo, setShowMoreInfo] = useState(false);

  return (
    <div>
      <nav className="navbar">
        <a href="/">Home</a>
        <a href="/react-build/pages/index.html">About</a>
        <a href="/docs.cfm">Documentation</a>
        <a href="/react-build/index.html">React App</a>
      </nav>

      <div className="container">
        <h1>About This Project</h1>
        <div className="card">
          <h2>React + ColdFusion Integration</h2>
          <p>
            This project demonstrates a level of integration between React and ColdFusion, by essentially having them operate out of two containers enabling development environments for both. The build React files are shared via volumes to the ColdFusion side which are then used to create a seamless navigation experience for the user.
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

        <div className="card">
          <h2>Project Overview</h2>
          <p>
            This project connects a React and a ColdFusion web application while also enabling local development for both. It is a React + Vite project and is running fully containerized via Podman.
          </p>
          <button onClick={() => setShowMoreInfo(!showMoreInfo)}>
            {showMoreInfo ? 'Hide More Info' : 'Show More Info'}
          </button>
          {showMoreInfo && (
            <div className="more-info">
              <p>
                Vite is a next-generation front-end tooling that emphasizes speed and performance. It serves as the build tool for the React application, providing a fast and modern development experience.
              </p>
              <p>
                The entire setup is fully containerized using Podman, ensuring a consistent and reproducible development environment. This containerization facilitates easy deployment and scaling of the application.
              </p>
              <ul>
                <li>React + Vite for fast development</li>
                <li>ColdFusion for powerful server-side processing</li>
                <li>Podman for containerization</li>
                <li>Local development and production-ready deployment</li>
              </ul>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default AboutPage;
