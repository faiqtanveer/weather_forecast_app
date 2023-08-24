import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/weather_forecast_model.dart';
import '../util/convert_icon.dart';
import '../util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index)
{
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("${dayOfWeek}",
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 17
            ),),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.white,
                  child: getWeatherIcon(weatherDescription: forecastList[index].weather![0].main,
                      size: 45)
              ),),
            Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                        children: <Widget>[
                          Text("${forecastList[index].temp?.min?.toStringAsFixed(0)}°C  ",),
                          const Icon(FontAwesomeIcons.solidCircleDown, size: 17, color: Colors.white,),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text("${forecastList[index].temp?.max?.toStringAsFixed(0)}°C  ",),
                        const Icon(FontAwesomeIcons.solidCircleUp, size: 17, color: Colors.white),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Text("${forecastList[index].humidity}%", ),
                        const SizedBox(width: 5,),
                        const Icon(Icons.water_drop,color: Colors.white,size: 17,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        Text("${forecastList[index].speed?.toStringAsFixed(1)}mi/h",),
                        const SizedBox(width: 5,),
                        const Icon(Icons.wind_power,color: Colors.white,size: 17,),
                      ],
                    ),
                  ),

                ]
            )
          ],
        )
      ]
  );
}


