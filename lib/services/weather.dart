import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String openWeatherKey = '';

class WeatherModel {

  double latitude = 25;
  double longitude = 35;

  Future<dynamic> getCityWeather(String cityName) async{
    try {
      NetworkHelper networkHelper = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$openWeatherKey&units=metric');
      var weatherData = await networkHelper.getData();
      return weatherData;
    } catch(e){
      return null;
    }
  }

  Future<dynamic> getLocationWeather() async{
    try {
      Location location = Location();
      await location.getCurrentLocation();
      latitude = location.latitude;
      longitude = location.longitude;

      NetworkHelper networkHelper = NetworkHelper(
          'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$openWeatherKey&units=metric');

      var weatherData = await networkHelper.getData();

      return weatherData;
    } catch (e){
      return null;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
