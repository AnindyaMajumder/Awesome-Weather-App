<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weather App</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-size: cover;
            background-position: center;
            font-family: 'Arial', sans-serif;
            color: #fff;
            text-shadow: 1px 1px 2px #000;
        }
        .form-container {
            margin: 50px auto;
            width: 50%;
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            color: #000;
        }
        .card {
            background: linear-gradient(135deg, rgba(70, 130, 180, 0.8), rgba(0, 191, 255, 0.8));
            border: none;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card-header {
            background: rgba(255, 255, 255, 0.2);
            border-bottom: none;
            color: #fff;
        }
        .card-body {
            color: #fff;
        }
        .icon {
            margin-right: 10px;
        }
        .weather-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .weather-info i {
            font-size: 1.5rem;
        }
        .weather-info span {
            font-size: 1.2rem;
        }
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }
            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container text-center">
        <h1>Welcome to Weather App</h1>
        <form action="myServlet-servlet" method="post">
            <div class="form-group">
                <input name="city" class="form-control" placeholder="Enter City">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <div id="weatherCard" class="card mx-auto" style="width: 50%;">
        <div class="card-header text-center">
            <h2>${city}</h2>
        </div>
        <div class="card-body text-center">
            <div class="weather-info"><i class="fas fa-calendar-day icon"></i><span>${dateTime}</span></div>
            <div class="weather-info"><i class="fas fa-thermometer-half icon"></i><span>${temp}&#8451;</span></div>
            <div class="weather-info"><i class="fas fa-tint icon"></i><span>Humidity: ${hum}%</span></div>
            <div class="weather-info"><i class="fas fa-wind icon"></i><span>Wind: ${wind} km/h</span></div>
            <div class="weather-info"><i class="fas fa-cloud-sun icon"></i><span>Weather: ${weather}</span></div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var weather = '${weather}';

        if (weather.includes('Rain')) {
            document.body.style.backgroundImage = "url('https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif')";
        } else if (weather.includes('Clear')) {
            document.body.style.backgroundImage = "url('https://media.giphy.com/media/26xBwdIuRJiAIqHwA/giphy.gif')";
        } else if (weather.includes('Clouds')) {
            document.body.style.backgroundImage = "url('https://media.giphy.com/media/3o6Zt481isNVuQI1l6/giphy.gif')";
        } else if (weather.includes('Snow')) {
            document.body.style.backgroundImage = "url('https://media.giphy.com/media/3oEjHHNfewtTQfKQXS/giphy.gif')";
        } else {
            document.body.style.backgroundImage = "url('https://media.giphy.com/media/3oEjI1erPMTMBFmNHi/giphy.gif')";
        }
    });
</script>
</body>
</html>
