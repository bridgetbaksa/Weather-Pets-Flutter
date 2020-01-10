import 'package:weather_pets/services/location.dart';
import 'package:weather_pets/services/networking.dart';

const apiKey = 'bbd61310ed97aaad433b91b00bd9c2eb';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=imperial');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIconImage(int condition) {
    if (condition < 300) {
      return 'images/storm.png';
    } else if (condition < 400) {
      return 'images/drizzle.png';
    } else if (condition < 600) {
      return 'images/rain.png️';
    } else if (condition < 700) {
      return 'images/snow.png️';
    } else if (condition < 800) {
      return 'images/haze.png';
    } else if (condition == 800) {
      return 'images/sun.png';
    } else if (condition <= 804) {
      return 'images/clouds.png';
    } else {
      return 'images/storm.png‍';
    }
  }

  String getBackgroundImage(String animal, int condition) {
    if(animal == 'cat'){
      if (condition < 600){
        return 'images/cat_rainy.png';
      } else if (condition < 700){
        return 'images/cat_winter.png';
      } else if (condition <= 804 && condition != 800){
        return 'images/cat_cloudy.png';
      } else if (condition == 800) {
        return 'images/cat_sunny.png';
      } else {
        return 'images/cat_sad.png';
      }
    } else if (animal == 'dog'){
      if (condition < 600){
        return 'images/dog_rainy.png';
      } else if (condition < 700){
        return 'images/dog_winter.png';
      } else if (condition <= 804 && condition != 800){
        return 'images/dog_cloudy.png';
      } else if (condition == 800) {
        return 'images/dog_sunny.png';
      } else {
        return 'images/dog_sad.png';
      }
    } else{
      return 'images/dog_sad.png';
    }

  }

//  String getMessage(int temp) {
//    if (temp > 80) {
//      return 'It\'s 🍦 time';
//    } else if (temp > 70) {
//      return 'Time for shorts and 👕';
//    } else if (temp < 50) {
//      return 'You\'ll need 🧣 and 🧤';
//    } else {
//      return 'Bring a 🧥 just in case';
//    }
//  }
}
