import 'package:flutter/material.dart';
import '../model/weather_forecast_model.dart';
import '../util/convert_icon.dart';
import '../util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot)
{
  var forecastList = snapshot.data?.list;
  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000 ?? 0);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$city, $country",
            style: TextStyle(
              color:Colors.blue.shade900.withOpacity(0.9),
              fontWeight: FontWeight.w800,
              fontSize: 25,
              //color: Colors.black87,
            ),
          ),
          Text(
            Util.getFormattedDate(formattedDate),
            style: const TextStyle(
                fontSize: 15
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main,size: 195),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("${forecastList[0].temp?.day?.toStringAsFixed(0)}°C",
                  style:TextStyle(
                      fontSize: 26,
                      color:Colors.blue.shade900,
                      fontWeight: FontWeight.w800
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("${forecastList[0].weather?[0].description?.toUpperCase()}",
                      style: TextStyle(fontSize: 18,color: Colors.blue.shade900,fontWeight: FontWeight.w900)
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                            color: Colors.brown.shade200
                        ),
                        child: const Icon(Icons.wind_power,size: 50,color: Colors.brown,)),
                    const SizedBox(height: 10,),
                    Text(
                      "${forecastList[0].speed!.toStringAsFixed(1)} mi/h",
                      style: TextStyle(
                          color: Colors.brown
                      ),
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
                            color: Colors.white

                        ),
                        child: const Icon(Icons.water_drop,size: 50,color: Colors.blueAccent,)),
                    const SizedBox(height: 10,),
                    Text(
                      "${forecastList[0].humidity!.toStringAsFixed(0)} %",
                      style: TextStyle(
                          color: Colors.lightBlue
                      ),
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
                    const SizedBox(height: 10,),
                    Text(
                      "${forecastList[0].temp?.max!.toStringAsFixed(0)} °C",
                      style: TextStyle(
                          color: Colors.red.shade900
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    ),
  );
  return midView;
}