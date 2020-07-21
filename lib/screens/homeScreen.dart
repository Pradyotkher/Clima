import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climaa/screens/cityScreen.dart';
import 'package:climaa/networking.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double temp;
  String getMessage;
  int t;
  String getConditions;
  int conditions;
  String cityName;
  double city;
  Weather weather= Weather();
  void getData() async{
    double temperature= await weather.locationWeather();
    String name= await weather.cityName();
    int cond= await weather.getConditionsForCurrentLocation();
    try{
      setState(() {
        temp=temperature- 273;
        t=temp.round();
        cityName=name;
        getMessage=weather.getMessage(t);
        conditions=cond;
        getConditions=weather.getWeatherIcon(conditions);
      });
    }
    catch(e){
      print(e);
    }
    print(temp);
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              FlatButton(
                  onPressed: () async {
                   var typedName= await Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CityScreen();
                    }));
                   print(typedName);
                   if(typedName!=null){
                    String name = await weather.getCityName(typedName);
                    int temper= await weather.getCityTemp(typedName);
                    int condti= await weather.getConditionsForCityName(typedName);
                    setState(() {
                      cityName=name;
                      t= temper;
                      conditions=condti;
                      getMessage=weather.getMessage(t);
                      getConditions= weather.getWeatherIcon(conditions);
                    });

                   }
                    },
                  child: Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.location_city, size: 50,color: Colors.white,)),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Text(
                    '$t°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 85,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$getConditions',
                    style: TextStyle(
                      fontSize: 80,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 450,
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 20,bottom: 30),
                child: Text(
                  '$getMessage is $cityName',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 65,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
