// Code samples from
// https://api.flutter.dev/flutter/material/ElevatedButton-class.html
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; //FlutterToast plugins

class IfBmi extends StatelessWidget {
  const IfBmi({Key? key}) : super(key: key);

  static const String _title = 'Kira kategori BMI';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          //back button
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //define id to retrieve value from TextField
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  double _weightSliderValue = 50;
  double _heightSliderValue = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(image: AssetImage('images/logozakat.png')),
          ),
          Padding(
            //TextField ID
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: TextField(
              controller: weightcontroller, //in kg
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weight (kg)',
              ),
            ),
          ), //padding name
          Padding(
            //TextField ID
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Slider(
              value: _weightSliderValue,
              min: 0,
              max: 200,
              divisions: 200,
              label: _weightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                  weightcontroller.text = value.toString();
                });
              },
            ),
          ),
          Padding(
            //TextField ID
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: TextField(
              controller: heightcontroller, //in meter
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height (cm)',
              ),
            ),
          ), //number padding
          Padding(
            //TextField ID
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Slider(
              value: _heightSliderValue,
              min: 0,
              max: 200,
              divisions: 200,
              label: _heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                  heightcontroller.text = value.toString();
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              child:
                  const Text('Calculate BMI', style: TextStyle(fontSize: 20)),
              onPressed: () {
                /* BMI calculation process
                formula BMI=kg/(m*m)
                BMI Categories:
                  Underweight = <18.5
                  Normal weight = 18.5–24.9
                  Overweight = 25–29.9
                  Obesity = BMI of 30 or greater
                */
                double kg = double.parse(weightcontroller.text);
                double meter = double.parse(heightcontroller.text) / 100;
                //double kg=weight.text;
                //double meter=height.text;
                String category, message;

                //formula BMI=kg/(m*m)
                double BMI = kg / (meter * meter);
                if (BMI <= 18.8) {
                  message = "You are UNDERWEIGHT";
                  Fluttertoast.showToast(
                      msg: message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (BMI >= 18.8 && BMI < 25) {
                  message = "Your BMI is  NORMAL";
                  Fluttertoast.showToast(
                      msg: message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (BMI >= 25 && BMI < 30) {
                  message = "Your BMI is  OVERWEIGHT";
                  Fluttertoast.showToast(
                      msg: message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (BMI >= 30) {
                  message = "Your BMI is categorised as OBESITY";
                  Fluttertoast.showToast(
                      msg: message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } //else if
              }, //end onPressed
            ),
          ),
        ],
      ),
    );
  } //end Widget build
}
