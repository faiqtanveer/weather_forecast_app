import 'dart:convert';
import 'package:http/http.dart';
import '../model/WeatherForecastModel.dart';
import '../util/forecast_util.dart';

class Network{
  Future<WeatherForecastmodel> getWeatherForecast({required String cityName}) async {
    var finalURL = "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${ForecastUtil.appid}";

    final response = await get(Uri.parse(finalURL));
    print("URL: ${Uri.encodeFull(finalURL)}");

    if(response.statusCode == 200)
    {
      print("Success");
      // print("weather data: ${response.body}");
      return WeatherForecastmodel.fromJson(json.decode(response.body));
    }
    else
    {
      throw Exception("Erorrrrrrrr!!!");
    }
  }
}
