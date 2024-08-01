<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Full Application</title>
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
        <a href="services.cfm">Services</a>
        <a href="react.cfm">React App</a> <!-- Link to ColdFusion page handling redirect -->
    </div>

    <!-- Content Section -->
    <div class="container">
        <h1>Hello!</h1>

        <form method="post" action="index.cfm">
            <label for="name">Enter a name:</label>
            <input type="text" id="name" name="name" required>
            <button type="submit">Add Name</button>
        </form>

        <cfif structKeyExists(form, "name")>
            <cfquery datasource="Project">
                INSERT INTO Names (Name)
                VALUES (<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">);
            </cfquery>
            <cflocation url="index.cfm" addtoken="false">
        </cfif>

        <cfquery name="getNames" datasource="Project">
            SELECT ID, Name FROM Names;
        </cfquery>

        <h2>Names:</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="getNames">
                    <tr>
                        <td>#getNames.Name#</td>
                        <td>
                            <form method="post" action="index.cfm">
                                <input type="hidden" name="deleteID" value="#getNames.ID#">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>

    <!-- Handle deletion -->
    <cfif structKeyExists(form, "deleteID")>
        <cfquery datasource="Project">
            DELETE FROM Names WHERE ID = <cfqueryparam value="#form.deleteID#" cfsqltype="cf_sql_integer">;
        </cfquery>
        <cflocation url="index.cfm" addtoken="false">
    </cfif>
</body>
</html>
