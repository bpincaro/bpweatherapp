import 'dart:async';
import 'config.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  await FlutterConfig.loadEnvVariables();
  runApp(MaterialApp(
      theme: ThemeData.light(),
      home: const WeatherApp(key: ValueKey("weather_app")),
  ));
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({required Key key}) : super(key: key);
  @override
  WeatherAppState createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  String _provider = 'OpenWeatherMap';  // Default weather provider
  String _location = 'Loading...';   // Variable to store the location
  String _temperature = 'Loading...';  // Variable to store the temperature
  String _forecast = 'Loading...';  // Variable to store the forecast
  String _unit = 'C';  // Variable to store the unit of temperature (Celsius or Fahrenheit)
  Color _backgroundColor = Colors.lightBlue;  // Variable to store the background color

  void _getWeather() async {
    // Check and request for the location permission
    final permissionStatus = await Permission.location.status;
    if (permissionStatus != PermissionStatus.granted) {
      final newPermissionStatus = await Permission.location.request();
      if (newPermissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    http.Response response;
    // Get the device's location
    final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Make API call based on the selected weather provider
    if (_provider == 'OpenWeatherMap') {
      response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&units=${_unit}&appid=${Config.OPENWEATHERMAP_API_KEY}'));
    } else if (_provider == 'WUnderground') {
      response = await http.get(Uri.parse('https://api.wunderground.com/api/${Config.WUNDERGROUND_API_KEY}/conditions/q/${position.latitude},${position.longitude}.json'));
    } else {
      response = await http.get(Uri.parse('http://dataservice.accuweather.com/currentconditions/v1/YOUR_LOCATION_KEY?apikey=${Config.ACCUWEATHER_API_KEY}&geoposition=${position.latitude},${position.longitude}'));
    }
    var data = json.decode(response.body);
    setState(() {
      _location = data['name'];
      _temperature = data['main']['temp'].toString();
      _forecast = data['weather'][0]['main'];
      // Set the background color based on the forecast
      if (_forecast == 'Clear') {
        _backgroundColor = Colors.lightBlue;
      } else if (_forecast == 'Snow') {
        _backgroundColor = Colors.white54; // light grey
      } else if (_forecast == 'Rain') {
        _backgroundColor = Colors.grey;
      }  else if (_forecast == 'Clouds') {
        _backgroundColor = Colors.white12;
      }
    });
  }

  void _convertTemperature() {
    setState(() {
      if (_unit == 'C') {
        _unit = 'F';
        _temperature = ((double.parse(_temperature) * 9/5) + 32).toString();
      } else {
        _unit = 'C';
        _temperature = ((double.parse(_temperature) - 32) * 5/9).toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getWeather(); // Get the weather data on app launch
    // Update the weather data every 30 minutes
    Timer.periodic(const Duration(minutes: 30), (timer) => _getWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: _provider,
                items: <String>['OpenWeatherMap', 'WUnderground', 'AccuWeather']
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                )).toList(),
                onChanged: (String? newValue) {
                  if(newValue != null) {
                    setState(() {
                      _provider = newValue; // Update the selected weather provider
                    });
                    _getWeather(); // Get the weather data for the new provider
                  }
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_location,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_temperature,
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_forecast,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: _unit == 'C' ? _convertTemperature : null,
                child: Text(_unit == 'C' ? '°F' : '°C'),
              ),
              TextButton(
                onPressed: _unit == 'F' ? _convertTemperature : null,
                child: Text(_unit == 'C' ? '°C' : '°F'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}