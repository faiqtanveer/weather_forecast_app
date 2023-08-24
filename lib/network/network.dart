import 'dart:convert';
import 'package:http/http.dart';
import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';
class Network
{
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async
  {                                                                                           // class name is Util
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=${Util.appId}&units=metric";   // change to metric or imperial
    // if units = metric then the temperature will be in celsius
    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");
    if(response.statusCode == 200)
    {
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }
    else
    {
      throw Exception("Error getting weather forecast");
    }
  }
}