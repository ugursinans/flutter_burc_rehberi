import 'package:burc_rehberi/BurcDetayi.dart';
import 'package:flutter/material.dart';
import 'BurcListesi.dart';
import 'models/burc.dart';

void main() {
  runApp(BurcRehberiApp());
}

class BurcRehberiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      routes: <String, WidgetBuilder>{
        '/': (context) => BurcListesi(),
        '/burcListesi': (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> birBurc = settings.name.split('/');
        if (birBurc[1] == 'burcDetayi') {
          return MaterialPageRoute(
            builder: (context) => BurcDetayi(int.parse(birBurc[2])),
          );
        } else
          return null;
      },
    );
  }
}
