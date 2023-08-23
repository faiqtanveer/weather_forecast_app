import 'package:flutter/material.dart';
import 'package:weather_app/ui/bottom_view.dart';
import 'package:weather_app/ui/mid_view.dart';
import 'model/WeatherForecastModel.dart';
import 'network/network.dart';

class Weather_Forecast extends StatefulWidget {
  //const Weather_Forecast({Key? key}) : super(key: key);

  @override
  State<Weather_Forecast> createState() => _Weather_ForecastState();
}

class _Weather_ForecastState extends State<Weather_Forecast> {

  late Future<WeatherForecastmodel> forecastobj;
  String _cityname="Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastobj=getweather(cityName: _cityname);
    // print(forecastobj);

    // forecastobj.then((weather) {
    //   print(weather.list![0].weather![0].main);
    //
    // }
    // );
  }

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
          children: [
            textFieldView(),
            SizedBox(height: 10,),
            Container(

              child: FutureBuilder<WeatherForecastmodel>(
                future: forecastobj,
                builder: (context, AsyncSnapshot<WeatherForecastmodel> snapshot) {
                    if(snapshot.hasData){
                      return Column(
                        children: [
                          midView(snapshot),
                          bottomView(snapshot,context),
                        ],
                      );
                    }
                    else{return Container(
                      child: CircularProgressIndicator(),
                    );
                    }
                },

              ) ,
            )
          ],
        ),]
      )
    );
  }

 Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "enter city name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          contentPadding: EdgeInsets.all(8)
        ),
        onSubmitted: (value){
          setState(() {
            _cityname=value;
            forecastobj=getweather(cityName: _cityname);
          });
        },
      ),
    );
 }

 Future<WeatherForecastmodel> getweather({required String cityName }) =>
     new Network().getWeatherForecast(cityName: _cityname);
}
