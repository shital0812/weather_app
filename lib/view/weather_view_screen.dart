import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/weather_controller.dart';

class WeatherViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        centerTitle: true,
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightBlue.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Enter city',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (value) => provider.setCity(value),
              ),
              SizedBox(height: 16),
              provider.currentWeather == null
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              provider.currentWeather!["name"],
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${provider.currentWeather!["main"]["temp"]} °${provider.isCelsius ? "C" : "F"}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              provider.currentWeather!["weather"][0]
                                  ["description"],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Humidity: ${provider.currentWeather!["main"]["humidity"]}%",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => provider.toggleUnit(),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text("F/C"),
                                  SizedBox(width: 10),
                                  Icon(provider.isCelsius
                                      ? Icons.thermostat
                                      : Icons.thermostat_outlined)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
              SizedBox(height: 16),
              provider.forecast == null
                  ? SizedBox.shrink()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: provider.forecast!.length,
                        itemBuilder: (context, index) {
                          final day = provider.forecast![index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black26)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    day["dt_txt"].toString().split(" ")[0],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Temp: ${day["main"]["temp"]} °${provider.isCelsius ? "C" : "F"}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
