package com.anincodes.weatherapp;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Scanner;

@WebServlet(name = "weatherServlet", value = "/weather")
public class WeatherApp extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String api_key = "bbdd9c72be99ee68c5f09f056b9cd1ab";
        String city = request.getParameter("city");
        if (city == null || city.isEmpty()) {
            // response.sendError(HttpServletResponse.SC_BAD_REQUEST, "City parameter is mandatory");
            request.setAttribute("errorMessage", "Please enter a city");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // api request url
        String api_url = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + api_key;

        try {
            // api integration
            URL url = new URL(api_url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // read response
            int status = conn.getResponseCode();
            if (status != HttpURLConnection.HTTP_OK) {
                // response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to get data from API");
                request.setAttribute("errorMessage", "Please enter the city name perfectly");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            InputStream in = conn.getInputStream();
            InputStreamReader isr = new InputStreamReader(in);

            // store
            StringBuilder responseContent = new StringBuilder();
            Scanner scanner = new Scanner(isr);

            while (scanner.hasNext()) {
                responseContent.append(scanner.nextLine());
            }

            // extract data from JSON
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(responseContent.toString(), JsonObject.class);

            // Date & Time
            long datetime = jsonObject.get("dt").getAsLong()*1000;
            String dateTime = new Date(datetime).toString();
            // Temp
            JsonElement tmp = jsonObject.getAsJsonObject("main").get("temp");
            int temp = (int) (tmp.getAsInt() - 273.16);
            // Humidity
            int hum = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
            //Wind Speed
            double wind = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
            // Weather Condition
            String weather = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();

            request.setAttribute("dateTime", dateTime);
            request.setAttribute("city", city);
            request.setAttribute("temp", temp);
            request.setAttribute("hum", hum);
            request.setAttribute("wind", wind);
            request.setAttribute("weather", weather);
            request.setAttribute("WeatherData", responseContent.toString());

            conn.disconnect();
            request.getRequestDispatcher("index.jsp").forward(request,response);

            scanner.close();
            in.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            // response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to get data from API");
            request.setAttribute("errorMessage", "Internal Server Error");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}