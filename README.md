# weather_app

# Overview
This is a simple weather application built using Flutter that fetches current weather and forecast data from the OpenWeather API. The app allows users to search for weather data based on city name, toggle between Celsius and Fahrenheit temperature units, and view both current weather details and a 3-day forecast.

# Features
Search City: Users can enter a city name to get weather information.
Current Weather: Displays temperature, humidity, and a brief description of the weather.
Unit Toggle: Users can toggle between Celsius and Fahrenheit for the temperature unit.
3-Day Forecast: Displays a 3-day weather forecast with temperature for each day.
Data Persistence: The app saves the city name and temperature unit in SharedPreferences to retain settings across sessions.

# Tech Stack
Flutter: A framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
OpenWeather API: Provides weather data such as temperature, humidity, weather descriptions, and forecasts.
Provider: State management solution for Flutter apps.
SharedPreferences: A simple storage solution for saving small pieces of data locally on the device.

# Requirements
To run this app locally, you need to have the following:

Flutter SDK installed on your machine.
Dart programming language.
Android Studio or VSCode with Flutter and Dart plugins.
Internet Connection to fetch weather data from the OpenWeather API.

# App Structure
# 1. weather_controller.dart
This file contains the WeatherProvider class responsible for:

Fetching current weather data (fetchWeather()).
Fetching 3-day forecast data (fetchForecast()).
Storing and loading preferences (savePreferences() and loadPreferences()).
Toggling between Celsius and Fahrenheit units (toggleUnit()).
# 2. weather_view_screen.dart
This file defines the main UI of the app:

A search field to enter city names.
Displays current weather data with temperature, weather description, and humidity.
A button to toggle between Celsius and Fahrenheit.
A list of forecast data for the next 3 days.
# 3. SharedPreferences
The app uses SharedPreferences to store the city and temperature unit settings so that the preferences persist across app launches.

# How to Use
- Change City
- Tap on the search field and enter the name of a city.
- The app will fetch and display the weather data for that city.
- Toggle Temperature Unit
- Tap on the temperature unit toggle button (°C/°F) to switch between Celsius and Fahrenheit.
# View Forecast
Scroll down to see the 3-day weather forecast with temperature for each day.