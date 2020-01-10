import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_pets/services/weather.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather_pets/widgets/main_model.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));
  }


  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body: Center(
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 100,
              ),
            ),
          );
        }
}