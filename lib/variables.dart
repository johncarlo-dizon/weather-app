import 'package:flutter/cupertino.dart';

String citylocation = "Manila";
Map<String, dynamic> weatherData = {};
String url =
    "https://api.openweathermap.org/data/2.5/weather?q=" +
    citylocation +
    "&appid=05f53c8bfd0bf75b9bf78e2edf3abfff";
String city = "Loading...";

String temperature = "°°°°";
String humidity = "°°°°";
String feels = "°°°°";
String visibility = "°°°°";
String pressure = "°°°°";
String cloud = "°°°°";
String wind = "°°°°";
int windDegree = 0;
String windDirection = "N";
Color colorIcon = CupertinoColors.systemPurple;
Brightness mode = Brightness.dark;
bool isDark = true;
bool showDeveloper = false;
Color darkColor = CupertinoColors.white;

bool isCelsius = true;
