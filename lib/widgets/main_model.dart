import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  String _cityName = '';
  List _searchWeatherDataList;

  String get cityName {
    return _cityName;
  }

  void updateName(String cityName) {
    _cityName = cityName;
  }

  List get searchWeatherDataList {
    return _searchWeatherDataList;
  }

  void addWeatherDataItem(var weatherData) {
    _searchWeatherDataList.add(weatherData);
  }
}