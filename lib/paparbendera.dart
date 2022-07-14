//formpage.dart
import 'package:flutter/material.dart';
import 'package:helloflutter3/datanegeri.dart';

class PaparBendera extends StatelessWidget {
  const PaparBendera({Key? key}) : super(key: key);

  static const String _title = 'Paparan Bendera Negeri';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //add ur widgets here
          Text(DataNegeri.negeri),
          Image.network(DataNegeri.urlbendera),
        ],
      ),
    );
  }
}
