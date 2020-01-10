import 'package:flutter/material.dart';
import 'package:weather_pets/utilities/constants.dart';
import 'package:weather_pets/services/weather.dart';
import 'city_screen.dart';
import 'package:weather_pets/widgets/overlay_menu.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather_pets/widgets/main_model.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  int condition;
  String weatherIconImage;
  String cityName;
  String weatherMessage;
  String mainDesc;
  String background;
  String themeIcon = 'images/cat_icon.png';

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIconImage = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        mainDesc = 'Unable to get weather data';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      mainDesc = weatherData['weather'][0]['main'];
      weatherIconImage = weather.getWeatherIconImage(condition);
      background = weather.getBackgroundImage('dog', condition);
      cityName = weatherData['name'];
      print(weatherIconImage);
    });
  }

  toggleTheme() {
    setState(() {
      if(themeIcon.contains('cat')){
        background = weather.getBackgroundImage('cat', condition);
        themeIcon = 'images/dog_icon.png';
      } else {
        background = weather.getBackgroundImage('dog', condition);
        themeIcon = 'images/cat_icon.png';
      }
    });
  }

  // Function for getting and storing data for search screen weather snippets

//  void getCityData(MainModel model) async {
//    List<String> cityList = [
//      'New York',
//      'Los Angeles',
//      'San Francisco',
//      'Boston',
//      'Chicago'
//    ];
//
//    for (String city in cityList) {
//      var cityWeatherData = await WeatherModel().getCityWeather(city);
//      model.addWeatherDataItem(cityWeatherData);
//    }
//
//    print(model.searchWeatherDataList);
//
//  }

  @override
  Widget build(BuildContext context) {
    Image themeIconImage = Image(
      image: AssetImage(themeIcon),
    );

  return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model)
    {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            await Navigator.of(context).push(
                                OverlayMenu());
                            print(model.cityName);
                            if(model.cityName.isNotEmpty){
                              var weatherData =
                              await weather.getCityWeather('${model.cityName}');
                              updateUI(weatherData);
                            }
                          },
                          child: Icon(
                            Icons.search,
                            size: 40.0,
                          ),
                        ),
                        Text(
                          cityName,
                          style: kCityNameStyle,
                        ),
                        FlatButton(
                          onPressed: toggleTheme,
                          child: themeIconImage,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 250, right: 175.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage(weatherIconImage),
                            height: 100,
                            width: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '$temperature',
                                style: kTempTextStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 75),
                                child: Text(
                                  '°',
                                  style: kDegreeSymbolStyle,
                                ),
                              )
                            ],
                          ),
                          Text(
                            mainDesc,
                            style: kMessageTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xFF131415)),
          child: BottomNavigationBar(
              //elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Current'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time),
                  title: Text('Hourly',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text('Daily'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  title: Text('Maps'),
                ),
              ]),
        ),
      );
      },
    );
  }
}
