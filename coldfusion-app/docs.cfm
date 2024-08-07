<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Documentation Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .container {
            width: 50%;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label, input, button {
            margin: 10px 0;
        }
        input {
            padding: 10px;
            font-size: 16px;
        }
        button {
            padding: 10px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="index.cfm">Home</a>
        <a href="about.cfm">About</a>
        <a href="docs.cfm">Documentation</a>
        <a href="react.cfm">React App</a>
    </div>

    <!-- Content Section -->
    <div class="container">
        <h1>Project Documentation</h1>
        <div class="card">
            <h2>Overview</h2>
            <p>This project connects a React and a ColdFusion web application, while also enabling local development for both. It is a React + Vite project and is fully containerized using Podman.</p>
        </div>

        <div class="container">
            <h2>Features</h2>
            <ul>
                <li>Dynamic Content Loading</li>
                <li>Component-Based Architecture</li>
                <li>State Management</li>
                <li>Efficient and Scalable Development</li>
            </ul>
        </div>

        <div class="container">
            <h2>Usage</h2>
            <p>To start the application, use the following commands:</p>
            <pre>
                <code>
docker-compose up
                </code>
            </pre>
            <p>This will spin up the necessary containers and you can access the application at <a href="http://localhost:8500">http://localhost:8500</a>.</p>
        </div>

        <div class="container">
            <h2>APIs</h2>
            <p>The application exposes the following APIs:</p>
            <ul>
                <li><code>GET /api/names.cfm?action=get</code> - Fetch all names</li>
                <li><code>POST /api/names.cfm</code> - Add a new name</li>
                <li><code>POST /api/names.cfm</code> - Delete a name (requires <code>id</code> parameter)</li>
            </ul>
        </div>
    </div>
</body>
</html>
