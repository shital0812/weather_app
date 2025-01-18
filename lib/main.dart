import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/weather_controller.dart';
import '../view/weather_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider()..loadPreferences(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherViewScreen(),
      ),
    );
  }
}
