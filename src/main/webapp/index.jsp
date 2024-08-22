<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Awesome Weather App</title>
  <link href="https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/63069/weather-icon-clipart-md.png" rel="icon" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&family=VT323&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Awesome Weather App</h1>
<div id="weatherCard" class="card text-center">
  <div class="card-header">
    <i class="fas fa-map-marker-alt icon" style="color: #ff6347;"></i><h2>${city}</h2>
  </div>
  <div class="card-body">
    <div class="weather-info"><i class="fas fa-calendar-day icon" style="color: #ffa500;"></i><span>${dateTime}</span></div>
    <div class="weather-info"><i class="fas fa-thermometer-half icon" style="color: #ff4500;"></i><span>${temp}&#8451;</span></div>
    <div class="weather-info"><i class="fas fa-tint icon" style="color: #00ced1;"></i><span>Humidity: ${hum}%</span></div>
    <div class="weather-info"><i class="fas fa-wind icon" style="color: #add8e6;"></i><span>Wind: ${wind} km/h</span></div>
    <div class="weather-info"><i class="fas fa-cloud-sun icon" style="color: #f0e68c;"></i><span>Weather: ${weather}</span></div>
    <div class="search-bar">
      <form action="weather" method="post" class="form-inline">
        <input name="city" class="form-control" placeholder="Enter City">
        <button type="submit" class="btn btn-primary">
          <i class="fas fa-search"></i>
        </button>
      </form>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
  var weather = "${weather}";
</script>
<script src="scripts.js"></script>
</body>
</html>
