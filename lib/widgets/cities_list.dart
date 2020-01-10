import 'package:flutter/material.dart';
import 'package:weather_pets/widgets/city_tile.dart';

class CitiesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        CityTile(
          strImage: 'images/clouds.png',
          cityName: 'New York',
          temp: '40',
        ),
        CityTile(
          strImage: 'images/sun.png',
          cityName: 'Los Angeles',
          temp: '70',
        ),
        CityTile(
          strImage: 'images/haze.png',
          cityName: 'San Francisco',
          temp: '75',
        ),
        CityTile(
          strImage: 'images/rain.png',
          cityName: 'Boston',
          temp: '30',
        ),
        CityTile(
          strImage: 'images/storm.png',
          cityName: 'Chicago',
          temp: '30',
        ),
      ],
    );
  }
}