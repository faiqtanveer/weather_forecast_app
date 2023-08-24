import 'package:flutter/material.dart';
import '../model/weather_forecast_model.dart';
import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context)
{
  var forecastList = snapshot.data?.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        "7-Day Weather Forecast".toUpperCase(),
        style:const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 2),
      Container(
        height: 170,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.0,
                height: 160,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.lightBlueAccent.shade200,
                      Colors.blue.shade400],
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomLeft)
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: forecastList!.length),
      )
    ],
  );
}








