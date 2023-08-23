
import 'package:flutter/material.dart';
import 'package:weather_app/util/forecast_util.dart';
import '../model/WeatherForecastModel.dart';
import '../util/covert.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastmodel> snapshot,int index){
  var forecastList = snapshot.data?.list;
  var time = ForecastUtil.getFormattedTime(DateTime.fromMillisecondsSinceEpoch(forecastList![index]!.dt * 1000));
  var date = ForecastUtil.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(forecastList![index]!.dt * 1000));

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            '${date}               ${time}',
            style:const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main,size: 45),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${forecastList[index].main.tempMin!.toStringAsFixed(1)} °F",
                      ),
                    ),
                    const SizedBox(width: 8,),
                    const Icon(Icons.arrow_circle_down_sharp,color: Colors.white,size: 17,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${forecastList[index].main.tempMax!.toStringAsFixed(1)} °F",
                      ),
                    ),
                    const SizedBox(width: 8,),
                    const Icon(Icons.arrow_circle_up_sharp,color: Colors.white,size: 17,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${forecastList[index].main.humidity!.toStringAsFixed(1)} %",
                      ),
                    ),
                    const SizedBox(width: 18,),
                    const Icon(Icons.water_drop,color: Colors.white,size: 17,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${forecastList[index].wind!.speed!.toStringAsFixed(1)} km/h",
                      ),
                    ),
                    const SizedBox(width: 8,),
                    const Icon(Icons.wind_power,color: Colors.white,size: 17,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

    ],
  );

}