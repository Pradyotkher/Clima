import 'package:flutter/material.dart';
class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30,color: Colors.white,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value){
                    //print(value);
                    setState(() {
                      cityName=value;
                    });
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(Icons.location_city,color: Colors.white,),
                  hintText:'Enter City Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10),

                    ),
                    borderSide: BorderSide.none,
                  ),

                ),
                ),
              ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context,cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
