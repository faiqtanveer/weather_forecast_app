import 'package:intl/intl.dart';

class ForecastUtil{

  static String appid ="4e6aa6cf8c112f9e4d484ca07042d130";

  static String getFormattedDate(DateTime datetime){

    return DateFormat("EEE, MMM d, y").format(datetime);
  }

  static String getFormattedTime(DateTime dateTime){
    return DateFormat("Hm").format(dateTime);
  }
}