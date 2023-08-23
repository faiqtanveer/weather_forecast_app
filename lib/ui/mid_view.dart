import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/util/forecast_util.dart';
import '../model/WeatherForecastModel.dart';
import '../util/covert.dart';



Widget midView(AsyncSnapshot<WeatherForecastmodel> snapshot){
  var forecastlist = snapshot.data?.list;
  var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastlist![0].dt * 1000);
  var temperature = (373.0 - forecastlist[0].main!.temp).toStringAsFixed(1);
  var Maxtemperature = (373.0 - forecastlist[0].main!.tempMax).toStringAsFixed(1);
  var Currentweather = forecastlist[0].weather![0]?.description!.toUpperCase();
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            "${snapshot.data?.city?.name}, ${snapshot.data?.city?.country}",
            style: TextStyle(
              color:Colors.blue.shade900.withOpacity(0.9),
              fontWeight: FontWeight.w800,
              fontSize: 25,
              //color: Colors.black87,
            ),
          ),
          Text(
            ForecastUtil.getFormattedDate(formattedDate),
            style:const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5,),
          getWeatherIcon(weatherDescription: forecastlist[0].weather[0].main, size: 195),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$temperature °F",
                  style:TextStyle(
                    fontSize: 26,
                      color:Colors.blue.shade900,
                      fontWeight: FontWeight.w800
                  ),
                ),
                Text(
                  "  $Currentweather",style: TextStyle(fontSize: 18,color: Colors.blue.shade900,fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.brown.shade200
                          ),
                          child: const Icon(Icons.wind_power,size: 50,color: Colors.brown,)),
                      const SizedBox(height: 10,),
                      Text("${forecastlist[0].wind!.speed!.toStringAsFixed(1)} km/h"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 455.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white

                          ),
                          child: const Icon(Icons.water_drop,size: 50,color: Colors.blueAccent,)),
                      Text(
                        "${forecastlist[0].main!.humidity!.toStringAsFixed(0)} %",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.redAccent.withOpacity(0.4)

                          ),
                          child: const Icon(Icons.thermostat_rounded,size: 50,color: Colors.deepOrange,)),
                      Text(
                        "$Maxtemperature °F",
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),





        ],
      ),
    ),
  );
  return midView;
}

