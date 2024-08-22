document.addEventListener('DOMContentLoaded', function() {
    console.log("Weather: ", weather);

    if (weather.includes('Rain')) {
        document.body.classList.add('rain');
    } else if (weather.includes('Clear')) {
        document.body.classList.add('clear');
    } else if (weather.includes('Clouds')) {
        document.body.classList.add('clouds');
    } else if (weather.includes('Snow')) {
        document.body.classList.add('snow');
    } else if (weather.includes('Haze')) {
        document.body.classList.add('haze');
    } else if (weather.includes('Mist')) {
        document.body.classList.add('mist');
    } else {
        document.body.classList.add('default-weather');
    }
});
