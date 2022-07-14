import 'package:flutter/material.dart';
import 'package:helloflutter3/datanegeri.dart';
import 'paparbendera.dart';
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
    "Malaysia",
    "Kedah",
    "Johor",
    "Melaka",
    "N.Sembilan",
    "Selangor",
    "Perak",
    "Perlis",
    "Kelantan",
    "Terengganu",
    "Sarawak",
    "Sabah",
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
                onTap: () {
                  //simpan pilihan negeri
                  DataNegeri.negeri = itemnegeri;
                  if (itemnegeri == "Kedah") {
                    DataNegeri.urlbendera =
                        "http://khirulnizam.com/bendera/kedah.png";
                  } else if (itemnegeri == "Johor") {
                    DataNegeri.urlbendera =
                        "http://khirulnizam.com/bendera/johor.png";
                  } else if (itemnegeri == "Melaka") {
                    DataNegeri.urlbendera =
                        "http://khirulnizam.com/bendera/melaka.png";
                  } else {
                    DataNegeri.urlbendera =
                        "http://khirulnizam.com/bendera/malaysia.png";
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      //route not named
                      builder: (context) => PaparBendera()));
                }),
          );
        }).toList(),
      ),
    );
  } //end Widget build
}
