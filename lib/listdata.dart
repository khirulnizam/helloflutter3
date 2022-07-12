import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart'; //FlutterToast plugins

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  static const String _title = 'LISTVIEW Senarai Negeri Malaysia';

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
  //senarai negeri in array List
  List<String> negeri2 = [
    "Johor",
    "Melaka",
    "Negeri Sembilan",
    "Selangor",
    "Perak",
    "Kedah",
    "Perlis",
    "Kelantan",
    "Terengganu",
    "Sarawak",
    "Sabah",
    "WP - Kuala Lumpur",
    "WP - Putrajaya",
    "WP - Labuan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: negeri2.map((itemnegeri) {
          return Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            color: const Color.fromARGB(255, 131, 155, 234),
            child: ListTile(
              title: Text(itemnegeri),
            ),
          );
        }).toList(),
      ),
    );
  } //end Widget build
}
