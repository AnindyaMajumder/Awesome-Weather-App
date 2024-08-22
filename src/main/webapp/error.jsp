<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Awesome Weather App</title>
    <link href="https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/63069/weather-icon-clipart-md.png" rel="icon" />
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&family=VT323&display=swap" rel="stylesheet">
    <style>
        body {
            background: url('https://media.giphy.com/media/QBd2kLB5qDmysEXre9/giphy.gif') no-repeat center center;
            background-size: cover;
            font-family: 'VT323', monospace;
            color: #fff;
            text-shadow: 1px 1px 2px #000;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        h1 {
            font-family: 'Press Start 2P', cursive;
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 30px;
            color: #ffff00; /* Yellow */
        }

        .card {
            background: rgba(30, 30, 30, 0.8);
            border: none;
            margin: 20px auto;
            width: 80%;
            max-width: 300px; /* Reduced max width */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 15px; /* Reduced padding */
            border-radius: 15px;
            text-align: center;
        }

        .search-bar {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            width: 100%;
        }

        .search-bar input {
            border: 0.2px solid #007bff;
            border-radius: 15px 0 0 15px;
            padding: 8px; /* Reduced padding */
            font-size: 70%; /* Reduced font size */
            text-align: center;
            font-family: 'Press Start 2P', cursive; /* Apply font */
            flex: 1;
            max-width: 200px; /* Reduced max width */
        }

        .search-bar button {
            border: 1px solid #007bff;
            border-radius: 0 15px 15px 0;
            background: #007bff;
            border-color: #007bff;
            color: #fff;
            padding: 8px 10px; /* Reduced padding */
            font-size: 0.9rem; /* Reduced font size */
            font-family: 'Press Start 2P', cursive; /* Apply font */
            cursor: pointer;
        }

        .search-bar button i {
            color: #fff;
        }

        @media (max-width: 768px) {
            .card, .search-bar {
                width: 90%;
            }
        }
    </style>
    <script>
        window.onload = function() {
            var errorMessage = "<%= request.getAttribute("errorMessage") %>";
            if (errorMessage) {
                alert("Error Message " + errorMessage);
            }
        };
    </script>
</head>
<body>
<h1>Awesome Weather App</h1>
<div class="card">
    <div class="search-bar">
        <form action="weather" method="post" class="form-inline">
            <input name="city" placeholder="Enter City" required>
            <button type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>


