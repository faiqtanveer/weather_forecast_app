import 'package:flutter/material.dart';
import 'package:weather_app/ui/bottom_view.dart';
import 'package:weather_app/ui/mid_view.dart';
import 'model/weather_forecast_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Mumbai";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    // forecastObject.then((weather) =>
    // {
    //   print(weather.list?[0]?.dt)
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade200,

                        Colors.blue.shade100
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter

                  )
              ),
            ),
            ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: textFieldView(),
                  ),
                  Container(
                    child: FutureBuilder<WeatherForecastModel>(
                      future: forecastObject,
                      builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot)
                      {
                        if(snapshot.hasData)
                        {
                          return Column(
                            children: <Widget>[
                              midView(snapshot),
                              SizedBox(height: 18),
                              bottomView(snapshot, context),
                            ],
                          );
                        }
                        else
                        {
                          return Container(
                            child: const Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  )
                ]
            ),
          ]
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Enter the City Name",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.all(8)
        ),
        onSubmitted: (value)
        {
          setState(() {
            _cityName = value;
            forecastObject = Network().getWeatherForecast(cityName: _cityName);
          });
        },
      ),
    );
  }
}

