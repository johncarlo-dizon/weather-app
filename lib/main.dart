import 'dart:convert';
import 'package:flutter/material.dart';
import 'variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness mode = Brightness.dark;

  Map<String, dynamic> weatherData = {};
  String url = "";
  String city = "Loading...";
  IconData? weather;
  bool newMetric = true;
  double tempInCelsius = 0.0;
  double feelslike = 0.0;
  bool dataload = false;

  void updateLocation(String newLocation) {
    setState(() {
      citylocation = newLocation;
      url =
          "https://api.openweathermap.org/data/2.5/weather?q=$citylocation&appid=05f53c8bfd0bf75b9bf78e2edf3abfff";
      getData();
    });
  }

  void updateColor(Color newColor) {
    setState(() {
      colorIcon = newColor;
    });
  }

  void updateMetric(bool newValue) {
    setState(() {
      newMetric = newValue;
      print(newMetric);
    });
  }

  void updateMode(Brightness newMode) {
    setState(() {
      mode = newMode;
    });
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse(url));

    setState(() {
      weatherData = jsonDecode(response.body);
      String cod = (weatherData["cod"]).toString();

      if (cod == "404") {
        setState(() {
          dataload = false;
        });
        navigatorKey.currentState?.pushReplacement(
          CupertinoPageRoute(
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                  "Invalid Location",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                content: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "The location you entered is invalid. Please try entering a valid location.",
                    style: TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.inactiveGray,
                    ),
                  ),
                ),
                actions: [
                  CupertinoButton(
                    child: Text(
                      "Close",
                      style: TextStyle(color: CupertinoColors.destructiveRed),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ),
        );
      } else {
        city = weatherData["name"];
        dataload = true;
        tempInCelsius = weatherData["main"]["temp"] - 273.15;
        feelslike = weatherData["main"]["feels_like"] - 273.15;

        if (newMetric) {
          temperature = tempInCelsius.toStringAsFixed(1) + "°C";
          feels = feelslike.toStringAsFixed(1) + "°C";
        } else {
          temperature =
              ((tempInCelsius * 9 / 5) + 32).toStringAsFixed(1) + "°F";
          feels = ((feelslike * 9 / 5) + 32).toStringAsFixed(1) + "°F";
        }

        humidity = (weatherData["main"]["humidity"]).toString() + "%";
        pressure = (weatherData["main"]["pressure"]).toString() + " hPa";
        visibility = (weatherData["visibility"] / 1000).toString() + " km";
        cloud = (weatherData["clouds"]["all"]).toString() + "%";
        wind =
            (weatherData["wind"]["speed"] * 3.6).toStringAsFixed(1) + " km/h";
        windDegree = weatherData["wind"]["deg"];

        if (windDegree >= 0 && windDegree < 22.5) {
          windDirection = "N";
        } else if (windDegree >= 22.5 && windDegree < 67.5) {
          windDirection = "NE";
        } else if (windDegree >= 67.5 && windDegree < 112.5) {
          windDirection = "E";
        } else if (windDegree >= 112.5 && windDegree < 157.5) {
          windDirection = "SE";
        } else if (windDegree >= 157.5 && windDegree < 202.5) {
          windDirection = "S";
        } else if (windDegree >= 202.5 && windDegree < 247.5) {
          windDirection = "SW";
        } else if (windDegree >= 247.5 && windDegree < 292.5) {
          windDirection = "W";
        } else if (windDegree >= 292.5 && windDegree < 337.5) {
          windDirection = "NW";
        } else {
          windDirection = "N";
        }

        switch (weatherData["weather"][0]["main"]) {
          case "Clouds":
            weather = CupertinoIcons.cloud;
            break;
          case "Clear":
            weather = CupertinoIcons.sun_max;
            break;
          case "Mist":
            weather = CupertinoIcons.cloud_rain;
            break;
          case "Rain":
            weather = CupertinoIcons.cloud_bolt_rain;
            break;
          case "Snow":
            weather = CupertinoIcons.snow;
            break;
          case "Thunderstorm":
            weather = CupertinoIcons.cloud_bolt;
            break;
          case "Drizzle":
            weather = CupertinoIcons.cloud_drizzle;
            break;
          default:
            weather = CupertinoIcons.cloud;
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    url =
        "https://api.openweathermap.org/data/2.5/weather?q=$citylocation&appid=05f53c8bfd0bf75b9bf78e2edf3abfff";
    getData();
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    if (dataload == true) {
      if (newMetric) {
        temperature = tempInCelsius.toStringAsFixed(1) + "°C";
        feels = feelslike.toStringAsFixed(1) + "°C";
      } else {
        temperature = ((tempInCelsius * 9 / 5) + 32).toStringAsFixed(1) + "°F";
        feels = ((feelslike * 9 / 5) + 32).toStringAsFixed(1) + "°F";
      }
    } else {
      city = "Loading...";
      temperature = "°°°°";
      humidity = "°°°°";
      feels = "°°°°";
      visibility = "°°°°";
      pressure = "°°°°";
      cloud = "°°°°";
      wind = "°°°°";
    }

    return CupertinoApp(
      navigatorKey: navigatorKey,
      theme: CupertinoThemeData(brightness: mode),
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Weather App"),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.settings, color: darkColor),
            onPressed: () {
              navigatorKey.currentState?.push(
                CupertinoPageRoute(
                  builder:
                      (context) => Settings(
                        onLocationChanged: updateLocation,
                        onColorChanged: updateColor,
                        onChangeMode: updateMode,
                        onChangeMetric: updateMetric,
                      ),
                ),
              );
            },
          ),
        ),

        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Text(
                      "My Location",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 40,
                      ),
                    ),

                    city == "Loading..."
                        ? CupertinoActivityIndicator()
                        : Text('$city', style: TextStyle(fontSize: 20)),

                    SizedBox(height: 10),
                    Text("$temperature", style: TextStyle(fontSize: 30)),
                    SizedBox(height: 10),
                    Icon(weather, color: colorIcon, size: 100),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
