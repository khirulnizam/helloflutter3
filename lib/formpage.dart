// Code samples from
// https://api.flutter.dev/flutter/material/ElevatedButton-class.html
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; //FlutterToast plugins

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  static const String _title = 'Kira zakat KWSP';

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
  final gajicontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(image: AssetImage('images/logozakat.png')),
          ),
          const Text(
            'Baki KWSP selepas 55tahun:',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: gajicontroller,
              obscureText: false, //true like password
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Baki kwsp RM',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              double kiraperatus, kwsp;
              kwsp = double.parse(gajicontroller.text.toString());
              kiraperatus = kwsp * 0.025;
              Fluttertoast.showToast(
                  msg: "Zakat KWSP anda RM$kiraperatus",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            child: const Text('Kira 0.25% Zakat KWSP'),
          ),
        ],
      ),
    );
  }
}
