import 'package:flutter/material.dart';
import 'BurcListesi.dart';

void main() {
  runApp(BurcRehberiApp());
}

class BurcRehberiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: BurcListesi());
  }
}
