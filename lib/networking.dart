import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
const String apiKey='f6dd5ac41f20040e6d6e6b2add9ecbfc';
class Weather {

  Future locationWeather() async{
    double lat;
    double lon;
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    lat= position.latitude;
    lon=  position.longitude;
    http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    if(response.statusCode==200){
      var decodeData= jsonDecode(response.body);
      double tem= decodeData['main']['temp'];
      //print(tem);
      return tem;
    }
    else
      {
        print(response.statusCode);
        print('ERROR');
      }
  }
  Future cityName() async{
    double lat;
    double lon;
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    lat= position.latitude;
    lon=  position.longitude;
   http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
   if(response.statusCode==200){
     var decodeData= jsonDecode(response.body);
     String name= decodeData['name'];
     return name;
   }
   else{
     print(response.statusCode);
     print('Error');
   }
  }
  Future getCityName(String cityName) async{
    var url='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    http.Response response= await http.get(url);
    if(response.statusCode==200){
      var decodeData= jsonDecode(response.body);
      String name= decodeData['name'];
      return name;
    }

  }
  Future getCityTemp(String cityName) async{
    int temper;
    double t;
    var url='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    http.Response response= await http.get(url);
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      double temp= decodeData['main']['temp'];
      t=temp-273;
      temper=t.round();
      return temper;
    }
  }
  Future getConditionsForCurrentLocation()async{
    double lat;
    double lon;
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    lat= position.latitude;
    lon=  position.longitude;
    http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      int cond= decodeData['cod'];
      return cond;
    }
  }
  Future getConditionsForCityName(String cityName) async{
    var url='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    http.Response response =await http.get(url);
    if(response.statusCode==200){
      var decodeData= jsonDecode(response.body);
      int cond= decodeData['cod'];
      return cond;
    }
  }
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }


}
